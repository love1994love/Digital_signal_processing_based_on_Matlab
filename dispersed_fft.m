%%
%   fft
%   功能：实现快速傅里叶变换
%   格式：
%       y = fft(x)
%       y = fft(x,n)
%       说明：x为向量时，y是x的 快速傅里叶变换结果，与x具有相同的长度；；x为矩阵时
%               y是x的每一列向量进行fft，参数n表示执行n点fft。
%               若x的长度为2的整数次幂，函数fft运行速度最佳

%% 例题
% 对信号y=2*sin(2*pi*f1.*t)+sin(2*pi*f2.*t)分别进行64点和256点傅里叶变换，并画出频谱涂，其中采样频率为256Hz，f1=30Hz，f2=80Hz
clc;
clear;
fs = 256;
f1=30;f2=80;
t = 0 : 1/fs : 1-1/fs;      %信号的时间序列
p = length(t);              %信号的长度
y = 2*sin(2*pi*f1.*t) + sin(2*pi*f2.*t);
nfft1 = 64; nfft2=256;
rfft1 = fft(y, nfft1);
ys1 = abs(rfft1);
fz1 = (1:nfft1/2)*fs/nfft1;      %信号的真实频率序列   ==> fs -->（1/nfft1 到 1/2）* fs
rfft2 = fft(y, nfft2);
ys2 = abs(rfft2);
fz2 = (1:nfft2/2)*fs/nfft2;     % 信号的真实频率序列
figure(1)
subplot(121)
plot(fz1,ys1(1:nfft1/2)*2/p)
xlabel('频率');ylabel('幅值');
title('64点fft');
subplot(122)
plot(fz2,ys2(1:nfft2/2)*2/p);
xlabel('频率');ylabel('幅值');
title('256点fft');




