function idftbs = idftbase(N)

cb = zeros(N,N);

for j = 1 : N
    for k = 1 : N
        idftbs(j,k) = cos(2*pi*(j-1)*(k-1)/N)+sin(2*pi*(j-1)*(k-1)/N)*i;
    end
end