function Hs = calculate_source_entropy(probs)
%Calcualte the entroy of the message source
% Hs: the entroy
% probs: a row vector, 1*N.
%fyf

mps = 1e-7;
probs(probs == 0) = mps; %to aviod zeros value.

if min(probs(:)) <= 0
    error('Some probability value is less than zero!');
end

if sum(probs) ~= 1
    probs = probs/sum(probs);
end

Hs = sum(probs.*log(1./probs));
%it is equal to the following one.
%Hs = sum(-probs.*log(probs));

end