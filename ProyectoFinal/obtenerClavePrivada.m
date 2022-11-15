function clavePrivada = obtenerClavePrivada(e,phi_n)
  y=1;
  while mod(( y * phi_n ) + 1, e) ~= 0
    y=y+1;
  end
  clavePrivada = (( y * phi_n )+1)/e ;
end