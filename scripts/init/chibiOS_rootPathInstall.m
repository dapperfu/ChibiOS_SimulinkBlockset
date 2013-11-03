function chibiOS_rootPathInstall(hDlg, hSrc)
% stm32F4xx_rootPathInstall get path of STM32F4xx installation 
%

%% Get SystemTargetFile installation path (stm32F4xx.tlc)
% 	systemTargetFile = slConfigUIGetVal(hDlg, hSrc, 'SystemTargetFile');
% 	filePath = which(systemTargetFile);
% 	[pathstr,name,ext] = fileparts(filePath);
% 	ind = strfind(pathstr,'STM32F4xx\rtw');
% 	if isempty(ind)
%         %Error stm32F4xx.tlc file has not been found 
%         %It means path of repository has not been added to Matlab path
% 		h = errordlg('Add STM32F4xx repository to Matlab default path' ,'STM32F4xx','modal');	    
% 		close(h);
% 		clear h
% 	else
% 		pathInstallFull = sscanf(filePath,'%c',ind + 8);
% 		pathInstallTmf = RTW.transformPaths(pathInstallFull);
% 		setenv('stm32F4xx_InstallPath',pathInstallTmf);	
% 		slConfigUISetVal(hDlg, hSrc, 'Target_Inst_path', pathInstallTmf);
% 		clear pathInstallTmf pathInstallFull
% 	end
% 	clear systemTargetFile filePath ind pathstr name ext
%% Get toolchain path    
%	compilPath = slConfigUIGetVal(hDlg, hSrc, 'CompilerPath');
%	if (strcmp(compilPath,''))
%	    toolChain = slConfigUIGetVal(hDlg, hSrc, 'ToolChain');
%		compilerpath = getToolPath(toolChain);
%		slConfigUISetVal(hDlg, hSrc, 'CompilerPath',compilerpath);
%       clear toolChain compilerpath
%	end
%	clear compliPath

end
% [EOF] stm32F4xx_rootPathInstall.m
