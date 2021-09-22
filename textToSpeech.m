clc;
clear all;
close all;
NET.addAssembly('System.speech');
mySpeaker=System.Speech.Synthesis.SpeechSynthesizer;
 
mySpeaker.Rate=0  ;
mySpeaker.Volume=100;
 
Speak(mySpeaker, 'this is digital Image and Speech Processing');
