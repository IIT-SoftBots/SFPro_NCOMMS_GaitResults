%%%% Plotting GRF data %%%%

close all
clear all
clc

set(0,'defaultfigurecolor',[1 1 1])
set(groot,'defaultLegendAutoUpdate','off')
currentfolder=pwd;

gaitcycle=linspace(0,100,101);
gc_old=linspace(0,100,100);
gc=linspace(0,100,200);

%% load CASE STUDY I data

load('level.mat');
load('bigarc.mat');
load('bigrect.mat');

%%Replace NaN values with zero values in GRF - CASE STUDY I
%sagittal
level.grf.sag.sf(isnan(level.grf.sag.sf))=0;
level.grf.sag.triton(isnan(level.grf.sag.triton))=0;
level.grf.sag.triton_sound(isnan(level.grf.sag.triton_sound))=0;

bigarc.grf.sag.sf(isnan(bigarc.grf.sag.sf))=0;
bigarc.grf.sag.triton(isnan(bigarc.grf.sag.triton))=0;
bigarc.grf.sag.triton_sound(isnan(bigarc.grf.sag.triton_sound))=0;   

bigrect.grf.sag.sf(isnan(bigrect.grf.sag.sf))=0;
bigrect.grf.sag.triton(isnan(bigrect.grf.sag.triton))=0;
bigrect.grf.sag.triton_sound(isnan(bigrect.grf.sag.triton_sound))=0; 

%frontal
level.grf.fron.sf(isnan(level.grf.fron.sf))=0;
level.grf.fron.triton(isnan(level.grf.fron.triton))=0;
level.grf.fron.triton_sound(isnan(level.grf.fron.triton_sound))=0;

bigarc.grf.fron.sf(isnan(bigarc.grf.fron.sf))=0;
bigarc.grf.fron.triton(isnan(bigarc.grf.fron.triton))=0;
bigarc.grf.fron.triton_sound(isnan(bigarc.grf.fron.triton_sound))=0;   

bigrect.grf.fron.sf(isnan(bigrect.grf.fron.sf))=0;
bigrect.grf.fron.triton(isnan(bigrect.grf.fron.triton))=0;
bigrect.grf.fron.triton_sound(isnan(bigrect.grf.fron.triton_sound))=0; 

%transverse
level.grf.transv.sf(isnan(level.grf.transv.sf))=0;
level.grf.transv.triton(isnan(level.grf.transv.triton))=0;
level.grf.transv.triton_sound(isnan(level.grf.transv.triton_sound))=0;

bigarc.grf.transv.sf(isnan(bigarc.grf.transv.sf))=0;
bigarc.grf.transv.triton(isnan(bigarc.grf.transv.triton))=0;
bigarc.grf.transv.triton_sound(isnan(bigarc.grf.transv.triton_sound))=0;   

bigrect.grf.transv.sf(isnan(bigrect.grf.transv.sf))=0;
bigrect.grf.transv.triton(isnan(bigrect.grf.transv.triton))=0;
bigrect.grf.transv.triton_sound(isnan(bigrect.grf.transv.triton_sound))=0; 


%interp over the gait cycle
level.grf.sag.triton_sound=interp1(gaitcycle,level.grf.sag.triton_sound,gc,'spline');
level.grf.sag.triton=interp1(gaitcycle,level.grf.sag.triton,gc,'spline');
level.grf.sag.sf=interp1(gaitcycle,level.grf.sag.sf,gc,'spline');
bigarc.grf.sag.triton_sound=interp1(gaitcycle,bigarc.grf.sag.triton_sound,gc,'spline');
bigarc.grf.sag.triton=interp1(gaitcycle,bigarc.grf.sag.triton,gc,'spline');
bigarc.grf.sag.sf=interp1(gaitcycle,bigarc.grf.sag.sf,gc,'spline');
bigrect.grf.sag.triton_sound=interp1(gaitcycle,bigrect.grf.sag.triton_sound,gc,'spline');
bigrect.grf.sag.triton=interp1(gaitcycle,bigrect.grf.sag.triton,gc,'spline');
bigrect.grf.sag.sf=interp1(gaitcycle,bigrect.grf.sag.sf,gc,'spline');

