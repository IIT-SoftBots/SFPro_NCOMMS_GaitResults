%%%% Plotting KNEE data %%%%

close all
clear all
clc

set(0,'defaultfigurecolor',[1 1 1])
set(groot,'defaultLegendAutoUpdate','off')

% load('stance_index_ablebodied.mat')

gaitcycle=linspace(0,100,101);
gc_old=linspace(0,100,100);
gc=linspace(0,100,200);


%% load CASE STUDY I data

load('level.mat');
load('bigarc.mat');
load('bigrect.mat');

% load('stance.mat');
% load('stance_control.mat');

% Filter to remove an outlier in the very final phase of the gait cycle (last 5 points) 
% for the torque and power of the knee joint ONLY for the prosthetic limb when using the Triton.
idx_start_corr = 93;    % start of the window to be fixed
idx_last_good  = 95;    % last reliable point before outlier

% Control points for interp: reliable data points + a forced point at 100% gait cycle
% with the same value of the start
x_ctrl = [gaitcycle(idx_start_corr:idx_last_good) 100];
y_ctrl_torque = [level.torque.knee.sag.triton(idx_start_corr:idx_last_good) level.torque.knee.sag.triton(1)];
y_ctrl_power = [level.power.knee.triton(idx_start_corr:idx_last_good) level.power.knee.triton(1)];

gc_fix  = gaitcycle(idx_start_corr:end); % Indices to be interpolated
torque_fixed =  level.torque.knee.sag.triton;
torque_fixed(idx_start_corr:end) = interp1(x_ctrl, y_ctrl_torque, gc_fix, 'pchip');
power_fixed =  level.power.knee.triton;
power_fixed(idx_start_corr:end) = interp1(x_ctrl, y_ctrl_power, gc_fix, 'pchip');

level.power.knee.triton=power_fixed;
level.torque.knee.sag.triton=torque_fixed;

%interp over the gait cycle
level.angle.knee.sag.triton_sound=interp1(gaitcycle,level.angle.knee.sag.triton_sound,gc,'spline');
level.angle.knee.sag.triton=interp1(gaitcycle,level.angle.knee.sag.triton,gc,'spline');
level.angle.knee.sag.sf=interp1(gaitcycle,level.angle.knee.sag.sf,gc,'spline');
bigarc.angle.knee.sag.triton_sound=interp1(gaitcycle,bigarc.angle.knee.sag.triton_sound,gc,'spline');
bigarc.angle.knee.sag.triton=interp1(gaitcycle,bigarc.angle.knee.sag.triton,gc,'spline');
bigarc.angle.knee.sag.sf=interp1(gaitcycle,bigarc.angle.knee.sag.sf,gc,'spline');
bigrect.angle.knee.sag.triton_sound=interp1(gaitcycle,bigrect.angle.knee.sag.triton_sound,gc,'spline');
bigrect.angle.knee.sag.triton=interp1(gaitcycle,bigrect.angle.knee.sag.triton,gc,'spline');
bigrect.angle.knee.sag.sf=interp1(gaitcycle,bigrect.angle.knee.sag.sf,gc,'spline');

level.torque.knee.sag.triton_sound=interp1(gaitcycle,level.torque.knee.sag.triton_sound,gc,'spline');
level.torque.knee.sag.triton=interp1(gaitcycle,level.torque.knee.sag.triton,gc,'spline');
level.torque.knee.sag.sf=interp1(gaitcycle,level.torque.knee.sag.sf,gc,'spline');
bigarc.torque.knee.sag.triton_sound=interp1(gaitcycle,bigarc.torque.knee.sag.triton_sound,gc,'spline');
bigarc.torque.knee.sag.triton=interp1(gaitcycle,bigarc.torque.knee.sag.triton,gc,'spline');
bigarc.torque.knee.sag.sf=interp1(gaitcycle,bigarc.torque.knee.sag.sf,gc,'spline');
bigrect.torque.knee.sag.triton_sound=interp1(gaitcycle,bigrect.torque.knee.sag.triton_sound,gc,'spline');
bigrect.torque.knee.sag.triton=interp1(gaitcycle,bigrect.torque.knee.sag.triton,gc,'spline');
bigrect.torque.knee.sag.sf=interp1(gaitcycle,bigrect.torque.knee.sag.sf,gc,'spline');

