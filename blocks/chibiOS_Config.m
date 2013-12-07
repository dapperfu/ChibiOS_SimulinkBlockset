function chibiOS_Config(block)
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
block.NumDialogPrms  = 31;
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
% System Tick Frequency
if (block.DialogPrm(1).Data<0)
    warning('CHIBIOS:CH_FREQ_INT','System tick frequency must be a positive integer. Setting to 1.');
    CH_FREQUENCY=1;
elseif (mod(block.DialogPrm(1).Data,1)~=0)
    warning('CHIBIOS:CH_FREQ_POSINT','System tick frequency must be a whole integer.');
    CH_FREQUENCY=round(block.DialogPrm(1).Data);
else
    CH_FREQUENCY=block.DialogPrm(1).Data;
end
block.WriteRTWParam('string','CH_FREQUENCY', sprintf('%.0f',CH_FREQUENCY));
% Round robin interval
if (block.DialogPrm(1).Data<0)
    warning('CHIBIOS:CH_FREQ_INT','System tick frequency must be a positive integer. Setting to 1.');
    CH_FREQUENCY=1;
elseif (mod(block.DialogPrm(1).Data,1)~=0)
    warning('CHIBIOS:CH_FREQ_POSINT','System tick frequency must be a whole integer.');
    CH_FREQUENCY=round(block.DialogPrm(1).Data);
else
    CH_FREQUENCY=block.DialogPrm(1).Data;
end
block.WriteRTWParam('string','CH_FREQUENCY', sprintf('%.0f',CH_FREQUENCY));
if ischar(block.DialogPrm(2).Data)
    block.WriteRTWParam('string','CH_TIME_QUANTUM', block.DialogPrm(2).Data);
else
    block.WriteRTWParam('string','CH_TIME_QUANTUM', sprintf('%d',block.DialogPrm(2).Data));
end
% Managed RAM size
if (block.DialogPrm(3).Data<0)
    warning('CHIBIOS:CH_MEMCORE_SIZE_INT','Managed RAM size must be a greater than or equal to 0. Setting to 0.');
    CH_MEMCORE_SIZE=0;
elseif (mod(block.DialogPrm(3).Data,1)~=0)
    warning('CHIBIOS:CH_MEMCORE_SIZE_POSINT','Managed RAM size must be a whole integer.');
    CH_MEMCORE_SIZE=round(block.DialogPrm(3).Data);
else
    CH_MEMCORE_SIZE=block.DialogPrm(3).Data;
end
block.WriteRTWParam('string','CH_MEMCORE_SIZE', sprintf('%.0f',CH_MEMCORE_SIZE));
% Idle thread automatic spawn suppression
if (block.DialogPrm(4).Data)
    block.WriteRTWParam('string','CH_NO_IDLE_THREAD', 'TRUE');
else
    block.WriteRTWParam('string','CH_NO_IDLE_THREAD', 'FALSE');
end
% OS optimization
if (block.DialogPrm(5).Data)
    block.WriteRTWParam('string','CH_OPTIMIZE_SPEED', 'TRUE');
else
    block.WriteRTWParam('string','CH_OPTIMIZE_SPEED', 'FALSE');
