clc;clf;clear all;
N = 16;    %ָ���źų���
x = round(10*rand(N,1));  %�������ָ�����ȵ��źţ���������ʽ

cb = cosbase(N);%����DFI������
sb = sinbase(N);

ReX = zeros(N/2+1, 1);%��ʼ��DFI�������
ImX = zeros(N/2+1, 1);

for i = 1 :N/2+1 %DFI�任����������ʽ�Ļ�����������������ʽ��ԭʼ�ź�
    ReX(i) = cb(i,:)*x;
    ImX(i) = sb(i,:)*x;
end

Re = zeros(N/2+1,1);
Im = zeros(N/2+1,1);

for i = 1 :N/2+1 %��DFI�任������е���
    Re(i) = ReX(i)/(N/2);
    Im(i) = ImX(i)/(N/2);
end

Re(1) = ReX(1)/N;
Re(N/2+1) = ReX(N/2+1)/N;


y = zeros(1,N);

for i = 1:N/2+1 %�ؽ�ԭʼ�ź�
    y = y + Re(i)*cb(i,:)+Im(i)*sb(i,:);%�������DFI�任ϵ�����Զ�Ӧ�Ļ����������
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

