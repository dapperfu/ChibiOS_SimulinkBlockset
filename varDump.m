function varDump(data,depth)
if nargin==1
    depth=0;
end
f=fieldnames(data);
for i=1:numel(f)
    doTab(depth);
    fprintf('%s:\t',f{i});
    try
        switch class(data.(f{i}))
            case 'char'
                fprintf('''%s''',data.(f{i}));
            case 'double'
                fprintf('%.2f ',data.(f{i}));
            otherwise
                try
                    f2=fieldnames(data.(f{i}));
                    varDump(data.(f{i}),depth+1);
                end
        end
    catch e
        fprintf('error');
    end
    fprintf('\n');
end

function doTab(depth)
for i=1:depth
    fprintf('\t');
end
