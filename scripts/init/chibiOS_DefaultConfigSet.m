function chibiOS_DefaultConfigSet(hDlg, hSrc)

% CHIBIOS_DEFAULTCONFIGSET sets the target's
% default configuration after applying the stm32F4xx.tlc
%
% $ chibiOS_DefaultConfigSet.m 2013-11-3 freyjed $

%% Set default RTW parameters for ChibiOS target:
tabs={'SolverTab','HardwareImplementationTab','CodeGenerationTab','ReportTab','TemplatesTab'};
n=numel(tabs);
for i=1:n
    waitbar(i/n);
    feval(tabs{i},hDlg,hSrc)
end

%% Solver Tab **********************************************************
function SolverTab(hDlg,hSrc) %#ok<*DEFNU>
slConfigUISetVal(hDlg, hSrc,     'SolverName','FixedStepDiscrete')
slConfigUISetEnabled(hDlg, hSrc, 'SolverName', false);

slConfigUISetVal(hDlg, hSrc,     'SolverName','FixedStepDiscrete')
slConfigUISetEnabled(hDlg, hSrc, 'SolverName', false);

slConfigUISetVal(hDlg, hSrc,     'FixedStep','0.01')
slConfigUISetEnabled(hDlg, hSrc, 'FixedStep', true);

%% HardwareImplementation tab **********************************************************
function HardwareImplementationTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'ProdHWDeviceType','STMicroelectronics->STM32F4xx 32-bit Cortex-M4')
slConfigUISetEnabled(hDlg, hSrc, 'ProdHWDeviceType', true);


%% General tab *************************************************************
function CodeGenerationTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'GenerateMakefile','on')
slConfigUISetEnabled(hDlg, hSrc, 'GenerateMakefile', false);

slConfigUISetVal(hDlg, hSrc,     'MakeCommand','make_rtw')
slConfigUISetEnabled(hDlg, hSrc, 'MakeCommand', false);

slConfigUISetVal(hDlg, hSrc,     'TemplateMakefile','ChibiOS.tmf')
slConfigUISetEnabled(hDlg, hSrc, 'TemplateMakefile', true);

%% Report tab **************************************************************
function ReportTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'GenerateReport','on')
slConfigUISetEnabled(hDlg, hSrc, 'GenerateReport', true);

slConfigUISetVal(hDlg, hSrc,     'LaunchReport','on')
slConfigUISetEnabled(hDlg, hSrc, 'LaunchReport', true);

%% Interface tab ***********************************************************
function InterfaceTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'SupportContinuousTime','on')
slConfigUISetEnabled(hDlg, hSrc, 'SupportContinuousTime', true);

% Templates tab ***********************************************************
function TemplatesTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'ERTCustomFileTemplate','chibiOS_customRoutineProcess.tlc')
slConfigUISetEnabled(hDlg, hSrc, 'ERTCustomFileTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTSrcFileBannerTemplate','chibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTSrcFileBannerTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTHdrFileBannerTemplate','chibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTHdrFileBannerTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTDataSrcFileTemplate','chibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTDataSrcFileTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTDataHdrFileTemplate','chibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTDataHdrFileTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'GenerateSampleERTMain','off')
slConfigUISetEnabled(hDlg, hSrc, 'GenerateSampleERTMain', false);

slConfigUISetVal(hDlg, hSrc,     'IncludeMdlTerminateFcn','off')
slConfigUISetEnabled(hDlg, hSrc, 'IncludeMdlTerminateFcn', true);


% [EOF] stm32F4xxDefaultConfigSet.m

