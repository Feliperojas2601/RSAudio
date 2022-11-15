function audioEncriptado = cifrar(e,n,m)
    format long
    row = size(m,1);
    col = size(m,2);
    audioEncriptado = zeros(row,col);
    for i = 1:row
        for j = 1:col
            audioEncriptado(i,j) = ModularExponentiation(m(i,j),e,n);
        end
    end
end