function chibiOS_PostApplyCallback(hDlg, hSrc)

% STM32F4XX_POSTAPPLYCALLBACK - called when "configuration parameters" window 
% Apply or Ok slected configuration.

%% Get installation path. 
%     rootPath = slConfigUIGetVal(hDlg, hSrc, 'Target_Inst_path');
% 	if (strcmp(rootPath,''))
% 		pathInstallTmf = getenv('stm32F4xx_InstallPath');
% 		slConfigUISetVal(hDlg, hSrc, 'Target_Inst_path', pathInstallTmf);						
%         clear pathInstallTmf
% 	end
%     clear rootPath
% 	compilPath = slConfigUIGetVal(hDlg, hSrc, 'CompilerPath');
% 	if (strcmp(compilPath,''))
% 	    toolChain = slConfigUIGetVal(hDlg, hSrc, 'ToolChain');
% 		compilerpath = getToolPath(toolChain);
% 		slConfigUISetVal(hDlg, hSrc, 'CompilerPath',compilerpath);
%         clear toolChain compilerpath
% 	end
% 	clear compilPath
	
%% Update preferences
% 	%Root path is STM32F4xx repository path 
% 	stm32f4RootPath = slConfigUIGetVal(hDlg, hSrc, 'Target_Inst_path');
% 	updatePrefs('set','stm32f4RootPath',stm32f4RootPath);
% 	%clear stm32f4RootPath at the end of file. It is used to set all relative path
% 
% 	%tool path is path for selected toolchain.
% 	toolPath = slConfigUIGetVal(hDlg, hSrc, 'CompilerPath');
% 	updatePrefs('set','stm32f4ToolPath',toolPath);
% 	clear toolPath
% 	
% 	%libsrcpath is path for STM32F4 driver library sources.
% 	libSrcPath = fullfile(stm32f4RootPath, 'lib','stm32F4xx_StdPeriph_Driver','src');
%     %path for library includes  files
% 	libIncPath = fullfile(stm32f4RootPath, 'lib','stm32F4xx_StdPeriph_Driver','inc');
% 	updatePrefs('set','stm32f4LibSrcPath',libSrcPath);
% 	updatePrefs('set','stm32f4LibIncPath',libIncPath);
% 	%List of src library files
% 	libFileList = dir(fullfile(libSrcPath, '\*.c'));	
% 	updatePrefs('set','stm32f4listLibFiles',libFileList);
% 	%Create umpty list of files to build if it doesn't already exist
% 	libFile2Build = updatePrefs('get','stm32f4listLibBuildFiles');
% 	if (isempty(libFile2Build))
% 		[col,line] = size(libFileList);
% 		libFile2Build = zeros(col,1);
% 		updatePrefs('set','stm32f4listLibBuildFiles',libFile2Build);
%     end
    
%% clear variables    
    clear libSrcPath libIncPath libFileList col line libFile2Build		
	clear stm32f4RootPath

% end

% [EOF] stm32F4xx_PostApplyCallback.m
