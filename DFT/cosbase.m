function cb = cosbase(N)
cb = zeros(N/2+1,N);


for i = 1 :N/2+1
    for j = 1 : N
        cb(i,j) = cos(2*pi*(i-1)*(j-1)/N);
    end
end
end