level.power.knee.triton_sound=interp1(gaitcycle,level.power.knee.triton_sound,gc,'spline');
level.power.knee.triton=interp1(gaitcycle,level.power.knee.triton,gc,'spline');
level.power.knee.sf=interp1(gaitcycle,level.power.knee.sf,gc,'spline');
bigarc.power.knee.triton_sound=interp1(gaitcycle,bigarc.power.knee.triton_sound,gc,'spline');
bigarc.power.knee.triton=interp1(gaitcycle,bigarc.power.knee.triton,gc,'spline');
bigarc.power.knee.sf=interp1(gaitcycle,bigarc.power.knee.sf,gc,'spline');
bigrect.power.knee.triton_sound=interp1(gaitcycle,bigrect.power.knee.triton_sound,gc,'spline');
bigrect.power.knee.triton=interp1(gaitcycle,bigrect.power.knee.triton,gc,'spline');
bigrect.power.knee.sf=interp1(gaitcycle,bigrect.power.knee.sf,gc,'spline');


%% load CASE STUDY II data

cd('JOiiNT Lab')
load('SFstance.mat')
load('Tstance.mat')

cd('Day 1 - Triton')
load('triton_meanSD_level2.mat')
load('triton_meanSD_rect2.mat')
load('triton_meanSD_rect_contr2.mat')
load('triton_meanSD_arch2.mat')
load('triton_meanSD_arch_contr2.mat')
cd ..

cd('Day 2 - SoftFoot')
load('sf_meanSD_level2.mat')
load('sf_meanSD_rect2.mat')
load('sf_meanSD_arch2.mat')
cd ..
cd ..

bodymass=92; %kg Case study II's participant mass


%% load ABLE-BODIED dataset 

cd('ablebodied12_data')
load("mean_knee.mat")
load("std_knee.mat")

load("mean_knee_torque_NATCOM.mat")
load("std_knee_torque_NATCOM.mat")

load("LLpower_means_NATCOM.mat")
load("LLpower_std_NATCOM.mat")
cd ..

%interp over gait cycle
mean_knee_level2=interp1(gc_old,mean_knee_level,gc);
mean_knee_arch2=interp1(gc_old,mean_knee_arch,gc);
mean_knee_rect2=interp1(gc_old,mean_knee_rect,gc);

mean_knee_torque_level2=interp1(gc_old,mean_knee_torque_level,gc)/1000;%Nmm/kg to Nm/kg
mean_knee_torque_arch2=interp1(gc_old,mean_knee_torque_arch,gc)/1000;
mean_knee_torque_rect2=interp1(gc_old,mean_knee_torque_rect,gc)/1000;

std_knee_level2=interp1(gc_old,std_knee_level,gc);
std_knee_arch2=interp1(gc_old,std_knee_arch,gc);
std_knee_rect2=interp1(gc_old,std_knee_rect,gc);

std_knee_torque_level2=interp1(gc_old,std_knee_torque_level,gc)/1000;
std_knee_torque_arch2=interp1(gc_old,std_knee_torque_arch,gc)/1000;
std_knee_torque_rect2=interp1(gc_old,std_knee_torque_rect,gc)/1000;


%% Figure CASE STUDY I & CASE STUDY II - MAIN TEXT 

shade=[0.65,0.65,0.65];
blue=hex2rgb('#004369');
red=hex2rgb('#DB1F48');
lightblue=[0.0745,0.6235,1.0000];
green=lightblue;

width=1.4;%lines width
fontsize=7;

figure

% Properties to export
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 21 12]);
set(gcf, 'PaperSize', [21 12]);

