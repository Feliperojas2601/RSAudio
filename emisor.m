%Proyecto Final Teoria de la Informacion (Emisor)
%% limpieza y formato
close all
clear
clc
format long

%% 0. Variable
% Frecuencia de muestreo comun para voz
fs = 8000; 

%% 1. Grabar Voz (Ejemplo: Audio de WhatsApp)
rec = audiorecorder;
msg1 = msgbox('recording for 5 second');
recordblocking(rec,5);
delete(msg1);
msg2 = msgbox('recording done');

%% 2. Datos de la voz grabada
y = getaudiodata(rec,'uint8');
yp = getaudiodata(rec);
original = double(y);
figure(1);
plot(y); title('Voz Original');
% Guardamos los datos en un archivo de Excel
xlswrite('RSA_original_voice.xlsx',original);

%% 3. Reproducir la voz original
sound(yp,fs)

%% IV. Generating Key
% Numeros primos p y q
p = 13;             %privado
q = 23;             %privado
nval = p*q;         %publico
[eval,dval] = generarllaves(p,q);
%Es decir que se comparte (41,299) es decir (eval,nval)
%y se mantiene en secreo p,q y (425377,299) (clavePrivada,n)


fprintf('exponente publico,    e = %d \n',eval);
fprintf('modulo,               n = %d \n',nval);
fprintf('exponente privado,    d = %d \n\n',dval);
fprintf('llave publica (e,n),  (%d,%d)\n',eval,nval);
fprintf('llave privada (d,n),  (%d,%d)\n\n',dval,nval);

%% V. Cifrado
% cifrado usando la llave publica (e,n)
mensajeCifrado = cifrar(original,eval,nval);
figure(2);
plot(mensajeCifrado); title('Voz Cifrada');
% write encrypted voice data to xlsx
xlswrite('RSA_encrypted_voice.xlsx',mensajeCifrado);

%% VI. Reproducir voz encriptada
enc = uint8(mensajeCifrado);
encp = audioplayer(enc,8000);
play(encp)

