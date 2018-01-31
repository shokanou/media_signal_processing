clc;clf;clear all;
N = 8; %ָ���źų���
x = round(10*rand(N,1));%�������ָ�����ȵ��źţ���������ʽ
dftbs = dftbase(N);%����DFI��������������ʽ
rdft = zeros(N,1);%���ڱ���dft���

for k = 1:N
    rdft(k) = sum(dftbs(k,:)*x);%DFT�任
end

idft = zeros(N,1);%��ʼ�����������ڱ���idft���
idftbs = idftbase(N);%����IDFT��������������ʽ

for k = 1 :N
    idft(k) = sum(idftbs(k,:)*rdft)/N;%IDFT�任
end

t = 1:N;

figure;
subplot(3,1,1),plot(t,x);
subplot(3,1,2),plot(t,rdft);
subplot(3,1,3),plot(t,idft);