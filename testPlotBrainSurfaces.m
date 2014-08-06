% Plot surface of brain.
% test script.

%% Clear all variables, then add required paths.
clear all; clc;
addpath(genpath('/home/bkhanal/Documents/softwares/matlabTools/'));
addpath(genpath('/home/bkhanal/Documents/softwares/spm8/'));

%% Extract surface of the brain volume and save the surface in .mat file.
spm_surf('results/t1_ss_64x64x32.nii');
brain = gifti(spm_select(1,'mesh','Select surface data'));
brain = export(brain,'patch');
save('results/brain.mat', 'brain')

%% load the saved file 
load 'results/brain.mat';

%% Plot the loaded brains
plotBrain(brain,[0.8 0.2 0.4],[0 0 0 0 0 0]');
hold on;
plotBrain(brain,[0.2 0.2 0.9],[0 0 0 100 100 100]);
hold on;
plotBrain(brain,[0.2 0.2 0.9],[pi/2 pi/2 0 200 200 200]);

%% 
% Linear mean of two brains represented as rotations and translations from
% a template brain.
f1 = [pi/3 0 0 100 0 0]';
% BISH: TODO:
% For better clarity create another function plotBrain that takes arguments
% R and t for rotation MATRIX and translation vector instead of f because
% that way it is easier to think of "linear mean" as (R1+R2)/2.
plotBrain(brain,[1 0 0],f1);
f2 = [(2*pi+4)/3 0 0 -100 -50 0]';
plotBrain(brain,[0 1 0],f2);

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
plotBrain(brainMean,[0 0 1], [0 0 0 0 0 0]);
axis on;    
set(gca, 'XColor','r','YColor','g','ZColor','b');
grid on;

%% 
% Plot Geodesics:
f1 = [0 0 0 0 0 0];
f2 = [pi/2 0 0 500 500 500];

u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
uL=riemLogL(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
uR=riemLogR(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic
stepSize = 0.2;

% index=1;
for s=0:stepSize:1 % plot points along the geodesics fs
    fs=grpExp(f1,s*u); % shooting from f1 with the group geodesic, s parameterize position along the geodesic
%     tst(:,index) = fs;
%     index = index+1;
    plotBrain(brain, [1 0 0],fs); % plot the point on the geodesic

    fsL=riemExpL(1,f1,s*uL); %idem with Riemannian left-invariant geodesic
    plotBrain(brain, [0 1 0], fsL);
    
    fsR=riemExpR(1,f1,s*uR); %idem with Riemannian right-invariant geodesic
    plotBrain(brain,[0 0 1], fsR);
    axis on;
    grid on;
end

