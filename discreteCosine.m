%discrete cosine transformation
clc;
clear all;
close all;
 
img=imread('autumn.tif');
img=rgb2gray(img);
subplot(131); imshow(img); title('original image');
 
%2d discrete cosine transformation
dct_img=dct2(img);
subplot(132); 
imshow(log(abs(dct_img)), []);
colormap(gca, jet);
title('image after dct');
 
%inverse discrete cosine transormation
dct_img(abs(dct_img)<10)=0;
idct_img=idct2(dct_img);
subplot(133); 
imshow(idct_img, [0, 255]); 
title('Reconstructed image');
