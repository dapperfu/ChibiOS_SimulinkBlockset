function chibiOS_SelectCallback(hDlg, hSrc)
% chibiOS_SelectCallback is called from  "configuration parameters" window 
% after target selection
%
    assignin('base','hDlg',hDlg);
    assignin('base','hSrc',hSrc);
    h = waitbar(0,'Set configuration. Please wait...','Name','ChibiOS Initial Setup');
	chibiOS_DefaultConfigSet(hDlg, hSrc);
    waitbar(2/2);
	close(h);
	clear h
end
% [EOF] chibiOS_SelectCallback.m
