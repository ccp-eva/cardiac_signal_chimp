function [HR] = calHR(signal,num_frames,video_framerate)
%CALHR Summary of this function goes here
%   Detailed explanation goes here
fr = video_framerate;
No_of_frames = num_frames;
disp(No_of_frames)
bb=signal;

%A=bb                                    
%t = (1:No_of_frames)
A1=bb; 
%time=No_of_frames/fr
len= No_of_frames;
t1 = (0:len-1)/fr;
%disp(t1)
%------SUB 1-----------
f1 = linspace(-fr/2,fr/2,numel(A1));
% Frequency-domain transformation
%f1 =fr/2*linspace(0,1,numel(AA));
% Frequency-domain transformation


%xf1 = fftshift(fft(A1));
%str = 'Frequency domain';
%Kernel_BP10 = abs(f1) >= 1.5 & abs(f1) <= 4.2;% band-pass filter (90-250 beats/min) %chimp
%BPF10 = Kernel_BP10 .* xf1;
%BP_t10 = ifft(ifftshift(BPF10));% signal after band-pas filter
%AA1=real (BP_t10);
%disp(length(AA1))
Nstd = 0.2;
NR = 500;
MaxIter = 5000;
LPF = 0.5;
HPF = 4.2;
nyquistF = 1/2*fr;
[B,A] = butter(3,[LPF/nyquistF HPF/nyquistF]);
BVP_F = filtfilt(B,A,(double(A1)));
[modes its]=ceemdan(BVP_F,0.001,250,50);
%t=1:length(BP_t10);

[a b]=size(modes);
IMF1 = modes(1,:);%select IMF1 for cardiac signal
disp(length(IMF1))
disp(length(t1))
[pks1,locs1] = findpeaks(IMF1,t1);
Peaks_number1=  numel (pks1);
HR=(Peaks_number1*60*fr)/No_of_frames;
end

