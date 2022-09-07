# cardiac_signal_chimp

## Introduction

This repository aims at computing heart rate signal from RGB images.

## Dependencies

* MATLAB
* MATLAB Image Processing Toolbox
* MATLAB Computer Vision Toolbox
* MATLAB Signal Processing Toolbox

Matlab is a scientific licensed software that may be used for data acquisition, processing, and computation. The software is available on the [Matlab homepage](https://www.mathworks.com/products/matlab.html). The Max Planck Digital Library provides Matlab licence for MPI staff: see [this page from an MPI network](https://www.soli.mpdl.mpg.de/de/software/matlab/activation-key/). You license needs to be activated with a MathWorks Account linked to your MPI email. The dependencies can be downloaded from the installer or from the MATLAB software using the Adds-On button.

## How to run

* Start MATLAB and navigate to project directory.
* Navigate to `src/` directory.   
   `cd src`
* Run the `test1` MATLAB script.   
   `test1`
* First frame of the video will popup; select the object to track.
* The running script will show videos with the selected bounding boxes.
* After processing the video, the heartrate will print out in Matlab terminal.

## Output

![output](https://user-images.githubusercontent.com/47135040/136742551-daf68be5-6ed4-4856-bb2a-5e586f767359.gif)

## License

MIT
