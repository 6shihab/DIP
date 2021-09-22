clc; 
clear all; 
close all;
 
% Homomorphic Filter(HMF)
img=imread('trees.tif');
[r,c]=size(img);
subplot(131), imshow(img), title('Source image')
IMG=fftshift(fft2(img));
 
%Dispaly Fourier Transformed Image
IMG1=log(1+abs(IMG));
m=max(IMG1(:));
figure(2), imshow(im2uint8(IMG1/m)), title('Fourier Transformed Image');
img=im2double(img);
IMG=fft2(log(img+0.01));
 
%%%Creating Butterworth High Pass Filter for HMF
%%%Creating filter
[u,v]=meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));
D=sqrt(u.^2+v.^2);
D0=15;
n=1;
BHPF = 1./( 1.+ (D0./D).^(2*n) );
figure(1), subplot(132), mesh(BHPF), title('BHPF for HMF')
 
BHPF_IMG=IMG.*BHPF;
real_img=real(ifft2(BHPF_IMG));
exp_img=exp(real_img);
subplot(133), imshow(mat2gray(abs(exp_img))), title('Homomorphic filtered image')
