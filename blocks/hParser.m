file1='halconf.h';
file2='hal_Config.tlc';

fid=fopen(file1,'r');
fid2=fopen(file2,'w');
[~,n]=fileparts(file2);

fprintf(fid2,'%%implements  %s "C"\n\n',n);
fprintf(fid2,'%%function BlockInstanceSetup(block, system) Output\n');
fprintf(fid2,'\t%%assign %s = LibCreateSourceFile("Header", "Custom", "%s")\n',n,n);
fprintf(fid2,'\t%%openfile tmpBuf\n');
% p=Simulink.Mask.get(gcbh);
while 1
    tline=fgetl(fid);
    if tline==-1, break, end
    result=regexp(tline,'#define[\s]+(?<name>[\w_]+)[\s]+(?<var>[\w_]+)','names');
    if length(result)==1
%         if strcmp(result.var,'TRUE')
%             p.addParameter('Name',result.name,'Prompt',result.name,'Type','checkbox','Value','on');
%         elseif strcmp(result.var,'FALSE')
%             p.addParameter('Name',result.name,'Prompt',result.name,'Type','checkbox','Value','off');
%         else
%             p.addParameter('Name',result.name,'Prompt',result.name,'Type','edit','Value',result.var,'Evaluate','off');
%         end
        fprintf(fid2,'%s\n',strrep(tline, result.var, sprintf('%%<block.ParamSettings.%s>',result.name)));
    else
        fprintf(fid2,'%s\n',tline);
    end
end
fprintf(fid2,'\t%%closefile tmpBuf\n');
fprintf(fid2,'%%<LibSetSourceFileSection(%s,"Defines",tmpBuf)>\n',n);
fprintf(fid2,'%%endfunction');
fclose(fid);
fclose(fid2);
fclose('all');