level.grf.fron.triton_sound=interp1(gaitcycle,level.grf.fron.triton_sound,gc,'spline');
level.grf.fron.triton=interp1(gaitcycle,level.grf.fron.triton,gc,'spline');
level.grf.fron.sf=interp1(gaitcycle,level.grf.fron.sf,gc,'spline');
bigarc.grf.fron.triton_sound=interp1(gaitcycle,bigarc.grf.fron.triton_sound,gc,'spline');
bigarc.grf.fron.triton=interp1(gaitcycle,bigarc.grf.fron.triton,gc,'spline');
bigarc.grf.fron.sf=interp1(gaitcycle,bigarc.grf.fron.sf,gc,'spline');
bigrect.grf.fron.triton_sound=interp1(gaitcycle,bigrect.grf.fron.triton_sound,gc,'spline');
bigrect.grf.fron.triton=interp1(gaitcycle,bigrect.grf.fron.triton,gc,'spline');
bigrect.grf.fron.sf=interp1(gaitcycle,bigrect.grf.fron.sf,gc,'spline');

level.grf.transv.triton_sound=interp1(gaitcycle,level.grf.transv.triton_sound,gc,'spline');
level.grf.transv.triton=interp1(gaitcycle,level.grf.transv.triton,gc,'spline');
level.grf.transv.sf=interp1(gaitcycle,level.grf.transv.sf,gc,'spline');
bigarc.grf.transv.triton_sound=interp1(gaitcycle,bigarc.grf.transv.triton_sound,gc,'spline');
bigarc.grf.transv.triton=interp1(gaitcycle,bigarc.grf.transv.triton,gc,'spline');
bigarc.grf.transv.sf=interp1(gaitcycle,bigarc.grf.transv.sf,gc,'spline');
bigrect.grf.transv.triton_sound=interp1(gaitcycle,bigrect.grf.transv.triton_sound,gc,'spline');
bigrect.grf.transv.triton=interp1(gaitcycle,bigrect.grf.transv.triton,gc,'spline');
bigrect.grf.transv.sf=interp1(gaitcycle,bigrect.grf.transv.sf,gc,'spline');


%% load CASE STUDY II data

cd('JOiiNT Lab')

cd('GRF d1')
load('triton_meanSDGRF_level.mat')
load('triton_meanSDGRF_rect.mat')
load('triton_meanSDGRF_arch.mat')
cd ..

cd('GRF d2')
load('sf_meanSDGRF_level.mat')
load('sf_meanSDGRF_rect.mat')
load('sf_meanSDGRF_arch.mat')
cd ..
cd ..

bodymass=92; %kg participant's body mass
bw=bodymass*9.81;


%% load ABLE-BODIED dataset 

cd('ablebodied12_data') 
load("GRF_mean_NATCOM.mat")
load("GRF_std_NATCOM.mat")
cd ..

%interp over gait cycle
%mean values
all_subjects_Norm_GRF_Level_walking_dynamic_X=interp1(gc_old,all_subjects_Norm_GRF_Level_walking_dynamic_X,gc);
all_subjects_Norm_GRF_Level_obs_arch_dynamic_X=interp1(gc_old,all_subjects_Norm_GRF_Level_obs_arch_dynamic_X,gc);
all_subjects_Norm_GRF_Level_obs_rect_dynamic_X=interp1(gc_old,all_subjects_Norm_GRF_Level_obs_rect_dynamic_X,gc);

all_subjects_Norm_GRF_Level_walking_dynamic_Y=interp1(gc_old,all_subjects_Norm_GRF_Level_walking_dynamic_Y,gc);
all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y=interp1(gc_old,all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y,gc);
all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y=interp1(gc_old,all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y,gc);

all_subjects_Norm_GRF_Level_walking_dynamic_Z=interp1(gc_old,all_subjects_Norm_GRF_Level_walking_dynamic_Z,gc);
all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z=interp1(gc_old,all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z,gc);
all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z=interp1(gc_old,all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z,gc);

%std
std_Norm_GRF_Level_walking_dynamic_X=interp1(gc_old,std_Norm_GRF_Level_walking_dynamic_X,gc);
std_Norm_GRF_Level_obs_arch_dynamic_X=interp1(gc_old,std_Norm_GRF_Level_obs_arch_dynamic_X,gc);
std_Norm_GRF_Level_obs_rect_dynamic_X=interp1(gc_old,std_Norm_GRF_Level_obs_rect_dynamic_X,gc);

