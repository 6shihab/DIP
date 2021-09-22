%haartransfrom
clc;
clear all;
close all;
 
i=imread('peppers.png');
subplot(231); imshow(i); title('original image');
 
%2D discrete wavelt transformations (single level) using Haar Basic
%functions
[ia1, ih1, iv1, id1]=dwt2(i, 'haar');
 
%display different coefficients
a1=ia1/255; h1=log10(ih1)*0.3; v1=log10(iv1)*0.3; d1=log10(id1)*0.3;
subplot(232); imshow(real(a1)); title('Approximation');
subplot(233); imshow(abs(h1)); title('Horizontal details');
subplot(234); imshow(abs(v1)); title('Vertical detail');
subplot(235); imshow(abs(d1)); title('diagonal detail');
 
%combined different coefficients in one image
transformed_i_level_1=[a1 v1 ; h1 d1];
subplot(236); imshow(abs(transformed_i_level_1)); 
title('level-1 transformation');
 
%reconstruction from level-1 transformation
rec_i=idwt2(ia1, ih1, iv1, id1, 'haar');
figure(2);
subplot(211);imshow(rec_i/255); 
title('Reconstruction from level-1 transformation');
 
%leve-2 transformation
[ia2, ih2, iv2, id2]=dwt2(ia1, 'haar');
 
%combined different coefficients in one image
a2=ia2/255; h2=log10(ih2)*0.3; v2=log10(iv2)*0.3; d2=log10(id2)*0.3;
tranformed_i_level_2=[[a2 v2 ; h2 d2] v1 ; h1 d1];
subplot(212);
imshow(abs(tranformed_i_level_2));
title('Level-2 transformation');
