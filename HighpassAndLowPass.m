clc;
i1=imread('Fig0333(a)(test_pattern_blurring_orig).tif');

figure(1);
subplot(131);
imshow(i1);
title('Source Image');
 
% Lowpass filter
LowKernel = [ 1 1 1; 1 -10 1; 1 1 1 ];
lpfi = conv2(LowKernel,i1);
subplot(132)
imshow(lpfi);
title('Low pass filtered image');
 

% Highpass filter
HighKernel = [ -1 -1 -1; -1 10 -1; -1 -1 -1 ];
hpfi = conv2(HighKernel, i1);
subplot(133);
imshow(hpfi);
title('High pass filtered image');
