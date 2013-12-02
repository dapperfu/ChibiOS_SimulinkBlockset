function startup()
% Startup set path for ChibiOS BlockSet
fprintf('%%%% Startup set path for ChibiOS BlockSet\n');
%Add path with subfolders
cwd=fileparts(mfilename('fullpath'));
addpath(cwd);
addpath(fullfile(cwd,'hal'));
addpath(fullfile(cwd,'rtw'));
addpath(fullfile(cwd,'scripts'));
addpath(fullfile(cwd,'scripts','init'));
addpath(fullfile(cwd,'scripts','util'));
%And save path
savepath;
%Add ST custom 
sl_refresh_customizations;

% [EOF] startup.m
