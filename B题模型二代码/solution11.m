clc;clear
data=xlsread('����1-���������','�������ݱ�');
data1=data(:,[1,2]);
data2=data(:,[1,4]);
xxx=data1(1:5,1);
yyy=data1(1:5,2);
%% �ڴ�֮ǰ���������ԡ�����ʽ�����Ǻ����Ĺ�ϵ
figure
subplot(2,2,1)
[fitresult, gof] = createFit_zhishu(xxx, yyy)
title('ָ�����')
subplot(2,2,2)
[fitresult2, gof2] = createFit_xianxing(xxx, yyy)
title('�������')
subplot(2,2,3)
[fitresult3, gof3] = createFit_duoxiangshi(xxx, yyy)
title('3�ζ���ʽ���')
subplot(2,2,4)
[fitresult4, gof4] = createFit_sanjiao(xxx, yyy)
title('���Ǻ������')
%% ̽���Ҵ�ת�������¶ȵĹ�ϵ

TT_x=cell(21,1);
TT_y=cell(21,1);
TT_x{1}=data1(1:5,1);TT_y{1}=data1(1:5,2);
TT_x{2}=data1(6:10,1);TT_y{2}=data1(6:10,2);
TT_x{3}=data1(11:17,1);TT_y{3}=data1(11:17,2);
TT_x{4}=data1(18:23,1);TT_y{4}=data1(18:23,2);
TT_x{5}=data1(24:29,1);TT_y{5}=data1(24:29,2);
TT_x{6}=data1(30:34,1);TT_y{6}=data1(30:34,2);
TT_x{7}=data1(35:39,1);TT_y{7}=data1(35:39,2);
TT_x{8}=data1(40:44,1);TT_y{8}=data1(40:44,2);
TT_x{9}=data1(45:49,1);TT_y{9}=data1(45:49,2);
TT_x{10}=data1(50:54,1);TT_y{10}=data1(50:54,2);
TT_x{11}=data1(55:59,1);TT_y{11}=data1(55:59,2);
TT_x{12}=data1(60:64,1);TT_y{12}=data1(60:64,2);
TT_x{13}=data1(65:69,1);TT_y{13}=data1(65:69,2);
TT_x{14}=data1(70:74,1);TT_y{14}=data1(70:74,2);
TT_x{15}=data1(75:79,1);TT_y{15}=data1(75:79,2);
TT_x{16}=data1(80:84,1);TT_y{16}=data1(80:84,2);
TT_x{17}=data1(85:90,1);TT_y{17}=data1(85:90,2);
TT_x{18}=data1(91:96,1);TT_y{18}=data1(91:96,2);
TT_x{19}=data1(97:102,1);TT_y{19}=data1(97:102,2);
TT_x{20}=data1(103:108,1);TT_y{20}=data1(103:108,2);
TT_x{21}=data1(109:114,1);TT_y{21}=data1(109:114,2);
for i=1:21
     xxx=TT_x{i};
     yyy=TT_y{i};
   [fitresult, gof] = createFit(xxx, yyy)
end

%% ̽����C4 ϩ����ѡ�������¶ȵĹ�ϵ
TT_x2=cell(21,1);
TT_y2=cell(21,1);
TT_x2{1}=data2(1:5,1);TT_y2{1}=data2(1:5,2);
TT_x2{2}=data2(6:10,1);TT_y2{2}=data2(6:10,2);
TT_x2{3}=data2(11:17,1);TT_y2{3}=data2(11:17,2);
TT_x2{4}=data2(18:23,1);TT_y2{4}=data2(18:23,2);
TT_x2{5}=data2(24:29,1);TT_y2{5}=data2(24:29,2);
TT_x2{6}=data2(30:34,1);TT_y2{6}=data2(30:34,2);
TT_x2{7}=data2(35:39,1);TT_y2{7}=data2(35:39,2);
TT_x2{8}=data2(40:44,1);TT_y2{8}=data2(40:44,2);
TT_x2{9}=data2(45:49,1);TT_y2{9}=data2(45:49,2);
TT_x2{10}=data2(50:54,1);TT_y2{10}=data2(50:54,2);
TT_x2{11}=data2(55:59,1);TT_y2{11}=data2(55:59,2);
TT_x2{12}=data2(60:64,1);TT_y2{12}=data2(60:64,2);
TT_x2{13}=data2(65:69,1);TT_y2{13}=data2(65:69,2);
TT_x2{14}=data2(70:74,1);TT_y2{14}=data2(70:74,2);
TT_x2{15}=data2(75:79,1);TT_y2{15}=data2(75:79,2);
TT_x2{16}=data2(80:84,1);TT_y2{16}=data2(80:84,2);
TT_x2{17}=data2(85:90,1);TT_y2{17}=data2(85:90,2);
TT_x2{18}=data2(91:96,1);TT_y2{18}=data2(91:96,2);
TT_x2{19}=data2(97:102,1);TT_y2{19}=data2(97:102,2);
TT_x2{20}=data2(103:108,1);TT_y2{20}=data2(103:108,2);
TT_x2{21}=data2(109:114,1);TT_y2{21}=data2(109:114,2);

for i=1:21
     xxx2=TT_x2{i};
     yyy2=TT_y2{i};
   [fitresult, gof] = createFit2(xxx2, yyy2)
end

%% ���Ը��� 2 �� 350 ��ʱ�����Ĵ߻��������һ��ʵ�鲻ͬʱ��Ĳ��Խ�����з�����
data33=xlsread('����2');
xx=data33(:,1);
figure
hold on 
for j=1:7
    yy=data33(:,j+1);
    plot(xx,yy,'+-');
end
legend('�Ҵ�ת����(%)','��ϩѡ����','C4ϩ��ѡ����','��ȩѡ����','̼��Ϊ4-12֬����','�׻�����ȩ�ͼ׻����״�','����','Location', 'best')
xlabel('�¶�')
ylabel('��ֵ')
disp('�Զ�������ָ��ֵ���£�')
for j=1:7
    yy=data33(:,j+1);
sum((yy(2:end)-yy(1:(end-1)))./yy(1:(end-1)))
end




