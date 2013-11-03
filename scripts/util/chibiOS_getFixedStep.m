function FixedStep = getFixedStep(modelName)
%Function called from tlc file to get solver FixedStep value defines for
%model modelName
	cset = getActiveConfigSet(modelName);
	FixedStep = cset.get_param ('FixedStep');
end
