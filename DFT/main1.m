clc;clf;clear all;
N = 16;    %指定信号长度
x = round(10*rand(N,1));  %随机生成指定长度的信号，列向量形式

cb = cosbase(N);%生成DFI基函数
sb = sinbase(N);

ReX = zeros(N/2+1, 1);%初始化DFI结果数组
ImX = zeros(N/2+1, 1);

for i = 1 :N/2+1 %DFI变换，行向量形式的基函数乘以列向量形式的原始信号
    ReX(i) = cb(i,:)*x;
    ImX(i) = sb(i,:)*x;
end

Re = zeros(N/2+1,1);
Im = zeros(N/2+1,1);

for i = 1 :N/2+1 %对DFI变换结果进行调整
    Re(i) = ReX(i)/(N/2);
    Im(i) = ImX(i)/(N/2);
end

Re(1) = ReX(1)/N;
Re(N/2+1) = ReX(N/2+1)/N;


y = zeros(1,N);

for i = 1:N/2+1 %重建原始信号
    y = y + Re(i)*cb(i,:)+Im(i)*sb(i,:);%调整后的DFI变换系数乘以对应的基函数并求和
end

t = 1:N;


figure;
subplot(1,3,1),plot(t,x,'bo');
title('The original signal');
subplot(1,3,2),plot(t,y,'r*');
title('The reconstructed signal');
mps = 1e-9;
df = x-y';
df(df<mps) = 0;
subplot(1,3,3), plot(t,df,'r-');
title('difference between two signals');

