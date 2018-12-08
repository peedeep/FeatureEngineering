function [E_1, E_2, E_3] = featureGenWave(X)

n = length(X);

Data = X;
%y=fft(A1);   %����fft�任
%en = sum(y.^2);   %����
%ku = kurtosis(A1);   %���ֵ
%printmat rm

wpname='db3';
Data=Data-mean(Data);
Data=detrend(Data);
nb=1;
wpt_1=wpdec(Data,nb,wpname); %�����ݽ���С�����ֽ�
for i=1:2^nb %wpcoef(wpt1,[n,i-1])�����n���i���ڵ��ϵ��
    E(i)=norm(wpcoef(wpt_1,[nb,i-1]),2);%���i���ڵ�ķ���ƽ������ʵҲ����ƽ����
end
E_total_1=sum(E); %��������
E_1 = E_total_1/n ;
for i=1:2^nb
    pfir(i)= E(i)/E_total_1;%��ÿ���ڵ�ĸ���
end

nb=2;
wpt_2=wpdec(Data,nb,wpname); %�����ݽ���С�����ֽ�
for i=1:2^nb %wpcoef(wpt1,[n,i-1])�����n���i���ڵ��ϵ��
    E(i)=norm(wpcoef(wpt_2,[nb,i-1]),2);%���i���ڵ�ķ���ƽ������ʵҲ����ƽ����
end
E_total_2=sum(E); %��������
E_2 = E_total_2/n;
for i=1:2^nb
    pfir(i)= E(i)/E_total_2;%��ÿ���ڵ�ĸ���
end

nb=3;
wpt_3=wpdec(Data,nb,wpname); %�����ݽ���С�����ֽ�
for i=1:2^nb %wpcoef(wpt1,[n,i-1])�����n���i���ڵ��ϵ��
    E(i)=norm(wpcoef(wpt_3,[nb,i-1]),2);%���i���ڵ�ķ���ƽ������ʵҲ����ƽ����
end
E_total_3=sum(E); %��������
E_3 = E_total_3/n;
for i=1:2^nb
    pfir(i)= E(i)/E_total_3;%��ÿ���ڵ�ĸ���
end
    
end


