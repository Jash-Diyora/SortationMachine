

businessCard   = imread('businessCard.png');
ocrResults     = ocr(businessCard);
recognizedText = ocrResults.Text  
figure; hold on
imshow(businessCard);
text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);