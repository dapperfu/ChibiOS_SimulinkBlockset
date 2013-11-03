function chibiOS_make_rtw_hook(hookMethod,modelName,rtwroot,templateMakefile,buildOpts,buildArgs)
% chibiOS_make_rtw_hook supports build process
%
% $ chibiOS_make_rtw_hook.m 2009-05-14 dlange $
%

% chibiOS_make_rtw_hook - This is the standard ERT hook file for the RTW build
% process (make_rtw), and implements automatic configuration of the
% models configuration parameters.  When the buildArgs option is specified
% as 'optimized_fixed_point=1' or 'optimized_floating_point=1', the model
% is configured automatically for optimized code generation.
%
% This hook file (i.e., file that implements various RTW callbacks) is
% called by RTW for system target file ert.tlc.  The file leverages
% strategic points of the RTW process.  A brief synopsis of the callback
% API is as follows:
%
% ert_make_rtw_hook(hookMethod, modelName, rtwroot, templateMakefile,
%                   buildOpts, buildArgs)
%
% hookMethod:
%   Specifies the stage of the RTW build process.  Possible values are
%   entry, before_tlc, after_tlc, before_make, after_make and exit, etc.
%
% modelName:
%   Name of model.  Valid for all stages.
%
% rtwroot:
%   Reserved.
%
% templateMakefile:
%   Name of template makefile.  Valid for stages 'before_make' and 'exit'.
%
% buildOpts:
%   Valid for stages 'before_make' and 'exit', a MATLAB structure
%   containing fields
%
%   modules:
%     Char array specifying list of generated C files: model.c, model_data.c,
%     etc.
%
%   codeFormat:
%     Char array containing code format: 'RealTime', 'RealTimeMalloc',
%     'Embedded-C', and 'S-Function'
%
%   noninlinedSFcns:
%     Cell array specifying list of non-inlined S-Functions.
%
%   compilerEnvVal:
%     String specifying compiler environment variable value, e.g.,
%     D:\Applications\Microsoft Visual
%
% buildArgs:
%   Char array containing the argument to make_rtw.  When pressing the build
%   button through the Configuration Parameter Dialog, buildArgs is taken
%   verbatim from whatever follows make_rtw in the make command edit field.
%   From MATLAB, it's whatever is passed into make_rtw.  For example, its
%   'optimized_fixed_point=1' for make_rtw('optimized_fixed_point=1').
%
%   This file implements these buildArgs:
%     optimized_fixed_point=1
%     optimized_floating_point=1
%
% You are encouraged to add other configuration options, and extend the
% various callbacks to fully integrate ERT into your environment.

% Copyright 1996-2006 The MathWorks, Inc.
% $Revision: 1.1.6.7 $ $Date: 2006/10/10 02:35:48 $

disp(['### Real-Time Workshop build procedure for method: ''' hookMethod]);

disp(['### modelName: ''' modelName]);
disp(['### gcs: ''' gcs]);
disp(['### bdroot: ''' bdroot]);

%Global variable to know if we download appli or not. Do not download
%reference, only top model
global downloadTopModel;