std_Norm_GRF_Level_walking_dynamic_Y=interp1(gc_old,std_Norm_GRF_Level_walking_dynamic_Y,gc);
std_Norm_GRF_Level_obs_arch_dynamic_Y=interp1(gc_old,std_Norm_GRF_Level_obs_arch_dynamic_Y,gc);
std_Norm_GRF_Level_obs_rect_dynamic_Y=interp1(gc_old,std_Norm_GRF_Level_obs_rect_dynamic_Y,gc);

std_Norm_GRF_Level_walking_dynamic_Z=interp1(gc_old,std_Norm_GRF_Level_walking_dynamic_Z,gc);
std_Norm_GRF_Level_obs_arch_dynamic_Z=interp1(gc_old,std_Norm_GRF_Level_obs_arch_dynamic_Z,gc);
std_Norm_GRF_Level_obs_rect_dynamic_Z=interp1(gc_old,std_Norm_GRF_Level_obs_rect_dynamic_Z,gc);


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

% GRF sagittal - vGRF
%CASE STUDY I
%level
sub1=subplot(3,6,1)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_Z-std_Norm_GRF_Level_walking_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_Z+std_Norm_GRF_Level_walking_dynamic_Z)],...
     shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,level.grf.sag.triton,'Linewidth',width,'Color',blue);
plot(gc,level.grf.sag.sf,'Linewidth',width,'Color',red);
xlim([0 100])
ylim([0 200])
box off
h1=ylabel('vGRF [%BW]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h1,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,2)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z-std_Norm_GRF_Level_obs_arch_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z+std_Norm_GRF_Level_obs_arch_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigarc.grf.sag.triton,'Linewidth',width,'Color',blue);
plot(gc,bigarc.grf.sag.sf,'Linewidth',width,'Color',red);
xlim([0 100])
% ylim([0 2])
ylim([0 200])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,3)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z-std_Norm_GRF_Level_obs_rect_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z+std_Norm_GRF_Level_obs_rect_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigrect.grf.sag.triton,'Linewidth',width,'Color',blue);
plot(gc,bigrect.grf.sag.sf,'Linewidth',width,'Color',red);
xlim([0 100])
ylim([0 200])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%CASE STUDY II
%level
subplot(3,6,4)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_Z-std_Norm_GRF_Level_walking_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_Z+std_Norm_GRF_Level_walking_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,Tmean_level_GRF.sag.left/bw*100,'Linewidth',width,'Color',blue); 
plot(gc,Tmean_level_GRF.sag.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,SFmean_level_GRF.sag.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_level_GRF.sag.right/bw*100,':','Linewidth',width,'Color',red);
xlim([0 100])
ylim([0 200])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,5)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z-std_Norm_GRF_Level_obs_arch_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z+std_Norm_GRF_Level_obs_arch_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,Tmean_arch_GRF.sag.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,Tmean_arch_GRF.sag.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,SFmean_arch_GRF.sag.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_arch_GRF.sag.right/bw*100,':','Linewidth',width,'Color',red);
xlim([0 100])
ylim([0 200])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,6)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z-std_Norm_GRF_Level_obs_rect_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z+std_Norm_GRF_Level_obs_rect_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,Tmean_rect_GRF.sag.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,Tmean_rect_GRF.sag.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,SFmean_rect_GRF.sag.left/bw*100,'Linewidth',width,'Color',red);
plot(gc ,SFmean_rect_GRF.sag.right/bw*100,':','Linewidth',width,'Color',red);
xlim([0 100])
ylim([0 200])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')


