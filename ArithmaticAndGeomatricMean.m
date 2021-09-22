clc;
clear all;
close all;
 
% Arithmetic Mean Filter and Geometric Mean Filter
img=imread('cameraman.tif');
[r,c]=size(img);
img=im2double(img);
subplot(221);imshow(img);title('Source image');
 
%%%Adding Gaussian Noise
noisy_img=imnoise(img,'gaussian');
subplot(222);imshow(noisy_img);title('Gaussian noisy image');
 
%%% 'valid' convolution(3*3) , so image dimension will be reduced
for i=1:r-2
    for j=1:c-2
        window = noisy_img(i:i+2,j:j+2);
         amf_img(i,j)= mean( window(:) );
        gmf_img(i,j)= geomean( window(:) );
    end
end
 
subplot(223);imshow(amf_img);title('AMF filtered image');
subplot(224);imshow(gmf_img);title('GMF filtered image');
