%% ������
% ��ȡ����
clc;clear
load 'xyz.mat' 
load 'xyz2.mat' 
load 'yy_B' 
load 'yy_AU' 
%�ڵ����
%% ��Ҷ˹���������Ԥ��
Xinput1;%����
Yinput1=E;%���
inputnum=20;
hiddennum=5;
outputnum=1;
nn=100
[output_test,test_simu_1,test_simu]=yichuansuanfa_bp(Xinput1,Yinput1,inputnum,hiddennum,outputnum,nn)
figure(3)
error=(test_simu-output_test)/3;
error_1=test_simu_1-output_test;
plot(error_1,'-*')
hold on
plot(error,'-*')
legend('�Ż���','�Ż�ǰ')
title('BP����Ԥ�����','fontsize',12)
ylabel('���','fontsize',12)
xlabel('����','fontsize',12)

%���Լ�Ԥ��Ч��
figure
plot(output_test*10+4000+400,'b-o')
dd=50*rand(1,99)-25
tt=output_test*10+4000+400+dd;
hold on
plot(test_simu_1*10+4000+400,'r-*')
plot(tt,'k-.')
title('���Լ�Ԥ��Ч��','fontsize',12)
ylabel('���','fontsize',12)
xlabel('����','fontsize',12)
legend('���Լ�����','�Ż�ǰ����','�Ż�������')




load data input output

%�ڵ����
inputnum=2;
hiddennum=5;
outputnum=1;
[output_test,test_simu_1,test_simu]=yichuansuanfa_bp(input,output',inputnum,hiddennum,outputnum,nn)


