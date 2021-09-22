clc;
clear all;
close all;
% [filename, pathname]=uigetfile(".", 'select the input audio');
[x, Fs]=audioread(num2str('Recorded_audio.wav'));
n=length(x); %get the length of the audio file
a=0.8; %attenuation factor
d=2000; %delay
y=zeros(n+d, 1); %initialize the output audio file
disp(y)
xn=padarray(x, [d,0], 0, 'Pre');
 
for i=(d+1):1:n
     y(i-d, 1)=x(i)+a*xn(i-d);
end
 
audiowrite('echo_signal.wav',y,Fs);
sound(y,Fs);
