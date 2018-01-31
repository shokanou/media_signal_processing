clc;clf;clear all;
N = 8; %指定信号长度
x = round(10*rand(N,1));%随机生成指定长度的信号，列向量形式
dftbs = dftbase(N);%生成DFI基函数，复数形式
rdft = zeros(N,1);%用于保存dft结果

for k = 1:N
    rdft(k) = sum(dftbs(k,:)*x);%DFT变换
end

idft = zeros(N,1);%初始化变量，用于保存idft结果
idftbs = idftbase(N);%生成IDFT基函数，复数形式

for k = 1 :N
    idft(k) = sum(idftbs(k,:)*rdft)/N;%IDFT变换
end

t = 1:N;

figure;
subplot(3,1,1),plot(t,x);
subplot(3,1,2),plot(t,rdft);
subplot(3,1,3),plot(t,idft);