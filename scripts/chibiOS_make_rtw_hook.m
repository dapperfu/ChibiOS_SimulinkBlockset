function ChibiOS_make_rtw_hook(hookMethod,modelName,rtwroot,templateMakefile,buildOpts,buildArgs)
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
% 
% fprintf('\n### Real-Time Workshop build procedure for method: %s\n',hookMethod);
% fprintf('### modelName: %s\n\n', modelName);

%Global variable to know if we download appli or not. Do not download
%reference, only top model

switch hookMethod
	case 'error'
		% Called if an error occurs anywhere during the build.  If no error occurs
		% during the build, then this hook will not be called.  Valid arguments
		% at this stage are hookMethod and modelName. This enables cleaning up
		% any static or global data used by this hook file.
		fprintf('### Real-Time Workshop build procedure for model: %s aborted due to an error.\n\n',modelName);
	case 'entry'
        clc;
        % Called at start of code generation process (before anything happens.)
        % Valid arguments at this stage are hookMethod, modelName, and buildArgs.
        msg = DAStudio.message('RTW:makertw:enterRTWBuild', modelName);
        fprintf('%s\n',msg);
        %Obtain the model's active configuration set.
%         cset = getActiveConfigSet(modelName);
        
		%If path of product is not good. Certainly example has been copied from system where product has not been installed
		%at same location.
% 		ProductInfo = what(Stm32RootPath);
% 		if(isempty(ProductInfo))
%             toolChain = cset.get_param('ToolChain');
%             CompilerPath = cset.get_param('CompilerPath');
%             Dongle = cset.get_param('Dongle');
%             flashRam = cset.get_param('flashRam');
%             CompilerSettings = cset.get_param('CompilerSettings');
%             LinkerSettings = cset.get_param('LinkerSettings');
%             AssemblerSettings = cset.get_param('AssemblerSettings');
%             DownloadApplication = cset.get_param('DownloadApplication');
%             cset.set_param('SystemTargetFile', 'ert.tlc');   % System target file
%             switchTarget(cset,'ert.tlc',[]);
%             pause(1);
%             switchTarget(cset,'stm32F4xx.tlc',[]);
%             cset.set_param('ToolChain', toolChain);
%             cset.set_param('CompilerPath', CompilerPath);
%             cset.set_param('Dongle', Dongle);
%             cset.set_param('flashRam', flashRam);
%             cset.set_param('CompilerSettings', CompilerSettings);
%             cset.set_param('LinkerSettings', LinkerSettings);
%             cset.set_param('AssemblerSettings', AssemblerSettings);
%             cset.set_param('DownloadApplication', DownloadApplication);
%             clear toolChain CompilerPath Dongle flashRam CompilerSettings 
%             clear LinkerSettings AssemblerSettings DownloadApplication
% 			h = warndlg(sprintf('Configuration parameters>code Generation>STM32F4xx Options>Installed path is not valid.\nPossible raison: Model has been copied from system where product was not installed at same location.\nSolution: Set Configuration parameters>code Generation>System target file to ert.tlc and click OK button. Then select stm32F4xx.tlc again, click OK button and verify that Installed path is STM32F4xx repository installation path on your system.\nThen save the model.')...
%             ,modelName,'modal');
%             uiwait(h); 
% 			clear h            
%    		end
% 		clear Stm32RootPath ProductInfo
% 		
% 		% Check the Current Directory for correctness. In any other case
% 		% there might be confilicts during the build-process towards finding
% 		% desired files for creating the application:
% 		disp('### Check Current Directory for building application.')
% 		PathParts = textscan(pwd,'%s','delimiter','\\');
% 		Origin = PathParts{1}(end-1:end);
% 		Ref = {'stm32F4xx';'CodeGeneration'};
% 		if ~strcmp(Origin,Ref)
% 			warning('Please change to STM32F4xx\STM32F4xxdemos\CodeGeneration build directory. In any other case there might be confilicts during the build-process towards finding desired files for creating the application.')
% 		else	
% 			disp('### Directory Check succeeded.')			
% 		end
		
	case 'before_tlc'
		% Called just prior to invoking TLC Compiler (actual code generation.)
		% Valid arguments at this stage are hookMethod, modelName, and
		% buildArgs
		fprintf('### before_tlc\n');      

	case 'after_tlc'
		% Called just after to invoking TLC Compiler (actual code generation.)
		% Valid arguments at this stage are hookMethod, modelName, and
		% buildArgs
		fprintf('### after_tlc\n');
		
	case 'before_makefilebuilder_make'
		% Called after code generation is complete for PIL processing
		% All arguments are valid at this stage.
		fprintf('### before_makefilebuilder_make\n');

    case 'before_make'
        % Called after code generation is complete, and just prior to kicking
        % off make process (assuming code generation only is not selected.)  All
        % arguments are valid at this stage.
        fprintf('\n### Code Format : %s\n',buildOpts.codeFormat); 
        
    case 'after_make'
        % Called after make process is complete. All arguments are valid at
        % this stage.
        fprintf('### after_make\n');
        
        
    case 'exit'
        % Called at the end of the RTW build process.  All arguments are valid
		% at this stage.
		fprintf('#############################################################################\n');
		fprintf('### Successful completion of Real-Time Workshop build procedure for model: %s\n', modelName);
		fprintf('#############################################################################\n');
		
end
