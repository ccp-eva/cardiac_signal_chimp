# cardiac_signal_chimp

## Introduction

This repository aims at computing the heart rate signal from RGB images. A Region of Interest (ROI) needs to be defined on the face region.

## Dependencies

* MATLAB
* MATLAB Image Processing Toolbox
* MATLAB Computer Vision Toolbox
* MATLAB Signal Processing Toolbox

**Matlab** is a scientific licensed software that may be used for data acquisition, processing, and computation. The software is available on the [Matlab homepage](https://www.mathworks.com/products/matlab.html). The Max Planck Digital Library provides **Matlab** licence for MPI staff: see [this page from an MPI network](https://www.soli.mpdl.mpg.de/de/software/matlab/activation-key/). This license must be activated with a MathWorks Account linked to an MPI email address. The dependencies can be downloaded from the installer or the MATLAB software using the Adds-On button.

## How to run

* Start **Matlab** and navigate to the project directory.
* Navigate to `src/` directory.   
   `cd src`
* Run the `test1` **Matlab** script.   
   `test1`
* The first video frame will popup; select the ROI to track.
* The running script will show the video with the selected bounding box.
* After processing the video, the heart rate will print out in the **Matlab** terminal.

## Output

![output](https://user-images.githubusercontent.com/47135040/136742551-daf68be5-6ed4-4856-bb2a-5e586f767359.gif)

## License

MIT
