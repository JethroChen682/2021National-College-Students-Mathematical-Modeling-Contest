%% 2021��߽����B������1
% ��1�����Ը���1�����ݽ��д������߻���������¶ȵ��Ա���ʹ�����ֱ�ʾ������Matlab��
% ��2����һ��21�ִ߻�����ϣ��������ÿһ�ִ߻�����Ϸֱ��о��¶ȶ��Ҵ�ת���ʡ�C4 ϩ����ѡ���Ե�Ӱ�죬
% ��3�����Ը���2�����ݽ��з�����������350��ʱ�����ŷ�Ӧ�Ľ��У��Ҵ�ת�������½�������C4 ϩ����ѡ����Ӱ�첻��

clc,clear
%% �������ݡ��������
load('data_of_202199B.mat')

% ����1 �������б���
% 1 ���
% 2 �߻�����ϱ��
% 3 װ�Ϸ�ʽ
% 4 Co/SiO2����
% 5 Co������
% 6 HAP����
% 7 ʯӢɰ����
% 8 Co/SiO2��HAPװ�ϱ�
% 9 �Ҵ�Ũ��
% 10 �¶�
% 11 �Ҵ�ת����(%)
% 12 ��ϩѡ����(%)
% 13 C4ϩ��ѡ����(%)
% 14 ��ȩѡ����(%)
% 15 ̼��Ϊ4-12֬����ѡ����(%)
% 16 �׻�����ȩ�ͼ׻����״�ѡ����(%)
% 17 �����������ѡ����(%)
% 18 C4ϩ������

% ����2�������б���
% 1 ʱ��(min)
% 2 �Ҵ�ת����(%)
% 3 C4ϩ��ѡ����
% 4 C4ϩ������

%% ��һ��
% һ��21�ִ߻�����ϣ��������ÿһ�ִ߻�����Ϸֱ��о��¶�T���Ҵ�ת����EC(Ethanol conversion)��C4ϩ����ѡ����COS(C4 olefin selectivity)��Ӱ��

for i=1:21
    T{i}=fujian1(fujian1(:,2)==i,10);
    EC{i}=fujian1(fujian1(:,2)==i,11);
    COS{i}=fujian1(fujian1(:,2)==i,13);
    
    %% �ع����,ȷ���ع����ͣ�leixing=1���Իع飬leixing=2���λع�
    
    leixing=1; 
    a1=polyfit(T{i},EC{i},leixing);
    b1=polyfit(T{i},COS{i},leixing);
    leixing=2; 
    a2=polyfit(T{i},EC{i},leixing);
    b2=polyfit(T{i},COS{i},leixing);
    RelationOfTAndEC1{i}=a1;
    RelationOfTAndCOS1{i}=b1;
    RelationOfTAndEC2{i}=a2;
    RelationOfTAndCOS2{i}=b2;
    
    ti=250:5:400;
    
    yEC1=polyval(a1,ti);
    yCOS1=polyval(b1,ti);
    yEC2=polyval(a2,ti);
    yCOS2=polyval(b2,ti);
    
    % ���Իع��ͼ
    Figure1=figure(1);
    yyaxis left
    plot(T{i},EC{i},'linestyle','-','marker','o','color','b');
    hold on
    plot(ti,yEC1,'linestyle','-.','marker','*','color','c');
    axis([250 400,0,100])
    set(gca,'YTick',[0:10:100]);
    xlabel('�¶�T(��)')
    ylabel('�Ҵ�ת����(%)')
    
    yyaxis right
    plot(T{i},COS{i},'linestyle','-','marker','+','color','r');
    hold on
    plot(ti,yCOS1,'linestyle','--','marker','*','color','g');
    axis([250 400,0,100])
    set(gca,'YTick',[0:10:100]);
    ylabel('C4ϩ����ѡ����(%)')
    
    
    title(['��',num2str(i),'�ִ߻�������������¶ȶ��Ҵ�ת������C4ϩ����ѡ���Ե����Իع�']) % ��ӱ���
    legend('�Ҵ�ת����','C4ϩ����ѡ����') %���ͼ��
    
    % �½��ļ��в�������
    folder = '..\cal202199B\����1��1С�����Իع�';
    if ~exist(folder,'dir')
        mkdir(folder)
    end
    filename=['.\����1��1С�����Իع�\��',num2str(i),'�ִ߻�������������¶ȶ��Ҵ�ת������C4ϩ����ѡ���Ե����Իع�.png'];
    saveas(gcf,filename)
    
    close(Figure1);
    
    % ���λع��ͼ
    Figure2=figure(1);
    yyaxis left
    plot(T{i},EC{i},'linestyle','-','marker','o','color','b');
    hold on
    plot(ti,yEC2,'linestyle','-.','marker','*','color','c');
    axis([250 400,0,100])
    set(gca,'YTick',[0:10:100]);
    xlabel('�¶�T(��)')
    ylabel('�Ҵ�ת����(%)')
    
    yyaxis right
    plot(T{i},COS{i},'linestyle','-','marker','+','color','r');
    hold on
    plot(ti,yCOS2,'linestyle','--','marker','*','color','g');
    axis([250 400,0,100])
    set(gca,'YTick',[0:10:100]);
    ylabel('C4ϩ����ѡ����(%)')
    
    
    title(['��',num2str(i),'�ִ߻�������������¶ȶ��Ҵ�ת������C4ϩ����ѡ���ԵĶ��λع�']) % ��ӱ���
    legend('�Ҵ�ת����','C4ϩ����ѡ����') %���ͼ��
    
    % �½��ļ��в�������
    folder = '..\cal202199B\����1��1С�ʶ��λع�';
    if ~exist(folder,'dir')
        mkdir(folder)
    end
    filename=['.\����1��1С�ʶ��λع�\��',num2str(i),'�ִ߻�������������¶ȶ��Ҵ�ת������C4ϩ����ѡ���ԵĶ��λع�.png'];
    saveas(gcf,filename)
    
    close(Figure2);
    %     %%�����ط������
    %     A=[T{i},EC{i},COS{i}];
    %     [p, anovatab, stats]=anova1(A);
    %     fa=finv(0.95, anovatab {2, 3},anovatab {3,3}); %����fa
    %     F=anovatab{2,5}; %Fֵ
    %     if p<=0.01 && F>fa
    %         disp ('�ǳ�����')
    %     elseif p<=0.05 && F>fa
    %         disp('����')
    %     else
    %         disp('������')
    %     end