%%CASE STUDY I
%ANGLE [deg]
%level
sub1=subplot(3,6,1)
patch([gc fliplr(gc)],[(mean_knee_level2-std_knee_level2) fliplr(mean_knee_level2+std_knee_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp1t=plot(gc,level.angle.knee.sag.triton,'Linewidth',width,'Color',blue); 
hp1s=plot(gc,level.angle.knee.sag.sf,'Linewidth',width,'Color',red); 
xlim([0 100])
ylim([-5 85])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
text(47,80,'+ flexion','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h1=ylabel('Knee angle [deg]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h1,'fontsize', fontsize)
set(h1,'FontName','Arial')

%arch
subplot(3,6,2)
patch([gc fliplr(gc)],[(mean_knee_arch2-std_knee_arch2) fliplr(mean_knee_arch2+std_knee_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp3t=plot(gc,bigarc.angle.knee.sag.triton,'Linewidth',width,'Color',blue);
hp3s=plot(gc,bigarc.angle.knee.sag.sf,'Linewidth',width,'Color',red);
xlim([0 100])
ylim([-5 85])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,3)
patch([gc fliplr(gc)],[(mean_knee_rect2-std_knee_rect2) fliplr(mean_knee_rect2+std_knee_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp5t=plot(gc,bigrect.angle.knee.sag.triton,'Linewidth',width,'Color',blue);
hp5s=plot(gc,bigrect.angle.knee.sag.sf,'Linewidth',width,'Color',red);
xlim([0 100])
ylim([-5 85])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,4)
patch([gc fliplr(gc)],[(mean_knee_level2-std_knee_level2) fliplr(mean_knee_level2+std_knee_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp1t=plot(gc,Tmean_level_kneeAngle.left,'Linewidth',width,'Color',blue); 
hp1ts=plot(gc,Tmean_level_kneeAngle.right,':','Linewidth',width,'Color',blue);
hp1s=plot(gc,SFmean_level_kneeAngle.left,'Linewidth',width,'Color',red); 
hp1ss=plot(gc,SFmean_level_kneeAngle.right,':','Linewidth',width,'Color',red); 
xlim([0 100])
ylim([-5 85])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,5)
patch([gc fliplr(gc)],[(mean_knee_arch2-std_knee_arch2) fliplr(mean_knee_arch2+std_knee_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp3t=plot(gc,Tmean_arch_kneeAngle.left,'Linewidth',width,'Color',blue);
hp3ts=plot(gc,Tmean_arch_contr_kneeAngle.right,':','Linewidth',width,'Color',blue);
hp3s=plot(gc,SFmean_arch_kneeAngle.left,'Linewidth',width,'Color',red);
hp3ss=plot(gc,SFmean_arch_kneeAngle.right,':','Linewidth',width,'Color',red);
xlim([0 100])
ylim([-5 85])
xticks([0 50 100])
xticklabels({'0','50','100'})
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize)
set(gca,'FontName', 'Arial')

%rect
subplot(3,6,6)
patch([gc fliplr(gc)],[(mean_knee_rect2-std_knee_rect2) fliplr(mean_knee_rect2+std_knee_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp2t=plot(gc,Tmean_rect_kneeAngle.left,'Linewidth',width,'Color',blue);
hp2ts=plot(gc,Tmean_rect_contr_kneeAngle.right,':','Linewidth',width,'Color',blue);
hp2s=plot(gc,SFmean_rect_kneeAngle.left,'Linewidth',width,'Color',red);
hp2ss=plot(gc,SFmean_rect_kneeAngle.right,':','Linewidth',width,'Color',red);
xlim([0 100])
ylim([-5 85])
xticks([0 50 100])
xticklabels({'0','50','100'})
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize)
set(gca,'FontName', 'Arial')


% TORQUE
%%CASE STUDY I
%level
sub2=subplot(3,6,7)
patch([gc fliplr(gc)],[(mean_knee_torque_level2-std_knee_torque_level2) fliplr(mean_knee_torque_level2+std_knee_torque_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp6t=plot(gc,(level.torque.knee.sag.triton)/1000,'Linewidth',width,'Color',blue);%(/1000 to go from Nmm to Nm)
hp6s=plot(gc,(level.torque.knee.sag.sf)/1000,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 3])
box off
text(50,2.7,'+ extensor','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h2=ylabel('Knee torque [Nm/kg]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h2,'fontsize', fontsize)
set(h2,'FontName','Arial')

%arch
subplot(3,6,8)
patch([gc fliplr(gc)],[(mean_knee_torque_arch2-std_knee_torque_arch2) fliplr(mean_knee_torque_arch2+std_knee_torque_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp8t=plot(gc,(bigarc.torque.knee.sag.triton)/1000,'Linewidth',width,'Color',blue);
hp8s=plot(gc,(bigarc.torque.knee.sag.sf)/1000,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 3])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,9)
patch([gc fliplr(gc)],[(mean_knee_torque_rect2-std_knee_torque_rect2) fliplr(mean_knee_torque_rect2+std_knee_torque_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp10t=plot(gc,(bigrect.torque.knee.sag.triton)/1000,'Linewidth',width,'Color',blue);
hp10s=plot(gc,(bigrect.torque.knee.sag.sf)/1000,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 3])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,10)
patch([gc fliplr(gc)],[(mean_knee_torque_level2-std_knee_torque_level2) fliplr(mean_knee_torque_level2+std_knee_torque_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
patch([gc fliplr(gc)],[(Tmean_level_kneeT.right/bodymass+Tsd_level_kneeT.right/bodymass) fliplr(Tmean_level_kneeT.right/bodymass-Tsd_level_kneeT.right/bodymass)],...
    blue,'FaceAlpha',.4,'LineStyle','none');
patch([gc fliplr(gc)],[(SFmean_level_kneeT.right/bodymass+SFsd_level_kneeT.right/bodymass) fliplr(SFmean_level_kneeT.right/bodymass-SFsd_level_kneeT.right/bodymass)],...
    red,'FaceAlpha',.4,'LineStyle','none');
hp5t=plot(gc,Tmean_level_kneeT.left/bodymass,'Linewidth',width,'Color',blue);
hp5ts=plot(gc,Tmean_level_kneeT.right/bodymass,':','Linewidth',width,'Color',blue);
hp5s=plot(gc,SFmean_level_kneeT.left/bodymass,'Linewidth',width,'Color',red);
hp5ss=plot(gc,SFmean_level_kneeT.right/bodymass,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 3])
xticks([0 50 100])
xticklabels({'0','50','100'})
box off
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%arch
subplot(3,6,11)
patch([gc fliplr(gc)],[(mean_knee_torque_arch2-std_knee_torque_arch2) fliplr(mean_knee_torque_arch2+std_knee_torque_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp7t=plot(gc,Tmean_arch_kneeT.left/bodymass,'Linewidth',width,'Color',blue);
patch([gc fliplr(gc)],[(Tmean_arch_contr_kneeT.right/bodymass+Tsd_arch_contr_kneeT.right/bodymass) fliplr(Tmean_arch_contr_kneeT.right/bodymass-Tsd_arch_contr_kneeT.right/bodymass)],...
    blue,'FaceAlpha',.4,'LineStyle','none');
patch([gc fliplr(gc)],[(SFmean_arch_kneeT.right/bodymass+SFsd_arch_kneeT.right/bodymass) fliplr(SFmean_arch_kneeT.right/bodymass-SFsd_arch_kneeT.right/bodymass)],...
    red,'FaceAlpha',.4,'LineStyle','none');
hp7ts=plot(gc,Tmean_arch_contr_kneeT.right/bodymass,':','Linewidth',width,'Color',blue);
hp7s=plot(gc,SFmean_arch_kneeT.left/bodymass,'Linewidth',width,'Color',red);
hp7ss=plot(gc,SFmean_arch_kneeT.right/bodymass,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 3])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%rect
subplot(3,6,12)
patch([gc fliplr(gc)],[(mean_knee_torque_rect2-std_knee_torque_rect2) fliplr(mean_knee_torque_rect2+std_knee_torque_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp6t=plot(gc,Tmean_rect_kneeT.left/bodymass,'Linewidth',width,'Color',blue);
patch([gc fliplr(gc)],[(Tmean_rect_contr_kneeT.right/bodymass+Tsd_rect_contr_kneeT.right/bodymass) fliplr(Tmean_rect_contr_kneeT.right/bodymass-Tsd_rect_contr_kneeT.right/bodymass)],...
    blue,'FaceAlpha',.4,'LineStyle','none');
patch([gc fliplr(gc)],[(SFmean_rect_kneeT.right/bodymass+SFsd_rect_kneeT.right/bodymass) fliplr(SFmean_rect_kneeT.right/bodymass-SFsd_rect_kneeT.right/bodymass)],...
    red,'FaceAlpha',.4,'LineStyle','none');
hp6ts=plot(gc,Tmean_rect_contr_kneeT.right/bodymass,':','Linewidth',width,'Color',blue);
hp6s=plot(gc,SFmean_rect_kneeT.left/bodymass,'Linewidth',width,'Color',red);
hp6ss=plot(gc,SFmean_rect_kneeT.right/bodymass,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 3])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
set(gca,'fontsize', fontsize,'FontName', 'Arial')


% POWER 
%%CASE STUDY I
%level
sub3=subplot(3,6,13)
patch([gc fliplr(gc)],[(mean_knee_power_level-std_knee_power_level) fliplr(mean_knee_power_level+std_knee_power_level)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp11t=plot(gc,level.power.knee.triton,'Linewidth',width,'Color',blue);
hp11s=plot(gc,level.power.knee.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5.2 2.5])
box off
text(50,2.0,'+ gen','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h31=xlabel('Gait cycle [%]');
h3=ylabel('Knee power [W/kg]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h3,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,14)
patch([gc fliplr(gc)],[(mean_knee_power_arch-std_knee_power_arch) fliplr(mean_knee_power_arch+std_knee_power_arch)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp13t=plot(gc,bigarc.power.knee.triton,'Linewidth',width,'Color',blue);
hp13s=plot(gc,bigarc.power.knee.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5.2 2.5])
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h33,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,15)
patch([gc fliplr(gc)],[(mean_knee_power_rect-std_knee_power_rect) fliplr(mean_knee_power_rect+std_knee_power_rect)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp15t=plot(gc,bigrect.power.knee.triton,'Linewidth',width,'Color',blue);
hp15s=plot(gc,bigrect.power.knee.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5.2 2.5])
box off
h35=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,16)
patch([gc fliplr(gc)],[(mean_knee_power_level-std_knee_power_level) fliplr(mean_knee_power_level+std_knee_power_level)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp9t=plot(gc,Tmean_level_kneeP.left/bodymass,'Linewidth',width,'Color',blue); 
hp9ts=plot(gc,Tmean_level_kneeP.right/bodymass,':','Linewidth',width,'Color',blue);
hp9s=plot(gc,SFmean_level_kneeP.left/bodymass,'Linewidth',width,'Color',red);
hp9ss=plot(gc,SFmean_level_kneeP.right/bodymass,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5.2 2.5])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
h31=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName', 'Arial')
set(h31,'fontsize', fontsize)
set(h31,'FontName','Arial')

%change order entries in the legend
hLegend = legend({'able-bodied','Triton','sound limb','SoftFoot Pro','sound limb'},...
    'Orientation','horizontal','FontName','Arial','FontSize',fontsize);
hLegend.PlotChildren = hLegend.PlotChildren([2,3,4,5,1]);
legend('boxoff')

%arch
subplot(3,6,17)
patch([gc fliplr(gc)],[(mean_knee_power_arch-std_knee_power_arch) fliplr(mean_knee_power_arch+std_knee_power_arch)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp11t=plot(gc,Tmean_arch_kneeP.left/bodymass,'b','Linewidth',width,'Color',blue);
hp11ts=plot(gc,Tmean_arch_contr_kneeP.right/bodymass,':','Linewidth',width,'Color',blue);
hp11s=plot(gc,SFmean_arch_kneeP.left/bodymass,'r','Linewidth',width,'Color',red);
hp11ss=plot(gc,SFmean_arch_kneeP.right/bodymass,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5.2 2.5])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
h32=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName', 'Arial')
set(h32,'fontsize', fontsize)
set(h32,'FontName','Arial')

%rect
subplot(3,6,18)
patch([gc fliplr(gc)],[(mean_knee_power_rect-std_knee_power_rect) fliplr(mean_knee_power_rect+std_knee_power_rect)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp10t=plot(gc,Tmean_rect_kneeP.left/bodymass,'b','Linewidth',width,'Color',blue);
hp10ts=plot(gc,Tmean_rect_contr_kneeP.right/bodymass,':','Linewidth',width,'Color',blue);
hp10s=plot(gc,SFmean_rect_kneeP.left/bodymass,'r','Linewidth',width,'Color',red);
hp10ss=plot(gc,SFmean_rect_kneeP.right/bodymass,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5.2 2.5])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName', 'Arial')
set(h33,'fontsize', fontsize)
set(h33,'FontName','Arial')

% set(get(sub1,'YLabel'), 'Units','centimeters');
% set(get(sub2,'YLabel'), 'Units','centimeters');
% set(get(sub3,'YLabel'), 'Units','centimeters');
% ylabel_position=get(get(sub1,'YLabel'),'Position');
% set(get(sub2,'YLabel'), 'Position',ylabel_position);
% set(get(sub3,'YLabel'), 'Position',ylabel_position);


%% Figure CASE STUDY I, contralateral limb - SUPPL MATERIAL

figure

%%CASE STUDY I
%ANGLE
%level
sub1=subplot(3,3,1)
patch([gc fliplr(gc)],[(mean_knee_level2-std_knee_level2) fliplr(mean_knee_level2+std_knee_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp1ts=plot(gc,level.angle.knee.sag.triton_sound,'Linewidth',width,'Color',green);
xlim([0 100])
ylim([-5 70])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
text(47,60,'+ flexion','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h1=ylabel('Knee angle [deg]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h1,'fontsize', fontsize)
set(h1,'FontName','Arial')

%arch
subplot(3,3,2)
patch([gc fliplr(gc)],[(mean_knee_arch2-std_knee_arch2) fliplr(mean_knee_arch2+std_knee_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp3ts=plot(gc,bigarc.angle.knee.sag.triton_sound,'Linewidth',width,'Color',green);
xlim([0 100])
ylim([-5 70])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,3)
patch([gc fliplr(gc)],[(mean_knee_rect2-std_knee_rect2) fliplr(mean_knee_rect2+std_knee_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp5ts=plot(gc,bigrect.angle.knee.sag.triton_sound,'Linewidth',width,'Color',green);
xlim([0 100])
ylim([-5 70])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName','Arial')

% TORQUE
%%CASE STUDY I
%level
sub2=subplot(3,3,4)
patch([gc fliplr(gc)],[(mean_knee_torque_level2-std_knee_torque_level2) fliplr(mean_knee_torque_level2+std_knee_torque_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp6ts=plot(gc,(level.torque.knee.sag.triton_sound)/1000,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 1])
box off
text(50,0.9,'+ extensor','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h2=ylabel('Knee torque [Nm/kg]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h2,'fontsize', fontsize)
set(h2,'FontName','Arial')

%arch
subplot(3,3,5)
patch([gc fliplr(gc)],[(mean_knee_torque_arch2-std_knee_torque_arch2) fliplr(mean_knee_torque_arch2+std_knee_torque_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp8ts=plot(gc,(bigarc.torque.knee.sag.triton_sound)/1000,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 1])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,6)
patch([gc fliplr(gc)],[(mean_knee_torque_rect2-std_knee_torque_rect2) fliplr(mean_knee_torque_rect2+std_knee_torque_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp10ts=plot(gc,(bigrect.torque.knee.sag.triton_sound)/1000,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-1 1])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')


% POWER 
%%CASE STUDY I
%level
sub3=subplot(3,3,7)
patch([gc fliplr(gc)],[(mean_knee_power_level-std_knee_power_level) fliplr(mean_knee_power_level+std_knee_power_level)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp11ts=plot(gc,level.power.knee.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 2])
box off
text(50,1.8,'+ gen','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h31=xlabel('Gait cycle [%]');
h3=ylabel('Knee power [W/kg]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h3,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,3,8)
patch([gc fliplr(gc)],[(mean_knee_power_arch-std_knee_power_arch) fliplr(mean_knee_power_arch+std_knee_power_arch)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp13ts=plot(gc,bigarc.power.knee.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 2])
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h33,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,9)
patch([gc fliplr(gc)],[(mean_knee_power_rect-std_knee_power_rect) fliplr(mean_knee_power_rect+std_knee_power_rect)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp15ts=plot(gc,bigrect.power.knee.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 2])
box off
h35=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize,'FontName','Arial')

%change order entries in the legend
hLegend = legend({'able-bodied','contralateral limb (Triton)'},...
    'Orientation','horizontal','FontName','Arial','FontSize',fontsize);
hLegend.PlotChildren = hLegend.PlotChildren([2,1]);
legend('boxoff')

% set(get(sub1,'YLabel'), 'Units','centimeters');
% set(get(sub2,'YLabel'), 'Units','centimeters');
% set(get(sub3,'YLabel'), 'Units','centimeters');
% ylabel_position=get(get(sub2,'YLabel'),'Position');
% set(get(sub1,'YLabel'), 'Position',ylabel_position);
% set(get(sub3,'YLabel'), 'Position',ylabel_position);
