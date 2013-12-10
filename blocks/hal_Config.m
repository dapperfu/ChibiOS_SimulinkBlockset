function hal_Config(block)
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
block.NumDialogPrms  = 32;
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
block.SampleTimes = [-1 0];

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
% HAL_USE_TM
if block.DialogPrm(1).Data
	block.WriteRTWParam('string','HAL_USE_TM', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_TM', 'FALSE');
end

% HAL_USE_PAL
if block.DialogPrm(2).Data
	block.WriteRTWParam('string','HAL_USE_PAL', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_PAL', 'FALSE');
end

% HAL_USE_ADC
if block.DialogPrm(3).Data
	block.WriteRTWParam('string','HAL_USE_ADC', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_ADC', 'FALSE');
end

% HAL_USE_CAN
if block.DialogPrm(4).Data
	block.WriteRTWParam('string','HAL_USE_CAN', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_CAN', 'FALSE');
end

% HAL_USE_EXT
if block.DialogPrm(5).Data
	block.WriteRTWParam('string','HAL_USE_EXT', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_EXT', 'FALSE');
end

% HAL_USE_GPT
if block.DialogPrm(6).Data
	block.WriteRTWParam('string','HAL_USE_GPT', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_GPT', 'FALSE');
end

% HAL_USE_I2C
if block.DialogPrm(7).Data
	block.WriteRTWParam('string','HAL_USE_I2C', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_I2C', 'FALSE');
end

% HAL_USE_ICU
if block.DialogPrm(8).Data
	block.WriteRTWParam('string','HAL_USE_ICU', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_ICU', 'FALSE');
end

% HAL_USE_MAC
if block.DialogPrm(9).Data
	block.WriteRTWParam('string','HAL_USE_MAC', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_MAC', 'FALSE');
end

% HAL_USE_MMC_SPI
if block.DialogPrm(10).Data
	block.WriteRTWParam('string','HAL_USE_MMC_SPI', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_MMC_SPI', 'FALSE');
end

% HAL_USE_PWM
if block.DialogPrm(11).Data
	block.WriteRTWParam('string','HAL_USE_PWM', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_PWM', 'FALSE');
end

% HAL_USE_RTC
if block.DialogPrm(12).Data
	block.WriteRTWParam('string','HAL_USE_RTC', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_RTC', 'FALSE');
end

% HAL_USE_SDC
if block.DialogPrm(13).Data
	block.WriteRTWParam('string','HAL_USE_SDC', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_SDC', 'FALSE');
end

% HAL_USE_SERIAL
if block.DialogPrm(14).Data
	block.WriteRTWParam('string','HAL_USE_SERIAL', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_SERIAL', 'FALSE');
end

% HAL_USE_SERIAL_USB
if block.DialogPrm(15).Data
	block.WriteRTWParam('string','HAL_USE_SERIAL_USB', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_SERIAL_USB', 'FALSE');
end

% HAL_USE_SPI
if block.DialogPrm(16).Data
	block.WriteRTWParam('string','HAL_USE_SPI', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_SPI', 'FALSE');
end

% HAL_USE_UART
if block.DialogPrm(17).Data
	block.WriteRTWParam('string','HAL_USE_UART', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_UART', 'FALSE');
end

% HAL_USE_USB
if block.DialogPrm(18).Data
	block.WriteRTWParam('string','HAL_USE_USB', 'TRUE');
else
	block.WriteRTWParam('string','HAL_USE_USB', 'FALSE');
end

% ADC_USE_WAIT
if block.DialogPrm(19).Data
	block.WriteRTWParam('string','ADC_USE_WAIT', 'TRUE');
else
	block.WriteRTWParam('string','ADC_USE_WAIT', 'FALSE');
end

% ADC_USE_MUTUAL_EXCLUSION
if block.DialogPrm(20).Data
	block.WriteRTWParam('string','ADC_USE_MUTUAL_EXCLUSION', 'TRUE');
else
	block.WriteRTWParam('string','ADC_USE_MUTUAL_EXCLUSION', 'FALSE');
end

% CAN_USE_SLEEP_MODE
if block.DialogPrm(21).Data
	block.WriteRTWParam('string','CAN_USE_SLEEP_MODE', 'TRUE');
else
	block.WriteRTWParam('string','CAN_USE_SLEEP_MODE', 'FALSE');
end

% I2C_USE_MUTUAL_EXCLUSION
if block.DialogPrm(22).Data
	block.WriteRTWParam('string','I2C_USE_MUTUAL_EXCLUSION', 'TRUE');
else
	block.WriteRTWParam('string','I2C_USE_MUTUAL_EXCLUSION', 'FALSE');
end

% MAC_USE_ZERO_COPY
if block.DialogPrm(23).Data
	block.WriteRTWParam('string','MAC_USE_ZERO_COPY', 'TRUE');
else
	block.WriteRTWParam('string','MAC_USE_ZERO_COPY', 'FALSE');
end

% MAC_USE_EVENTS
if block.DialogPrm(24).Data
	block.WriteRTWParam('string','MAC_USE_EVENTS', 'TRUE');
else
	block.WriteRTWParam('string','MAC_USE_EVENTS', 'FALSE');
end

% MMC_NICE_WAITING
if block.DialogPrm(25).Data
	block.WriteRTWParam('string','MMC_NICE_WAITING', 'TRUE');
else
	block.WriteRTWParam('string','MMC_NICE_WAITING', 'FALSE');
end

% SDC_INIT_RETRY
if ischar(block.DialogPrm(26).Data)
	block.WriteRTWParam('string','SDC_INIT_RETRY', block.DialogPrm(26).Data);
else
	block.WriteRTWParam('string','SDC_INIT_RETRY', num2str(block.DialogPrm(26).Data));
end

% SDC_MMC_SUPPORT
if block.DialogPrm(27).Data
	block.WriteRTWParam('string','SDC_MMC_SUPPORT', 'TRUE');
else
	block.WriteRTWParam('string','SDC_MMC_SUPPORT', 'FALSE');
end

% SDC_NICE_WAITING
if block.DialogPrm(28).Data
	block.WriteRTWParam('string','SDC_NICE_WAITING', 'TRUE');
else
	block.WriteRTWParam('string','SDC_NICE_WAITING', 'FALSE');
end

% SERIAL_DEFAULT_BITRATE
if ischar(block.DialogPrm(29).Data)
	block.WriteRTWParam('string','SERIAL_DEFAULT_BITRATE', block.DialogPrm(29).Data);
else
	block.WriteRTWParam('string','SERIAL_DEFAULT_BITRATE', num2str(block.DialogPrm(29).Data));
end

% SERIAL_BUFFERS_SIZE
if ischar(block.DialogPrm(30).Data)
	block.WriteRTWParam('string','SERIAL_BUFFERS_SIZE', block.DialogPrm(30).Data);
else
	block.WriteRTWParam('string','SERIAL_BUFFERS_SIZE', num2str(block.DialogPrm(30).Data));
end

% SPI_USE_WAIT
if block.DialogPrm(31).Data
	block.WriteRTWParam('string','SPI_USE_WAIT', 'TRUE');
else
	block.WriteRTWParam('string','SPI_USE_WAIT', 'FALSE');
end

% SPI_USE_MUTUAL_EXCLUSION
if block.DialogPrm(32).Data
	block.WriteRTWParam('string','SPI_USE_MUTUAL_EXCLUSION', 'TRUE');
else
	block.WriteRTWParam('string','SPI_USE_MUTUAL_EXCLUSION', 'FALSE');
end