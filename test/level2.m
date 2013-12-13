function msfuntmpl(block)
%MSFUNTMPL A Template for a MATLAB S-Function
%   The MATLAB S-function is written as a MATLAB function with the
%   same name as the S-function. Replace 'msfuntmpl' with the name
%   of your S-function.
%
%   It should be noted that the MATLAB S-function is very similar
%   to Level-2 C-Mex S-functions. You should be able to get more
%   information for each of the block methods by referring to the
%   documentation for C-Mex S-functions.
%
%   Copyright 2003-2010 The MathWorks, Inc.
%   $Revision: 1.1.6.22 $

%
% The setup method is used to setup the basic attributes of the
% S-function such as ports, parameters, etc. Do not add any other
% calls to the main body of the function.
%
setup(block);

%endfunction

% Function: setup ===================================================
% Abstract:
%   Set up the S-function block's basic characteristics such as:
%   - Input ports
%   - Output ports
%   - Dialog parameters
%   - Options
%
%   Required         : Yes
%   C-Mex counterpart: mdlInitializeSizes
%
function setup(block)

% Register the number of ports.
block.NumInputPorts  = 0;
block.NumOutputPorts = 0;

% Set up the port properties to be inherited or dynamic.
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

%   % Override the input port properties.
%   block.InputPort(1).DatatypeID  = 0;  % double
%   block.InputPort(1).Complexity  = 'Real';
%
%   % Override the output port properties.
%   block.OutputPort(1).DatatypeID  = 0; % double
%   block.OutputPort(1).Complexity  = 'Real';

% Register the parameters.
block.NumDialogPrms     = 12;
tmp=cell(1,block.NumDialogPrms);
for i=1:block.NumDialogPrms
    tmp{i}='Nontunable';
end
block.DialogPrmsTunable = tmp;% {'Tunable','Nontunable','SimOnlyTunable'};

% Set up the continuous states.
block.NumContStates = 1;

% Register the sample times.
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [-1 0];

% -----------------------------------------------------------------
% Options
% -----------------------------------------------------------------
% Specify if Accelerator should use TLC or call back to the
% MATLAB file
block.SetAccelRunOnTLC(false);

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same SimState as a built-in block
%    'HasNoSimState',   < No SimState
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Errors out when saving or restoring the SimState
block.SimStateCompliance = 'DefaultSimState';

% -----------------------------------------------------------------
% The MATLAB S-function uses an internal registry for all
% block methods. You should register all relevant methods
% (optional and required) as illustrated below. You may choose
% any suitable name for the methods and implement these methods
% as local functions within the same file.
% -----------------------------------------------------------------

% -----------------------------------------------------------------
% Register the methods called during update diagram/compilation.
% -----------------------------------------------------------------

%
% CheckParameters:
%   Functionality    : Called in order to allow validation of the
%                      block dialog parameters. You are
%                      responsible for calling this method
%                      explicitly at the start of the setup method.
%   C-Mex counterpart: mdlCheckParameters
%
block.RegBlockMethod('CheckParameters', @CheckPrms);

%
% SetInputPortSamplingMode:
%   Functionality    : Check and set input and output port
%                      attributes and specify whether the port is operating
%                      in sample-based or frame-based mode
%   C-Mex counterpart: mdlSetInputPortFrameData.
%   (The DSP System Toolbox is required to set a port as frame-based)
%
block.RegBlockMethod('SetInputPortSamplingMode', @SetInpPortFrameData);

%
% SetInputPortDimensions:
%   Functionality    : Check and set the input and optionally the output
%                      port dimensions.
%   C-Mex counterpart: mdlSetInputPortDimensionInfo
%
block.RegBlockMethod('SetInputPortDimensions', @SetInpPortDims);

%
% SetOutputPortDimensions:
%   Functionality    : Check and set the output and optionally the input
%                      port dimensions.
%   C-Mex counterpart: mdlSetOutputPortDimensionInfo
%
block.RegBlockMethod('SetOutputPortDimensions', @SetOutPortDims);

%
% SetInputPortDatatype:
%   Functionality    : Check and set the input and optionally the output
%                      port datatypes.
%   C-Mex counterpart: mdlSetInputPortDataType
%
block.RegBlockMethod('SetInputPortDataType', @SetInpPortDataType);

%
% SetOutputPortDatatype:
%   Functionality    : Check and set the output and optionally the input
%                      port datatypes.
%   C-Mex counterpart: mdlSetOutputPortDataType
%
block.RegBlockMethod('SetOutputPortDataType', @SetOutPortDataType);

%
% SetInputPortComplexSignal:
%   Functionality    : Check and set the input and optionally the output
%                      port complexity attributes.
%   C-Mex counterpart: mdlSetInputPortComplexSignal
%
block.RegBlockMethod('SetInputPortComplexSignal', @SetInpPortComplexSig);

%
% SetOutputPortComplexSignal:
%   Functionality    : Check and set the output and optionally the input
%                      port complexity attributes.
%   C-Mex counterpart: mdlSetOutputPortComplexSignal
%
block.RegBlockMethod('SetOutputPortComplexSignal', @SetOutPortComplexSig);

%
% PostPropagationSetup:
%   Functionality    : Set up the work areas and the state variables. You can
%                      also register run-time methods here.
%   C-Mex counterpart: mdlSetWorkWidths
%
block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);

