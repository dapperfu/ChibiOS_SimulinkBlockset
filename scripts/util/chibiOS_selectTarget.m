function chibiOS_selectTarget(hDlg, hSrc)
%Callback to get toolpath automatically from registry.
%Also set default parameters for compil, link and asm
% GCC toolchain management
chibiOS_root=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Root');
if isempty(chibiOS_root)
    warning('CHIBIOS:ROOTEMPTY','ChibiOS/RT root path is empty.')
else
    boards_directory=fullfile(chibiOS_root,'boards');
    if ~isdir(boards_directory)
        warning('CHIBIOS:BOARDSMISSING','ChibiOS/RT boards directory is missing.')
    else
        d=dir(fullfile(chibiOS_root,'boards'));
        % Get all of the file names in the boards directory.
        files={d(:).name};
        % Get everything that is a directory but does not start with '.'
        boards=sort(files([d(:).isdir]&~strncmpi(files,'.',1)));
        % Get the currently selected board
        board=slConfigUIGetVal(hDlg, hSrc,'ChibiOS_Target');
        if isempty(board)
            InitialValue=1;
        else
            InitialValue=find(strcmp(boards,board),1,'first');
            if isempty(InitialValue)
                InitialValue=1;
            end
        end
        % Prompt the user to select the board.
        [s,v]=listdlg('Name','Select Board','PromptString','Select a ChibiOS Development Board','SelectionMode','Single','InitialValue',InitialValue,'ListSize',[300 400],'ListString',boards);
        if v==0
            warning('CHIBIOS:BOARDCANCELED','ChibiOS/RT board selection canceled.')
        else
            board=boards{s};
            slConfigUISetEnabled(hDlg, hSrc, 'ChibiOS_Target', true);
            slConfigUISetVal(hDlg, hSrc,'ChibiOS_Target',board);
            slConfigUISetEnabled(hDlg, hSrc, 'ChibiOS_Target', false);
        end
    end
end
end
