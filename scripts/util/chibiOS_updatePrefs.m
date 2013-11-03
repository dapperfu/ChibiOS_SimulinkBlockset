function prefVal = updatePrefs(action,prefName,value)

% UPDATEPREFS for STM32F4xx preferences creation, modification ...

%   Copyright 2008-2010 The MathWorks, Inc.
%   $Revision: 1.1.6.2 $ $Date: 2010/09/13 16:02:47 $

%% groupName definition
groupName = 'STM32F4xx';

switch (action)
%% Set preferences
    case 'set', % set a preference's value
        error(nargchk(3,3,nargin));
        error(nargoutchk(0,0,nargout));
        if ~ispref(groupName) % STM32F4xx group is not present
            addpref(groupName,prefName,value);
        else % STM32F4xx group is present
            if ~ispref(groupName,prefName) % pref is not present
                addpref(groupName,prefName,value);
            else  % pref is not present
                setpref(groupName,prefName,value);
            end
        end
%% Get preferences        
    case 'get', % get a preference's value
        error(nargchk(2,2,nargin));
        error(nargoutchk(0,1,nargout));
        if ~ispref(groupName) % STM32F4xx group is not present
            prefVal = [];
        else % STM32F4xx group is present
            if ~ispref(groupName,prefName) % pref is not present
                prefVal = [];
            else  % pref is present
                prefVal = getpref(groupName,prefName);
            end
        end
%% Remove preferences        
    case 'remove', % remove a preference
        error(nargchk(2,2,nargin));
        error(nargoutchk(0,0,nargout));
        if ispref(groupName) % STM32F4xx group is present
            rmpref(groupName,prefName);
        end
%% Remove groupName        
    case 'rmgroup', % remove the STM32F4xx group
        error(nargchk(1,1,nargin));
        error(nargoutchk(0,0,nargout));
        if ispref(groupName) % STM32F4xx group is present
            rmpref(groupName);
        end
%% Error if other action        
    otherwise,
        lf_error('STM32F4xx:InvalidInputToFunc', action, 'updatePrefs');
end

% [EOF] updatePrefs.m
