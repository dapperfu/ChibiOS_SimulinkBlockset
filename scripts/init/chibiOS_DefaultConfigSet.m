function ChibiOS_DefaultConfigSet(hDlg, hSrc)

% ChibiOS_DEFAULTCONFIGSET sets the target's
% default configuration after applying the chibios.tlc

% $ ChibiOS_DefaultConfigSet.m 2013-11- jafrey $

%% Set default RTW parameters for ChibiOS target:
tabs={'CodeStyleTab','SolverTab','HardwareImplementationTab','CodeGenerationTab','ReportTab','TemplatesTab','ChibiOSTab'};
n=numel(tabs);
for i=1:n
    waitbar(i/(2*n));
    feval(tabs{i},hDlg,hSrc)
end

%% Solver Tab **********************************************************
function SolverTab(hDlg,hSrc) %#ok<*DEFNU>
slConfigUISetVal(hDlg, hSrc,     'SolverName','FixedStepDiscrete')
slConfigUISetEnabled(hDlg, hSrc, 'SolverName', false);

slConfigUISetVal(hDlg, hSrc,     'FixedStep','auto')
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
slConfigUISetVal(hDlg, hSrc,     'GenerateReport','off')
slConfigUISetEnabled(hDlg, hSrc, 'GenerateReport', true);

slConfigUISetVal(hDlg, hSrc,     'LaunchReport','off')
slConfigUISetEnabled(hDlg, hSrc, 'LaunchReport', true);

%% Interface tab ***********************************************************
function InterfaceTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'SupportContinuousTime','off')
slConfigUISetEnabled(hDlg, hSrc, 'SupportContinuousTime', true);

% Templates tab ***********************************************************
function TemplatesTab(hDlg, hSrc)
slConfigUISetVal(hDlg, hSrc,     'ERTCustomFileTemplate','ChibiOS_customRoutineProcess.tlc')
slConfigUISetEnabled(hDlg, hSrc, 'ERTCustomFileTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTSrcFileBannerTemplate','ChibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTSrcFileBannerTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTHdrFileBannerTemplate','ChibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTHdrFileBannerTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTDataSrcFileTemplate','ChibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTDataSrcFileTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'ERTDataHdrFileTemplate','ChibiOS_sourceFileTemplate.cgt')
slConfigUISetEnabled(hDlg, hSrc, 'ERTDataHdrFileTemplate', true);

slConfigUISetVal(hDlg, hSrc,     'GenerateSampleERTMain','off')
slConfigUISetEnabled(hDlg, hSrc, 'GenerateSampleERTMain', false);

slConfigUISetVal(hDlg, hSrc,     'IncludeMdlTerminateFcn','off')
slConfigUISetEnabled(hDlg, hSrc, 'IncludeMdlTerminateFcn', true);

% CodeStyle tab ***********************************************************
function CodeStyleTab(hDlg,hSrc)
slConfigUISetVal(hDlg, hSrc,     'ParenthesesLevel','Maximum')
slConfigUISetEnabled(hDlg, hSrc, 'ParenthesesLevel', true);

slConfigUISetVal(hDlg, hSrc,     'PreserveExpressionOrder','on')
slConfigUISetEnabled(hDlg, hSrc, 'PreserveExpressionOrder', true);

slConfigUISetVal(hDlg, hSrc,     'PreserveIfCondition','on')
slConfigUISetEnabled(hDlg, hSrc, 'PreserveIfCondition', true);

slConfigUISetVal(hDlg, hSrc,     'ConvertIfToSwitch','on')
slConfigUISetEnabled(hDlg, hSrc, 'ConvertIfToSwitch', true);

% ChibiOS Tab *************************************************************
function ChibiOSTab(hDlg,hSrc)
if ispref('ChibiOS','ChibiOS_Root')
    ChibiOS_Root=getpref('ChibiOS','ChibiOS_Root');
    if isdir(ChibiOS_Root)
        slConfigUISetVal(hDlg, hSrc,'ChibiOS_Root',ChibiOS_Root);
        slConfigUISetVal(hDlg, hSrc,'Alt_ChibiOS_Root',ChibiOS_getShortName(ChibiOS_Root));
    end
end
if ispref('ChibiOS','ChibiOS_CompilerRoot')
    ChibiOS_CompilerRoot=getpref('ChibiOS','ChibiOS_CompilerRoot');
    if isdir(ChibiOS_CompilerRoot)
        slConfigUISetVal(hDlg, hSrc,'ChibiOS_Root',ChibiOS_CompilerRoot);
        slConfigUISetVal(hDlg, hSrc,'Alt_ChibiOS_CompilerRoot',ChibiOS_getShortName(ChibiOS_CompilerRoot));
    end
end
if ispref('ChibiOS','STLink')
    STLink=getpref('ChibiOS','STLink');
    if exist(STLink,'file')
        slConfigUISetVal(hDlg, hSrc,'STLink',STLink);
        slConfigUISetVal(hDlg, hSrc,'Alt_STLink',ChibiOS_getShortName(STLink));
    end
end
% [EOF] stm32F4xxDefaultConfigSet.m

