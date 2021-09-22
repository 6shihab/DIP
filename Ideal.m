clc; 
clear all; 
close all;
 
% Ideal Lowpass Filter(ILPF)
img=imread('cameraman.tif');
[r,c]=size(img);
% disp(r);
% disp(c);
subplot(231);
imshow(img);
title('Source image');

imgfft=fft2(img);

IMG=fftshift(imgfft);
 
%%%Creating filter
[u,v]=meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));
% disp(u)
D=sqrt(u.^2+v.^2);
% disp(D);
D0=40;
ILPF=(D<=D0);
% disp(ILPF);

subplot(232);
mesh(double(ILPF));
title('ILPF');
 
ILPF_IMG=IMG.*ILPF;
ilpf_img=ifft2(ILPF_IMG);
% disp(abs(ilpf_img));
subplot(233);
imshow(mat2gray(abs(ilpf_img)));
title('ILPF filtered image');
 
% Ideal Highpass Filter(IHPF)
subplot(234);
imshow(img);
title('Source image');
 
D0=30;
IHPF=(D>D0);
subplot(235);
mesh(double(IHPF));
title('IHPF');
 
IHPF_IMG=IMG.*IHPF;
ihpf_img=ifft2(IHPF_IMG);
subplot(236);
imshow(mat2gray(abs(ihpf_img)));
title('IHPF filtered image');
