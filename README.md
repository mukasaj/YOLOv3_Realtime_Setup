# YOLOv3_Realtime_Setup
Quickly get YOLOv3 and the required dependencies installed/running.  



Before we get started You'll need CUDA 10.2 installed on your system. Other versions might work but I used 10.2.


Clone this repo to your home folder and then run the install.sh.
Install.sh does the following:
1. Update Ubuntu
1. Install opencv dependencies
1. install python dependencies
1. Clone opencv repo
	1. Compile opencv
1. Clone darknet_YOLOv3 repo
	1. Replace Makefile
	1. Compile darknet_YOLOv3
	
	
 I just want to say a quick thank you to pjreddie, AlexeyAB and learnopencv, some of thier material are used in this repo.  



