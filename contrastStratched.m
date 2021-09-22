clc;
i1=imread('DIP3E_CH03_Original_Images\Fig0316(1)(top_left).tif');
 
figure(1);
subplot(441);
imshow(i1);
title('Source image')
 
subplot(442);
imhist(i1);
title('Source image Histogram')
 
cs_i1=imadjust(i1);
 
subplot(443);
imshow(cs_i1);
title('Contrast stretched image');
 
subplot(444);
imhist(cs_i1);
title('Contrast stretched image Histogram');
 
i1=imread('C:\Users\Shihab\Downloads\Compressed\DIP3E_CH03_Original_Images\Fig0316(2)(2nd_from_top).tif');
 
subplot(445);
imshow(i1);
title('Source image')
 
subplot(446);
imhist(i1);
title('Source image Histogram')
 
cs_i1=imadjust(i1);
 
subplot(447);
imshow(cs_i1);
title('Contrast stretched image');
 
subplot(448);
imhist(cs_i1);
title('Contrast stretched image Histogram');
 
i3=imread('C:\Users\Shihab\Downloads\Compressed\DIP3E_CH03_Original_Images\Fig0316(3)(third_from_top).tif');
 
subplot(449);
imshow(i3);
title('Source image')
 
subplot(4,4,10);
imhist(i3);
title('Source image Histogram')
 
cs_i3=imadjust(i3);
 
subplot(4,4,11);
imshow(cs_i3);
title('Contrast stretched image');
 
subplot(4,4,12);
imhist(cs_i3);
title('Contrast stretched image Histogram');
 
i4=imread('C:\Users\Shihab\Downloads\Compressed\DIP3E_CH03_Original_Images\Fig0316(4)(bottom_left).tif');
 
subplot(4,4,13);
imshow(i4);
title('Source image')
 
subplot(4,4,14);
imhist(i4);
title('Source image Histogram')
 
cs_i4=imadjust(i4);
 
subplot(4,4,15);
imshow(cs_i4);
title('Contrast stretched image');
 
subplot(4,4,16);
imhist(cs_i4);
title('Contrast stretched image Histogram');
