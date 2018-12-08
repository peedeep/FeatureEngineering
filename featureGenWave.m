function [E_1, E_2, E_3] = featureGenWave(X)

n = length(X);

Data = X;
%y=fft(A1);   %进行fft变换
%en = sum(y.^2);   %能量
%ku = kurtosis(A1);   %最大值
%printmat rm

wpname='db3';
Data=Data-mean(Data);
Data=detrend(Data);
nb=1;
wpt_1=wpdec(Data,nb,wpname); %对数据进行小波包分解
for i=1:2^nb %wpcoef(wpt1,[n,i-1])是求第n层第i个节点的系数
    E(i)=norm(wpcoef(wpt_1,[nb,i-1]),2);%求第i个节点的范数平方，其实也就是平方和
end
E_total_1=sum(E); %求总能量
E_1 = E_total_1/n ;
for i=1:2^nb
    pfir(i)= E(i)/E_total_1;%求每个节点的概率
end

nb=2;
wpt_2=wpdec(Data,nb,wpname); %对数据进行小波包分解
for i=1:2^nb %wpcoef(wpt1,[n,i-1])是求第n层第i个节点的系数
    E(i)=norm(wpcoef(wpt_2,[nb,i-1]),2);%求第i个节点的范数平方，其实也就是平方和
end
E_total_2=sum(E); %求总能量
E_2 = E_total_2/n;
for i=1:2^nb
    pfir(i)= E(i)/E_total_2;%求每个节点的概率
end

nb=3;
wpt_3=wpdec(Data,nb,wpname); %对数据进行小波包分解
for i=1:2^nb %wpcoef(wpt1,[n,i-1])是求第n层第i个节点的系数
    E(i)=norm(wpcoef(wpt_3,[nb,i-1]),2);%求第i个节点的范数平方，其实也就是平方和
end
E_total_3=sum(E); %求总能量
E_3 = E_total_3/n;
for i=1:2^nb
    pfir(i)= E(i)/E_total_3;%求每个节点的概率
end
    
end


