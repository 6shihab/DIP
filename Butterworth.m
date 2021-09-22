clc;
clear all;
close all;
 
% Butterworth Lowpass Filter(BLPF)
img=imread('cameraman.tif');
[r,c]=size(img);
subplot(231), imshow(img), title('Source image');
IMG=fftshift(fft2(img));
 
%%%Creating filter
[u, v]=meshgrid(-floor(c/2):floor((c-1)/2),-floor(r/2):floor((r-1)/2));
D=sqrt(u.^2+v.^2);
D0=15;
n=1;
BLPF = 1./( 1.+ (D./D0).^(2*n) );

subplot(232), mesh(BLPF), title('BLPF')
 
BLPF_IMG=IMG.*BLPF;
blpf_img=ifft2(BLPF_IMG);
subplot(233), imshow(mat2gray(abs(blpf_img))), title('BLPF filtered image')
 
% Butterworth Highpass Filter(BHPF)
subplot(234), imshow(img), title('Source image')
D0=15;
n=1;
BHPF=1./( 1.+ 1./((D./D0).^(2*n)) );
subplot(235), mesh(BHPF), title('BHPF')
 
BHPF_IMG=IMG.*BHPF;
bhpf_img=ifft2(BHPF_IMG);
subplot(236), imshow(mat2gray(abs(bhpf_img))), title('BHPF filtered image')
