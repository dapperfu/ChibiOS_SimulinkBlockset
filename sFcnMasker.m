if ~strcmpi(get(gcbh,'BlockType'),'M-S-Function');
    return;
end
Parameters=strrep(get(gcbh,'MaskPropertyNameString'),'|',',');
set(gcbh,'FunctionName',get(gcbh,'Name'));
set(gcbh,'Parameters',Parameters);

MaskStyles=get(gcbh,'MaskStyles');
MaskPrompts=get(gcbh,'MaskPrompts');
MaskNames=get(gcbh,'MaskNames');

fprintf('function WriteRTW(block)\n');
for i=1:numel(MaskStyles)
   switch MaskStyles{i}
       case 'edit'
           fprintf('%% %s\n',MaskPrompts{i});
           fprintf('if ischar(block.DialogPrm(%d).Data)\n',i);
           fprintf('\tblock.WriteRTWParam(''%s'',''%s'', block.DialogPrm(%d).Data);\n','string',MaskNames{i},i);
           fprintf('else\n');
           fprintf('\tblock.WriteRTWParam(''%s'',''%s'', num2str(block.DialogPrm(%d).Data));\n','string',MaskNames{i},i);
           fprintf('end\n');
       case 'checkbox'
           fprintf('%% %s\n',MaskPrompts{i});
           fprintf('if (block.DialogPrm(%d).Data)\n',i);
           fprintf('\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',MaskNames{i},'TRUE');
           fprintf('else\n');
           fprintf('\tblock.WriteRTWParam(''%s'',''%s'', ''%s'');\n','string',MaskNames{i},'FALSE');
           fprintf('end\n');
       otherwise
   end
end