% -----------------------------------------------------------------
% Register methods called at run-time
% -----------------------------------------------------------------

%
% ProcessParameters:
%   Functionality    : Call to allow an update of run-time parameters.
%   C-Mex counterpart: mdlProcessParameters
%
block.RegBlockMethod('ProcessParameters', @ProcessPrms);

%
% InitializeConditions:
%   Functionality    : Call to initialize the state and the work
%                      area values.
%   C-Mex counterpart: mdlInitializeConditions
%
block.RegBlockMethod('InitializeConditions', @InitializeConditions);

%
% Start:
%   Functionality    : Call to initialize the state and the work
%                      area values.
%   C-Mex counterpart: mdlStart
%
block.RegBlockMethod('Start', @Start);

%
% Outputs:
%   Functionality    : Call to generate the block outputs during a
%                      simulation step.
%   C-Mex counterpart: mdlOutputs
%
block.RegBlockMethod('Outputs', @Outputs);

%
% Update:
%   Functionality    : Call to update the discrete states
%                      during a simulation step.
%   C-Mex counterpart: mdlUpdate
%
block.RegBlockMethod('Update', @Update);

%
% Derivatives:
%   Functionality    : Call to update the derivatives of the
%                      continuous states during a simulation step.
%   C-Mex counterpart: mdlDerivatives
%
block.RegBlockMethod('Derivatives', @Derivatives);

%
% Projection:
%   Functionality    : Call to update the projections during a
%                      simulation step.
%   C-Mex counterpart: mdlProjections
%
block.RegBlockMethod('Projection', @Projection);

%
% SimStatusChange:
%   Functionality    : Call when simulation enters pause mode
%                      or leaves pause mode.
%   C-Mex counterpart: mdlSimStatusChange
%
block.RegBlockMethod('SimStatusChange', @SimStatusChange);

%
% Terminate:
%   Functionality    : Call at the end of a simulation for cleanup.
%   C-Mex counterpart: mdlTerminate
%
block.RegBlockMethod('Terminate', @Terminate);

%
% GetSimState:
%   Functionality    : Return the SimState of the block.
%   C-Mex counterpart: mdlGetSimState
%
block.RegBlockMethod('GetSimState', @GetSimState);

%
% SetSimState:
%   Functionality    : Set the SimState of the block using a given value.
%   C-Mex counterpart: mdlSetSimState
%
block.RegBlockMethod('SetSimState', @SetSimState);

% -----------------------------------------------------------------
% Register the methods called during code generation.
% -----------------------------------------------------------------

%
% WriteRTW:
%   Functionality    : Write specific information to model.rtw file.
%   C-Mex counterpart: mdlRTW
%
block.RegBlockMethod('WriteRTW', @WriteRTW);
%endfunction

% -------------------------------------------------------------------
% The local functions below are provided to illustrate how you may implement
% the various block methods listed above.
% -------------------------------------------------------------------

function CheckPrms(block)

%endfunction

function ProcessPrms(block)
block.AutoUpdateRuntimePrms;

%endfunction

function SetInpPortFrameData(block, idx, fd)

block.InputPort(idx).SamplingMode = fd;
block.OutputPort(1).SamplingMode  = fd;

%endfunction

function SetInpPortDims(block, idx, di)

block.InputPort(idx).Dimensions = di;
block.OutputPort(1).Dimensions  = di;

%endfunction

function SetOutPortDims(block, idx, di)

block.OutputPort(idx).Dimensions = di;
block.InputPort(1).Dimensions    = di;

%endfunction

function SetInpPortDataType(block, idx, dt)

block.InputPort(idx).DataTypeID = dt;
block.OutputPort(1).DataTypeID  = dt;

%endfunction

function SetOutPortDataType(block, idx, dt)

block.OutputPort(idx).DataTypeID  = dt;
block.InputPort(1).DataTypeID     = dt;

%endfunction

function SetInpPortComplexSig(block, idx, c)

block.InputPort(idx).Complexity = c;
block.OutputPort(1).Complexity  = c;

%endfunction

function SetOutPortComplexSig(block, idx, c)

block.OutputPort(idx).Complexity = c;
block.InputPort(1).Complexity    = c;

%endfunction

function DoPostPropSetup(block)

% Register all tunable parameters as runtime parameters.
block.AutoRegRuntimePrms;

%endfunction

function InitializeConditions(block)

block.ContStates.Data = 1;

%endfunction

function Start(block)

%endfunction

function WriteRTW(block)

block.WriteRTWParam('matrix', 'M',    [1 2; 3 4]);
block.WriteRTWParam('string', 'Mode', 'Auto');

%endfunction

function Outputs(block)

%endfunction

function Update(block)

%endfunction

function Derivatives(block)

%endfunction

function Projection(block)

%endfunction

function SimStatusChange(block, s)


%endfunction

function Terminate(block)
for i=1:block.NumDialogPrms
    switch class(block.DialogPrm(i).data)
        case 'char'
            fprintf('%3d: %s (%s)\n',i,block.DialogPrm(i).data,class(block.DialogPrm(i).data));
        case 'double'
            fprintf('%3d: %f (%s)\n',i,block.DialogPrm(i).data,class(block.DialogPrm(i).data));
    end
end
%endfunction

function outSimState = GetSimState(block)

outSimState = block.Dwork(1).Data;

%endfunction

function SetSimState(block, inSimState)

block.Dwork(1).Data = inSimState;

%endfunction
