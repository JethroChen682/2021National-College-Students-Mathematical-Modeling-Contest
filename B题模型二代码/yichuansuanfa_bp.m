
%% �ô���Ϊ�����Ŵ��㷨�������Ԥ�����
% ��ջ�������
function [output_test,test_simu_1,test_simu]=yichuansuanfa_bp(input,output,inputnum,hiddennum,outputnum,nn)
%input Ϊ��������  ��Ϊ������������Ϊ�ж��ٸ������
%outputһ��
%inputnum,hiddennum,outputnum���ֱ�Ϊ����㣬���ز㣬�����ڵ����
%nΪǰ������������Ϊѵ��������ôʣ�µ���Ϊ���Լ�
% 
%% ����ṹ����
%��ȡ����
% load data input output
% 
% %�ڵ����
% inputnum=2;
% hiddennum=5;
% outputnum=1;
input_train=input(1:nn,:)';%ȡ1��1900�е�������ѵ��
input_test=input(nn+1:end,:)';%ȡ1901��2000�е�����������
output_train=output(1:nn,:)';
output_test=output(nn+1:end,:)';
%ѡ����������������ݹ�һ��
[inputn,inputps]=mapminmax(input_train);%��һ����[-1,1]֮�䣬inputps��������һ��ͬ���Ĺ�һ��
[outputn,outputps]=mapminmax(output_train);
%��������
net=newff(inputn,outputn,hiddennum);%�������㣬5����������Ԫ
%% δ���Ż���bp�㷨
net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00001;
%����ѵ��
[net,per2]=train(net,inputn,outputn);
%% BP����Ԥ��
%���ݹ�һ��
inputn_test_1=mapminmax('apply',input_test,inputps);
an_1=sim(net,inputn_test_1);
test_simu_1=mapminmax('reverse',an_1,outputps);
error_1=test_simu_1-output_test;
% figure(2)
% plot((output_test-test_simu_1)./test_simu_1,'-*');
% title('������Ԥ�����ٷֱ�')
% figure(3)
% plot(error_1,'-*')
% title('BP����Ԥ�����','fontsize',12)
% ylabel('���','fontsize',12)
% xlabel('����','fontsize',12)
%% �Ŵ��㷨������ʼ��
maxgen=20;                          %��������������������
sizepop=10;                         %��Ⱥ��ģ
pcross=0.2;                       %�������ѡ��0��1֮��
pmutation=0.1;                    %�������ѡ��0��1֮��

%�ڵ�����������������Ȩֵ��������ֵ�����������Ȩֵ�������ֵ��4���������һ��Ⱦɫ�壩
numsum=inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum;%21����10,5,5,1

lenchrom=ones(1,numsum);%���峤�ȣ���ʱ�����ΪȾɫ�峤�ȣ���1��numsum�еľ���      
bound=[-3*ones(numsum,1) 3*ones(numsum,1)];    %��numsum��2�еĴ������󣬵�1����-3����2����3

%------------------------------------------------------��Ⱥ��ʼ��--------------------------------------------------------
individuals=struct('fitness',zeros(1,sizepop), 'chrom',[]);  %����Ⱥ��Ϣ����Ϊһ���ṹ�壺10���������Ӧ��ֵ��10��Ⱦɫ�������Ϣ
avgfitness=[];                      %ÿһ����Ⱥ��ƽ����Ӧ��,һά
bestfitness=[];                     %ÿһ����Ⱥ�������Ӧ��
bestchrom=[];                       %��Ӧ����õ�Ⱦɫ�壬���������Ϣ
%��ʼ����Ⱥ
for i=1:sizepop
    %�������һ����Ⱥ
    individuals.chrom(i,:)=Code(lenchrom,bound);    %���루binary�������ƣ���grey�ı�����Ϊһ��ʵ����float�ı�����Ϊһ��ʵ��������
    x=individuals.chrom(i,:);
    %������Ӧ��
    individuals.fitness(i)=fun(x,inputnum,hiddennum,outputnum,net,inputn,outputn);   %Ⱦɫ�����Ӧ��
end

FitRecord=[];

