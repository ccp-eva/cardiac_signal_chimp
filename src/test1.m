
videofile = 'test.mp4';
starttime = 0;
duration = 10;
calcu_time = 9;
FS = 25;
fr = 25;
vidobj = VideoReader(videofile);
vidobj.CurrentTime = starttime;

FramesToRead = ceil(duration*vidobj.FrameRate);
FN = 0;
im = readFrame(vidobj);

f = figure('Name', 'Select object to track'); imshow(im);
rect = getrect;
close(f); clear f;
center = [rect(2)+rect(4)/2 rect(1)+rect(3)/2];

% plot gaussian
sigma = 100;
gsize = size(im);
[R,C] = ndgrid(1:gsize(1), 1:gsize(2));
g = gaussC(R,C, sigma, center);
g = mat2gray(g);

% randomly warp original image to create training set
if (size(im,3) == 3) 
    img = rgb2gray(im); 
end
img = imcrop(img, rect);
g = imcrop(g, rect);
G = fft2(g);
height = size(g,1);
width = size(g,2);
fi = preprocess(imresize(img, [height width]));
Ai = (G.*conj(fft2(fi)));
Bi = (fft2(fi).*conj(fft2(fi)));
N = 128;
for i = 1:N
    fi = preprocess(rand_warp(img));
    Ai = Ai + (G.*conj(fft2(fi)));
    Bi = Bi + (fft2(fi).*conj(fft2(fi)));
end
eta = 0.125;

num_frames = 0;0
meanYIntensityLevels = zeros(1,calcu_time*fr);
while hasFrame(vidobj) && (vidobj.CurrentTime <= starttime+duration)
    FN = FN+1;
    T(FN) = vidobj.CurrentTime;
    img = readFrame(vidobj);
    
    im = img;
    
    if (size(img,3) == 3)
        img = rgb2gray(img);
    end
    if (i == 1)
        Ai = eta.*Ai;
        Bi = eta.*Bi;
    else
        Hi = Ai./Bi;
        fi = imcrop(img, rect); 
        fi = preprocess(imresize(fi, [height width]));
        gi = uint8(255*mat2gray(ifft2(Hi.*fft2(fi))));
        maxval = max(gi(:));
        [P, Q] = find(gi == maxval);
        dx = mean(P)-height/2;
        dy = mean(Q)-width/2;
        
        rect = [rect(1)+dy rect(2)+dx width height];
        fi = imcrop(img, rect); 
        fi = preprocess(imresize(fi, [height width]));
        Ai = eta.*(G.*conj(fft2(fi))) + (1-eta).*Ai;
        Bi = eta.*(fft2(fi).*conj(fft2(fi))) + (1-eta).*Bi;
    end
    I1 = imcrop(im, rect);  % RGB
    
    %imshow(im);
    I=rgb2ycbcr (I1) ;        % YIQ
    It=I(:,:,1);
    
    num_frames = num_frames+1;
    meanYIntensityLevels(num_frames) = mean(mean(It));
    if num_frames >= calcu_time*fr
        bb=meanYIntensityLevels;
        %save('signal.csv','bb')
        heartrate = calHR(bb,num_frames,fr);
        %disp(heartrate)
        fprintf('Heartrate is %d\n',round(heartrate))
        clear('meanYIntensityLevels')
        %meanYIntensityLevels = [];
        num_frames = 0;
    end
    % visualization
    result = insertShape(im, 'Rectangle', rect, 'LineWidth', 3);
    imshow(result);
end