% GRF frontal - mlGRF
%CASE STUDY I
%level
sub2=subplot(3,6,7)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_Y-std_Norm_GRF_Level_walking_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_Y+std_Norm_GRF_Level_walking_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,level.grf.fron.triton,'Linewidth',width,'Color',blue);
plot(gc,level.grf.fron.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-7 17])
box off
text(80,15,'+ medial','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h2=ylabel('mlGRF [%BW]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h2,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,8)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y-std_Norm_GRF_Level_obs_arch_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y+std_Norm_GRF_Level_obs_arch_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigarc.grf.fron.triton,'Linewidth',width,'Color',blue);
plot(gc,bigarc.grf.fron.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-7 17])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,9)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y-std_Norm_GRF_Level_obs_rect_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y+std_Norm_GRF_Level_obs_rect_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigrect.grf.fron.triton,'Linewidth',width,'Color',blue);
plot(gc,bigrect.grf.fron.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-7 17])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,10)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_Y-std_Norm_GRF_Level_walking_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_Y+std_Norm_GRF_Level_walking_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,Tmean_level_GRF.fron.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,-Tmean_level_GRF.fron.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,-SFmean_level_GRF.fron.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_level_GRF.fron.right/bw*100,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-7 17])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,11)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y-std_Norm_GRF_Level_obs_arch_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y+std_Norm_GRF_Level_obs_arch_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,-Tmean_arch_GRF.fron.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,Tmean_arch_GRF.fron.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,-SFmean_arch_GRF.fron.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_arch_GRF.fron.right/bw*100,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-7 17])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,12)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y-std_Norm_GRF_Level_obs_rect_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y+std_Norm_GRF_Level_obs_rect_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,-Tmean_rect_GRF.fron.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,Tmean_rect_GRF.fron.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,-SFmean_rect_GRF.fron.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_rect_GRF.fron.right/bw*100,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-7 17])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')


% GRF transverse - apGRF
%level
sub3=subplot(3,6,13)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_X-std_Norm_GRF_Level_walking_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_X+std_Norm_GRF_Level_walking_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,level.grf.transv.triton,'Linewidth',width,'Color',blue);
plot(gc,level.grf.transv.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-42 40])
box off
text(80,36,'+ anterior','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h31=xlabel('Gait cycle [%]');
h3=ylabel('apGRF [%BW]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h3,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,6,14)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_X-std_Norm_GRF_Level_obs_arch_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_X+std_Norm_GRF_Level_obs_arch_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
hold on
plot(gc,bigarc.grf.transv.triton,'Linewidth',width,'Color',blue);
plot(gc,bigarc.grf.transv.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
% ylim([-0.4 0.4])
ylim([-42 40])
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h33,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,15)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_X-std_Norm_GRF_Level_obs_rect_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_X+std_Norm_GRF_Level_obs_rect_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigrect.grf.transv.triton,'Linewidth',width,'Color',blue);
plot(gc,bigrect.grf.transv.sf,'Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-42 40])
box off
h35=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize,'FontName','Arial')

%%CASE STUDY II
%level
subplot(3,6,16)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_X-std_Norm_GRF_Level_walking_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_X+std_Norm_GRF_Level_walking_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,-Tmean_level_GRF.transv.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,-Tmean_level_GRF.transv.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,SFmean_level_GRF.transv.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_level_GRF.transv.right/bw*100,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-42 40])
box off
h31=xlabel('Gait cycle [%]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%change order entries in the legend
hLegend = legend({'able-bodied','Triton','sound limb','SoftFoot Pro','sound limb'},...
    'Orientation','horizontal','FontName', 'Arial','FontSize',fontsize);
hLegend.PlotChildren = hLegend.PlotChildren([2,3,4,5,1]);
legend('boxoff')

%arch
subplot(3,6,17)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_X-std_Norm_GRF_Level_obs_arch_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_X+std_Norm_GRF_Level_obs_arch_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,Tmean_arch_GRF.transv.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,Tmean_arch_GRF.transv.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,SFmean_arch_GRF.transv.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_arch_GRF.transv.right/bw*100,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-42 40])
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h33,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,6,18)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_X-std_Norm_GRF_Level_obs_rect_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_X+std_Norm_GRF_Level_obs_rect_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,Tmean_rect_GRF.transv.left/bw*100,'Linewidth',width,'Color',blue);
plot(gc,Tmean_rect_GRF.transv.right/bw*100,':','Linewidth',width,'Color',blue);
plot(gc,SFmean_rect_GRF.transv.left/bw*100,'Linewidth',width,'Color',red);
plot(gc,SFmean_rect_GRF.transv.right/bw*100,':','Linewidth',width,'Color',red);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-42 40])
box off
h35=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize,'FontName','Arial')

% set(get(sub1,'YLabel'), 'Units','centimeters');
% set(get(sub2,'YLabel'), 'Units','centimeters');
% set(get(sub3,'YLabel'), 'Units','centimeters');
% ylabel_position=get(get(sub3,'YLabel'),'Position');
% set(get(sub2,'YLabel'), 'Position',ylabel_position);
% set(get(sub1,'YLabel'), 'Position',ylabel_position);


%% Figure CASE STUDY I, contralateral limb - SUPPL MATERIAL