switch hookMethod
	case 'error'
		% Called if an error occurs anywhere during the build.  If no error occurs
		% during the build, then this hook will not be called.  Valid arguments
		% at this stage are hookMethod and modelName. This enables cleaning up
		% any static or global data used by this hook file.
		disp(['### Real-Time Workshop build procedure for model: ''' modelName...
			''' aborted due to an error.']);
		
	case 'entry'
        %Do not download by default. See before_tlc case
        downloadTopModel = 0;
        
		% Called at start of code generation process (before anything happens.)
		% Valid arguments at this stage are hookMethod, modelName, and buildArgs.
	    msg = DAStudio.message('RTW:makertw:enterRTWBuild', modelName);
        disp(msg);
		disp(sprintf(['\n### Starting Real-Time Workshop build procedure for ', ...
			'model: %s'],modelName)); %#ok

        %Verify that product has been installed (ie: Added to Matlab path)
		Stm32RootPath = updatePrefs('get','stm32f4RootPath');    
		%If path has not been added to preferences. Product has not been installed
		if(isempty(Stm32RootPath))
			h = errordlg('Add STM32F4xx repository to Matlab default path!','STM32F4xx');	    
			close(h);
			clear h
			error('Product has not been installed. ie:Not in Matlab path')
        end
        %Obtain the model's active configuration set.
        cset = getActiveConfigSet(modelName);
        
		%If path of product is not good. Certainly example has been copied from system where product has not been installed
		%at same location.
		ProductInfo = what(Stm32RootPath);
		if(isempty(ProductInfo))
            toolChain = cset.get_param('ToolChain');
            CompilerPath = cset.get_param('CompilerPath');
            Dongle = cset.get_param('Dongle');
            flashRam = cset.get_param('flashRam');
            CompilerSettings = cset.get_param('CompilerSettings');
            LinkerSettings = cset.get_param('LinkerSettings');
            AssemblerSettings = cset.get_param('AssemblerSettings');
            DownloadApplication = cset.get_param('DownloadApplication');
            cset.set_param('SystemTargetFile', 'ert.tlc');   % System target file
            switchTarget(cset,'ert.tlc',[]);
            pause(1);
            switchTarget(cset,'stm32F4xx.tlc',[]);
            cset.set_param('ToolChain', toolChain);
            cset.set_param('CompilerPath', CompilerPath);
            cset.set_param('Dongle', Dongle);
            cset.set_param('flashRam', flashRam);
            cset.set_param('CompilerSettings', CompilerSettings);
            cset.set_param('LinkerSettings', LinkerSettings);
            cset.set_param('AssemblerSettings', AssemblerSettings);
            cset.set_param('DownloadApplication', DownloadApplication);
            clear toolChain CompilerPath Dongle flashRam CompilerSettings 
            clear LinkerSettings AssemblerSettings DownloadApplication
			h = warndlg(sprintf('Configuration parameters>code Generation>STM32F4xx Options>Installed path is not valid.\nPossible raison: Model has been copied from system where product was not installed at same location.\nSolution: Set Configuration parameters>code Generation>System target file to ert.tlc and click OK button. Then select stm32F4xx.tlc again, click OK button and verify that Installed path is STM32F4xx repository installation path on your system.\nThen save the model.')...
            ,modelName,'modal');
            uiwait(h); 
			clear h            
   		end
		clear Stm32RootPath ProductInfo
			
		SIL_PIL = cset.get_param ('SimulationMode');
		disp(sprintf(['### Model connectivity is: %s\n'],SIL_PIL));%#ok
		if (strfind(SIL_PIL,'processor-in-the-loop'))
			%PIL requested mode
			updatePrefs('set','stm32f4PilMode',1);
			%cset.set_param ('CreateSILPILBlock','PIL');
			set_param(modelName, 'CreateSILPILBlock','PIL');
			pause(1);
			disp(sprintf(['### Create verification block: PIL\n']));%#ok
		else
			%NORMAL/SIL (Not PIL) requested mode
			updatePrefs('set','stm32f4PilMode',0);
			if (strfind(SIL_PIL,'Software-in-the-loop'))
				%SIL requested mode
				cset.set_param ('CreateSILPILBlock','SIL');
				cset.set_param('GenerateErtSFunction','on');
				disp(sprintf(['### Create verification block: SIL\n']));
			else
				%other requested mode
				cset.set_param ('CreateSILPILBlock','None');
				disp(sprintf(['### Create verification block: None\n']));
			end
		end
		clear cset SIL_PIL
		
		% Check the Current Directory for correctness. In any other case
		% there might be confilicts during the build-process towards finding
		% desired files for creating the application:
		disp('### Check Current Directory for building application.')
		PathParts = textscan(pwd,'%s','delimiter','\\');
		Origin = PathParts{1}(end-1:end);
		Ref = {'stm32F4xx';'CodeGeneration'};
		if ~strcmp(Origin,Ref)
			warning('Please change to STM32F4xx\STM32F4xxdemos\CodeGeneration build directory. In any other case there might be confilicts during the build-process towards finding desired files for creating the application.')
		else	
			disp('### Directory Check succeeded.')			
		end
		
	case 'before_tlc'
		% Called just prior to invoking TLC Compiler (actual code generation.)
		% Valid arguments at this stage are hookMethod, modelName, and
		% buildArgs
		disp(sprintf(['### before_tlc\n']));
        % Download for topModel only, not for referenced model!       
        topmodelName = bdroot;
        disp(['### Top model: ''' topmodelName]);           
        disp(['### Model: ''' modelName]);           
		if (strcmp(topmodelName,modelName))
            downloadTopModel = 1;
        else
            downloadTopModel = 0;
        end
        clear topmodelName
		
		
	case 'after_tlc'
		% Called just after to invoking TLC Compiler (actual code generation.)
		% Valid arguments at this stage are hookMethod, modelName, and
		% buildArgs
		disp(sprintf(['### after_tlc\n']));
		
	case 'before_makefilebuilder_make'
		% Called after code generation is complete for PIL processing
		% All arguments are valid at this stage.
		disp(sprintf(['### before_makefilebuilder_make\n']));

	
	case 'before_make'
		% Called after code generation is complete, and just prior to kicking
		% off make process (assuming code generation only is not selected.)  All
		% arguments are valid at this stage.
        disp(sprintf(['\n### Code Format : %s'],buildOpts.codeFormat));%#ok
        
        %Set environement variable to know windows version 32/64 bits
        winVersion = getenv('MATLAB_WIN_VER');        
        ext = mexext;
        if (isempty(winVersion))
            switch ext
            	case 'mexw32'
                    setenv('MATLAB_WIN_VER','win32');
                case 'mexw64'
                    setenv('MATLAB_WIN_VER','win64');
            end
        end
        clear ext winVersion
       		
		%Add makefile token to know when model ref is built if it is for PIL or not
        SIMULATION_MODE_RP = 'NO_PIL';
		SIL_PIL = updatePrefs('get','stm32f4PilMode');
		if (isequal(SIL_PIL,1))
            SIMULATION_MODE_RP = 'PIL';
        end
		clear SIL_PIL        
        
		% Add additional sources to makefile. Sources must be part ot
		% ..\dev_tool\Sources directory
		
		args = get_param(modelName, 'RTWBuildArgs');
		toolChainSel = get_param(modelName,'ToolChain');		
		Stm32RootPath = updatePrefs('get','stm32f4RootPath');    
		if(isempty(Stm32RootPath))
			h = errordlg('Add STM32F4xx repository to Matlab default path!','STM32F4xx');	    
			close(h);
			clear h
		end
	
		Stm32LibPath = updatePrefs('get','stm32f4LibSrcPath'); 
		sourceFiles = ['system_stm32f4xx.c '];
		Stm32LibFiles = updatePrefs('get','stm32f4listLibFiles'); 
		Stm32LibFiles2Build = updatePrefs('get','stm32f4listLibBuildFiles'); 
		if (isempty(Stm32LibFiles))
			error('STM32F4xx : list of StdPeriph Driver files not defined.');
		end
		if (isempty(Stm32LibFiles2Build))
			disp(sprintf(['\n### %s StdPeriph Driver files not used!'],Stm32RootPath));
		else
			listfiles = {Stm32LibFiles(logical(reshape(Stm32LibFiles2Build,1,numel(Stm32LibFiles)))).name};
			for index = listfiles
				sourceFiles = [sourceFiles,char(index),' '];
			end
			clear listfiles index
		end
		
		sourceFiles = [sourceFiles,'stm32f4xx_flash.c ',...
		               'stm32f4xx_pwr.c ' ];
		itFile      = ['stm32f4xx_it.c '];			  
        
        switch toolChainSel
            case 'IAR'
                startupFile = 'startup_stm32f4xx.s';
            case 'KEIL'
                startupFile = 'startup_stm32f4xx.s';
            case 'ATOLLIC'
                startupFile = 'startup_stm32f4xx.s';
            case 'GCC'
                startupFile = 'startup_stm32f4xx.s';
        end
        
		args = [args, ' SIMULATION_MODE_RP="' SIMULATION_MODE_RP '" ', ...
            ' TARGET_SRCS="' sourceFiles '" ', ...				
			' SYSTEM_SRCS="' itFile '"', ...
			' STARTUP_SRCS="' startupFile '"'];
		set_param(modelName,'RTWBuildArgs',args);
		clear args toolChainSel startupFile Stm32RootPath itFile sourceFiles Stm32LibPath Stm32LibFiles Stm32LibFiles2Build
		 		
	case 'after_make'
		% Called after make process is complete. All arguments are valid at
		% this stage.
	
	case 'exit'
		% Called at the end of the RTW build process.  All arguments are valid
		% at this stage.
		
		disp(['### Successful completion of Real-Time Workshop build ',...
			'procedure for model: ', modelName]);
				
		% In case the user enabled the checkbox 'Download Application' the
		% project is opened and the application gets downloaded:
        % When PIL request, Launcher do that.
		PilReq = updatePrefs('get','stm32f4PilMode');
		if (strcmp(get_param(modelName,'DownloadApplication'),'on') && ...
			strcmp(get_param(modelName,'GenCodeOnly'),'off') && ...
            isequal(PilReq,0)  && ...
            downloadTopModel == 1)
			disp('### Downloading application...');
            %Get current repository (should be CodeGeneration)
            currentPath = pwd;            
			toolChainSel = get_param(modelName,'ToolChain');
			toolPath = updatePrefs('get','stm32f4ToolPath');
			Stm32RootPath = updatePrefs('get','stm32f4RootPath');    
			if(isempty(Stm32RootPath))
				h = errordlg('Add STM32F4xx repository to Matlab default path!','STM32F4xx');	    
				close(h);
				clear h
            end
         
			switch toolChainSel
				case 'IAR'
				    probeName = get_param(modelName,'Dongle');
					bootMode = get_param(modelName,'flashRam');
                    switch probeName
						case 'J-Link'
							str_dgl = ' --jlink_interface=SWD --jlink_speed=auto --jlink_initial_speed=32 --jlink_reset_strategy=0,3 --jlink_exec_commmand=monitor reg r13 = (0x20000000); monitor reg pc = (0x20000004); break main; continue';
							str_mac = [' --macro ',[Stm32RootPath,'\script\\',bootMode,'_UserResetMacro.mac']];					
							toolDll = fullfile(toolPath, 'armjlink.dll');
						case 'STLinkV2'
							str_dgl = ' --stlink_interface=SWD --stlink_reset_strategy=0,0 ';
							str_mac = ' ';							
							toolDll = fullfile(toolPath, 'armstlink.dll');
						otherwise
							error('Not supported Dongle!');                           
                    end					
				    target = get_param(modelName,'stm32Target');
				    armProcDll = fullfile(toolPath, 'armproc.dll');
					plugInDll = fullfile(toolPath, 'armbat.dll');
					flashLoadpath = fullfile(toolPath, '..', 'config','flashloader','ST');
					ddf = fullfile(toolPath, '..', 'config','debugger','ST');
					%Change toolPath to IDE path
				    toolPath = fullfile(toolPath, '..','..', 'common','bin');
					str = ['start "EWARM" ',...
					['"',toolPath, '\IarIdePm.exe" --DBG ARM'],...
					[' "', toolDll,'" "',modelName,'.out" ']];
					str1 = [[' --plugin "' , plugInDll, '" --backend '],...
					'--endian=little --cpu=Cortex-M3 --fpu=None -p "',...
					[ddf,'\io',target,'.ddf"' ],...
                    ' --flash_loader "',[flashLoadpath,'\Flash',target,'.flash"' ],...
					[' --semihosting --drv_verify_download  --drv_communication=USB0 ',' --device=',target]];
                    
					str_cmd = strcat(str,str_mac,str1,str_dgl);
			        disp(['C-SPY CMD:',str_cmd ]);
				
					[status, result] = system(str_cmd); %#ok
					clear probeName str_dgl str_mac toolDll target armProcDll plugInDll flashLoadpath ddf bootMode
				case 'KEIL'                    
                    probeName = get_param(modelName,'Dongle');
                    keil_MCUConf = [Stm32RootPath,'\toolchain\Keil\Keil_Prj_',probeName,'.uvproj'];
                    keil_FlashConf = [Stm32RootPath,'\toolchain\Keil\Keil_Prj_',probeName,'.uvopt'];
                    keil_Settings = [Stm32RootPath,'\toolchain\Keil\',probeName,'_Settings.ini'];

                    %Add buildDirectory to the path.
                    infoBuild = RTW.getBuildDir(modelName);
                    pathBuild =  textscan(infoBuild.ModelRefRelativeBuildDir,'%s','delimiter','\\');
                    origin = pathBuild{1}(1);
                    path2Add = fullfile(infoBuild.CodeGenFolder, origin);
                    addpath(genpath(path2Add{1}),'-begin');
                 
                    %Get generated model.elf file path 
                    hexGeneratedFile = [modelName,'.axf'];
                    hexGeneratedFilePath = which (hexGeneratedFile);
                    [pathstr, ~, ext] = fileparts(hexGeneratedFilePath);
                    %CD to download directory
                    cd(pathstr);
                    %%cd ..                
                    %Copy keil template to prg/debug                  
                    disp(['Keil_MCUConf:',keil_MCUConf ]);
                    copyfile(keil_MCUConf,'Keil_Prj.uvproj','f');		                 
                    disp(['Keil_FlashConf:',keil_FlashConf ]);
                    copyfile(keil_FlashConf,'Keil_Prj.uvopt','f');		
                    disp(['Keil_Settings:',keil_Settings ]);
                    copyfile(keil_Settings,'Keil_Settings.ini','f');		
                    copyfile(hexGeneratedFilePath,'Keil_Prj.axf','f');                 
                    pause(1);
                    clear probeName                   
                    
                    %Command string to start IDE
					str = ['start "µVision4" ',...
					['"',toolPath, '\..\UV4\Uv4.exe" -d Keil_Prj.uvproj']];
					[status, result] = system(str); %#ok
					
				case 'ATOLLIC'
				    probeName = get_param(modelName,'Dongle');
					bootMode = get_param(modelName,'flashRam');
				    atollic_PRJ = [Stm32RootPath,'\toolchain\ATOLLIC_TrueSTUDIO\Atollic_Prj'];
				    atollic_DATA = [Stm32RootPath,'\toolchain\ATOLLIC_TrueSTUDIO\.metadata'];
				    atollic_MCUConf = [Stm32RootPath,'\toolchain\ATOLLIC_TrueSTUDIO\launch\',bootMode,'_',probeName];
                    
                   
                    %Get generated model.elf file path 
                    elfGeneratedFile = [modelName,'.elf'];
                    hexGeneratedFilePath = which (elfGeneratedFile);
                    [pathstr, ~, ext] = fileparts(hexGeneratedFilePath);
                    %CD to pil directory
                    cd(pathstr);
                                
				    copyfile(atollic_PRJ,'Atollic_Prj','f');
				    copyfile(atollic_DATA,'.metadata','f');
					disp(['atollic_MCUConf:',atollic_MCUConf ]);
				    copyfile(atollic_MCUConf,'Atollic_Prj\Atollic_Prj.elf.launch','f');					
                    copyfile([modelName,'.elf'],'Atollic_Prj\Atollic_Prj.elf','f');
                    pause(1);
                    
                    clear atollic_PRJ atollic_DATA probeName bootMode
                    str = ['start "ATOLLIC TrueSTUDIO" ',...
                        ['"',toolPath, '\ide\TrueSTUDIO.exe" -data .']];
                    [status, result] = system(str); %#ok
                    pause(1);
                case 'GCC'
                    probeName = get_param(modelName,'Dongle');
                    bootMode = get_param(modelName,'flashRam');
                    
                    stlink = 'C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe';
                    
                    %Get generated model.elf file path
                    hexGeneratedFile = [modelName,'.hex'];
                    hexGeneratedFilePath = which (hexGeneratedFile);
                    [pathstr, name, ext] = fileparts(hexGeneratedFilePath);
                    cd(pathstr);
                    
                    cmd = sprintf('"%s" -c SWD HOTPLUG -P "%s"',stlink,hexGeneratedFilePath);
					[status, result] = system(cmd); %#ok                   
                    cmd = sprintf('"%s" -Rst',stlink);
					[status, result] = system(cmd); %#ok
                    pause(1);
			end
            %Go back to current path
            cd(currentPath);
            clear currentPath ;
			if status == 0 % success
				disp('### Downloaded command successfully fired.')
			end
			clear Stm32RootPath toolChainSel toolPath
		end
		
end
