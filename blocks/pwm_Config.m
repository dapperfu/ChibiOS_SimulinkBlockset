function pwm_Config(block)
%MSFUNTMPL_BASIC A Template for a Level-2 MATLAB S-Function
%   The MATLAB S-function is written as a MATLAB function with the
%   same name as the S-function. Replace 'msfuntmpl_basic' with the
%   name of your S-function.
%
%   It should be noted that the MATLAB S-function is very similar
%   to Level-2 C-Mex S-functions. You should be able to get more
%   information for each of the block methods by referring to the
%   documentation for C-Mex S-functions.
%
%   Copyright 2003-2010 The MathWorks, Inc.

%%
%% The setup method is used to set up the basic attributes of the
%% S-function such as ports, parameters, etc. Do not add any other
%% calls to the main body of the function.
%%
setup(block);

%endfunction

function setup(block)
% Register number of ports
block.NumInputPorts  = 4;
block.NumOutputPorts = 0;
% Register number of dialog parameters
block.NumDialogPrms  = 8;
tmp = cell(1,block.NumDialogPrms);
for i=1:block.NumDialogPrms
    tmp{i}='Nontunable';
end
block.DialogPrmsTunable=tmp;
% Register sample times
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [block.DialogPrm(8).Data 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Error out when saving or restoring the model sim state
block.SimStateCompliance = 'DefaultSimState';
%% -----------------------------------------------------------------
%% The MATLAB S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file. See comments
%% provided for each function for more information.
%% -----------------------------------------------------------------
block.RegBlockMethod('WriteRTW', @WriteRTW);
block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);

block.RegBlockMethod('Outputs', @nullFCN);   % Required
block.RegBlockMethod('Start', @nullFCN);   % Required
block.RegBlockMethod('Update', @nullFCN); % Required
block.RegBlockMethod('Terminate', @nullFCN); % Required
block.RegBlockMethod('InitializeConditions', @nullFCN); % Required
block.RegBlockMethod('InitializeConditions', @nullFCN); % Required

%% Block runs on TLC in accelerator mode.
block.SetAccelRunOnTLC(true);

function nullFCN(~)

function DoPostPropSetup(block)
%% Register all tunable parameters as runtime parameters.
block.AutoRegRuntimePrms;

function WriteRTW(block)
% PWM Driver
block.WriteRTWParam('string','pwmDriver', sprintf('%.0f',block.DialogPrm(1).Data));
switch block.DialogPrm(1).Data
    case 1
        pwm(1).GPIO='A';
        pwm(1).pin='8';
        pwm(1).AF='1';
        pwm(2).GPIO='A';
        pwm(2).pin='9';
        pwm(2).AF='1';
        pwm(3).GPIO='A';
        pwm(3).pin='10';
        pwm(3).AF='1';
        pwm(4).GPIO='A';
        pwm(4).pin='11';
        pwm(4).AF='1';
    case 2
        pwm(1).GPIO='A';
        pwm(1).pin='8';
        pwm(1).AF='1';
        pwm(2).GPIO='A';
        pwm(2).pin='1';
        pwm(2).AF='1';
        pwm(3).GPIO='A';
        pwm(3).pin='2';
        pwm(3).AF='1';
        pwm(4).GPIO='A';
        pwm(4).pin='3';
        pwm(4).AF='1';
    case 3
        pwm(1).GPIO='C';
        pwm(1).pin='6';
        pwm(1).AF='3';
        pwm(2).GPIO='C';
        pwm(2).pin='7';
        pwm(2).AF='3';
        pwm(3).GPIO='C';
        pwm(3).pin='8';
        pwm(3).AF='3';
        pwm(4).GPIO='C';
        pwm(4).pin='9';
        pwm(4).AF='3';
    case 4
        pwm(1).GPIO='A';
        pwm(1).pin='12';
        pwm(1).AF='2';
        pwm(2).GPIO='D';
        pwm(2).pin='13';
        pwm(2).AF='2';
        pwm(3).GPIO='D';
        pwm(3).pin='14';
        pwm(3).AF='2';
        pwm(4).GPIO='D';
        pwm(4).pin='15';
        pwm(4).AF='2';
    case 5
        
    case 6
        
    case 7
        
    case 8
        
    case 9
end
% PWM Clock Frequency (Hz)
if ischar(block.DialogPrm(2).Data)
    pwmClockFreq=str2double(block.DialogPrm(2).Data);
else
	pwmClockFreq=block.DialogPrm(2).Data;
end
block.WriteRTWParam('string','pwmClockFreq', sprintf('%.0f',pwmClockFreq));

% PWM Period (s)
if ischar(block.DialogPrm(3).Data)
    pwmPeriod=str2double(block.DialogPrm(3).Data);
else
    pwmPeriod=block.DialogPrm(3).Data;
end
block.WriteRTWParam('string','pwmPeriod', sprintf('%.0f',pwmClockFreq*pwmPeriod));

% PWM Channel 
for i=1:4
    switch block.DialogPrm(i+3).Data
        case 'Disabled'
            block.WriteRTWParam('string', sprintf('pwmChan%.0f',i), 'PWM_OUTPUT_DISABLED');
            block.WriteRTWParam('string', sprintf('palSetPadMode%.0f',i), '');
        case 'Active High'
            block.WriteRTWParam('string', sprintf('pwmChan%.0f',i), 'PWM_OUTPUT_ACTIVE_HIGH');
            block.WriteRTWParam('string', sprintf('palSetPadMode%.0f',i), sprintf('palSetPadMode(GPIO%s, %s, PAL_MODE_ALTERNATE(%s));',pwm(i).GPIO,pwm(i).pin,pwm(i).AF));
        case 'Active Low'
            block.WriteRTWParam('string', sprintf('pwmChan%.0f',i), 'PWM_OUTPUT_ACTIVE_LOW');
            block.WriteRTWParam('string', sprintf('palSetPadMode%.0f',i), sprintf('palSetPadMode(GPIO%s, %s, PAL_MODE_ALTERNATE(%s));',pwm(i).GPIO,pwm(i).pin,pwm(i).AF));
    end
end