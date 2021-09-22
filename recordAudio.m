clc;
clear all;
close all;
Fs=44100;
noc=1;
nob=16;
disp('Start Recording');
for i=1:3
    disp(num2str(i));
    pause(1);
end
recObj=audiorecorder(Fs,nob,noc);
% record(recObj);
recordblocking(recObj,5);
% play(recObj);
myRecording=getaudiodata(recObj);
plot(myRecording);
sound(myRecording,Fs);
audiowrite('Recorded_audio.wav',myRecording,Fs);
