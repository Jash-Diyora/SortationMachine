clear all
clc

cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);  
position = [30 300]; 

runLoop = true;
frameCount = 0;

while runLoop && frameCount < 400       
   
    videoFrame = snapshot(cam);
    frameCount = frameCount + 1; 
    diff_im = imsubtract(videoFrame(:,:,1), rgb2gray(videoFrame));
    diff_im = medfilt2(diff_im, [3 3]); 
    diff_im = imbinarize(diff_im,0.18);
    diff_im = bwareaopen(diff_im,300);
    bw = logical(diff_im);
    stats = regionprops(bw,'BoundingBox', 'Centroid');
    imshow(videoFrame)
    bb = stats(1).BoundingBox;        
    rectangle('Position',bb,'EdgeColor','b','LineWidth',2)
    hold on          
   
    ocrResults= ocr(videoFrame);
    recognizedText = ocrResults.Text;
    videoFrame = insertText(videoFrame,position,recognizedText,'AnchorPoint','LeftBottom');
    
    hold off      
    step(videoPlayer, videoFrame);
    runLoop = isOpen(videoPlayer);
    
end

clear cam;
release(videoPlayer);