figure
% GRF sagittal - vGRF
%CASE STUDY I
%level
sub1=subplot(3,3,1)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_Z-std_Norm_GRF_Level_walking_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_Z+std_Norm_GRF_Level_walking_dynamic_Z)],...
     shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,level.grf.sag.triton_sound,'Linewidth',width,'Color',green);
xlim([0 100])
ylim([0 150])
box off
h1=ylabel('vGRF [%BW]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h1,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,3,2)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z-std_Norm_GRF_Level_obs_arch_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Z+std_Norm_GRF_Level_obs_arch_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigarc.grf.sag.triton_sound,'Linewidth',width,'Color',green);
xlim([0 100])
ylim([0 150])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,3)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z-std_Norm_GRF_Level_obs_rect_dynamic_Z) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Z+std_Norm_GRF_Level_obs_rect_dynamic_Z)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigrect.grf.sag.triton_sound,'Linewidth',width,'Color',green);
xlim([0 100])
ylim([0 150])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')


% GRF frontal - mlGRF
%level
sub2=subplot(3,3,4)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_Y-std_Norm_GRF_Level_walking_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_Y+std_Norm_GRF_Level_walking_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,level.grf.fron.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5 12])
box off
text(80,15,'+ medial','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h2=ylabel('mlGRF [%BW]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h2,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,3,5)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y-std_Norm_GRF_Level_obs_arch_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_Y+std_Norm_GRF_Level_obs_arch_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigarc.grf.fron.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5 12])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,6)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y-std_Norm_GRF_Level_obs_rect_dynamic_Y) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_Y+std_Norm_GRF_Level_obs_rect_dynamic_Y)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigrect.grf.fron.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-5 12])
box off
set(gca,'fontsize', fontsize,'FontName','Arial')


% GRF transverse - apGRF
%level
sub3=subplot(3,3,7)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_walking_dynamic_X-std_Norm_GRF_Level_walking_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_walking_dynamic_X+std_Norm_GRF_Level_walking_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,level.grf.transv.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-30 30])
box off
text(80,36,'+ anterior','FontName','Arial','FontSize',6,'HorizontalAlignment','center')
h31=xlabel('Gait cycle [%]');
h3=ylabel('apGRF [%BW]');
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h3,'fontsize', fontsize,'FontName','Arial')
set(h31,'fontsize', fontsize,'FontName','Arial')

%arch
subplot(3,3,8)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_arch_dynamic_X-std_Norm_GRF_Level_obs_arch_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_obs_arch_dynamic_X+std_Norm_GRF_Level_obs_arch_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigarc.grf.transv.triton_sound,'Linewidth',width,'Color',green);
hold on
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-30 30])
box off
h33=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h33,'fontsize', fontsize,'FontName','Arial')

%rect
subplot(3,3,9)
patch([gc fliplr(gc)],[(all_subjects_Norm_GRF_Level_obs_rect_dynamic_X-std_Norm_GRF_Level_obs_rect_dynamic_X) fliplr(all_subjects_Norm_GRF_Level_obs_rect_dynamic_X+std_Norm_GRF_Level_obs_rect_dynamic_X)],...
    shade,'FaceAlpha',.6,'LineStyle','none');
hold on
plot(gc,bigrect.grf.transv.triton_sound,'Linewidth',width,'Color',green);
ref = refline(0,0);
set(ref,'color','k','linestyle',':')
xlim([0 100])
ylim([-30 30])
box off
h35=xlabel('Gait cycle [%]')
set(gca,'fontsize', fontsize,'FontName','Arial')
set(h35,'fontsize', fontsize,'FontName','Arial')

%change order entries in the legend
hLegend = legend({'able-bodied','contralateral limb (Triton)'},...
    'Orientation','horizontal','FontName', 'Arial','FontSize',11);
hLegend.PlotChildren = hLegend.PlotChildren([2,1]);
legend('boxoff')

% set(get(sub1,'YLabel'), 'Units','centimeters');
% set(get(sub2,'YLabel'), 'Units','centimeters');
% set(get(sub3,'YLabel'), 'Units','centimeters');
% ylabel_position=get(get(sub3,'YLabel'),'Position');
% set(get(sub2,'YLabel'), 'Position',ylabel_position);
% set(get(sub1,'YLabel'), 'Position',ylabel_position);
