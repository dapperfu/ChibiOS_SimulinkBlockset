function runtlccmd
% RUNTLCCMD - run tlc command (regenerate C code from .rtw file) for model chibiOS_Config_Test_PAL
% This function will run the tlc command stored in the variable 
% "tlccmd" in tlccmd.mat, whose contents is as follows:
% 
% 	tlc
% 	-r
% 	C:\Projects\ChibiOS_SimulinkBlockset\test\chibiOS_Config_Test_PAL_chibiOS\chibiOS_Config_Test_PAL.rtw
% 	C:\Projects\ChibiOS_SimulinkBlockset\rtw\ChibiOS.tlc
% 	-OC:\Projects\ChibiOS_SimulinkBlockset\test\chibiOS_Config_Test_PAL_chibiOS
% 	-IC:\Projects\ChibiOS_SimulinkBlockset\rtw
% 	-IC:\Projects\ChibiOS_SimulinkBlockset\blocks
% 	-IC:\Projects\ChibiOS_SimulinkBlockset\test\chibiOS_Config_Test_PAL_chibiOS\tlc
% 	-IC:\Program Files\MATLAB\R2012b\rtw\c\tlc\mw
% 	-IC:\Program Files\MATLAB\R2012b\rtw\c\tlc\lib
% 	-IC:\Program Files\MATLAB\R2012b\rtw\c\tlc\blocks
% 	-IC:\Program Files\MATLAB\R2012b\rtw\c\tlc\fixpt
% 	-IC:\Program Files\MATLAB\R2012b\stateflow\c\tlc
% 	-aFoldNonRolledExpr=1
% 	-aInlineInvariantSignals=0
% 	-aInlineParameters=0
% 	-aLocalBlockOutputs=1
% 	-aRollThreshold=5
% 	-aZeroInternalMemoryAtStartup=1
% 	-aZeroExternalMemoryAtStartup=1
% 	-aInitFltsAndDblsToZero=0
% 	-aForceBlockIOInitOptimize=0
% 	-aGenerateReport=0
% 	-aGenCodeOnly=0
% 	-aRTWVerbose=1
% 	-aIncludeHyperlinkInReport=1
% 	-aLaunchReport=0
% 	-aGenerateTraceInfo=0
% 	-aPortableWordSizes=0
% 	-aGenerateErtSFunction=0
% 	-aForceParamTrailComments=1
% 	-aGenerateComments=1
% 	-aIgnoreCustomStorageClasses=0
% 	-aIncHierarchyInIds=0
% 	-aMaxRTWIdLen=31
% 	-aShowEliminatedStatements=1
% 	-aIncDataTypeInIds=0
% 	-aInsertBlockDesc=1
% 	-aIgnoreTestpoints=0
% 	-aSimulinkBlockComments=1
% 	-aInlinedPrmAccess="Literals"
% 	-aTargetFcnLib="ansi_tfl_table_tmw.mat"
% 	-aGenFloatMathFcnCalls="ANSI_C"
% 	-aIsPILTarget=0
% 	-aIncludeMdlTerminateFcn=0
% 	-aCombineOutputUpdateFcns=1
% 	-aSuppressErrorStatus=0
% 	-aERTCustomFileBanners=1
% 	-aLogVarNameModifier="rt_"
% 	-aGenerateFullHeader=1
% 	-aGenerateSampleERTMain=0
% 	-aMatFileLogging=0
% 	-aMultiInstanceERTCode=0
% 	-aPurelyIntegerCode=0
% 	-aGenerateASAP2=0
% 	-aExtMode=0
% 	-aExtModeStaticAlloc=0
% 	-aExtModeStaticAllocSize=1000000
% 	-aExtModeTransport=0
% 	-aExtModeTesting=0
% 	-aInlinedParameterPlacement="NonHierarchical"
% 	-aTargetOS="BareBoardExample"
% 	-aMultiInstanceErrorCode="Error"
% 	-aRateGroupingCode=1
% 	-aRTWCAPISignals=0
% 	-aRTWCAPIParams=0
% 	-aRootIOStructures=0
% 	-aERTCustomFileTemplate="chibiOS_customRoutineProcess.tlc"
% 	-aChibiOS_Root="C:\ChibiStudio\chibios"
% 	-aAlt_ChibiOS_Root="C:\CHIBIS~1\chibios"
% 	-aChibiOS_Board="ST_STM32F4_DISCOVERY"
% 	-aChibiOS_Platform="STM32F4xx"
% 	-aChibiOS_Compiler="GCC"
% 	-aChibiOS_InstructionSet="ARMCMx"
% 	-aChibiOS_Chip="STM32F4xx"
% 	-aChibiOS_CompilerRoot="C:\ChibiStudio\tools\GNU Tools ARM Embedded\4.7 2013q3"
% 	-aAlt_ChibiOS_CompilerRoot="C:\CHIBIS~1\tools\GNUTOO~1\43F2B~1.720"
% 	-aSTLink_Flash=1
% 	-aSTLink="C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility\ST-LINK_CLI.exe"
% 	-aAlt_STLink="C:\PROGRA~2\STMICR~1\STM32S~1\ST-LIN~1\ST-LIN~1.EXE"
% 	-aSTLink_Protocol="SWD"
% 	-aSTLink_Connection="Hotplug"
% 	-aSTLink_Erase=0
% 	-aSTLink_Verify=1
% 	-aSTLink_CMD="-Rst"
% 	-aGenerateTraceInfo=0
% 	-aIgnoreTestpoints=0
% 	-aProtectedModelReferenceTarget=0
% 	-p10000

   disp('This function will be obsoleted in a future release.') 
   mdl = 'chibiOS_Config_Test_PAL';

   sysopen = ~isempty(strmatch(mdl, find_system('type', 'block_diagram'), 'exact'));

   if ~sysopen

      disp([mfilename ': Error: model ' mdl ' is not open. Please open model ' mdl ' and then run ' mfilename ' again.']);

   else

      rtwprivate('rtwattic', 'setBuildDir', 'C:\Projects\ChibiOS_SimulinkBlockset\test\chibiOS_Config_Test_PAL_chibiOS');
      rtwprivate('ec_set_replacement_flag', 'chibiOS_Config_Test_PAL');
      load tlccmd.mat;
      savedpwd = pwd;
      cd ..;
      set_param(mdl,'MakeRTWSettingsObject', makertwObj);
      tlccmd{end+1} = '-aSLCGUseRTWContext=0';
      feval(tlccmd{:});
      set_param(mdl,'MakeRTWSettingsObject', []);
      rtwprivate rtwattic clean;
      cd(savedpwd);

   end
