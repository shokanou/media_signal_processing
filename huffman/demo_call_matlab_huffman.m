function demo_call_matlab_huffman
% A demo to show how to call the huffman encode and decode functions of matlab.
% 1D digital seqence signal

clc;

%% Create random digit sequence
digits = 0:9;  %distinct digit symbols that the data source can produce.
probs = rand(1,10);  %randomly set the probability for each symbol.
probs = probs./sum(probs); %normalize the sum to 1.
digitSeq = randsrc(500,1,[digits; probs]); %create digit sequence

Hs = calculate_source_entropy(probs);

%% Create codebook or dictionary
[dict, avglen] = huffmandict(digits, probs);

%% Encode the sequence
comp = huffmanenco(digitSeq, dict);

%% Decode the sequence
deDigitSeq = huffmandeco(comp, dict);

%% Analysis result
figure;
subplot(3,1,1), plot(digitSeq); title('The original data');
subplot(3,1,2), plot(deDigitSeq); title('The decoded result');
subplot(3,1,3), plot(deDigitSeq-digitSeq); title('The difference value');

end