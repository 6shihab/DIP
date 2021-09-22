clc;
clear all;
close all;
 
% Butterworth Bandreject Filter(BBRF)
img=imread('cameraman.tif');
[r,c]=size(img);
imshow(img);title('Source image');
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
n=1;
W=20;
BBRF=1./( 1.+ ( (D.*W) ./ (D.^2-D0.^2) ) .^(2*n) );
subplot(232);mesh(BBRF);title('BBRF')
BBRF_IMG=NOISY_IMG.*BBRF;
bbrf_img=ifft2(BBRF_IMG);
subplot(233);
imshow(mat2gray(abs(bbrf_img)));
title('BBRF filtered image')
 
% Butterworth Bandpass Filter(BBPF)
BBPF= 1 - BBRF;
subplot(235);
mesh(BBPF);
title('BBPF')
 
BBPF_IMG=NOISY_IMG.*BBPF;
bbpf_img=ifft2(BBPF_IMG);
subplot(236);
imshow(mat2gray(abs(bbpf_img)));
title('BBPF filtered image')
