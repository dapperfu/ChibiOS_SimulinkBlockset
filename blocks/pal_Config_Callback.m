function pal_Config_Callback(block,i)
if nargin<1
    block=gcbh;
end
if nargin<2
    i=0:15;
end
i=reshape(i,1,length(i));

for q=i
    pal_Config_Port(block,q)
end

function pal_Config_Port(block,i)
block=get_param(block,'Handle');
blockPath=sprintf('%s/%s',get_param(block,'Parent'),get_param(block,'Name'));
sFcn=sprintf('%s/%s/%s',get_param(block,'Parent'),get_param(block,'Name'),'pal_Config');
portHandles=get_param(sFcn,'PortHandles');

port=get_param(block,'portName');
pin=sprintf('pin%d',i);
pad=sprintf('P%s%d',port,i);
padPath2  =sprintf('^P[\\w]%d$'     ,i);
termPath  =sprintf('%s_term'       ,pad);
termPath2 =sprintf('P[\\w]%d_term',i);
constPath =sprintf('%s_const'      ,pad);
constPath2=sprintf('P[\\w]%d_const',i);

setting=get_param(block,pin);
%% Left hand ports
padI  =find_system(blockPath,'FollowLinks','on','LookUnderMasks','all','BlockType','Inport','Name',pad);
padI2 =find_system(blockPath,'FollowLinks','on','RegExp','on','LookUnderMasks','all','BlockType','Inport','Name',padPath2);
const =find_system(blockPath,'FollowLinks','on','RegExp','on','LookUnderMasks','all','Name',constPath);
const2=find_system(blockPath,'FollowLinks','on','RegExp','on','LookUnderMasks','all','Name',constPath2);
switch setting
    case {'Disabled','Toggle','Input - No Pull','Input - Pull Up','Input - Pull Down'}
        if ~isempty(padI2)
            delete_block(padI2{1});
        end
        if isempty(const)
            if ~isempty(const2)
                delete_block(const2{1});
            end
            block=add_block('built-in/Constant',[blockPath '/' constPath]);
            pos=get(portHandles.Inport(i+1),'Position');
            set_param(block,'Position',[pos(1)-70 pos(2)-10 pos(1)-50 pos(2)+10]);
            set_param(block,'OutDataTypeStr','Inherit: Inherit via back propagation');
            line=get(portHandles.Inport(i+1),'Line');
            if line~=-1
                delete_line(line);
            end
            add_line(blockPath,sprintf('%s/1',constPath),sprintf('pal_Config/%d',i+1));
        end
    case {'Output - Open Drain','Output - Push Pull'}
        if ~isempty(const2)
            delete_block(const2{1});
        end
        if isempty(padI)
            if ~isempty(padI2)
                delete_block(padI2{1});
            end
            block=add_block('built-in/Inport',[blockPath '/' pad]);
            pos=get(portHandles.Inport(i+1),'Position');
            set_param(block,'Position',[pos(1)-70 pos(2)-10 pos(1)-50 pos(2)+10]);
            line=get(portHandles.Inport(i+1),'Line');
            if line~=-1
                delete_line(line);
            end
            add_line(blockPath,sprintf('%s/1',pad),sprintf('pal_Config/%d',i+1));
        end
    otherwise
        
end



%% Right hand ports
padO  =find_system(blockPath,'LookUnderMasks','all','BlockType','Outport','Name',pad);
padO2 =find_system(blockPath,'RegExp','on','LookUnderMasks','all','BlockType','Outport','Name',padPath2);
term  =find_system(blockPath,'RegExp','on','LookUnderMasks','all','Name',termPath);
term2 =find_system(blockPath,'RegExp','on','LookUnderMasks','all','Name',termPath2);
switch setting
    case {'Disabled','Toggle','Output - Open Drain','Output - Push Pull'}
        if ~isempty(padO2)
            delete_block(padO2{1});
        end
        if isempty(term)
            if ~isempty(term2)
                delete_block(term2{1});
            end
            block=add_block('built-in/Terminator',[blockPath '/' termPath]);
            pos=get(portHandles.Outport(i+1),'Position');
            set_param(block,'Position',[pos(1)+50 pos(2)-10 pos(1)+70 pos(2)+10]);
            line=get(portHandles.Outport(i+1),'Line');
            if line~=-1
                delete_line(line);
            end
            add_line(blockPath,sprintf('pal_Config/%d',i+1),sprintf('%s/1',termPath));
        end
    case {'Input - No Pull','Input - Pull Up','Input - Pull Down'}
        if ~isempty(term2)
            delete_block(term2{1});
        end
        if isempty(padO)
            if ~isempty(padO2)
                delete_block(padO2{1});
            end
            block=add_block('built-in/Outport',[blockPath '/' pad]);
            pos=get(portHandles.Outport(i+1),'Position');
            set_param(block,'Position',[pos(1)+50 pos(2)-10 pos(1)+70 pos(2)+10]);
            line=get(portHandles.Outport(i+1),'Line');
            if line~=-1
                delete_line(line);
            end
            add_line(blockPath,sprintf('pal_Config/%d',i+1),sprintf('%s/1',pad));
        end
    otherwise
        
end