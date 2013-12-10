if ~strcmpi(get(gcbh,'BlockType'),'M-S-Function');
    return;
end
Parameters=strrep(get(gcbh,'MaskPropertyNameString'),'|',',');
set(gcbh,'FunctionName',get(gcbh,'Name'));
set(gcbh,'Parameters',Parameters);
%%
% Get the mask of the current plot
p=Simulink.Mask.get(gcbh);
Parameters=p.Parameters;
%%
ParameterType={Parameters.Type};
ParameterPopup={Parameters.TypeOptions};
ParameterEvaluate={Parameters.Evaluate};
ParameterPrompts={Parameters.Prompt};
ParameterName={Parameters.Name};
ParameterTabName={Parameters.TabName};
%%
fid=fopen('WriteRTW.tmp','w');
fprintf(fid,'function WriteRTW(block)\n');
for i=1:numel(ParameterType)
    fprintf(fid,'%% %s\n',ParameterPrompts{i});
    switch ParameterType{i}
        case 'popup'
            if strcmpi(ParameterEvaluate{i},'on')
                fprintf(fid,'if ischar(block.DialogPrm(%d).Data)\n',i);
                fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', block.DialogPrm(%d).Data);\n','string',ParameterName{i},i);
                fprintf(fid,'else\n');
                fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', num2str(block.DialogPrm(%d).Data));\n','string',ParameterName{i},i);
                fprintf(fid,'end\n');
            else
                fprintf(fid,'switch block.DialogPrm(%d).Data\n',i);
                for j=1:numel(ParameterPopup{i})
                    fprintf(fid,'\tcase ''%s''\n',ParameterPopup{i}{j});
                    fprintf(fid,'\t\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',ParameterName{i},genvarname(ParameterPopup{i}{j}));
                end
                fprintf(fid,'end');
            end
        case 'edit'
            p.Parameters(i).Evaluate='off';
            fprintf(fid,'if ischar(block.DialogPrm(%d).Data)\n',i);
            fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', block.DialogPrm(%d).Data);\n','string',ParameterName{i},i);
            fprintf(fid,'else\n');
            fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', num2str(block.DialogPrm(%d).Data));\n','string',ParameterName{i},i);
            fprintf(fid,'end\n');
        case 'checkbox'
            % Force checkboxes to be evaluated.
            p.Parameters(i).Evaluate='on';
            fprintf(fid,'if block.DialogPrm(%d).Data\n',i);
            fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',ParameterName{i},'TRUE');
            fprintf(fid,'else\n');
            fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',ParameterName{i},'FALSE');
            fprintf(fid,'end\n');
        otherwise
            fprintf(fid,'%% Unknown ''%s''\n',ParameterType{i});
    end
    fprintf(fid,'\n');
end
%%
fclose(fid);
%%
fid=fopen('header.h','w');
fprintf(fid,'/*\n * %s\n */\n',ParameterTabName{1});
for i=1:numel(ParameterType)
    if i>1&&~strcmp(ParameterTabName{i-1},ParameterTabName{i})
        fprintf(fid,'\n/*\n * %s\n */\n',ParameterTabName{i});
    end
    fprintf(fid,'#define %-40s%%<block.ParamSettings.%s>\n',ParameterName{i},ParameterName{i});
end
fclose(fid);
%%
fclose('all');