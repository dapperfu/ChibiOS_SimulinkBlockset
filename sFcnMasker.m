if ~strcmpi(get(gcbh,'BlockType'),'M-S-Function');
    return;
end
Parameters=strrep(get(gcbh,'MaskPropertyNameString'),'|',',');
set(gcbh,'FunctionName',get(gcbh,'Name'));
set(gcbh,'Parameters',Parameters);
%%
MaskStyles=get(gcbh,'MaskStyles');
MaskPrompts=get(gcbh,'MaskPrompts');
MaskNames=get(gcbh,'MaskNames');
MaskTabNames=get(gcbh,'MaskTabNames');
%%
fid=fopen('WriteRTW.tmp','w');
fprintf(fid,'function WriteRTW(block)\n');
for i=1:numel(MaskStyles)
   switch MaskStyles{i}
       case 'edit'
           fprintf(fid,'%% %s\n',MaskPrompts{i});
           fprintf(fid,'if ischar(block.DialogPrm(%d).Data)\n',i);
           fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', block.DialogPrm(%d).Data);\n','string',MaskNames{i},i);
           fprintf(fid,'else\n');
           fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', num2str(block.DialogPrm(%d).Data));\n','string',MaskNames{i},i);
           fprintf(fid,'end\n');
       case 'checkbox'
           fprintf(fid,'%% %s\n',MaskPrompts{i});
           fprintf(fid,'if (block.DialogPrm(%d).Data)\n',i);
           fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',MaskNames{i},'TRUE');
           fprintf(fid,'else\n');
           fprintf(fid,'\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',MaskNames{i},'FALSE');
           fprintf(fid,'end\n');
       otherwise
   end
end
%%
fid=fopen('header.h','w');
%%
fprintf('/*\n * %s\n */\n',MaskTabNames{1});
for i=1:numel(MaskStyles)
    if i>1&&~strcmp(MaskTabNames{i-1},MaskTabNames{i})
        fprintf('\n/*\n * %s\n */\n',MaskTabNames{i});
    end
    fprintf('#define %-40s%%<block.ParamSettings.%s>\n',MaskNames{i},MaskNames{i});
end