%����õ�Ⱦɫ��
[bestfitness, bestindex]=min(individuals.fitness);%bestindex����Сֵ��������λ��/ĳ�����壩��bestfitness��ֵΪ��С��Ӧ��ֵ
bestchrom=individuals.chrom(bestindex,:);  %��õ�Ⱦɫ�壬��10����������ѡ����
avgfitness=sum(individuals.fitness)/sizepop; %Ⱦɫ���ƽ����Ӧ��(���и�����Ӧ�Ⱥ� / ������)
% ��¼ÿһ����������õ���Ӧ�Ⱥ�ƽ����Ӧ��
trace=[avgfitness bestfitness]; %trace����1��2�У�avgfitness��bestfitness��������ֵ
 
%% ���������ѳ�ʼ��ֵ��Ȩֵ
% ������ʼ
for i=1:maxgen
    % ѡ��
    individuals=Select(individuals,sizepop); 
%     avgfitness=sum(individuals.fitness)/sizepop;%��Ⱥ��ƽ����Ӧ��ֵ
    %����
    individuals.chrom=Cross(pcross,lenchrom,individuals.chrom,sizepop);
    % ����
    individuals.chrom=Mutation(pmutation,lenchrom,individuals.chrom,sizepop,i,maxgen,bound);
    
    % ������Ӧ�� 
    for j=1:sizepop
        x=individuals.chrom(j,:); %������Ϣ
        individuals.fitness(j)=fun(x,inputnum,hiddennum,outputnum,net,inputn,outputn);  %����ÿ���������Ӧ��ֵ 
    end
    
    %�ҵ���С�������Ӧ�ȵ�Ⱦɫ�弰��������Ⱥ�е�λ��
    [newbestfitness,newbestindex]=min(individuals.fitness);%�����Ӧ��ֵ
    [worestfitness,worestindex]=max(individuals.fitness);
    % ���Ÿ������
    if bestfitness>newbestfitness
        bestfitness=newbestfitness;
        bestchrom=individuals.chrom(newbestindex,:);
    end
    individuals.chrom(worestindex,:)=bestchrom;%ȡ�������ģ��൱����̭
    individuals.fitness(worestindex)=bestfitness;
    
    avgfitness=sum(individuals.fitness)/sizepop;
    
    trace=[trace;avgfitness bestfitness]; %��¼ÿһ����������õ���Ӧ�Ⱥ�ƽ����Ӧ��
    FitRecord=[FitRecord;individuals.fitness];%��¼ÿһ����������Ⱥ���и������Ӧ��ֵ
end

%% �Ŵ��㷨������� 
figure
[r, c]=size(trace);
plot([1:r]',trace(:,2),'b--');
title(['��Ӧ������  ' '��ֹ������' num2str(maxgen)]);
xlabel('��������');ylabel('��Ӧ��');
legend('ƽ����Ӧ��','�����Ӧ��');
disp('��Ӧ��                   ����');

%% �����ų�ʼ��ֵȨֵ��������Ԥ��
% %���Ŵ��㷨�Ż���BP�������ֵԤ��
w1=x(1:inputnum*hiddennum);
B1=x(inputnum*hiddennum+1:inputnum*hiddennum+hiddennum);
w2=x(inputnum*hiddennum+hiddennum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum);
B2=x(inputnum*hiddennum+hiddennum+hiddennum*outputnum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum);

net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=reshape(B2,outputnum,1);

%% BP����ѵ��
%�����������
net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.00001;

%����ѵ��
[net,per2]=train(net,inputn,outputn);

%% BP����Ԥ��
%���ݹ�һ��
inputn_test=mapminmax('apply',input_test,inputps);
an=sim(net,inputn_test);
test_simu=mapminmax('reverse',an,outputps);
error=test_simu-output_test;

figure
plot((output_test-test_simu_1)./test_simu_1,'-*');
hold on
plot((output_test-test_simu)./test_simu,'-*');
title('������Ԥ�����ٷֱ�')
legend('�Ż���','�Ż�ǰ')

figure
plot(error_1,'-*')
hold on
plot(error,'-*')
legend('�Ż�ǰ','�Ż���')
title('BP����Ԥ�����','fontsize',12)
ylabel('���','fontsize',12)
xlabel('����','fontsize',12)

%���Լ�Ԥ��Ч��
figure
plot(output_test,'b-o')
hold on
plot(test_simu_1,'r-*')
plot(test_simu,'k-.')
title('���Լ�Ԥ��Ч��','fontsize',12)
ylabel('���','fontsize',12)
xlabel('����','fontsize',12)
legend('���Լ�����','�Ż�ǰ����','�Ż�������')
save('net_11','net')
end




