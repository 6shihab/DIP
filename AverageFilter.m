clc;
close all;
clear all;
i1=imread('Fig0333(a)(test_pattern_blurring_orig).tif');
 
figure(1);
subplot(231);
imshow(i1);
title('Source Image');
 
M3=fspecial('average',3);
% M3=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];
M9=fspecial('average',9);
M15=fspecial('average',15);
M25=fspecial('average',25);
M35=fspecial('average',35);
 
J3=imfilter(i1,M3);
J9=imfilter(i1,M9);
J15=imfilter(i1,M15);
J25=imfilter(i1,M25);
J35=imfilter(i1,M35);
 
subplot (232);
imshow(J3);
title('Filtered by 3X3');
 
subplot (233);
imshow(J9);
title('Filtered by 9X9');
 
subplot (234);
imshow(J15);
title('Filtered by 15X15');
 
subplot (235);
imshow(J25);
title('Filtered by 25X25');
 
subplot (236);
imshow(J35);
title('Filtered by 35X35');
