%Proyecto Final
close all
clear
clc
format long
load gong.mat;

[y, fs] = audioread('prueba.mp3');
gong = audioplayer(y,fs);
play(gong);

b = length(y);
t = 0:1/fs:(b-1)/fs;
figure(1);
plot(t,y);

%Calculo de la llave publica y llave privada
p=839;%privado
q=947;%privado
n=p*q;%publico
e=41;%publico ( llave publica )
phi=(p-1)*(q-1); %privado ( calculo de la llave privada )
clavePrivada = obtenerClavePrivada(e, phi);
%Es decir que se comparte (41,794533) es decir (e,n)
%y se mantiene en secreo p,q y (425377,794533) (clavePrivada,n)
fprintf('\n%d',clavePrivada);
mensaje = [77, 97, 116, 101, 109, 225, 116, 105, 99, 97, 115, 32, 68, 105, 115, 99, 114, 101, 116, 97, 115]
audioEncriptado = cifrar(e,n,mensaje);
%figure(2);
%plot(t,audioEncriptado);

audioDesencriptado = descifrar(clavePrivada,n,audioEncriptado);
audioDesencriptado
%figure(3);
%plot(t,audioDesencriptado);
