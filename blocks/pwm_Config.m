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
block.NumInputPorts  = 0;
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
block.RegBlockMethod('Outputs', @nullFCN);     % Required
block.RegBlockMethod('Terminate', @nullFCN); % Required
block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);

%% Block runs on TLC in accelerator mode.
block.SetAccelRunOnTLC(true);

function nullFCN(~)

function DoPostPropSetup(block)
%% Register all tunable parameters as runtime parameters.
block.AutoRegRuntimePrms;

function WriteRTW(block)
% PWM Driver
if ischar(block.DialogPrm(1).Data)
	block.WriteRTWParam('string','pwmDriver', block.DialogPrm(1).Data);
else
	block.WriteRTWParam('string','pwmDriver', num2str(block.DialogPrm(1).Data));
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

% PWM Channel 1
switch block.DialogPrm(4).Data
	case 'Disabled'
		block.WriteRTWParam('string','pwmChan1', 'PWM_OUTPUT_DISABLED');
	case 'Active High'
		block.WriteRTWParam('string','pwmChan1', 'PWM_OUTPUT_ACTIVE_HIGH');
	case 'Active Low'
		block.WriteRTWParam('string','pwmChan1', 'PWM_OUTPUT_ACTIVE_LOW');
end

% PWM Channel 2
switch block.DialogPrm(5).Data
	case 'Disabled'
		block.WriteRTWParam('string','pwmChan2', 'PWM_OUTPUT_DISABLED');
	case 'Active High'
		block.WriteRTWParam('string','pwmChan2', 'PWM_OUTPUT_ACTIVE_HIGH');
	case 'Active Low'
		block.WriteRTWParam('string','pwmChan2', 'PWM_OUTPUT_ACTIVE_LOW');
end

% PWM Channel 3
switch block.DialogPrm(6).Data
	case 'Disabled'
		block.WriteRTWParam('string','pwmChan3', 'PWM_OUTPUT_DISABLED');
	case 'Active High'
		block.WriteRTWParam('string','pwmChan3', 'PWM_OUTPUT_ACTIVE_HIGH');
	case 'Active Low'
		block.WriteRTWParam('string','pwmChan3', 'PWM_OUTPUT_ACTIVE_LOW');
end

% PWM Channel 4
switch block.DialogPrm(7).Data
	case 'Disabled'
		block.WriteRTWParam('string','pwmChan4', 'PWM_OUTPUT_DISABLED');
	case 'Active High'
		block.WriteRTWParam('string','pwmChan4', 'PWM_OUTPUT_ACTIVE_HIGH');
	case 'Active Low'
		block.WriteRTWParam('string','pwmChan4', 'PWM_OUTPUT_ACTIVE_LOW');
end