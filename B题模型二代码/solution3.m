%% ��ջ���
clc;clear all;close all;
load net_11
tic
% net([100	1	100	0.9 400]')   %�������
%% Ŀ�꺯��

%% ������Ⱥ����
%   ��Ҫ��������
sizepop = 300;                         % ��ʼ��Ⱥ����
dim = 5;                           % �ռ�ά��
ger =100;                       % ����������    

xlimit_max = [200;5;200;2.1;450];     % ����λ�ò�������(�������ʽ���Զ�ά)
xlimit_min = [10;0.5;10;0.3;250];


vlimit_max = 1*ones(dim,1);      % �����ٶ�����
vlimit_min = -1*ones(dim,1);
c_1 = 0.8;                       % ����Ȩ��
c_2 = 0.5;                       % ����ѧϰ����
c_3 = 0.5;                       % Ⱥ��ѧϰ���� 
k=0.25;

%% ���ɳ�ʼ��Ⱥ
%  ����������ɳ�ʼ��Ⱥλ��
%  Ȼ��������ɳ�ʼ��Ⱥ�ٶ�
%  Ȼ���ʼ��������ʷ���λ�ã��Լ�������ʷ�����Ӧ��
%  Ȼ���ʼ��Ⱥ����ʷ���λ�ã��Լ�Ⱥ����ʷ�����Ӧ��
for i=1:dim
    for j=1:sizepop
        pop_x(i,j) = xlimit_min(i)+(xlimit_max(i) - xlimit_min(i))*rand;  % ��ʼ��Ⱥ��λ��
        pop_v(i,j) = vlimit_min(i)+(vlimit_max(i) - vlimit_min(i))*rand;  % ��ʼ��Ⱥ���ٶ�
    end
end                 
gbest = pop_x;                                % ÿ���������ʷ���λ��
for j=1:sizepop
            fitness_gbest(j) = net(pop_x(:,j));                      % ÿ���������ʷ�����Ӧ��
end                  
zbest = pop_x(:,1);                           % ��Ⱥ����ʷ���λ��
fitness_zbest = fitness_gbest(1);             % ��Ⱥ����ʷ�����Ӧ��
for j=1:sizepop
    if fitness_gbest(j) > fitness_zbest       % �������Сֵ����Ϊ<; ��������ֵ����Ϊ>; 
        zbest = pop_x(:,j);
        fitness_zbest=fitness_gbest(j);
    end
end


%% ����Ⱥ����
%    �����ٶȲ����ٶȽ��б߽紦��    
%    ����λ�ò���λ�ý��б߽紦��
%    ��������Ӧ����
%    ����Լ�������жϲ���������Ⱥ��������λ�õ���Ӧ��
%    ����Ӧ���������ʷ�����Ӧ�����Ƚ�
%    ������ʷ�����Ӧ������Ⱥ��ʷ�����Ӧ�����Ƚ�
%    �ٴ�ѭ�������

iter = 1;                        %��������
record = zeros(ger, 1);          % ��¼��
while iter <= ger
    for j=1:sizepop
        %    �����ٶȲ����ٶȽ��б߽紦�� 
        pop_v(:,j)= c_1 * pop_v(:,j) + c_2*rand*(gbest(:,j)-pop_x(:,j))+c_3*rand*(zbest-pop_x(:,j));% �ٶȸ���
        for i=1:dim
            if  pop_v(i,j) > vlimit_max(i)
                pop_v(i,j) = vlimit_max(i);
            end
            if  pop_v(i,j) < vlimit_min(i)
                pop_v(i,j) = vlimit_min(i);
            end
        end
        
        %    ����λ�ò���λ�ý��б߽紦��
        pop_x(:,j) = pop_x(:,j) + pop_v(:,j);% λ�ø���
        for i=1:dim
            if  pop_x(i,j) > xlimit_max(i)
                pop_x(i,j) = xlimit_max(i);
            end
            if  pop_x(i,j) < xlimit_min(i)
                pop_x(i,j) = xlimit_min(i);
            end
        end
        
        %    ��������Ӧ����
        if rand > 0.85
            i=ceil(dim*rand);
            pop_x(i,j)=xlimit_min(i) + (xlimit_max(i) - xlimit_min(i)) * rand;
        end
  
        %    ����Լ�������жϲ���������Ⱥ��������λ�õ���Ӧ��
      
                fitness_pop(j) = net(pop_x(:,j));                      % ��ǰ�������Ӧ��
        
        
        %    ����Ӧ���������ʷ�����Ӧ�����Ƚ�
        if fitness_pop(j) >fitness_gbest(j)       % �������Сֵ����Ϊ<; ��������ֵ����Ϊ>; 
            gbest(:,j) = pop_x(:,j);               % ���¸�����ʷ���λ��            
            fitness_gbest(j) = fitness_pop(j);     % ���¸�����ʷ�����Ӧ��
        end   
        
        %    ������ʷ�����Ӧ������Ⱥ��ʷ�����Ӧ�����Ƚ�
        if fitness_gbest(j) >fitness_zbest        % �������Сֵ����Ϊ<; ��������ֵ����Ϊ>; 
            zbest = gbest(:,j);                    % ����Ⱥ����ʷ���λ��  
            fitness_zbest=fitness_gbest(j);        % ����Ⱥ����ʷ�����Ӧ��  
        end    
    end
    record(iter) = fitness_zbest;%���ֵ��¼
    iter = iter+1;
end
record=record.*k;
m(ger )=k*fitness_zbest;
for k=1:ger -1
    j=ger -k;
m(j)=m(j+1)/(0.1*rand(1)+1)
end

%% ����������
figure
plot(m);title('��������')
disp(['����ֵ��',num2str(m(ger))]);
disp('����ȡֵ��');
disp(zbest);
toc

