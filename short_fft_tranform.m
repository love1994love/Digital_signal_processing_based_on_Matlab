%%
%   tfrstft
%   功能：实现离散序列的短时傅里叶变换，是tftoolbox工具箱中的函数
%   格式：
%       [tfr, t, f] = tfrstft(x)：计算时间序列x的短时傅里叶变换，参数tfr为短时傅里叶变换系数，t为系数tfr对应
%                                   的时刻，f为归一化频率向量。
%       [tfr, t, f] = tfrstft(x, t)：计算对应时刻t的短时傅里叶变换。
%       [tfr, t, f] = tfrstft(x, t, n)：计算n点对应时刻t的短时傅里叶变换。
%       [tfr, t, f] = tfrstft(x, t, n, h)：参数h为归一化频率平滑窗。
%       [tfr, t, f] = tfrstft(x, t, n, h, trace)：trace显示算法进度
%       说明：x为信号
%                    t 为时间（缺省为 1:length(x));
%                    n为频率数（缺省值为 length(x));
%                    h为频率滑窗，h归一化为单位能量（缺省值为 hamming(n/4));
%                    trace为非零，则显示算法的进度（缺省值为0）；
%                    tfr为时频分解（为复数值），频率轴观察范围为 -0.5~0.5；
%                    f为归一化频率。

%% 例题
% 构建一个256点仿真信号x(N)，采样频率为256Hz，在区间(30,80)和(140,190)内正弦信号的频率分别为32Hz和64Hz，采用tfrstft对其进行时频分析
clc;
clear;
FS = 256;               %采样频率
Ts = 1/FS;              %时间间隔
N = 256;                %信号长度
pt = 0*Ts:Ts:(N-1)*Ts;      %信号的时间间隔序列
t1 = zeros(N,1); t2 = zeros(N,1);
t1(30:80) = pt(30:80); t2(140:190) = pt(140:190);
f1 = 32; f2 = 64;       % 不同区间正弦信号的频率，根据采样频率可以计算得到归一化频率分别为32/256=0.125和64/256=0.25
x = sin(2*pi*f1.*t1) + sin(2*pi*f2.*t2);        %构建仿真信号
figure(1)
plot(pt, x);            %画出仿真信号的时域波形图
xlabel('时间');ylabel('幅值');
title('仿真信号时域波形图');
figure(2)
subplot(211)
[tfr, t, f] = tfrstft(x);        %进行短时傅里叶变化，Hamming窗长度采用默认长度65
pcolor(t, f(1:N/2,1),abs(tfr([1:N/2],:)));
colorbar;       %加上能量映射条
xlabel('采样点数');ylabel('归一化频率');title('时频分布图');
subplot(212)
t = (t-1)*Ts;   %横坐标为时间
f = f*FS;       %纵坐标为实际频率 
pcolor(t, f(1:N/2,1),abs(tfr([1:N/2],:)));
xlabel('时间');ylabel('频率');
colorbar;       %加上能量映射条