end

%% �ڶ���
% �Ը���2�����ݽ��з�����������350��ʱ�����ŷ�Ӧ�Ľ��У��Ҵ�ת�������½�������C4ϩ����ѡ����Ӱ�첻��
Time=fujian2(:,1);
    EC=fujian2(:,2);
    COS=fujian2(:,3);
    
%% �ع����,ȷ���ع����ͣ�leixing=1���Իع飬leixing=2���λع�
    leixing=1; 
    TimeEC1=polyfit(Time,EC,leixing);
    TimeCOS1=polyfit(Time,COS,leixing);
    leixing=2; 
    TimeEC2=polyfit(Time,EC,leixing);
    TimeCOS2=polyfit(Time,COS,leixing);
    
    time=0:10:280;
    
    yEC1=polyval(TimeEC1,time);
    yCOS1=polyval(TimeCOS1,time);
    yEC2=polyval(TimeEC2,time);
    yCOS2=polyval(TimeCOS2,time);
    
    % ���Իع��ͼ
    Figure1=figure(1);
    yyaxis left
    plot(Time,EC,'linestyle','-','marker','o','color','b');
    hold on
    plot(time,yEC1,'linestyle','-.','marker','*','color','c');
    axis([0 280,0,100])
    set(gca,'YTick',[0:10:100]);
    xlabel('ʱ��(min��)')
    ylabel('�Ҵ�ת����(%)')
    
    yyaxis right
    plot(Time,COS,'linestyle','-','marker','+','color','r');
    hold on
    plot(time,yCOS1,'linestyle','--','marker','*','color','g');
    axis([0 280,0,100])
    set(gca,'YTick',[0:10:100]);
    ylabel('C4ϩ����ѡ����(%)')
    
    
    title(['350���������Ҵ�ת������C4ϩ����ѡ������ʱ��仯�����Իع�']) % ��ӱ���
    legend('�Ҵ�ת����','C4ϩ����ѡ����') %���ͼ��
    
    % �½��ļ��в�������
    folder = '..\cal202199B\����1��2С�����Իع�';
    if ~exist(folder,'dir')
        mkdir(folder)
    end
    filename=['.\����1��2С�����Իع�\350���������Ҵ�ת������C4ϩ����ѡ������ʱ��仯�����Իع�.png'];
    saveas(gcf,filename)
    
    close(Figure1);
    
    % ���λع��ͼ
    Figure2=figure(1);
    yyaxis left
    plot(Time,EC,'linestyle','-','marker','o','color','b');
    hold on
    plot(time,yEC2,'linestyle','-.','marker','*','color','c');
    axis([0 280,0,100])
    set(gca,'YTick',[0:10:100]);
    xlabel('ʱ�䣨min��)')
    ylabel('�Ҵ�ת����(%)')
    
    yyaxis right
    plot(Time,COS,'linestyle','-','marker','+','color','r');
    hold on
    plot(time,yCOS2,'linestyle','--','marker','*','color','g');
    axis([0 280,0,100])
    set(gca,'YTick',[0:10:100]);
    ylabel('C4ϩ����ѡ����(%)')
    
    
    title(['350���������Ҵ�ת������C4ϩ����ѡ������ʱ��仯�����Իع�Ķ��λع�']) % ��ӱ���
    legend('�Ҵ�ת����','C4ϩ����ѡ����') %���ͼ��
    
    % �½��ļ��в�������
    folder = '..\cal202199B\����1��2С�ʶ��λع�';
    if ~exist(folder,'dir')
        mkdir(folder)
    end
    filename=['.\����1��2С�ʶ��λع�\350���������Ҵ�ת������C4ϩ����ѡ������ʱ��仯�����Իع�Ķ��λع�.png'];
    saveas(gcf,filename)

%% ��������
save ques1.mat RelationOfTAndEC1 RelationOfTAndCOS1 RelationOfTAndEC2 RelationOfTAndCOS2 TimeEC1 TimeCOS1 TimeEC2 TimeCOS2