end
% Threads registry APIs
if (block.DialogPrm(6).Data)
    block.WriteRTWParam('string','CH_USE_REGISTRY', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_REGISTRY', 'FALSE');
end
% Threads synchronization APIs
if (block.DialogPrm(7).Data)
    block.WriteRTWParam('string','CH_USE_WAITEXIT', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_WAITEXIT', 'FALSE');
end
% Semaphores APIs
if (block.DialogPrm(8).Data)
    block.WriteRTWParam('string','CH_USE_SEMAPHORES', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_SEMAPHORES', 'FALSE');
end
% Semaphores queuing mode
if (block.DialogPrm(9).Data)
    block.WriteRTWParam('string','CH_USE_SEMAPHORES_PRIORITY', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_SEMAPHORES_PRIORITY', 'FALSE');
end
% Atomic semaphore API
if (block.DialogPrm(10).Data)
    block.WriteRTWParam('string','CH_USE_SEMSW', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_SEMSW', 'FALSE');
end
% Mutexes APIs
if (block.DialogPrm(11).Data)
    block.WriteRTWParam('string','CH_USE_MUTEXES', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MUTEXES', 'FALSE');
end
% Conditional Variables APIs
if (block.DialogPrm(12).Data)
    block.WriteRTWParam('string','CH_USE_CONDVARS', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_CONDVARS', 'FALSE');
end
% Conditional Variables APIs with timeout
if (block.DialogPrm(13).Data)
    block.WriteRTWParam('string','CH_USE_CONDVARS_TIMEOUT', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_CONDVARS_TIMEOUT', 'FALSE');
end
% Events Flags APIs
if (block.DialogPrm(14).Data)
    block.WriteRTWParam('string','CH_USE_EVENTS', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_EVENTS', 'FALSE');
end
% Events Flags APIs with timeout
if (block.DialogPrm(15).Data)
    block.WriteRTWParam('string','CH_USE_EVENTS_TIMEOUT', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_EVENTS_TIMEOUT', 'FALSE');
end
% Synchronous Messages APIs
if (block.DialogPrm(16).Data)
    block.WriteRTWParam('string','CH_USE_MESSAGES', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MESSAGES', 'FALSE');
end
% Synchronous Messages queuing mode
if (block.DialogPrm(17).Data)
    block.WriteRTWParam('string','CH_USE_MESSAGES_PRIORITY', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MESSAGES_PRIORITY', 'FALSE');
end
% Mailboxes APIs
if (block.DialogPrm(18).Data)
    block.WriteRTWParam('string','CH_USE_MAILBOXES', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MAILBOXES', 'FALSE');
end
% I/O Queues APIs
if (block.DialogPrm(19).Data)
    block.WriteRTWParam('string','CH_USE_QUEUES', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_QUEUES', 'FALSE');
end
% Core Memory Manager APIs
if (block.DialogPrm(20).Data)
    block.WriteRTWParam('string','CH_USE_MEMCORE', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MEMCORE', 'FALSE');
end
% Heap Allocator APIs
if (block.DialogPrm(21).Data)
    block.WriteRTWParam('string','CH_USE_HEAP', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_HEAP', 'FALSE');
end
% C-runtime allocator
if (block.DialogPrm(22).Data)
    block.WriteRTWParam('string','CH_USE_MALLOC_HEAP', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MALLOC_HEAP', 'FALSE');
end
% Memory Pools Allocator APIs
if (block.DialogPrm(23).Data)
    block.WriteRTWParam('string','CH_USE_MEMPOOLS', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_MEMPOOLS', 'FALSE');
end
% Dynamic Threads APIs
if (block.DialogPrm(24).Data)
    block.WriteRTWParam('string','CH_USE_DYNAMIC', 'TRUE');
else
    block.WriteRTWParam('string','CH_USE_DYNAMIC', 'FALSE');
end
% Debug option, system state check
if (block.DialogPrm(25).Data)
    block.WriteRTWParam('string','CH_DBG_SYSTEM_STATE_CHECK', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_SYSTEM_STATE_CHECK', 'FALSE');
end
% Debug option, parameters checks
if (block.DialogPrm(26).Data)
    block.WriteRTWParam('string','CH_DBG_ENABLE_CHECKS', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_ENABLE_CHECKS', 'FALSE');
end
% Debug option, consistency checks
if (block.DialogPrm(27).Data)
    block.WriteRTWParam('string','CH_DBG_ENABLE_ASSERTS', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_ENABLE_ASSERTS', 'FALSE');
end
% Debug option, trace buffer
if (block.DialogPrm(28).Data)
    block.WriteRTWParam('string','CH_DBG_ENABLE_TRACE', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_ENABLE_TRACE', 'FALSE');
end
% Debug option, stack checks
if (block.DialogPrm(29).Data)
    block.WriteRTWParam('string','CH_DBG_ENABLE_STACK_CHECK', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_ENABLE_STACK_CHECK', 'FALSE');
end
% Debug option, stacks initialization
if (block.DialogPrm(30).Data)
    block.WriteRTWParam('string','CH_DBG_FILL_THREADS', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_FILL_THREADS', 'FALSE');
end
% Debug option, threads profiling
if (block.DialogPrm(31).Data)
    block.WriteRTWParam('string','CH_DBG_THREADS_PROFILING', 'TRUE');
else
    block.WriteRTWParam('string','CH_DBG_THREADS_PROFILING', 'FALSE');
end