% Plot surface of brain.
% test script.

%% Clear all variables, then add required paths.
% Change the paths in the following lines according to where you have put
% the relevant toolboxes.
clear all; clc;
addpath(genpath('/home/bkhanal/Documents/softwares/matlabTools/'));
addpath(genpath('/home/bkhanal/Documents/softwares/spm8/'));

%% Extract surface of the brain volume and save the surface in .mat file.
% Use this section only if you have spm installed. Otherwise you can use
% the already extracted surface available as brain.mat by skipping this
% section.
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
refColor = [0.8 0.7 0.7];
%% Plot a template and some other brains:
figure('units','normalized','outerposition',[0 0 1 1]) % same window size as matlab.
plotBrain(brain,refColor,[0 0 0 0 0 0]');
plotBrain(brain,brainFlesh,[pi/4 pi/2 0 180 300 150]);
plotBrain(brain,brainFlesh,[0 pi/4 0 150 -150 200]);
plotBrain(brain,brainFlesh,[0 pi/4 pi/4 500 300 300]);
plotBrain(brain,brainFlesh,[pi/2 pi/4 0 100 0 0]);
plotBrain(brain,brainFlesh,[0 pi/4 pi/2 400 -100 10]);
axis on;
grid on;
axis([-100 700 -300 500 0 600])
view([-700 -500 100]);
camzoom(1);
camlight('headlight');
material default;
set(gca, 'XColor','r','YColor','g','ZColor','b');
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
% convert inputImage.png -gravity Center -crop 1110x890+14+30 croppedImage.png

%% Plot linear mean of the two brains f1 and f2.:

% Linear mean of two brains represented as rotations and translations from
% a template brain.
% IMPORTANT: for the linear mean we take R1 and R2 as the rotation matrices
% of f1 and f2. i.e. f1=(R1,t1) and f2=(R2,t2). However in the code here we
% are representing f1 and f2 as (r1,t1) and (r2,t2) respectively where
% small r represents the rotation vector. Thus for the linear mean we must
% first get the rotation matrices.

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
camlight('headlight');
material default;
set(gca, 'XColor','r','YColor','g','ZColor','b');
grid on;
% Image saved from this setting was cropped with:
% convert inputImage.png -gravity Center -crop 1110x890+14+30 croppedImage.png

%% Group, Frechet Left, Frechet Right means.
figure('units','normalized','outerposition',[0 0 1 1]) %same window size as matlab.
plotBrain(brain,brainFlesh,f1);
plotBrain(brain,brainFlesh,f2);
% Plot group and/or Frechet left/right means.:
u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
fMeanG=grpExp(f1,0.5*u); % shooting from f1 with the group geodesic, 0.5 => halfway position along the geodesic
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
% Image saved from this setting was cropped with:
% convert inputImage.png -gravity Center -crop 1110x890+14+30 croppedImage.png

%% Plot linking geodesics:
u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
uL=riemLogL(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
uR=riemLogR(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic

figure('units','normalized','outerposition',[0 0 1 1]); %same window size as matlab.
numOfPlots = 5;
stepSize = 1/(numOfPlots-1);
index=1;
for s=0:stepSize:1 % plot points along the geodesics fs
    
    fs=grpExp(f1,s*u); % shooting from f1 with the group geodesic, s parameterize position along the geodesic.
    fs_a(:,index) = fs;
    color = red;
    if(index==1 || index == numOfPlots)
        color = brainFlesh;
    end
    plotBrain(brain, color,fs); % plot the point on the geodesic
    
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
    
    plotBrain(brain,color, fsR);
    axis on;
    axis([-300 300 -300 300 -300 300])
    view([-800 -800 100]);
    camzoom(1);
    camlight('headlight');
    %     material default;
    if(index==1 || index == numOfPlots)
        material([0.1 0.2 0.1 3]);
    else
        material([0.2 0.4 0.5 1]);
    end
    
    set(gca, 'XColor','r','YColor','g','ZColor','b');
    grid on;
    
    index = index+1;
end

%% Group action on data and test of means
% Get the new reference.
ref = [0 0 0 0 0 0];
g = [pi/2 pi/4 pi/2 100 100 200];
refNew = grpInv(g);
refNewColor = [0.8, 0.4, 0.1];

% Apply g to the data.
f1DotG = grpCompose(f1,g);
f2DotG = grpCompose(f2,g);

% Comput mean of the data before applying g, and then apply g to the mean.
uL=riemLogL(1,f1,f2); % compute the initial tangent vector for the L-Riem geodesic
fMeanL=riemExpL(1,f1,0.5*uL);

uR=riemLogR(1,f1,f2); % compute the initial tangent vector for the R-Riem geodesic
fMeanR=riemExpR(1,f1,0.5*uR); 

u=grpLog(f1,f2); % compute the initial tangent vector for the group geodesic
fMeanG=grpExp(f1,0.5*u); % shooting from f1 with the group geodesic, 0.5 => halfway position along the geodesic
% fMeanGNew1 = grpCompose(g,fMeanG);

% Transform the data and then compute their mean.
uLNew = riemLogL(1,f1DotG,f2DotG);
fMeanLNew = riemExpL(1,f1DotG,0.5*uLNew);

uRNew=riemLogR(1,f1DotG,f2DotG); % compute the initial tangent vector for the R-Riem geodesic
fMeanRNew=riemExpR(1,f1DotG,0.5*uRNew); %idem with Riemannian right-invariant geodesic

uNew = grpLog(f1DotG,f2DotG);
fMeanGNew = grpExp(f1DotG,0.5*uNew);

% Plot the results.
figure('units','normalized','outerposition',[0 0 1 1])
plotBrain(brain, refColor,ref);
% plotBrain(brain, refNewColor,refNew);
plotBrain(brain, refColor,refNew);
plotBrain(brain, brainFlesh, f1);
plotBrain(brain, brainFlesh, f2);
plotBrain(brain, green ,fMeanL);
plotBrain(brain, green + [0.3 -0.3 0.3],grpCompose(fMeanLNew,refNew));
% plotBrain(brain, blue,fMeanR);
% plotBrain(brain, blue + [0.3 0.3 -0.3],grpCompose(fMeanRNew,refNew));
% plotBrain(brain, red,fMeanG);
% plotBrain(brain, red + [-0.3 0.3 0.3],grpCompose(fMeanGNew,refNew)); % plot the point on the geodesic
axis on;
% axis off;
axis([-300 300 -300 300 -300 300])
view([-800 -800 100]);
camzoom(1);
camlight('headlight');
material default;
set(gca, 'XColor','r','YColor','g','ZColor','b');
grid on;
% grid off;
% Image saved from this setting was cropped with:
% convert inputImage.png -gravity Center -crop 1110x890+14+30 croppedImage.png




