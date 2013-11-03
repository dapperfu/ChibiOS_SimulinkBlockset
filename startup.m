function startup()
% Startup set path for ChibiOS BlockSet
fprintf('%%%% Startup set path for ChibiOS BlockSet\n');
%Add path with subfolders
addpath(fileparts(mfilename('fullpath')));
%And save path
savepath;
%Add ST custom 
sl_refresh_customizations;

% [EOF] startup.m
