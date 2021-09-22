clc;
clear all;
close all;
 
I=imread('coins.png');
figure(1),
subplot(231), imshow(I), title('Original image');
 
BW1=edge(I, 'sobel');
BW2=edge(I, 'canny');
BW3=edge(I, 'roberts');
 
subplot(232), imshow(BW1), title('Soble filter');
subplot(233), imshow(BW3), title('Roberts filter');
 
I=imread('circuit.tif');
subplot(234), imshow(I), title('Original image');
 
BW1=edge(I, 'zerocross');
BW2=edge(I, 'prewitt');

 
subplot(235), imshow(BW1), title('zerocross filter');
subplot(236), imshow(BW2), title('prewit filter');
