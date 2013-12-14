function varargout=chibiOS_selectSettings(hDlg, hSrc, option)
% If we're not already trying to set the ChibiOS Root Directory
if ~strcmpi(option,'ChibiOS_Root')
    % Get the directory.
    ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
    if isempty(ChibiOS_Root)||~isdir(ChibiOS_Root)
        % Warn about the root directory.
        warning('CHIBIOS:ROOTEMPTY','ChibiOS/RT root path error');
        uiwait(warndlg({'ChibiOS/RT root directory is undefined or not a path','','Please select it from the next dialog'}, 'ChibiOS Root Directory Undefined'));
        % If the user cancels root directory, not much we can do. Already
        % throws an warning.
        if ~chibiOS_selectSettings(hDlg, hSrc,'ChibiOS_Root');
            return;
        end
    end
end

% Switch
switch option
    case 'STLink' 
        varargout{1}=selectSTLink(hDlg,hSrc);
    case 'ChibiOS_Root'
        varargout{1}=chibiOS_selectRoot(hDlg,hSrc);
    case 'ChibiOS_CompilerRoot'
        varargout{1}=chibiOS_selectCompilerRoot(hDlg,hSrc);
    case 'ChibiOS_Board'
        varargout{1}=chibiOS_selectBoard(hDlg,hSrc);
    case 'ChibiOS_Platform'
        varargout{1}=chibiOS_selectPlatform(hDlg,hSrc);
    case 'ChibiOS_Compiler'
        varargout{1}=chibiOS_selectCompiler(hDlg,hSrc);
    case 'ChibiOS_InstructionSet'
        % Compiler must be defined before we can select a port.
        chibiOS_compiler=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Compiler');
        if isempty(chibiOS_compiler)
            warning('CHIBIOS:COMPLIEREMPTY','ChibiOS/RT compiler is not selected');
            uiwait(warndlg({'ChibiOS/RT compiler undefined','Please select it from the next dialog'}, 'ChibiOS Compiler Undefined'));
            if ~chibiOS_selectSettings(hDlg, hSrc,'ChibiOS_Compiler');
                return;
            end
        end
        varargout{1}=chibiOS_selectInstructions(hDlg,hSrc);
    case 'ChibiOS_Chip'
        % Compiler must be defined before we can select a port.
        ChibiOS_InstructionSet=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_InstructionSet');
        if isempty(ChibiOS_InstructionSet)
            warning('CHIBIOS:INSTRUCTIONSETEMPTY','ChibiOS/RT instruction set is not selected');
            uiwait(warndlg({'ChibiOS/RT instruction set undefined','Please select it from the next dialog'}, 'ChibiOS Instruction Set Undefined'));
            if ~chibiOS_selectSettings(hDlg, hSrc,'ChibiOS_Compiler');
                return;
            end
        end
        varargout{1}=chibiOS_selectChip(hDlg,hSrc);
end
% If nothing needs to be returned
if nargout==0
    % Clear the variable out;
    varargout={};
end
%%
function success=selectSTLink(hDlg, hSrc)
stLink=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
if isdir(stLink)
    stLink=fileparts(stLink);
else
    stLink=pwd;
end
stLink=uigetdir(stLink,'Select the STLink CLI Application');
if stLink==0
    warning('CHIBIOS:ROOTCANCELED','ST Link CLI path selection canceled.')
    success=false;
else
    slConfigUISetVal(hDlg, hSrc,'STLink',stLink);
    slConfigUISetVal(hDlg, hSrc,'Alt_STLink',chibiOS_getShortName(stLink));
    setpref('ChibiOS','STLink',ChibiOS_Root);
    setpref('ChibiOS','Alt_STLink',chibiOS_getShortName(stLink));
    success=true;
end
%%
function success=chibiOS_selectRoot(hDlg, hSrc)
ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
if isdir(ChibiOS_Root)
    ChibiOS_Root=fileparts(ChibiOS_Root);
else
    ChibiOS_Root=pwd;
end
ChibiOS_Root=uigetdir(ChibiOS_Root,'Select the ChibiOS/RT Root Directory');
if ChibiOS_Root==0
    warning('CHIBIOS:ROOTCANCELED','ChibiOS/RT root path selection canceled.')
    success=false;
