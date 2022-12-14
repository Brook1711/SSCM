LineWidthValue = 0.75;
PlotLineWidthValue = 1.25;
ItemTokenSizeValue = [8 18];
colors = ...
 1/256*[ 31,119,180; % 1 默认蓝色
        255,127,14;  % 2 橘色
         44,160,44;  % 3 绿色
        214,39,40;   % 4 红色
        148,103,189; % 5 紫色
        140,86,75;   % 6 棕色 
       227,119,194;  % 7 粉色
       127,127,127;  % 8 灰色
       188,189,34;   % 9 青棕
       23,190,207;   % 10 淡蓝
       26,85,255;    % 11 鲜蓝色
       ];
color_mea = colors(1,:);
color_sim = colors(4,:);


% + 加号
% o 圆圈
% * 星号
% . 实心点
% x 叉号
% s 正方形
% d 钻石形
% ^ 上三角形
% v 下三角形
% > 右三角形
% < 左三角形
% p 五角星形
% h 六角星形
marker_mea = "x";
marker_sim = "*";

close all;

% load Data
load('AngularSpread_LoS.mat');
load('AngularSpread_NLoS.mat');
load('NumberOfLobes_LoS.mat');
load('NumberOfLobes_NLoS.mat');

fig = figure;
% subplot 1,1
subplot(2,2,1);

b = bar(100*transpose([NumberOfLobes_LoS.Mea_y(1,2:6);NumberOfLobes_LoS.Sim_y(1,2:6)]), ...
    LineWidth=LineWidthValue);
b(1).FaceColor = color_mea;
b(2).FaceColor = color_sim;
hold on ;
ylim(100*[0 0.55]);
lgd = legend('Measured number of lobes','Simulated number of lobes',...
    Location='northeast');
lgd.ItemTokenSize = ItemTokenSizeValue;

xlabel('Number of lobes');
ylabel('Frequency of Occurrence (%)');
set(gca, ...
    'XTickLabel',{'1','2','3','4','5'},...
    'FontName','Times New Roman');

title("(a): Lobes distribution under LoS scenario");

% subplot 1,2
subplot(2,2,2);
b = bar(100*transpose([NumberOfLobes_NLoS.Mea_y(1,2:6);NumberOfLobes_NLoS.Sim_y(1,2:6)]), ...
    LineWidth=LineWidthValue);
b(1).FaceColor = color_mea;
b(2).FaceColor = color_sim;
hold on ;
ylim(100*[0 0.7]);
lgd = legend('Measured number of lobes','Simulated number of lobes',...
    Location='northeast');
lgd.ItemTokenSize = ItemTokenSizeValue;

xlabel('Number of lobes');
ylabel('Frequency of Occurrence (%)');
set(gca, ...
    'XTickLabel',{'1','2','3','4','5'},...
    'FontName','Times New Roman');

title("(b): Lobes distribution under NLoS scenario");

% subplot 2,1
subplot(2,2,3);

scatter(AngularSpread_LoS.Mea_x,...
    AngularSpread_LoS.Mea_y, ...
    30,...
    'color',color_mea, ...
    'marker', marker_mea, ...
    'LineWidth', PlotLineWidthValue    );
hold on;
plot(AngularSpread_LoS.Sim_x,...
    AngularSpread_LoS.Sim_y, ...
    'color',color_sim, ...
    'LineWidth',PlotLineWidthValue);
hold on;

xlim([0 130]);
lgd = legend('Measured AS','Simulated AS', ...
    'Location','northeast');
lgd.ItemTokenSize = ItemTokenSizeValue;

xlabel('Angular Spreads (deg)');
ylabel('CDF: Probability (%)');
set(gca, ...
    'FontName','Times New Roman');

title("(c): AS under LoS scenario");

% subplot 2,2
subplot(2,2,4);

scatter(AngularSpread_NLoS.Mea_x,...
    AngularSpread_NLoS.Mea_y, ...
    30,...
    'color',color_mea, ...
    'marker', marker_mea, ...
    'LineWidth', PlotLineWidthValue    );
hold on;
plot(AngularSpread_NLoS.Sim_x,...
    AngularSpread_NLoS.Sim_y, ...
    'color',color_sim, ...
    'LineWidth',PlotLineWidthValue);
hold on;

xlim([0 130]);
lgd = legend('Measured AS','Simulated AS', ...
    'Location','northeast');
lgd.ItemTokenSize = ItemTokenSizeValue;

xlabel('Angular Spreads (deg)');
ylabel('CDF: Probability (%)');
set(gca, ...
    'FontName','Times New Roman');
title("(d): AS under NLoS scenario");
saveas(fig,'autosave_Sim_Mea.fig');
saveas(fig,'png/autosave_Sim_Mea.png');

