function chibiOS_selectRoot(hDlg, hSrc)
%Callback to get toolpath automatically from registry.
%Also set default parameters for compil, link and asm
% GCC toolchain management
chibiOS_root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
if isdir(chibiOS_root)
    chibiOS_root=fileparts(chibiOS_root);
else
    chibiOS_root=pwd;
end
chibiOS_root=uigetdir(chibiOS_root,'Select the ChibiOS/RT Root Directory');
if chibiOS_root==0
    warning('CHIBIOS:ROOTCANCELED','ChibiOS/RT root path selection canceled.')
else
    slConfigUISetEnabled(hDlg, hSrc, 'ChibiOS_Root', true);
    slConfigUISetVal(hDlg, hSrc,'ChibiOS_Root',chibiOS_root);
    slConfigUISetEnabled(hDlg, hSrc, 'ChibiOS_Root', false);
    setpref('ChibiOS','ChibiOS_Root',chibiOS_root);
end
end
