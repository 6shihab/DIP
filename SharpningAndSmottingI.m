clc;
clear all;
close all;
 
rgb_img=imread('peacock.jpg');

figure(1)
subplot(221);imshow(rgb_img);title('Original RGB image');
rgb_img=im2double(rgb_img); 
% Creating filter
avg_filter=fspecial('average',[5 5]);
laplacian_filter=fspecial('laplacian',0.2);

 
% Filtering RGB components independently
R=rgb_img(:,:,1); avg_R=imfilter(R,avg_filter);
lap_R=imfilter(R,laplacian_filter);
G=rgb_img(:,:,2); avg_G=imfilter(G,avg_filter);
lap_G=imfilter(G,laplacian_filter);
B=rgb_img(:,:,3); avg_B=imfilter(B,avg_filter);
lap_B=imfilter(B,laplacian_filter);
 
% Combining 3 channels after filtering
avg_rgb_img=cat(3,avg_R,avg_G,avg_B);
lap_rgb_img=cat(3,lap_R,lap_G,lap_B);
 
%%%% Converting to HSI from RGB
hsi_img=rgb2hsv(rgb_img);
 
% Filtering intensity component only
H=hsi_img(:,:,1);
S=hsi_img(:,:,2);
I=hsi_img(:,:,3); avg_I=imfilter(I,avg_filter);
lap_I=imfilter(I,laplacian_filter);
 
% Combining 3 channels after filtering
avg_hsi_img=cat(3,H,S,avg_I);
lap_hsi_img=cat(3,H,S,lap_I);
 
% Converting to RGB from HSI
avg_rgb_img_from_hsi=hsv2rgb(avg_hsi_img);
lap_rgb_img_from_hsi=hsv2rgb(lap_hsi_img);
 
% Calculate difference
diff_avg_img=avg_rgb_img-avg_rgb_img_from_hsi;
diff_lap_img=lap_rgb_img-lap_rgb_img_from_hsi;
% Displaying
subplot(222);
imshow(avg_rgb_img);
title('Smoothing using RGB model');
 
subplot(223);
imshow(avg_rgb_img_from_hsi);
title('Smoothing using HSI model');
 
subplot(224);
imshow(diff_avg_img);
title('Difference');
 
figure(2)
subplot(221);
imshow(rgb_img);
title('Original RGB image');
 
subplot(222);
imshow(lap_rgb_img);
title('Sharpening using RGB model');
 
subplot(223);
imshow(lap_rgb_img_from_hsi);
title('Sharpening using HSI model');
 
subplot(224);
imshow(diff_lap_img);
title('Difference');


