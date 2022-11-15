function audioDesencriptado = descifrar(d,n,c)
    format long
    row = size(c,1);
    col = size(c,2);
    audioDesencriptado = zeros(row,col);
    for i = 1:row
        for j = 1:col
            audioDesencriptado(i,j) = ModularExponentiation(c(i,j),d,n);
        end
    end
end