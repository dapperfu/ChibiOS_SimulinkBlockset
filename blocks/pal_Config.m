function pal_Config(block)
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

%% Function: setup ===================================================
%% Abstract:
%%   Set up the basic characteristics of the S-function block such as:
%%   - Input ports
%%   - Output ports
%%   - Dialog parameters
%%   - Options
%%
%%   Required         : Yes
%%   C-Mex counterpart: mdlInitializeSizes
%%
function setup(block)
% Register number of ports
block.NumInputPorts  = 16;
block.NumOutputPorts = 16;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

for i=1:block.NumInputPorts
    block.InputPort(i).Dimensions  = 1;
    block.InputPort(i).DatatypeID  = 8; % boolean
    block.InputPort(i).Complexity  = 'Real';
    block.InputPort(i).SamplingMode  = 0;
end

for i=1:block.NumOutputPorts
    block.OutputPort(i).Dimensions  = 1;
    block.OutputPort(i).DatatypeID  = 8; % boolean
    block.OutputPort(i).Complexity  = 'Real';
    block.OutputPort(i).SamplingMode  = 0;
end
% % Override output port properties
% block.OutputPort(1).Dimensions  = 1;
% block.OutputPort(1).DatatypeID  = 5; % double
% block.OutputPort(1).Complexity  = 'Real';
% block.OutputPort(1).SamplingMode  = 0;
% 
% block.OutputPort(2).Dimensions  = 1;
% block.OutputPort(2).DatatypeID  = 7; % double
% block.OutputPort(2).Complexity  = 'Real';
% block.OutputPort(2).SamplingMode  = 0;

% Register parameters
block.NumDialogPrms     = 18;
tmp = cell(1,block.NumDialogPrms);
for i=1:block.NumDialogPrms
    tmp{i}='Nontunable';
end
block.DialogPrmsTunable=tmp;
% Register sample times
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
if length(block.DialogPrm(block.NumDialogPrms).Data)==1
    block.SampleTimes = [block.DialogPrm(block.NumDialogPrms).Data 0];
else
    block.SampleTimes = block.DialogPrm(block.NumDialogPrms).Data;
end
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

% Used functions.
block.RegBlockMethod('WriteRTW', @WriteRTW);
block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);

% Null functions.
block.RegBlockMethod('Outputs', @nullFCN);   % Required
block.RegBlockMethod('Start', @nullFCN);   % Required
block.RegBlockMethod('Update', @nullFCN); % Required
block.RegBlockMethod('Terminate', @nullFCN); % Required
block.RegBlockMethod('InitializeConditions', @nullFCN); % Required
block.RegBlockMethod('InitializeConditions', @nullFCN); % Required

%% Block runs on TLC in accelerator mode.
block.SetAccelRunOnTLC(true);

function nullFCN(~)
%end function

function DoPostPropSetup(block)
%% Register all tunable parameters as runtime parameters.
block.AutoRegRuntimePrms;
%end function

function WriteRTW(block)
% Port
block.WriteRTWParam('string','portName', sprintf('GPIO%s',block.DialogPrm(1).Data));
% Pin 0-15
for i=0:15
    pin=sprintf('pin%d',i);
    pinMode=sprintf('pinMode%d',i);
    switch block.DialogPrm(i+2).Data
        case 'Disabled'
            block.WriteRTWParam('string',pin,  'Disabled');
        case 'Input - No Pull'
            block.WriteRTWParam('string',pin,  'Input');
            block.WriteRTWParam('string',pinMode,  'PAL_MODE_INPUT');
        case 'Input - Pull Up'
            block.WriteRTWParam('string',pin,  'Input');
            block.WriteRTWParam('string',pinMode,  'PAL_MODE_INPUT_PULLUP');
        case 'Input - Pull Down'
            block.WriteRTWParam('string',pin,  'Input');
            block.WriteRTWParam('string',pinMode,  'PAL_MODE_INPUT_PULLDOWN');
        case 'Output - Open Drain'
            block.WriteRTWParam('string',pin,  'Output');
            block.WriteRTWParam('string',pinMode,  'PAL_MODE_OUTPUT_OPENDRAIN');
        case 'Output - Push Pull'
            block.WriteRTWParam('string',pin,  'Output');
            block.WriteRTWParam('string',pinMode,  'PAL_MODE_OUTPUT_PUSHPULL');
        case 'Toggle'
            block.WriteRTWParam('string',pin,  'Toggle');
            block.WriteRTWParam('string',pinMode,  'PAL_MODE_OUTPUT_PUSHPULL');
    end
end