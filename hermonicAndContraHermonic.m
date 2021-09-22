clc;
clear all;
close all;
 
% Harmonic Mean Filter and Conrtaharmonic Mean Filter
img=imread('cameraman.tif');
[r,c]=size(img);
img=im2double(img);
subplot(221);
imshow(img);
title('Source image');
 
%%%Adding Gaussian Noise
noisy_img=imnoise(img,'gaussian');
subplot(222);
imshow(noisy_img);
title('Gaussian noisy image');
 
%%% 'valid' convolution(3*3) , so image dimension will be reduced
Q=1.5;
for i=1:r-2
    for j=1:c-2
        window = noisy_img(i:i+2,j:j+2);
        hmf_img(i,j)= harmmean( window(:) );
        chmf_img(i,j)= sum( window(:).^(Q+1) ) ./ sum( window(:).^Q );
    end
end
 
subplot(223);
imshow(hmf_img);
title('HMF filtered image');

subplot(224);
imshow(chmf_img);
title('CHMF filtered image');
