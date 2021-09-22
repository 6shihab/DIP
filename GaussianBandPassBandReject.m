clc;
clear all;
close all;
 
% Gaussian Bandreject Filter(GBRF)
img=imread('cameraman.tif');
[r,c]=size(img);
imshow(img);
title('Source image')
[u,v]=meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));
 
%%%Adding Noise
sin_noise= 15*sin( 2*pi*1/10*u + 2*pi*1/10*v);
noisy_img=double(img)+sin_noise;
NOISY_IMG=fftshift(fft2(noisy_img));
figure(2)
subplot(231);
imshow(noisy_img,[]);
title('Sinusoidal noisy image');
 
subplot(234);
imshow(mat2gray(log(1+abs(NOISY_IMG))));
title('FFT of noisy image');
 
%%%Creating filter
D=sqrt(u.^2+v.^2);
D0=50;
W=20;
GBRF= 1 - exp ( -(1/2).* ( ((D.^2)-(D0.^2)) ./ (D.*W) ).^2 ) ;
subplot(232);mesh(GBRF);title('GBRF');
GBRF_IMG=NOISY_IMG.*GBRF;
gbrf_img=ifft2(GBRF_IMG);
subplot(233);
imshow(mat2gray(abs(gbrf_img)));
title('GBRF filtered image');
 
% Gaussian Bandpass Filter(GBPF)
GBPF=1 - GBRF;
subplot(235);
mesh(GBPF);
title('GBPF');
 
GBPF_IMG=NOISY_IMG.*GBPF;
gbpf_img=ifft2(GBPF_IMG);
subplot(236);
imshow(mat2gray(abs(gbpf_img)));
title('GBPF filtered image');
