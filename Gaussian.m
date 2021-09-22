clc;
clear all;
close all
 
% Gaussian Lowpass Filter(GLPF)
img=imread('cameraman.tif');
[r,c]=size(img);
subplot(231), imshow(img), title('Source image')
IMG=fftshift(fft2(img));
 
%%%Creating filter
[u,v]=meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));
D=sqrt(u.^2+v.^2);
D0=10;
GLPF = exp (-(D.^2)./(2*D0^2)) ;
subplot(232), mesh(GLPF), title('GLPF')
GLPF_IMG=IMG.*GLPF;
glpf_img=ifft2(GLPF_IMG);
subplot(233), imshow(mat2gray(abs(glpf_img))), title('GLPF filtered image')
 
% Gaussian Highpass Filter(GHPF)
subplot(234), imshow(img), title('Source image')
D0=10;
GHPF=1 - exp (-(D.^2)./(2*D0^2)) ;
subplot(235), mesh(GHPF), title('GHPF')
GHPF_IMG=IMG.*GHPF;
ghpf_img=ifft2(GHPF_IMG);
subplot(236), imshow(mat2gray(abs(ghpf_img))), title('GHPF filtered image')
