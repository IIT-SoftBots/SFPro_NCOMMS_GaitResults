%%%% Plotting ANKLE data %%%%

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

% load('stance');
% load('stance_control');

%interp over the gait cycle
level.angle.ankle.sag.triton_sound=interp1(gaitcycle,level.angle.ankle.sag.triton_sound,gc,'spline');
level.angle.ankle.sag.triton=interp1(gaitcycle,level.angle.ankle.sag.triton,gc,'spline');
level.angle.ankle.sag.sf=interp1(gaitcycle,level.angle.ankle.sag.sf,gc,'spline');
bigarc.angle.ankle.sag.triton_sound=interp1(gaitcycle,bigarc.angle.ankle.sag.triton_sound,gc,'spline');
bigarc.angle.ankle.sag.triton=interp1(gaitcycle,bigarc.angle.ankle.sag.triton,gc,'spline');
bigarc.angle.ankle.sag.sf=interp1(gaitcycle,bigarc.angle.ankle.sag.sf,gc,'spline');
bigrect.angle.ankle.sag.triton_sound=interp1(gaitcycle,bigrect.angle.ankle.sag.triton_sound,gc,'spline');
bigrect.angle.ankle.sag.triton=interp1(gaitcycle,bigrect.angle.ankle.sag.triton,gc,'spline');
bigrect.angle.ankle.sag.sf=interp1(gaitcycle,bigrect.angle.ankle.sag.sf,gc,'spline');

level.torque.ankle.sag.triton_sound=interp1(gaitcycle,level.torque.ankle.sag.triton_sound,gc,'spline');
level.torque.ankle.sag.triton=interp1(gaitcycle,level.torque.ankle.sag.triton,gc,'spline');
level.torque.ankle.sag.sf=interp1(gaitcycle,level.torque.ankle.sag.sf,gc,'spline');
bigarc.torque.ankle.sag.triton_sound=interp1(gaitcycle,bigarc.torque.ankle.sag.triton_sound,gc,'spline');
bigarc.torque.ankle.sag.triton=interp1(gaitcycle,bigarc.torque.ankle.sag.triton,gc,'spline');
bigarc.torque.ankle.sag.sf=interp1(gaitcycle,bigarc.torque.ankle.sag.sf,gc,'spline');
bigrect.torque.ankle.sag.triton_sound=interp1(gaitcycle,bigrect.torque.ankle.sag.triton_sound,gc,'spline');
bigrect.torque.ankle.sag.triton=interp1(gaitcycle,bigrect.torque.ankle.sag.triton,gc,'spline');
bigrect.torque.ankle.sag.sf=interp1(gaitcycle,bigrect.torque.ankle.sag.sf,gc,'spline');

level.power.ankle.triton_sound=interp1(gaitcycle,level.power.ankle.triton_sound,gc,'spline');
level.power.ankle.triton=interp1(gaitcycle,level.power.ankle.triton,gc,'spline');
level.power.ankle.sf=interp1(gaitcycle,level.power.ankle.sf,gc,'spline');
bigarc.power.ankle.triton_sound=interp1(gaitcycle,bigarc.power.ankle.triton_sound,gc,'spline');
bigarc.power.ankle.triton=interp1(gaitcycle,bigarc.power.ankle.triton,gc,'spline');
bigarc.power.ankle.sf=interp1(gaitcycle,bigarc.power.ankle.sf,gc,'spline');
bigrect.power.ankle.triton_sound=interp1(gaitcycle,bigrect.power.ankle.triton_sound,gc,'spline');
bigrect.power.ankle.triton=interp1(gaitcycle,bigrect.power.ankle.triton,gc,'spline');
bigrect.power.ankle.sf=interp1(gaitcycle,bigrect.power.ankle.sf,gc,'spline');


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
load("mean_ankle.mat")
load("std_ankle.mat")

load("mean_ankle_torque_NATCOM.mat")
load("std_ankle_torque_NATCOM.mat")

load("LLpower_means_NATCOM.mat")
load("LLpower_std_NATCOM.mat")
cd ..

%Remove initial offfset from ankle angle
initial_offset_ankle_level=mean_ankle_level(1);
mean_ankle_level=mean_ankle_level-initial_offset_ankle_level;
mean_ankle_arch=mean_ankle_arch-initial_offset_ankle_level;
mean_ankle_rect=mean_ankle_rect-initial_offset_ankle_level;

