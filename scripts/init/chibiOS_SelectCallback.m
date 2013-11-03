function chibiOS_SelectCallback(hDlg, hSrc)
% chibiOS_SelectCallback is called from  "configuration parameters" window 
% after target selection
%

    h = waitbar(0,'Set configuration. Please wait...');
% 	%Call defaultSettings
% 	waitbar(1/4);
	chibiOS_DefaultConfigSet(hDlg, hSrc);
% 	waitbar(1/2);
% 	%Call rootpathInstall to get installation path of chibiOS product
%     chibiOS_rootPathInstall(hDlg, hSrc);
% 	%Set model referencing compliant. ie: Model includes other models
% 	slConfigUISetVal(hDlg, hSrc, 'ModelReferenceCompliant', 'on');
% 	slConfigUISetEnabled(hDlg, hSrc, 'ModelReferenceCompliant', false);
% 	%Set parallel build to reduce build for referenced models
% 	slConfigUISetVal(hDlg, hSrc, 'ParMdlRefBuildCompliant', 'on');
% 	slConfigUISetEnabled(hDlg, hSrc, 'ParMdlRefBuildCompliant', false);
% 	waitbar(2/2);
	close(h);
	clear h
end
% [EOF] chibiOS_SelectCallback.m
