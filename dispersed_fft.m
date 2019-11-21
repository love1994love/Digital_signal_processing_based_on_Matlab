%%
%   fft
%   ���ܣ�ʵ�ֿ��ٸ���Ҷ�任
%   ��ʽ��
%       y = fft(x)
%       y = fft(x,n)
%       ˵����xΪ����ʱ��y��x�� ���ٸ���Ҷ�任�������x������ͬ�ĳ��ȣ���xΪ����ʱ
%               y��x��ÿһ����������fft������n��ʾִ��n��fft��
%               ��x�ĳ���Ϊ2���������ݣ�����fft�����ٶ����

%% ����
% ���ź�y=2*sin(2*pi*f1.*t)+sin(2*pi*f2.*t)�ֱ����64���256�㸵��Ҷ�任��������Ƶ��Ϳ�����в���Ƶ��Ϊ256Hz��f1=30Hz��f2=80Hz
clc;
clear;
fs = 256;
f1=30;f2=80;
t = 0 : 1/fs : 1-1/fs;      %�źŵ�ʱ������
p = length(t);              %�źŵĳ���
y = 2*sin(2*pi*f1.*t) + sin(2*pi*f2.*t);
nfft1 = 64; nfft2=256;
rfft1 = fft(y, nfft1);
ys1 = abs(rfft1);
fz1 = (1:nfft1/2)*fs/nfft1;      %�źŵ���ʵƵ������   ==> fs -->��1/nfft1 �� 1/2��* fs
rfft2 = fft(y, nfft2);
ys2 = abs(rfft2);
fz2 = (1:nfft2/2)*fs/nfft2;     % �źŵ���ʵƵ������
figure(1)
subplot(121)
plot(fz1,ys1(1:nfft1/2)*2/p)
xlabel('Ƶ��');ylabel('��ֵ');
title('64��fft');
subplot(122)
plot(fz2,ys2(1:nfft2/2)*2/p);
xlabel('Ƶ��');ylabel('��ֵ');
title('256��fft');