%interp over gait cycle
mean_ankle_level2=interp1(gc_old,mean_ankle_level,gc);
mean_ankle_arch2=interp1(gc_old,mean_ankle_arch,gc);
mean_ankle_rect2=interp1(gc_old,mean_ankle_rect,gc);

mean_ankle_torque_level2=interp1(gc_old,mean_ankle_torque_level,gc)/1000;%Nmm/kg to Nm/kg
mean_ankle_torque_arch2=interp1(gc_old,mean_ankle_torque_arch,gc)/1000;
mean_ankle_torque_rect2=interp1(gc_old,mean_ankle_torque_rect,gc)/1000;

std_ankle_level2=interp1(gc_old,std_ankle_level,gc);
std_ankle_arch2=interp1(gc_old,std_ankle_arch,gc);
std_ankle_rect2=interp1(gc_old,std_ankle_rect,gc);

std_ankle_torque_level2=interp1(gc_old,std_ankle_torque_level,gc)/1000;
std_ankle_torque_arch2=interp1(gc_old,std_ankle_torque_arch,gc)/1000;
std_ankle_torque_rect2=interp1(gc_old,std_ankle_torque_rect,gc)/1000;


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
patch([gc fliplr(gc)],[(mean_ankle_level2-std_ankle_level2) fliplr(mean_ankle_level2+std_ankle_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp1t=plot(gc,level.angle.ankle.sag.triton-level.angle.ankle.sag.triton(1,1),'Linewidth',width,'Color',blue);  
hp1s=plot(gc,level.angle.ankle.sag.sf-level.angle.ankle.sag.sf(1,1),'Linewidth',width,'Color',red);
xlim([0 100])
ylim([-40 22])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
text(80,22,'+ DF','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h1=ylabel('Ankle angle [deg]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h1,'fontsize', fontsize)
set(h1,'FontName','Arial')

%arch
subplot(3,6,2)
patch([gc fliplr(gc)],[(mean_ankle_arch2-std_ankle_arch2) fliplr(mean_ankle_arch2+std_ankle_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp3t=plot(gc,bigarc.angle.ankle.sag.triton-level.angle.ankle.sag.triton(1,1),'Linewidth',width,'Color',blue); 
hp3s=plot(gc,bigarc.angle.ankle.sag.sf-level.angle.ankle.sag.sf(1,1),'Linewidth',width,'Color',red); 
xlim([0 100])
ylim([-40 22])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%rect
subplot(3,6,3)
patch([gc fliplr(gc)],[(mean_ankle_rect2-std_ankle_rect2) fliplr(mean_ankle_rect2+std_ankle_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp5t=plot(gc,bigrect.angle.ankle.sag.triton-level.angle.ankle.sag.triton(1,1),'Linewidth',width,'Color',blue); 
hp5s=plot(gc,bigrect.angle.ankle.sag.sf-level.angle.ankle.sag.sf(1,1),'Linewidth',width,'Color',red); 
xlim([0 100])
ylim([-40 22])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%%CASE STUDY II
%level
subplot(3,6,4)
patch([gc fliplr(gc)],[(mean_ankle_level2-std_ankle_level2) fliplr(mean_ankle_level2+std_ankle_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp1t=plot(gc,Tmean_level_ankleAngle.sag.left-Tmean_level_ankleAngle.sag.left(1,1),'Linewidth',width,'Color',blue);  
hp1ts=plot(gc,Tmean_level_ankleAngle.sag.right-Tmean_level_ankleAngle.sag.right(1,1),':','Linewidth',width,'Color',blue);
hp1s=plot(gc,SFmean_level_ankleAngle.sag.left-SFmean_level_ankleAngle.sag.left(1,1),'Linewidth',width,'Color',red); 
hp1ss=plot(gc,SFmean_level_ankleAngle.sag.right-SFmean_level_ankleAngle.sag.right(1,1),':','Linewidth',width,'Color',red);
xlim([0 100])
ylim([-40 22])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%arch
subplot(3,6,5)
patch([gc fliplr(gc)],[(mean_ankle_arch2-std_ankle_arch2) fliplr(mean_ankle_arch2+std_ankle_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp3t=plot(gc,Tmean_arch_ankleAngle.sag.left-Tmean_level_ankleAngle.sag.left(1,1),'Linewidth',width,'Color',blue); 
hp3ts=plot(gc,Tmean_arch_contr_ankleAngle.sag.right-Tmean_level_ankleAngle.sag.right(1,1),':','Linewidth',width,'Color',blue); 
hp3s=plot(gc,SFmean_arch_ankleAngle.sag.left-SFmean_level_ankleAngle.sag.left(1,1),'Linewidth',width,'Color',red); 
hp3ss=plot(gc,SFmean_arch_ankleAngle.sag.right-SFmean_level_ankleAngle.sag.right(1,1),':','Linewidth',width,'Color',red); 
xlim([0 100])
ylim([-40 22])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%rect
subplot(3,6,6)
patch([gc fliplr(gc)],[(mean_ankle_rect2-std_ankle_rect2) fliplr(mean_ankle_rect2+std_ankle_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp2t=plot(gc,Tmean_rect_ankleAngle.sag.left-Tmean_level_ankleAngle.sag.left(1,1),'Linewidth',width,'Color',blue); 
hold on
hp2ts=plot(gc,Tmean_rect_contr_ankleAngle.sag.right-Tmean_level_ankleAngle.sag.right(1,1),':','Linewidth',width,'Color',blue); 
hp2s=plot(gc,SFmean_rect_ankleAngle.sag.left-SFmean_level_ankleAngle.sag.left(1,1),'Linewidth',width,'Color',red); 
hp2ss=plot(gc,SFmean_rect_ankleAngle.sag.right-SFmean_level_ankleAngle.sag.right(1,1),':','Linewidth',width,'Color',red); 
xlim([0 100])
ylim([-40 22])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')


%%CASE STUDY I
% TORQUE [Nm/kg]
%level
sub2=subplot(3,6,7)
patch([gc fliplr(gc)],[(mean_ankle_torque_level2-std_ankle_torque_level2) fliplr(mean_ankle_torque_level2+std_ankle_torque_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp6t=plot(gc,(level.torque.ankle.sag.triton)/1000,'Linewidth',width,'Color',blue); %(/1000 to go from Nmm to Nm)
hp6s=plot(gc,(level.torque.ankle.sag.sf)/1000,'Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
box off
text(50,1.97,'+ plantarflexor','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h2=ylabel('Ankle torque [Nm/kg]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h2,'fontsize', fontsize)
set(h2,'FontName','Arial')

%arch
subplot(3,6,8)
patch([gc fliplr(gc)],[(mean_ankle_torque_arch2-std_ankle_torque_arch2) fliplr(mean_ankle_torque_arch2+std_ankle_torque_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp8t=plot(gc,(bigarc.torque.ankle.sag.triton)/1000,'Linewidth',width,'Color',blue); 
hp8s=plot(gc,(bigarc.torque.ankle.sag.sf)/1000,'Linewidth',width,'Color',red);  
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,9)
patch([gc fliplr(gc)],[(mean_ankle_torque_rect2-std_ankle_torque_rect2) fliplr(mean_ankle_torque_rect2+std_ankle_torque_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp10t=plot(gc,(bigrect.torque.ankle.sag.triton)/1000,'Linewidth',width,'Color',blue); 
hp10s=plot(gc,(bigrect.torque.ankle.sag.sf)/1000,'Linewidth',width,'Color',red);  
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,10)
patch([gc fliplr(gc)],[(mean_ankle_torque_level2-std_ankle_torque_level2) fliplr(mean_ankle_torque_level2+std_ankle_torque_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
patch([gc fliplr(gc)],[(Tmean_level_ankleT.sag.right/bodymass+Tsd_level_ankleT.sag.right/bodymass) fliplr(Tmean_level_ankleT.sag.right/bodymass-Tsd_level_ankleT.sag.right/bodymass)],...
    blue,'FaceAlpha',.4,'LineStyle','none');
patch([gc fliplr(gc)],[(SFmean_level_ankleT.sag.right/bodymass+SFsd_level_ankleT.sag.right/bodymass) fliplr(SFmean_level_ankleT.sag.right/bodymass-SFsd_level_ankleT.sag.right/bodymass)],...
    red,'FaceAlpha',.4,'LineStyle','none');
hp5t=plot(gc,Tmean_level_ankleT.sag.left/bodymass,'Linewidth',width,'Color',blue); %(/1000 to go from Nmm to Nm)
hp5ts=plot(gc,Tmean_level_ankleT.sag.right/bodymass,':','Linewidth',width,'Color',blue); 
hp5s=plot(gc,SFmean_level_ankleT.sag.left/bodymass,'Linewidth',width,'Color',red); 
hp5ss=plot(gc,SFmean_level_ankleT.sag.right/bodymass,':','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%arch
subplot(3,6,11)
patch([gc fliplr(gc)],[(mean_ankle_torque_arch2-std_ankle_torque_arch2) fliplr(mean_ankle_torque_arch2+std_ankle_torque_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp7t=plot(gc,Tmean_arch_ankleT.sag.left/bodymass,'Linewidth',width,'Color',blue); 
patch([gc fliplr(gc)],[(Tmean_arch_contr_ankleT.sag.right/bodymass+Tsd_arch_contr_ankleT.sag.right/bodymass) fliplr(Tmean_arch_contr_ankleT.sag.right/bodymass-Tsd_arch_contr_ankleT.sag.right/bodymass)],...
    blue,'FaceAlpha',.4,'LineStyle','none');
patch([gc fliplr(gc)],[(SFmean_arch_ankleT.sag.right/bodymass+SFsd_arch_ankleT.sag.right/bodymass) fliplr(SFmean_arch_ankleT.sag.right/bodymass-SFsd_arch_ankleT.sag.right/bodymass)],...
    red,'FaceAlpha',.4,'LineStyle','none');
hp7ts=plot(gc,Tmean_arch_contr_ankleT.sag.right/bodymass,':','Linewidth',width,'Color',blue); 
hp7s=plot(gc,SFmean_arch_ankleT.sag.left/bodymass,'Linewidth',width,'Color',red); 
hp7ss=plot(gc,SFmean_arch_ankleT.sag.right/bodymass,':','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%rect
subplot(3,6,12)
patch([gc fliplr(gc)],[(mean_ankle_torque_rect2-std_ankle_torque_rect2) fliplr(mean_ankle_torque_rect2+std_ankle_torque_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp6t=plot(gc,Tmean_rect_ankleT.sag.left/bodymass,'Linewidth',width,'Color',blue); 
patch([gc fliplr(gc)],[(Tmean_rect_contr_ankleT.sag.right/bodymass+Tsd_rect_contr_ankleT.sag.right/bodymass) fliplr(Tmean_rect_contr_ankleT.sag.right/bodymass-Tsd_rect_contr_ankleT.sag.right/bodymass)],...
    blue,'FaceAlpha',.4,'LineStyle','none');
patch([gc fliplr(gc)],[(SFmean_rect_ankleT.sag.right/bodymass+SFsd_rect_ankleT.sag.right/bodymass) fliplr(SFmean_rect_ankleT.sag.right/bodymass-SFsd_rect_ankleT.sag.right/bodymass)],...
    red,'FaceAlpha',.4,'LineStyle','none');
hp6ts=plot(gc,Tmean_rect_contr_ankleT.sag.right/bodymass,':','Linewidth',width,'Color',blue); 
hp6s=plot(gc,SFmean_rect_ankleT.sag.left/bodymass,'Linewidth',width,'Color',red); 
hp6ss=plot(gc,SFmean_rect_ankleT.sag.right/bodymass,':','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
set(gca,'fontsize', fontsize,'FontName', 'Arial')


%%CASE STUDY I
% POWER [W/kg]
%level
sub3=subplot(3,6,13)
patch([gc fliplr(gc)],[(mean_ankle_power_level-std_ankle_power_level) fliplr(mean_ankle_power_level+std_ankle_power_level)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp11t=plot(gc,level.power.ankle.triton,'Linewidth',width,'Color',blue);  
hp11s=plot(gc,level.power.ankle.sf,'Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
box off
text(80,4.8,'+ gen','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h3=ylabel('Ankle power [W/kg]');
h31=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h3,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,14)
patch([gc fliplr(gc)],[(mean_ankle_power_arch-std_ankle_power_arch) fliplr(mean_ankle_power_arch+std_ankle_power_arch)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp13t=plot(gc,bigarc.power.ankle.triton,'b','Linewidth',width,'Color',blue); 
hp13s=plot(gc,bigarc.power.ankle.sf,'r','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
box off
h33=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial');
set(h33,'fontsize', fontsize)
set(h33,'FontName','Arial')

%rect
subplot(3,6,15)
patch([gc fliplr(gc)],[(mean_ankle_power_rect-std_ankle_power_rect) fliplr(mean_ankle_power_rect+std_ankle_power_rect)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp15t=plot(gc,bigrect.power.ankle.triton,'b','Linewidth',width,'Color',blue); 
hp15s=plot(gc,bigrect.power.ankle.sf,'r','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
box off
h35=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize)
set(h35,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,16)
patch([gc fliplr(gc)],[(mean_ankle_power_level-std_ankle_power_level) fliplr(mean_ankle_power_level+std_ankle_power_level)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp9t=plot(gc,Tmean_level_ankleP.sag.left/bodymass,'Linewidth',width,'Color',blue);  
hp9ts=plot(gc,Tmean_level_ankleP.sag.right/bodymass,':','Linewidth',width,'Color',blue); 
hp9s=plot(gc,SFmean_level_ankleP.sag.left/bodymass,'Linewidth',width,'Color',red); 
hp9ss=plot(gc,SFmean_level_ankleP.sag.right/bodymass,':','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
h31=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize)
set(h31,'FontName','Arial')

%change order entries in the legend
hLegend = legend({'able-bodied','Triton','sound limb','SoftFoot Pro','sound limb'},...
    'Orientation','horizontal','FontName','Arial','FontSize', fontsize);
hLegend.PlotChildren = hLegend.PlotChildren([2,3,4,5,1]);
legend('boxoff')

%arch
subplot(3,6,17)
patch([gc fliplr(gc)],[(mean_ankle_power_arch-std_ankle_power_arch) fliplr(mean_ankle_power_arch+std_ankle_power_arch)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp11t=plot(gc,Tmean_arch_ankleP.sag.left/bodymass,'b','Linewidth',width,'Color',blue); 
hp11ts=plot(gc,Tmean_arch_contr_ankleP.sag.right/bodymass,':','Linewidth',width,'Color',blue); 
hp11s=plot(gc,SFmean_arch_ankleP.sag.left/bodymass,'r','Linewidth',width,'Color',red); 
hp11ss=plot(gc,SFmean_arch_ankleP.sag.right/bodymass,':','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
h32=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName', 'Arial')
set(h32,'fontsize', fontsize)
set(h32,'FontName','Arial')

%rect
subplot(3,6,18)
patch([gc fliplr(gc)],[(mean_ankle_power_rect-std_ankle_power_rect) fliplr(mean_ankle_power_rect+std_ankle_power_rect)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp10t=plot(gc,Tmean_rect_ankleP.sag.left/bodymass,'b','Linewidth',width,'Color',blue); 
hp10ts=plot(gc,Tmean_rect_contr_ankleP.sag.right/bodymass,':','Linewidth',width,'Color',blue); 
hp10s=plot(gc,SFmean_rect_ankleP.sag.left/bodymass,'r','Linewidth',width,'Color',red); 
hp10ss=plot(gc,SFmean_rect_ankleP.sag.right/bodymass,':','Linewidth',width,'Color',red); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
xticks([0  50 100])
xticklabels({'0','50','100'})
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName', 'Arial')
set(h33,'fontsize', fontsize)
set(h33,'FontName','Arial')

% set(get(sub1,'YLabel'), 'Units','data');
% set(get(sub2,'YLabel'), 'Units','data');%centimeters
% set(get(sub3,'YLabel'), 'Units','data');
% ylabel_position=get(get(sub3,'YLabel'),'Position');
% set(get(sub2,'YLabel'), 'Position',ylabel_position);
% set(get(sub1,'YLabel'), 'Position',ylabel_position);


%% Figure CASE STUDY I, contralateral limb - SUPPL MATERIAL

figure

%%CASE STUDY I
%ANGLE
%level
sub1=subplot(3,3,1)
patch([gc fliplr(gc)],[(mean_ankle_level2-std_ankle_level2) fliplr(mean_ankle_level2+std_ankle_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp1ts=plot(gc,level.angle.ankle.sag.triton_sound-level.angle.ankle.sag.triton_sound(1,1),'Linewidth',width,'Color',green);
xlim([0 100])
ylim([-30 22])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
text(80,22,'+ DF','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h1=ylabel('Ankle angle [deg]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h1,'fontsize', fontsize)
set(h1,'FontName','Arial')

%arch
subplot(3,3,2)
patch([gc fliplr(gc)],[(mean_ankle_arch2-std_ankle_arch2) fliplr(mean_ankle_arch2+std_ankle_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp3ts=plot(gc,bigarc.angle.ankle.sag.triton_sound-level.angle.ankle.sag.triton_sound(1,1),'Linewidth',width,'Color',green); 
xlim([0 100])
ylim([-30 22])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')

%rect
subplot(3,3,3)
patch([gc fliplr(gc)],[(mean_ankle_rect2-std_ankle_rect2) fliplr(mean_ankle_rect2+std_ankle_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp5ts=plot(gc,bigrect.angle.ankle.sag.triton_sound-level.angle.ankle.sag.triton_sound(1,1),'Linewidth',width,'Color',green); 
xlim([0 100])
ylim([-30 22])
box off
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
set(gca,'fontsize', fontsize,'FontName', 'Arial')


%%CASE STUDY I
% TORQUE
%level
sub2=subplot(3,3,4)
patch([gc fliplr(gc)],[(mean_ankle_torque_level2-std_ankle_torque_level2) fliplr(mean_ankle_torque_level2+std_ankle_torque_level2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp6ts=plot(gc,(level.torque.ankle.sag.triton_sound)/1000,'Linewidth',width,'Color',green); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
box off
text(50,1.97,'+ plantarflexor','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h2=ylabel('Ankle torque [Nm/kg]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h2,'fontsize', fontsize)
set(h2,'FontName','Arial')

%arch
subplot(3,3,5)
patch([gc fliplr(gc)],[(mean_ankle_torque_arch2-std_ankle_torque_arch2) fliplr(mean_ankle_torque_arch2+std_ankle_torque_arch2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp8ts=plot(gc,(bigarc.torque.ankle.sag.triton_sound)/1000,'Linewidth',width,'Color',green); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,6)
patch([gc fliplr(gc)],[(mean_ankle_torque_rect2-std_ankle_torque_rect2) fliplr(mean_ankle_torque_rect2+std_ankle_torque_rect2)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp10ts=plot(gc,(bigrect.torque.ankle.sag.triton_sound)/1000,'Linewidth',width,'Color',green); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-0.52 2])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')


%%CASE STUDY I
%level
sub3=subplot(3,3,7)
patch([gc fliplr(gc)],[(mean_ankle_power_level-std_ankle_power_level) fliplr(mean_ankle_power_level+std_ankle_power_level)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp11ts=plot(gc,level.power.ankle.triton_sound,'Linewidth',width,'Color',green); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
box off
text(80,4.8,'+ gen','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h3=ylabel('Ankle power [W/kg]');
h31=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h3,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,3,8)
patch([gc fliplr(gc)],[(mean_ankle_power_arch-std_ankle_power_arch) fliplr(mean_ankle_power_arch+std_ankle_power_arch)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp13ts=plot(gc,bigarc.power.ankle.triton_sound,'Linewidth',width,'Color',green); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
box off
h33=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial');
set(h33,'fontsize', fontsize)
set(h33,'FontName','Arial')

%rect
subplot(3,3,9)
patch([gc fliplr(gc)],[(mean_ankle_power_rect-std_ankle_power_rect) fliplr(mean_ankle_power_rect+std_ankle_power_rect)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hp15ts=plot(gc,bigrect.power.ankle.triton_sound,'Linewidth',width,'Color',green); 
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-2 5])
box off
h35=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize)
set(h35,'FontName','Arial')

%change order entries in the legend
hLegend = legend({'able-bodied','contralateral limb (Triton)'},...
    'Orientation','horizontal','FontName','Arial','FontSize', fontsize);
hLegend.PlotChildren = hLegend.PlotChildren([2,1]);
legend('boxoff')

% set(get(sub1,'YLabel'), 'Units','centimeters');
% set(get(sub2,'YLabel'), 'Units','centimeters');
% set(get(sub3,'YLabel'), 'Units','centimeters');
% ylabel_position=get(get(sub2,'YLabel'),'Position');
% set(get(sub1,'YLabel'), 'Position',ylabel_position);
% set(get(sub3,'YLabel'), 'Position',ylabel_position);