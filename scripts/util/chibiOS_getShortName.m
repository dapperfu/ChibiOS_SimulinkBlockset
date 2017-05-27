function path=ChibiOS_getShortName(path)
if iscell(path)
    for i=1:numel(path)
        path{i}=feval(mfilename,path{i});
    end
    return;
end
if ispc
    [~,path]=system(sprintf('for %%I in ("%s") do @echo %%~sI',path));
    % Remove the trailing new line
    path(path==10)='';
end