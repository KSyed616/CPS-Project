I = imread('incorrect2.jpg');
counter = 0;
nose = 1;
mouth = 1;
%Nose Detection algorithm using Viola Jones algorithm
%Generating nose detection object
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
%Applying the cascade object detector to the image to locate the nose
BB=step(NoseDetect,I);
figure,
imshow(I); 
hold on;

if isempty(BB)
    counter = counter +1;
    nose = 0;
end
%Displays the image with a box drawn around the detected nose 
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;

%Mouth detection algorith using Viola Jones algorithm
%Generating nose detection object
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',300);
%Applying the cascade object detector to the image to locate the mouth
BB=step(MouthDetect,I);
figure,
imshow(I); 
hold on;
%Displays the image with a box drawn around the detected mouth
if isempty(BB)
    counter = counter +1;
    mouth = 0;
end
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','g');
end
title('Mouth Detection');
hold off;

if(counter == 2)
    clf;
    imshow(I); hold on;
    title('Mask detected on following image: Either is worn correctly or input image is wrong')
end

if(counter == 1 && nose == 1)
    clf;
    imshow(I); hold on;
    title('Mask worn incorrectly: nose detected')
end

if(counter == 1 && mouth == 1)
    clf;
    imshow(I); hold on;
    title('Mask worn incorrectly: mouth detected')
end