else
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Root',ChibiOS_Root);
    slConfigUISetVal(hDlg, hSrc,'Alt_ChibiOS_Root',chibiOS_getShortName(ChibiOS_Root));
    setpref('ChibiOS','ChibiOS_Root',ChibiOS_Root);
    setpref('ChibiOS','Alt_ChibiOS_Root',chibiOS_getShortName(ChibiOS_Root));
    success=true;
end
%%
function success=chibiOS_selectCompilerRoot(hDlg, hSrc)
ChibiOS_CompilerRoot=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_CompilerRoot');
if isdir(ChibiOS_CompilerRoot)
    ChibiOS_CompilerRoot=fileparts(ChibiOS_CompilerRoot);
else
    ChibiOS_CompilerRoot=pwd;
end
ChibiOS_CompilerRoot=uigetdir(ChibiOS_CompilerRoot,'Select the ChibiOS/RT Root Directory');
if ChibiOS_CompilerRoot==0
    warning('CHIBIOS:COMPILERROOTCANCELED','ChibiOS/RT compiler path selection canceled.')
    success=false;
else
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_CompilerRoot',ChibiOS_CompilerRoot);
    slConfigUISetVal(hDlg, hSrc,'Alt_ChibiOS_CompilerRoot',chibiOS_getShortName(ChibiOS_CompilerRoot));
    setpref('ChibiOS','ChibiOS_CompilerRoot',ChibiOS_CompilerRoot);
    setpref('ChibiOS','Alt_ChibiOS_CompilerRoot',chibiOS_getShortName(ChibiOS_CompilerRoot));
    success=true;
end
%%
function success=chibiOS_selectBoard(hDlg, hSrc)
success=false;
ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
targets_Directory=fullfile(ChibiOS_Root,'boards');
if ~isdir(targets_Directory)
    warning('CHIBIOS:BOARDSMISSING','ChibiOS/RT boards directory is missing.')
    return;
end
d=dir(targets_Directory);
% Get all of the file names in the boards directory.
files={d(:).name};
% Get everything that is a directory but does not start with '.'
targets=sort(files([d(:).isdir]&~strncmpi(files,'.',1)));
% Get the currently selected board
board=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Board');
if isempty(board)
    InitialValue=1;
else
    InitialValue=find(strcmp(targets,board),1,'first');
    if isempty(InitialValue)
        InitialValue=1;
    end
end
% Prompt the user to select the board.
[s,v]=listdlg('Name','Select Board','PromptString','Select a ChibiOS Development Board','SelectionMode','Single','InitialValue',InitialValue,'ListSize',[300 400],'ListString',targets);
if v==0
    warning('CHIBIOS:BOARDCANCELED','ChibiOS/RT board selection canceled.')
else
    board=targets{s};
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Board',board);
    success=true;
end
%%
function success=chibiOS_selectPlatform(hDlg, hSrc)
success=false;
ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
targets_directory=fullfile(ChibiOS_Root,'os','hal','platforms');
if ~isdir(targets_directory)
    warning('CHIBIOS:PLATFORMMISSING','ChibiOS/RT platform directory is missing.');
    return;
end
d=dir(targets_directory);
% Get all of the file names in the boards directory.
files={d(:).name};
% Get everything that is a directory but does not start with '.'
targets=sort(files([d(:).isdir]&~strncmpi(files,'.',1)));
% Get the currently selected board
target=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Platform');
if isempty(target)
    InitialValue=1;
else
    InitialValue=find(strcmp(targets,target),1,'first');
    if isempty(InitialValue)
        InitialValue=1;
    end
end
% Prompt the user to select the board.
[s,v]=listdlg('Name','Select Board','PromptString','Select a ChibiOS Development Platform','SelectionMode','Single','InitialValue',InitialValue,'ListSize',[300 400],'ListString',targets);
if v==0
    warning('CHIBIOS:ChibiOS_PlatformCANCELED','ChibiOS_Platform selection canceled.')
else
    target=targets{s};
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Platform',target);
    success=true;
