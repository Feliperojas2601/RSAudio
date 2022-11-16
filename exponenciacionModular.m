function Resultado = exponenciacionModular(base, exponente,m)
    base = mod(base,m);
    Resultado = 1;
    for k = 1:exponente
        Resultado = Resultado.*base;
        Resultado = mod(Resultado,m);
    end
end