function basis = dct_basis(u)

basis = zeros(1,8);


for i = 0:7
    basis(i+1) = cos((2*i+1)*u*pi/16);
end

if u == 0
    basis = basis*sqrt(2)/4;
else
    basis = basis/2;
end 
    
end