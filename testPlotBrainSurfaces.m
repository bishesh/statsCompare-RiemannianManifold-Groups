% Plot surface of brain.
% test script.

%% Clear all variables, then add required paths.
clear all; clc;
addpath(genpath('/home/bkhanal/Documents/softwares/matlabTools/'));
addpath(genpath('/home/bkhanal/Documents/softwares/spm8/'));

%% Extract surface of the brain volume and save the surface in .mat file.
spm_surf('results/t1_ss_64x64x32.nii');
% spm_surf('results/t1_ss1_128x128x64.nii');
brain = gifti(spm_select(1,'mesh','Select surface data'));
brain = export(brain,'patch');
save('results/brain.mat', 'brain')
% save('results/brain1.mat', 'brain')

%% load the saved file
load 'results/brain.mat';

% Define some colors:
brainFlesh = [1 160/255 150/255];
red = [1 0 0];
green = [0 1 0];
blue = [0 0 1];
templateColor = [0.8 0.7 0.7];
%% Plot a template and some other brains:
figure('units','normalized','outerposition',[0 0 1 1]) % same window size as matlab.
plotBrain(brain,templateColor,[0 0 0 0 0 0]');
plotBrain(brain,brainFlesh,[pi/4 pi/2 0 180 300 150]);
plotBrain(brain,brainFlesh,[0 pi/4 0 150 -150 200]);
plotBrain(brain,brainFlesh,[0 pi/4 pi/4 500 300 300]);
plotBrain(brain,brainFlesh,[pi/2 pi/4 0 100 0 0]);
plotBrain(brain,brainFlesh,[0 pi/4 pi/2 400 -100 10]);
axis on;
grid on;
%% Select two brains and plot them.
f1 = [pi/2 0 0 300 200 100]';
f2 = [(2*pi+5.5)/3 pi/2 0 -200 0 0]';
figure('units','normalized','outerposition',[0 0 1 1])
plotBrain(brain,brainFlesh,f1);
plotBrain(brain,brainFlesh,f2);
axis on;
axis([-300 300 -300 300 -300 300])
view([-800 -800 100]);
camzoom(1);
camlight('headlight');
material default;
set(gca, 'XColor','r','YColor','g','ZColor','b');
grid on;
% Image saved from this setting was cropped with:
% convert savedImageFileName.png -gravity Center -crop 1500x900+10+10 croppedImage.png
%% Plot different means of the two brains f1 and f2.:

% Linear mean of two brains represented as rotations and translations from
% a template brain.
% BISH: TODO:
% For better clarity create another function plotBrain that takes arguments
% R and t for rotation MATRIX and translation vector instead of f because
% that way it is easier to think of "linear mean" as (R1+R2)/2.
figure('units','normalized','outerposition',[0 0 1 1]) %same window size as matlab.
plotBrain(brain,brainFlesh,f1);
plotBrain(brain,brainFlesh,f2);

% Get mean translation:
t = (f1(4:6)+f2(4:6))/2;
% Get mean rotation (linear, i.e. from rotation matrices.)
R1 = getClosestRotMat(rotMat(f1(1:3)));
R2 = getClosestRotMat(rotMat(f2(1:3)));
R = (R1+R2)/2;
brainMean = brain;
brainMean.vertices = (R*brain.vertices')';
brainMean.vertices(:,1) = brainMean.vertices(:,1) + t(1);
brainMean.vertices(:,2) = brainMean.vertices(:,2) + t(2);
brainMean.vertices(:,3) = brainMean.vertices(:,3) + t(3);
plotBrain(brainMean,[1 1 0], [0 0 0 0 0 0]);
axis on;
axis([-300 300 -300 300 -300 300])
view([-800 -800 100]);
camzoom(1);
% light('Position',[-400 800 -800],'Style','infinite');
% light('Position',[100 500 -100],'Style','infinite');
camlight('headlight');
material default;
set(gca, 'XColor','r','YColor','g','ZColor','b');
grid on;
%% Group, Frechet Left, Frechet Right means.
figure('units','normalized','outerposition',[0 0 1 1]) %same window size as matlab.
plotBrain(brain,brainFlesh,f1);
plotBrain(brain,brainFlesh,f2);
% Plot group and/or Frechet left/right means.:
u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
fMeanG=grpExp(f1,0.5*u); % shooting from f1 with the group geodesic, s parameterize position along the geodesic
plotBrain(brain, red,fMeanG); % plot the point on the geodesic

uL=riemLogL(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
fMeanL=riemExpL(1,f1,0.5*uL); %idem with Riemannian left-invariant geodesic
plotBrain(brain, green,fMeanL); 

uR=riemLogR(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic
fMeanR=riemExpR(1,f1,0.5*uR); %idem with Riemannian right-invariant geodesic
plotBrain(brain, blue,fMeanR); 
axis on;
axis([-300 300 -300 300 -300 300])
view([-800 -800 100]);
camzoom(1);
light('Position',[-400 800 -800],'Style','infinite');
camlight('headlight');
material default;
set(gca, 'XColor','r','YColor','g','ZColor','b');
grid on;

%% Plot linking geodesics:
u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
uL=riemLogL(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
uR=riemLogR(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic

figure('units','normalized','outerposition',[0 0 1 1]); %same window size as matlab.
numOfPlots = 3;
stepSize = 1/(numOfPlots-1);
index=1;
for s=0:stepSize:1 % plot points along the geodesics fs
    
    fs=grpExp(f1,s*u); % shooting from f1 with the group geodesic, s parameterize position along the geodesic
    fs_a(:,index) = fs;
    color = red;
    if(index==1 || index == numOfPlots)
        color = brainFlesh;
    end
    %     plotBrain(brain, color,fs); % plot the point on the geodesic
    
    fsL=riemExpL(1,f1,s*uL); %idem with Riemannian left-invariant geodesic
    fsL_a(:,index) = fsL;
    color = green;
    if(index==1 || index == numOfPlots)
        color = brainFlesh;
    end
    plotBrain(brain, color, fsL);
    
    fsR=riemExpR(1,f1,s*uR); %idem with Riemannian right-invariant geodesic
    fsR_a(:,index) = fsR;
    color = blue;
    if(index==1 || index == numOfPlots)
        color = brainFlesh;
    end
    
    %     plotBrain(brain,color, fsR);
    axis on;
    axis([-300 300 -300 300 -300 300])
    view([-800 -800 100]);
    camzoom(1);
    light('Position',[-400 800 -800],'Style','infinite');
    
    material default;
    set(gca, 'XColor','r','YColor','g','ZColor','b');
    grid on;
    
    index = index+1;
end


