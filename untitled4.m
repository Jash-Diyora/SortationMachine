clear all
clc

cam = webcam();

a=arduino('/dev/cu.usbmodem14201','Uno'); 

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);  
position = [30 300]; 

runLoop = true;
frameCount = 0;

while runLoop && frameCount < 400       
   
    videoFrame = snapshot(cam);
    frameCount = frameCount + 1; 
    hold on          
   
    ocrResults= ocr(videoFrame);
    recognizedText = ocrResults.Text;
    videoFrame = insertText(videoFrame,position,recognizedText,'AnchorPoint','LeftBottom');
    videoFrame = insertShape(videoFrame,'FilledRectangle',[250 250 800 300],'Color', 'green','Opacity',0.2);
%     videoFrame = insertShape(videoFrame,'Rectangle',[250 250 800 300],'LineWidth',4);

    hold off      
    step(videoPlayer, videoFrame);
    runLoop = isOpen(videoPlayer);
end

clear cam;
release(videoPlayer);