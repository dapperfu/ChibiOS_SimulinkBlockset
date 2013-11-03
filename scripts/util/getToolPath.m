function toolPath = getToolPath(toolName)

%Get toolPath from registry.
%Called from getpath_callback function.
%toolName can be IAR, KEIL or ATOLLIC
%Return path found
%Error if toolchain has not been installed
if (strcmp(toolName,'IAR'))
    try
        %toolPath = winqueryreg('HKEY_LOCAL_MACHINE', ...
        %'SOFTWARE\IAR Systems\Embedded Workbench\5.0\EWARM', 'InstallPath');
        %            [status,IARKey] = system('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\IAR Systems\Embedded Workbench" /s');
        %            regKey = regexp(IARKey,' InstallPath	REG_SZ	','split');
        %            regKeyUtil = regKey(1,2:end);
        %            listToolpath = [];
        %            listAllPath = [];
        %            for k = 1:numel(regKeyUtil)
        %                regKey = regexp(regKeyUtil(1,k),'HKEY_LOCAL_MACHINE','split');
        %                listAllPath = [regKey{1,1}(1) ; listAllPath];
        %            end
        %            for k = 1:numel(listAllPath)
        %                if isempty(strfind(char(listAllPath(k,1)),'ExePath'))
        %                    listToolpath = [listAllPath(k,1); listToolpath];
        %                end
        %            end
        
        [status,IARKey] = system('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\IAR Systems\Embedded Workbench" /s');
        if (status == 1)
            [status,IARKey] = system('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\IAR Systems\Embedded Workbench" /s');
        end
        %Search for expression and split
        %            expression = '(REG_SZ|HKEY_LOCAL_MACHINE)';
        expression = '(HKEY_LOCAL_MACHINE|ExePath)';
        regKey = regexp(IARKey,expression,'split');
        %Kip only cell(s) with words InstallPath or LastInstallPath and
        %c:\ or C:\
        expression = '(InstallPath|LastInstallPath).*[cC]:\\.*';
        regKeyPath = regexp(regKey,expression,'match');
        %Build an array of cell with results
        regKeyPathUtil = [];
        for k = 1:numel(regKeyPath)
            if (size(regKeyPath{1,k}))
                regKeyPathUtil = [regKeyPath{1,k}  regKeyPathUtil];
            end
        end
        %Kip only cell(s) with c:\ but not ExePath
        expression = '[cC]:\\.*';
        regKeyUtil = regexp(regKeyPathUtil,expression,'match');
        %Build list of possible tool path
        listToolpath = [];
        for k = 1:numel(regKeyUtil)
            %Remove blanck char
            toolpath = strtrim(regKeyUtil{1,k});
            %Test if path include arm
            armFind = strfind(toolpath,'\arm');
            %Kip path only once
            alreadyLoad = strcmp(listToolpath,toolpath);
            if (isempty(armFind{1}) && sum(alreadyLoad) == 0)
                listToolpath = [toolpath ; listToolpath];
            end
        end
        
        if(numel(listToolpath) == 0)
            toolPath ='';
        elseif (numel(listToolpath)>1)
            toolPath = selectPath(listToolpath,'IAR');
        else
            toolPath = char(listToolpath);
        end
        
        if (isempty(toolPath))
            warning('### IAR toolchain not automatically found.')
            toolPath = uigetdir('c:\','Select IAR directory tool path');
        end
        toolPath = strtrim(toolPath);
        toolPath = fullfile(toolPath, 'arm','bin');
    catch %#ok
        warning('### IAR toolchain not automatically found.')
        toolPath = uigetdir('c:\','Select IAR directory tool path');
        toolPath = fullfile(toolPath, 'arm','bin');
    end
end
if (strcmp(toolName,'KEIL'))
    try
        toolPath = winqueryreg('HKEY_LOCAL_MACHINE', ...
            'SOFTWARE\Keil\Products\MDK', 'Path');
        verKEIL = winqueryreg('HKEY_LOCAL_MACHINE', ...
            'SOFTWARE\Keil\Products\MDK', 'Version');
        if (verKEIL < 4)
            error('### µVision3 not supported. Please update to µVision4')
        end
        %toolPath = fullfile(toolPath, '..', 'UV4');
        clear verKEIL
    catch %#ok
        warning('### KEIL toolchain not automatically found.')
        toolPath = uigetdir('c:\','Select KEIL µVision4 directory tool path');
    end
end
if (strcmp(toolName,'ATOLLIC'))
    try
        %AtollicKey = getRegistryKey('HKEY_LOCAL_MACHINE\SOFTWARE\Atollic','TrueSTUDIO for');
        %AtollicList = winqueryreg('HKEY_LOCAL_MACHINE', char(regKey{1}),'*');
        [status,AtollicKey] = system('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Atollic" /s');
        if (status == 1)
            [status,AtollicKey] = system('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Atollic" /s');
        end
        %Search for expression and split
        expression = '(REG_SZ|HKEY_LOCAL_MACHINE)';
        regKey = regexp(AtollicKey,expression,'split');
        %Kip only cell(s) starting with c:\
        expression = '[cC]:\\.*';
        regKeyUtil = regexp(regKey,expression,'match');
        %Build list of possible tool path
        listToolpath = [];
        for k = 1:numel(regKeyUtil)
            if (size(regKeyUtil{1,k}))
                listToolpath = [regKeyUtil{1,k} ; listToolpath];
            end
        end
        
        if(numel(listToolpath) == 0)
            toolPath ='';
        elseif (numel(listToolpath)>1)
            toolPath = selectPath(listToolpath,'ATOLLIC');
        else
            toolPath = char(listToolpath);
        end
        
        if (isempty(toolPath))
            warning('### ATOLLIC toolchain not automatically found.')
            toolPath = uigetdir('c:\','Select ATOLLIC directory tool path');
        end
        toolPath = strtrim(toolPath);
    catch %#ok
        warning('### ATOLLIC toolchain not automatically found.')
        toolPath = uigetdir('c:\','Select ATOLLIC directory tool path');
        toolPath = strtrim(toolPath);
        
    end
end
if (strcmp(toolName,'GCC'))
    warning('### GCC toolchain not automatically found.')
    toolPath = uigetdir('C:\','Select GCC directory tool path');
    toolPath = strtrim(toolPath);
end
end

function pathSelection(hObj,event) %#ok<INUSD>
global listIndex;
listIndex = get(hObj,'Value');
end

function toolPath = selectPath(pathList,toolName)
%Get toolPath from list of possible path.
%Called from getToolPath function.
%Return path found
%% Create uicontrol to make choise.
global listIndex;
scrsz = get(0,'ScreenSize');
figPos = [scrsz(1)+scrsz(3)/3 scrsz(2)+scrsz(4)/3 scrsz(3)/3 scrsz(4)/3];
fig1=figure('Name','Tool path Selection','Position',figPos);
bckColor = get(gcf,'Color');

h2 = uicontrol('Style','text',...
    'Position',[scrsz(3)/10 5*scrsz(4)/20 200 40],'FontWeight','bold',...
    'String','Select one of possible tool path and press continue.');
set(h2,'BackgroundColor',bckColor);

h1 = uicontrol('Style','listbox','Max',1,...
    'String',pathList,...
    'Position',[(scrsz(3)/10)-70 (2*scrsz(4)/20)+20 350 100],'FontWeight','bold',...
    'Callback',@pathSelection);
h11 = uicontrol('Style','text','FontWeight','bold',...
    'Position',[(scrsz(3)/10)-140 (3*scrsz(4)/20)+40 70 20],...
    'String',toolName);
set(h11,'BackgroundColor',bckColor);

h3 = uicontrol('Position',[scrsz(3)/10 20 200 40],'String','Continue',...
    'Callback','uiresume(gcbf)');
uiwait(gcf);
close(fig1);
toolPath = char(pathList(listIndex));
%pause(1);
clear fig1 h1 h2 h3 h11 bckColor
end

