function [fitresult, gof] = createFit_xianxing(xxx, yyy)
%CREATEFIT1(XXX,YYY)
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

%  �� MATLAB �� 09-Sep-2021 23:36:06 �Զ�����


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( xxx, yyy );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
h = plot( fitresult, xData, yData );
legend( h, 'ԭʼ��', '�������', 'Location', 'NorthEast' );
% Label axes
xlabel �¶�
ylabel �Ҵ�ת����
grid on


