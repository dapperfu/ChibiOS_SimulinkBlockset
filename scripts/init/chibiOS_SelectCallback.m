function ChibiOS_SelectCallback(hDlg, hSrc)
% ChibiOS_SelectCallback is called from  "configuration parameters" window 
% after target selection
%
    assignin('base','hDlg',hDlg);
    assignin('base','hSrc',hSrc);
    h = waitbar(0,'Setting configuration. Please wait...','Name','ChibiOS Setup');
	ChibiOS_DefaultConfigSet(hDlg, hSrc);
    waitbar(2/2);
	close(h);
	clear h
end
% [EOF] ChibiOS_SelectCallback.m
