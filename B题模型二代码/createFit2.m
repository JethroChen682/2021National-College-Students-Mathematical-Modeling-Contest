function [fitresult, gof] = createFit2(xxx, yyy)
%CREATEFIT(XXX,YYY)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : xxx
%      Y Output: yyy
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 09-Sep-2021 22:47:23 �Զ�����


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( xxx, yyy );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.00138346464351452 0.029521077160977];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'ָ����ϵ���ͼ' );
h = plot( fitresult, xData, yData );
legend( h, 'ԭʼ��', '�������', 'Location', 'NorthEast' );
% Label axes
xlabel �¶�
ylabel C4ϩ����ѡ����
grid on



