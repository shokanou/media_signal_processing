function rB = remove_less_important_entry(B, N)

[H, W] = size(B);

%copy
rB = B;

rB(N+1:end,:) = 0;
rB(:,N+1:end) = 0;

for i = 1:N
    for j = 1:N
       if (j > N-i)
           rB(i,j) = 0;
       end
    end
end

end