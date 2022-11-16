%Proyecto Final Teoria de la Informacion (Receptor)
%% limpieza y formato
close all
clear
clc
format long

%% 0. Variable
% Frecuencia de muestreo comun para voz
fs = 8000; 
% Usar la llave privada (d,n), 
d = 53;     
n = 299;

%% 1. Cargar los datos encriptados
en = uigetfile('*.xlsx');
mensajeCifrado = xlsread(en);
z = uint8(mensajeCifrado);
figure(1);
plot(mensajeCifrado); 
title('Voz Cifrada');

%% 2. Reproducir voz cifrada
k = audioplayer(z,fs);
play(k)

%% 3. descifrar
mensajeDescifrado = descifrar(mensajeCifrado,d,n);
figure(2);
plot(mensajeDescifrado);
title('voz descifrada');
dec = uint8(mensajeDescifrado);
xlswrite('RSA_decrypted_voice.xlsx',dec);

%% 4. Reproducir voz descifrada
decp = audioplayer(dec,8000);
play(decp)