end
%%
function success=chibiOS_selectCompiler(hDlg, hSrc)
success=false;
ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
targets_directory=fullfile(ChibiOS_Root,'os','ports');
if ~isdir(targets_directory)
    warning('CHIBIOS:BOARDSMISSING','ChibiOS/RT compiler directory is missing.');
    return;
end
d=dir(targets_directory);
% Get all of the file names in the boards directory.
files={d(:).name};
% Get everything that is a directory but does not start with '.'
targets=sort(files([d(:).isdir]&~strncmpi(files,'.',1)));
% Get the currently selected board
target=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Compiler');
if isempty(target)
    InitialValue=1;
else
    InitialValue=find(strcmp(targets,target),1,'first');
    if isempty(InitialValue)
        InitialValue=1;
    end
end
% Prompt the user to select the board.
[s,v]=listdlg('Name','Select Board','PromptString','Select a ChibiOS Development Platform','SelectionMode','Single','InitialValue',InitialValue,'ListSize',[300 400],'ListString',targets);
if v==0
    warning('CHIBIOS:ChibiOS_CompilerCANCELED','ChibiOS_Compiler selection canceled.')
else
    target=targets{s};
    if ~strcmpi(target,'GCC')
        warning('CHIBIOS:COMPILERNOTSUPPORTED','Selected compiler is not supported')
    end
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Compiler',target);
    success=true;
end
%%
function success=chibiOS_selectInstructions(hDlg, hSrc)
success=false;
ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
ChibiOS_Compiler=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Compiler');
targets_directory=fullfile(ChibiOS_Root,'os','ports',ChibiOS_Compiler);
if ~isdir(targets_directory)
    warning('CHIBIOS:BOARDSMISSING','ChibiOS/RT ports directory is missing.');
    return;
end
d=dir(targets_directory);
% Get all of the file names in the boards directory.
files={d(:).name};
% Get everything that is a directory but does not start with '.'
targets=sort(files([d(:).isdir]&~strncmpi(files,'.',1)));
% Get the currently selected board
target=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_InstructionSet');
if isempty(target)
    InitialValue=1;
else
    InitialValue=find(strcmp(targets,target),1,'first');
    if isempty(InitialValue)
        InitialValue=1;
    end
end
% Prompt the user to select the board.
[s,v]=listdlg('Name','Select Board','PromptString','Select a ChibiOS Instruction Set','SelectionMode','Single','InitialValue',InitialValue,'ListSize',[300 400],'ListString',targets);
if v==0
    warning('CHIBIOS:ChibiOS_PortCANCELED','ChibiOS_Port selection canceled.')
else
    target=targets{s};
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_InstructionSet',target);
    success=true;
end
%%
function success=chibiOS_selectChip(hDlg, hSrc)
success=false;
ChibiOS_Root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
ChibiOS_Compiler=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Compiler');
ChibiOS_InstructionSet=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_InstructionSet');
targets_directory=fullfile(ChibiOS_Root,'os','ports',ChibiOS_Compiler,ChibiOS_InstructionSet);
if ~isdir(targets_directory)
    warning('CHIBIOS:BOARDSMISSING','ChibiOS/RT ports directory is missing.');
    return;
end
d=dir(targets_directory);
% Get all of the file names in the boards directory.
files={d(:).name};
% Get everything that is a directory but does not start with '.'
targets=sort(files([d(:).isdir]&~strncmpi(files,'.',1)));
% If there are no specific chip options (no chip subdirectories) just
% return.
if isempty(targets)
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Chip','');
    success=true;
    warning('CHIBIOS:ChibiOS_ChipNone','No specific chip option for the specified instruction set');
    return;
end
% Get the currently selected board
target=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Chip');
if isempty(target)
    InitialValue=1;
else
    InitialValue=find(strcmp(targets,target),1,'first');
    if isempty(InitialValue)
        InitialValue=1;
    end
end
% Prompt the user to select the board.
[s,v]=listdlg('Name','Select Board','PromptString','Select a ChibiOS Instruction Set','SelectionMode','Single','InitialValue',InitialValue,'ListSize',[300 400],'ListString',targets);
if v==0
    warning('CHIBIOS:ChibiOS_PortCANCELED','ChibiOS_Port selection canceled.')
else
    target=targets{s};
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Chip',target);
    success=true;
end