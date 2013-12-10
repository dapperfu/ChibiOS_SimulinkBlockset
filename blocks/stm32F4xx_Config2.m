function stm32F4xx_Config2(block)
%MSFUNTMPL_BASIC A Template for a Level-2 MATLAB S-Function
%   The MATLAB S-function is written as a MATLAB function with the
%   same name as the S-function. Replace 'msfuntmpl_basic' with the
%   name of your S-function.
%
%   It should be noted that the MATLAB S-function is very similar
%   to Level-2 C-Mex S-functions. You should be able to get more
%   information for each of the block methods by referring to the
%   documentation for C-Mex S-functions.
%
%   Copyright 2003-2010 The MathWorks, Inc.

%%
%% The setup method is used to set up the basic attributes of the
%% S-function such as ports, parameters, etc. Do not add any other
%% calls to the main body of the function.
%%
setup(block);

%endfunction

function setup(block)
% Register number of ports
block.NumInputPorts  = 0;
block.NumOutputPorts = 0;
% Register number of dialog parameters
block.NumDialogPrms  = 195;
tmp = cell(1,block.NumDialogPrms);
for i=1:block.NumDialogPrms
    tmp{i}='Nontunable';
end
block.DialogPrmsTunable=tmp;
% Register sample times
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [-1 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Error out when saving or restoring the model sim state
block.SimStateCompliance = 'DefaultSimState';
%% -----------------------------------------------------------------
%% The MATLAB S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file. See comments
%% provided for each function for more information.
%% -----------------------------------------------------------------
block.RegBlockMethod('WriteRTW', @WriteRTW);
block.RegBlockMethod('Outputs', @nullFCN);     % Required
block.RegBlockMethod('Terminate', @nullFCN); % Required
block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);

%% Block runs on TLC in accelerator mode.
block.SetAccelRunOnTLC(true);

function nullFCN(~)

function DoPostPropSetup(block)
%% Register all tunable parameters as runtime parameters.
block.AutoRegRuntimePrms;

function WriteRTW(block)
% Enable PWR/RCC initialization in the HAL
if block.DialogPrm(1).Data
	block.WriteRTWParam('string','STM32_NO_INIT', 'TRUE');
else
	block.WriteRTWParam('string','STM32_NO_INIT', 'FALSE');
end

% Enable High Speed Internal (HSI) Clock Source
if block.DialogPrm(2).Data
	block.WriteRTWParam('string','STM32_HSI_ENABLED', 'TRUE');
else
	block.WriteRTWParam('string','STM32_HSI_ENABLED', 'FALSE');
end

% Enable Low Speed Internal (LSI) Clock Source
if block.DialogPrm(3).Data
	block.WriteRTWParam('string','STM32_LSI_ENABLED', 'TRUE');
else
	block.WriteRTWParam('string','STM32_LSI_ENABLED', 'FALSE');
end

% Enable High Speed External (HSE) Clock Source
if block.DialogPrm(4).Data
	block.WriteRTWParam('string','STM32_HSE_ENABLED', 'TRUE');
else
	block.WriteRTWParam('string','STM32_HSE_ENABLED', 'FALSE');
end

% Enable Low Speed External (LSE) Clock Source
if block.DialogPrm(5).Data
	block.WriteRTWParam('string','STM32_LSE_ENABLED', 'TRUE');
else
	block.WriteRTWParam('string','STM32_LSE_ENABLED', 'FALSE');
end

% Enable USB/SDIO clock setting
if block.DialogPrm(6).Data
	block.WriteRTWParam('string','STM32_CLOCK48_REQUIRED', 'TRUE');
else
	block.WriteRTWParam('string','STM32_CLOCK48_REQUIRED', 'FALSE');
end

% System Clock Setup
switch block.DialogPrm(7).Data
	case 'Internal High Speed Clock (HSI)'
		block.WriteRTWParam('string','STM32_SW', 'STM32_SW_HSI');
	case 'External High Speed Clock (HSE)'
		block.WriteRTWParam('string','STM32_SW', 'STM32_SW_HSE');
	case 'Phase locked Loop (PLL)'
		block.WriteRTWParam('string','STM32_SW', 'STM32_SW_PLL');
end
% PLL Clock Source
switch block.DialogPrm(8).Data
	case 'Internal High Speed Clock (HSI)'
		block.WriteRTWParam('string','STM32_PLLSRC', 'STM32_PLLSRC_HSI');
	case 'External High Speed Clock (HSE)'
		block.WriteRTWParam('string','STM32_PLLSRC', 'STM32_PLLSRC_HSE');
end
% Divisor for PLL VCO input clock (STM32_PLLM_VALUE)
if ischar(block.DialogPrm(9).Data)
	block.WriteRTWParam('string','STM32_PLLM_VALUE', block.DialogPrm(9).Data);
else
	block.WriteRTWParam('string','STM32_PLLM_VALUE', num2str(block.DialogPrm(9).Data));
end

% Multiplier for PLL VCO output clock (STM32_PLLN_VALUE)
if ischar(block.DialogPrm(10).Data)
	block.WriteRTWParam('string','STM32_PLLN_VALUE', block.DialogPrm(10).Data);
else
	block.WriteRTWParam('string','STM32_PLLN_VALUE', num2str(block.DialogPrm(10).Data));
end

% PLL Divisor for main system clock (STM32_PLLP_VALUE)
if ischar(block.DialogPrm(11).Data)
	block.WriteRTWParam('string','STM32_PLLP_VALUE', block.DialogPrm(11).Data);
else
	block.WriteRTWParam('string','STM32_PLLP_VALUE', num2str(block.DialogPrm(11).Data));
end

% PLL Divisor for OTG FS, SDIO and RNG clocks (STM32_PLLQ_VALUE)
if ischar(block.DialogPrm(12).Data)
	block.WriteRTWParam('string','STM32_PLLQ_VALUE', block.DialogPrm(12).Data);
else
	block.WriteRTWParam('string','STM32_PLLQ_VALUE', num2str(block.DialogPrm(12).Data));
end

% Advanced High Performance Bus Prescaler Value (AHB)
block.WriteRTWParam('string','STM32_HPRE', sprintf('STM32_HPRE_DIV%.0f',block.DialogPrm(13).Data));

% Low Speed Advanced Peripherial Bus Prescaler Value (AHB1)
block.WriteRTWParam('string','STM32_PPRE1', sprintf('STM32_PPRE1_DIV%.0f',block.DialogPrm(14).Data));

% High Speed Advanced Peripherial Bus Prescaler Value (AHB2)
block.WriteRTWParam('string','STM32_PPRE2', sprintf('STM32_PPRE2_DIV%.0f',block.DialogPrm(15).Data));

% RTC Clock Source
switch block.DialogPrm(16).Data
	case 'No RTC source'
		block.WriteRTWParam('string','STM32_RTCSEL', 'STM32_RTC_NOCLOCK');
	case 'LSE'
		block.WriteRTWParam('string','STM32_RTCSEL', 'STM32_RTC_LSE');
	case 'LSI'
		block.WriteRTWParam('string','STM32_RTCSEL', 'STM32_RTC_LSI');
	case 'HSE divided by programmable prescaler'
		block.WriteRTWParam('string','STM32_RTCSEL', 'STM32_RTC_HSE');
end

% RTC HSE prescaler value
if ischar(block.DialogPrm(17).Data)
	block.WriteRTWParam('string','STM32_RTCPRE_VALUE', block.DialogPrm(17).Data);
else
	block.WriteRTWParam('string','STM32_RTCPRE_VALUE', num2str(block.DialogPrm(17).Data));
end

% MC01 clock source value
switch block.DialogPrm(18).Data
	case 'HSI clock on MCO1 pin'
		block.WriteRTWParam('string','STM32_MCO1SEL', 'STM32_MCO1SEL_HSI');
	case 'LSE clock on MCO1 pin'
		block.WriteRTWParam('string','STM32_MCO1SEL', 'STM32_MCO1SEL_LSE');
	case 'HSE clock on MCO1 pin'
		block.WriteRTWParam('string','STM32_MCO1SEL', 'STM32_MCO1SEL_HSE');
	case 'PLL clock on MCO1 pin'
		block.WriteRTWParam('string','STM32_MCO1SEL', 'STM32_MCO1SEL_PLL');
end
% MC01 prescaler value
block.WriteRTWParam('string','STM32_MCO1PRE', sprintf('STM32_MCO1PRE_DIV%.0f',block.DialogPrm(19).Data));

% MC02 clock source value
switch block.DialogPrm(20).Data
	case 'SYSCLK clock on MCO2 pin'
		block.WriteRTWParam('string','STM32_MCO2SEL', 'STM32_MCO2SEL_SYSCLK');
	case 'PLLI2S clock on MCO2 pin'
		block.WriteRTWParam('string','STM32_MCO2SEL', 'STM32_MCO2SEL_PLLI2S');
	case 'HSE clock on MCO2 pin'
		block.WriteRTWParam('string','STM32_MCO2SEL', 'STM32_MCO2SEL_HSE');
	case 'PLL clock on MCO2 pin'
		block.WriteRTWParam('string','STM32_MCO2SEL', 'STM32_MCO2SEL_PLL');
end
% MC02 prescaler value
if ischar(block.DialogPrm(21).Data)
	block.WriteRTWParam('string','STM32_MCO2PRE', block.DialogPrm(21).Data);
else
	block.WriteRTWParam('string','STM32_MCO2PRE', num2str(block.DialogPrm(21).Data));
end

% I2S clock source
switch block.DialogPrm(22).Data
	case 'I2S PLL'
		block.WriteRTWParam('string','STM32_I2SSRC', 'I2SPLL');
	case 'CKIN'
		block.WriteRTWParam('string','STM32_I2SSRC', 'CKIN');
end
% Multiplier for PLLI2S VCO output clock
if ischar(block.DialogPrm(23).Data)
	block.WriteRTWParam('string','STM32_PLLI2SN_VALUE', block.DialogPrm(23).Data);
else
	block.WriteRTWParam('string','STM32_PLLI2SN_VALUE', num2str(block.DialogPrm(23).Data));
end

% Divisor for I2S clock
if ischar(block.DialogPrm(24).Data)
	block.WriteRTWParam('string','STM32_PLLI2SR_VALUE', block.DialogPrm(24).Data);
else
	block.WriteRTWParam('string','STM32_PLLI2SR_VALUE', num2str(block.DialogPrm(24).Data));
end

% Core Voltage
block.WriteRTWParam('string','STM32_VOS', block.DialogPrm(25).Data);

% Enable Programmable Voltage Detector
if block.DialogPrm(26).Data
	block.WriteRTWParam('string','STM32_PVD_ENABLE', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PVD_ENABLE', 'FALSE');
end

% Voltage Level for Programmable Voltage Detector (Rising/Falling)
switch block.DialogPrm(27).Data
	case 'Level 0: 214/204 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV0');
	case 'Level 1: 230/219 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV1');
	case 'Level 2: 245/235 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV2');
	case 'Level 3: 251/260 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV3');
	case 'Level 4: 276/266 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV4');
	case 'Level 5: 293/284 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV5');
	case 'Level 6: 303/293 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV6');
	case 'Level 7: 314/303 mV'
		block.WriteRTWParam('string','STM32_PLS', 'STM32_PLS_LEV7');
end
% ADC common clock divider
block.WriteRTWParam('string','STM32_ADC_ADCPRE', sprintf('STM32_RTCPRE_DIV%.0f',block.DialogPrm(28).Data));

% ADC interrupt priority level setting
if ischar(block.DialogPrm(29).Data)
	block.WriteRTWParam('string','STM32_ADC_IRQ_PRIORITY', block.DialogPrm(29).Data);
else
	block.WriteRTWParam('string','STM32_ADC_IRQ_PRIORITY', num2str(block.DialogPrm(29).Data));
end

% Enable ACD1
if block.DialogPrm(30).Data
	block.WriteRTWParam('string','STM32_ADC_USE_ADC1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ADC_USE_ADC1', 'FALSE');
end

% DMA stream used for ADC1 operations
if ischar(block.DialogPrm(31).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC1_DMA_STREAM', block.DialogPrm(31).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC1_DMA_STREAM', num2str(block.DialogPrm(31).Data));
end

% ADC1 DMA Priority
if ischar(block.DialogPrm(32).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC1_DMA_PRIORITY', block.DialogPrm(32).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC1_DMA_PRIORITY', num2str(block.DialogPrm(32).Data));
end

% ADC1 DMA interrupt priority level setting
if ischar(block.DialogPrm(33).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC1_DMA_IRQ_PRIORITY', block.DialogPrm(33).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC1_DMA_IRQ_PRIORITY', num2str(block.DialogPrm(33).Data));
end

% Enable ADC2
if block.DialogPrm(34).Data
	block.WriteRTWParam('string','STM32_ADC_USE_ADC2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ADC_USE_ADC2', 'FALSE');
end

% DMA stream used for ADC2 operations
if ischar(block.DialogPrm(35).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC2_DMA_STREAM', block.DialogPrm(35).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC2_DMA_STREAM', num2str(block.DialogPrm(35).Data));
end

% ADC2 DMA Priority
if ischar(block.DialogPrm(36).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC2_DMA_PRIORITY', block.DialogPrm(36).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC2_DMA_PRIORITY', num2str(block.DialogPrm(36).Data));
end

% ADC2 DMA interrupt priority level setting
if ischar(block.DialogPrm(37).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC2_DMA_IRQ_PRIORITY', block.DialogPrm(37).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC2_DMA_IRQ_PRIORITY', num2str(block.DialogPrm(37).Data));
end

% Enable ACD3
if block.DialogPrm(38).Data
	block.WriteRTWParam('string','STM32_ADC_USE_ADC3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ADC_USE_ADC3', 'FALSE');
end

% DMA stream used for ADC3 operations
if ischar(block.DialogPrm(39).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC3_DMA_STREAM', block.DialogPrm(39).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC3_DMA_STREAM', num2str(block.DialogPrm(39).Data));
end

% ADC3 DMA Priority
if ischar(block.DialogPrm(40).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC3_DMA_PRIORITY', block.DialogPrm(40).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC3_DMA_PRIORITY', num2str(block.DialogPrm(40).Data));
end

% ADC3 DMA interrupt priority level setting
if ischar(block.DialogPrm(41).Data)
	block.WriteRTWParam('string','STM32_ADC_ADC3_DMA_IRQ_PRIORITY', block.DialogPrm(41).Data);
else
	block.WriteRTWParam('string','STM32_ADC_ADC3_DMA_IRQ_PRIORITY', num2str(block.DialogPrm(41).Data));
end

% Use CAN1
if block.DialogPrm(42).Data
	block.WriteRTWParam('string','STM32_CAN_USE_CAN1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_CAN_USE_CAN1', 'FALSE');
end

% CAN1 IRQ Priority
if ischar(block.DialogPrm(43).Data)
	block.WriteRTWParam('string','STM32_CAN_CAN1_IRQ_PRIORITY', block.DialogPrm(43).Data);
else
	block.WriteRTWParam('string','STM32_CAN_CAN1_IRQ_PRIORITY', num2str(block.DialogPrm(43).Data));
end

% Use CAN2
if block.DialogPrm(44).Data
	block.WriteRTWParam('string','STM32_CAN_USE_CAN2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_CAN_USE_CAN2', 'FALSE');
end

% CAN2 IRQ Priority
if ischar(block.DialogPrm(45).Data)
	block.WriteRTWParam('string','STM32_CAN_CAN2_IRQ_PRIORITY', block.DialogPrm(45).Data);
else
	block.WriteRTWParam('string','STM32_CAN_CAN2_IRQ_PRIORITY', num2str(block.DialogPrm(45).Data));
end

% EXT0 IRQ Priority
if ischar(block.DialogPrm(46).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI0_IRQ_PRIORITY', block.DialogPrm(46).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI0_IRQ_PRIORITY', num2str(block.DialogPrm(46).Data));
end

% EXT1 IRQ Priority
if ischar(block.DialogPrm(47).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI1_IRQ_PRIORITY', block.DialogPrm(47).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI1_IRQ_PRIORITY', num2str(block.DialogPrm(47).Data));
end

% EXT2 IRQ Priority
if ischar(block.DialogPrm(48).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI2_IRQ_PRIORITY', block.DialogPrm(48).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI2_IRQ_PRIORITY', num2str(block.DialogPrm(48).Data));
end

% EXT3 IRQ Priority
if ischar(block.DialogPrm(49).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI3_IRQ_PRIORITY', block.DialogPrm(49).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI3_IRQ_PRIORITY', num2str(block.DialogPrm(49).Data));
end

% EXT4 IRQ Priority
if ischar(block.DialogPrm(50).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI4_IRQ_PRIORITY', block.DialogPrm(50).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI4_IRQ_PRIORITY', num2str(block.DialogPrm(50).Data));
end

% EXT5-9 IRQ Priority
if ischar(block.DialogPrm(51).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI5_9_IRQ_PRIORITY', block.DialogPrm(51).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI5_9_IRQ_PRIORITY', num2str(block.DialogPrm(51).Data));
end

% EXT10-15 IRQ Priority
if ischar(block.DialogPrm(52).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI10_15_IRQ_PRIORITY', block.DialogPrm(52).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI10_15_IRQ_PRIORITY', num2str(block.DialogPrm(52).Data));
end

% EXT16 IRQ Priority
if ischar(block.DialogPrm(53).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI16_IRQ_PRIORITY', block.DialogPrm(53).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI16_IRQ_PRIORITY', num2str(block.DialogPrm(53).Data));
end

% EXT17 IRQ Priority
if ischar(block.DialogPrm(54).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI17_IRQ_PRIORITY', block.DialogPrm(54).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI17_IRQ_PRIORITY', num2str(block.DialogPrm(54).Data));
end

% EXT18 IRQ Priority
if ischar(block.DialogPrm(55).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI18_IRQ_PRIORITY', block.DialogPrm(55).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI18_IRQ_PRIORITY', num2str(block.DialogPrm(55).Data));
end

% EXT19 IRQ Priority
if ischar(block.DialogPrm(56).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI19_IRQ_PRIORITY', block.DialogPrm(56).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI19_IRQ_PRIORITY', num2str(block.DialogPrm(56).Data));
end

% EXT20 IRQ Priority
if ischar(block.DialogPrm(57).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI20_IRQ_PRIORITY', block.DialogPrm(57).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI20_IRQ_PRIORITY', num2str(block.DialogPrm(57).Data));
end

% EXT21 IRQ Priority
if ischar(block.DialogPrm(58).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI21_IRQ_PRIORITY', block.DialogPrm(58).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI21_IRQ_PRIORITY', num2str(block.DialogPrm(58).Data));
end

% EXT22 IRQ Priority
if ischar(block.DialogPrm(59).Data)
	block.WriteRTWParam('string','STM32_EXT_EXTI22_IRQ_PRIORITY', block.DialogPrm(59).Data);
else
	block.WriteRTWParam('string','STM32_EXT_EXTI22_IRQ_PRIORITY', num2str(block.DialogPrm(59).Data));
end

% GPT Use Timer 1
if block.DialogPrm(60).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM1', 'FALSE');
end

% GPT Timer 1 IRQ Priority
if ischar(block.DialogPrm(61).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM1_IRQ_PRIORITY', block.DialogPrm(61).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM1_IRQ_PRIORITY', num2str(block.DialogPrm(61).Data));
end

% GPT Use Timer 2
if block.DialogPrm(62).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM2', 'FALSE');
end

% GPT Timer 2 IRQ Priority
if ischar(block.DialogPrm(63).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM2_IRQ_PRIORITY', block.DialogPrm(63).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM2_IRQ_PRIORITY', num2str(block.DialogPrm(63).Data));
end

% GPT Use Timer 3
if block.DialogPrm(64).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM3', 'FALSE');
end

% GPT Timer 3 IRQ Priority
if ischar(block.DialogPrm(65).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM3_IRQ_PRIORITY', block.DialogPrm(65).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM3_IRQ_PRIORITY', num2str(block.DialogPrm(65).Data));
end

% GPT Use Timer 4
if block.DialogPrm(66).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM4', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM4', 'FALSE');
end

% GPT Timer 4 IRQ Priority
if ischar(block.DialogPrm(67).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM4_IRQ_PRIORITY', block.DialogPrm(67).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM4_IRQ_PRIORITY', num2str(block.DialogPrm(67).Data));
end

% GPT Use Timer 5
if block.DialogPrm(68).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM5', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM5', 'FALSE');
end

% GPT Timer 5 IRQ Priority
if ischar(block.DialogPrm(69).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM5_IRQ_PRIORITY', block.DialogPrm(69).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM5_IRQ_PRIORITY', num2str(block.DialogPrm(69).Data));
end

% GPT Use Timer 6
if block.DialogPrm(70).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM6', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM6', 'FALSE');
end

% GPT Timer 6 IRQ Priority
if ischar(block.DialogPrm(71).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM6_IRQ_PRIORITY', block.DialogPrm(71).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM6_IRQ_PRIORITY', num2str(block.DialogPrm(71).Data));
end

% GPT Use Timer 7
if block.DialogPrm(72).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM7', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM7', 'FALSE');
end

% GPT Timer 7 IRQ Priority
if ischar(block.DialogPrm(73).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM7_IRQ_PRIORITY', block.DialogPrm(73).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM7_IRQ_PRIORITY', num2str(block.DialogPrm(73).Data));
end

% GPT Use Timer 8
if block.DialogPrm(74).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM8', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM8', 'FALSE');
end

% GPT Timer 8 IRQ Priority
if ischar(block.DialogPrm(75).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM8_IRQ_PRIORITY', block.DialogPrm(75).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM8_IRQ_PRIORITY', num2str(block.DialogPrm(75).Data));
end

% GPT Use Timer 9
if block.DialogPrm(76).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM9', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM9', 'FALSE');
end

% GPT Timer 9 IRQ Priority
if ischar(block.DialogPrm(77).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM9_IRQ_PRIORITY', block.DialogPrm(77).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM9_IRQ_PRIORITY', num2str(block.DialogPrm(77).Data));
end

% GPT Use Timer 11
if block.DialogPrm(78).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM11', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM11', 'FALSE');
end

% GPT Timer 11 IRQ Priority
if ischar(block.DialogPrm(79).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM11_IRQ_PRIORITY', block.DialogPrm(79).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM11_IRQ_PRIORITY', num2str(block.DialogPrm(79).Data));
end

% GPT Use Timer 12
if block.DialogPrm(80).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM12', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM12', 'FALSE');
end

% GPT Timer 12 IRQ Priority
if ischar(block.DialogPrm(81).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM12_IRQ_PRIORITY', block.DialogPrm(81).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM12_IRQ_PRIORITY', num2str(block.DialogPrm(81).Data));
end

% GPT Use Timer 14
if block.DialogPrm(82).Data
	block.WriteRTWParam('string','STM32_GPT_USE_TIM14', 'TRUE');
else
	block.WriteRTWParam('string','STM32_GPT_USE_TIM14', 'FALSE');
end

% GPT Timer 14 IRQ Priority
if ischar(block.DialogPrm(83).Data)
	block.WriteRTWParam('string','STM32_GPT_TIM14_IRQ_PRIORITY', block.DialogPrm(83).Data);
else
	block.WriteRTWParam('string','STM32_GPT_TIM14_IRQ_PRIORITY', num2str(block.DialogPrm(83).Data));
end

% Enable I2C 1
if block.DialogPrm(84).Data
	block.WriteRTWParam('string','STM32_I2C_USE_I2C1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_I2C_USE_I2C1', 'FALSE');
end

% I2C 1 Rx DMA Stream
if ischar(block.DialogPrm(85).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C1_RX_DMA_STREAM', block.DialogPrm(85).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C1_RX_DMA_STREAM', num2str(block.DialogPrm(85).Data));
end

% I2C 1 Tx DMA Stream
if ischar(block.DialogPrm(86).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C1_TX_DMA_STREAM', block.DialogPrm(86).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C1_TX_DMA_STREAM', num2str(block.DialogPrm(86).Data));
end

% I2C 1 IRQ Priority
if ischar(block.DialogPrm(87).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C1_IRQ_PRIORITY', block.DialogPrm(87).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C1_IRQ_PRIORITY', num2str(block.DialogPrm(87).Data));
end

% I2C 1 DMA Priority
switch block.DialogPrm(88).Data
	case '0'
		block.WriteRTWParam('string','STM32_I2C_I2C1_DMA_PRIORITY', 'x0');
	case '1'
		block.WriteRTWParam('string','STM32_I2C_I2C1_DMA_PRIORITY', 'x1');
	case '2'
		block.WriteRTWParam('string','STM32_I2C_I2C1_DMA_PRIORITY', 'x2');
	case '3'
		block.WriteRTWParam('string','STM32_I2C_I2C1_DMA_PRIORITY', 'x3');
end
% I2C 1 DMA Error Hook
if ischar(block.DialogPrm(89).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C1_DMA_ERROR_HOOK', block.DialogPrm(89).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C1_DMA_ERROR_HOOK', num2str(block.DialogPrm(89).Data));
end

% Enable I2C 2
if block.DialogPrm(90).Data
	block.WriteRTWParam('string','STM32_I2C_USE_I2C2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_I2C_USE_I2C2', 'FALSE');
end

% I2C 2 Rx DMA Stream
if ischar(block.DialogPrm(91).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C2_RX_DMA_STREAM', block.DialogPrm(91).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C2_RX_DMA_STREAM', num2str(block.DialogPrm(91).Data));
end

% I2C 2 Tx DMA Stream
if ischar(block.DialogPrm(92).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C2_TX_DMA_STREAM', block.DialogPrm(92).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C2_TX_DMA_STREAM', num2str(block.DialogPrm(92).Data));
end

% I2C 2 IRQ Priority
if ischar(block.DialogPrm(93).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C2_IRQ_PRIORITY', block.DialogPrm(93).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C2_IRQ_PRIORITY', num2str(block.DialogPrm(93).Data));
end

% I2C 2 DMA Priority
switch block.DialogPrm(94).Data
	case '0'
		block.WriteRTWParam('string','STM32_I2C_I2C2_DMA_PRIORITY', 'x0');
	case '1'
		block.WriteRTWParam('string','STM32_I2C_I2C2_DMA_PRIORITY', 'x1');
	case '2'
		block.WriteRTWParam('string','STM32_I2C_I2C2_DMA_PRIORITY', 'x2');
	case '3'
		block.WriteRTWParam('string','STM32_I2C_I2C2_DMA_PRIORITY', 'x3');
end
% I2C 2 DMA Error Hook
if ischar(block.DialogPrm(95).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C2_DMA_ERROR_HOOK', block.DialogPrm(95).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C2_DMA_ERROR_HOOK', num2str(block.DialogPrm(95).Data));
end

% Enable I2C 3
if block.DialogPrm(96).Data
	block.WriteRTWParam('string','STM32_I2C_USE_I2C3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_I2C_USE_I2C3', 'FALSE');
end

% I2C 3 Rx DMA Stream
if ischar(block.DialogPrm(97).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C3_RX_DMA_STREAM', block.DialogPrm(97).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C3_RX_DMA_STREAM', num2str(block.DialogPrm(97).Data));
end

% I2C 3 Tx DMA Stream
if ischar(block.DialogPrm(98).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C3_TX_DMA_STREAM', block.DialogPrm(98).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C3_TX_DMA_STREAM', num2str(block.DialogPrm(98).Data));
end

% I2C 3 IRQ Priority
if ischar(block.DialogPrm(99).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C3_IRQ_PRIORITY', block.DialogPrm(99).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C3_IRQ_PRIORITY', num2str(block.DialogPrm(99).Data));
end

% I2C 3 DMA Priority
switch block.DialogPrm(100).Data
	case '0'
		block.WriteRTWParam('string','STM32_I2C_I2C3_DMA_PRIORITY', 'x0');
	case '1'
		block.WriteRTWParam('string','STM32_I2C_I2C3_DMA_PRIORITY', 'x1');
	case '2'
		block.WriteRTWParam('string','STM32_I2C_I2C3_DMA_PRIORITY', 'x2');
	case '3'
		block.WriteRTWParam('string','STM32_I2C_I2C3_DMA_PRIORITY', 'x3');
end
% I2C 3 DMA Error Hook
if ischar(block.DialogPrm(101).Data)
	block.WriteRTWParam('string','STM32_I2C_I2C3_DMA_ERROR_HOOK', block.DialogPrm(101).Data);
else
	block.WriteRTWParam('string','STM32_I2C_I2C3_DMA_ERROR_HOOK', num2str(block.DialogPrm(101).Data));
end

% ICU Use Timer 1
if block.DialogPrm(102).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM1', 'FALSE');
end

% ICU Timer 1 IRQ Priority
if ischar(block.DialogPrm(103).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM1_IRQ_PRIORITY', block.DialogPrm(103).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM1_IRQ_PRIORITY', num2str(block.DialogPrm(103).Data));
end

% ICU Use Timer 2
if block.DialogPrm(104).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM2', 'FALSE');
end

% ICU Timer 2 IRQ Priority
if ischar(block.DialogPrm(105).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM2_IRQ_PRIORITY', block.DialogPrm(105).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM2_IRQ_PRIORITY', num2str(block.DialogPrm(105).Data));
end

% ICU Use Timer 3
if block.DialogPrm(106).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM3', 'FALSE');
end

% ICU Timer 3 IRQ Priority
if ischar(block.DialogPrm(107).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM3_IRQ_PRIORITY', block.DialogPrm(107).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM3_IRQ_PRIORITY', num2str(block.DialogPrm(107).Data));
end

% ICU Use Timer 4
if block.DialogPrm(108).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM4', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM4', 'FALSE');
end

% ICU Timer 4 IRQ Priority
if ischar(block.DialogPrm(109).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM4_IRQ_PRIORITY', block.DialogPrm(109).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM4_IRQ_PRIORITY', num2str(block.DialogPrm(109).Data));
end

% ICU Use Timer 5
if block.DialogPrm(110).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM5', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM5', 'FALSE');
end

% ICU Timer 5 IRQ Priority
if ischar(block.DialogPrm(111).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM5_IRQ_PRIORITY', block.DialogPrm(111).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM5_IRQ_PRIORITY', num2str(block.DialogPrm(111).Data));
end

% ICU Use Timer 8
if block.DialogPrm(112).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM8', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM8', 'FALSE');
end

% ICU Timer 8 IRQ Priority
if ischar(block.DialogPrm(113).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM8_IRQ_PRIORITY', block.DialogPrm(113).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM8_IRQ_PRIORITY', num2str(block.DialogPrm(113).Data));
end

% ICU Use Timer 9
if block.DialogPrm(114).Data
	block.WriteRTWParam('string','STM32_ICU_USE_TIM9', 'TRUE');
else
	block.WriteRTWParam('string','STM32_ICU_USE_TIM9', 'FALSE');
end

% ICU Timer 9 IRQ Priority
if ischar(block.DialogPrm(115).Data)
	block.WriteRTWParam('string','STM32_ICU_TIM9_IRQ_PRIORITY', block.DialogPrm(115).Data);
else
	block.WriteRTWParam('string','STM32_ICU_TIM9_IRQ_PRIORITY', num2str(block.DialogPrm(115).Data));
end

% MAC Transmit Buffers
if ischar(block.DialogPrm(116).Data)
	block.WriteRTWParam('string','STM32_MAC_TRANSMIT_BUFFERS', block.DialogPrm(116).Data);
else
	block.WriteRTWParam('string','STM32_MAC_TRANSMIT_BUFFERS', num2str(block.DialogPrm(116).Data));
end

% MAC Receive Buffers
if ischar(block.DialogPrm(117).Data)
	block.WriteRTWParam('string','STM32_MAC_RECEIVE_BUFFERS', block.DialogPrm(117).Data);
else
	block.WriteRTWParam('string','STM32_MAC_RECEIVE_BUFFERS', num2str(block.DialogPrm(117).Data));
end

% MAC Buffer Size
if ischar(block.DialogPrm(118).Data)
	block.WriteRTWParam('string','STM32_MAC_BUFFERS_SIZE', block.DialogPrm(118).Data);
else
	block.WriteRTWParam('string','STM32_MAC_BUFFERS_SIZE', num2str(block.DialogPrm(118).Data));
end

% MAC Timeout
if ischar(block.DialogPrm(119).Data)
	block.WriteRTWParam('string','STM32_MAC_PHY_TIMEOUT', block.DialogPrm(119).Data);
else
	block.WriteRTWParam('string','STM32_MAC_PHY_TIMEOUT', num2str(block.DialogPrm(119).Data));
end

% MAC Eth1 Change Phy State
if block.DialogPrm(120).Data
	block.WriteRTWParam('string','STM32_MAC_ETH1_CHANGE_PHY_STATE', 'TRUE');
else
	block.WriteRTWParam('string','STM32_MAC_ETH1_CHANGE_PHY_STATE', 'FALSE');
end

% MAC ETh1 IRQ Priority
if ischar(block.DialogPrm(121).Data)
	block.WriteRTWParam('string','STM32_MAC_ETH1_IRQ_PRIORITY', block.DialogPrm(121).Data);
else
	block.WriteRTWParam('string','STM32_MAC_ETH1_IRQ_PRIORITY', num2str(block.DialogPrm(121).Data));
end

% MAC IP Checksum Offload
if ischar(block.DialogPrm(122).Data)
	block.WriteRTWParam('string','STM32_MAC_IP_CHECKSUM_OFFLOAD', block.DialogPrm(122).Data);
else
	block.WriteRTWParam('string','STM32_MAC_IP_CHECKSUM_OFFLOAD', num2str(block.DialogPrm(122).Data));
end

% Enable Advanced PWM Timer Features
if block.DialogPrm(123).Data
	block.WriteRTWParam('string','STM32_PWM_USE_ADVANCED', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_ADVANCED', 'FALSE');
end

% PWM Use Timer 1
if block.DialogPrm(124).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM1', 'FALSE');
end

% PWM Timer 1 IRQ Priority
if ischar(block.DialogPrm(125).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM1_IRQ_PRIORITY', block.DialogPrm(125).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM1_IRQ_PRIORITY', num2str(block.DialogPrm(125).Data));
end

% PWM Use Timer 2
if block.DialogPrm(126).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM2', 'FALSE');
end

% PWM Timer 2 IRQ Priority
if ischar(block.DialogPrm(127).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM2_IRQ_PRIORITY', block.DialogPrm(127).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM2_IRQ_PRIORITY', num2str(block.DialogPrm(127).Data));
end

% PWM Use Timer 3
if block.DialogPrm(128).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM3', 'FALSE');
end

% PWM Timer 3 IRQ Priority
if ischar(block.DialogPrm(129).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM3_IRQ_PRIORITY', block.DialogPrm(129).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM3_IRQ_PRIORITY', num2str(block.DialogPrm(129).Data));
end

% PWM Use Timer 4
if block.DialogPrm(130).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM4', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM4', 'FALSE');
end

% PWM Timer 4 IRQ Priority
if ischar(block.DialogPrm(131).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM4_IRQ_PRIORITY', block.DialogPrm(131).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM4_IRQ_PRIORITY', num2str(block.DialogPrm(131).Data));
end

% PWM Use Timer 5
if block.DialogPrm(132).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM5', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM5', 'FALSE');
end

% PWM Timer 5 IRQ Priority
if ischar(block.DialogPrm(133).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM5_IRQ_PRIORITY', block.DialogPrm(133).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM5_IRQ_PRIORITY', num2str(block.DialogPrm(133).Data));
end

% PWM Use Timer 8
if block.DialogPrm(134).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM8', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM8', 'FALSE');
end

% PWM Timer 8 IRQ Priority
if ischar(block.DialogPrm(135).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM8_IRQ_PRIORITY', block.DialogPrm(135).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM8_IRQ_PRIORITY', num2str(block.DialogPrm(135).Data));
end

% PWM Use Timer 9
if block.DialogPrm(136).Data
	block.WriteRTWParam('string','STM32_PWM_USE_TIM9', 'TRUE');
else
	block.WriteRTWParam('string','STM32_PWM_USE_TIM9', 'FALSE');
end

% PWM Timer 9 IRQ Priority
if ischar(block.DialogPrm(137).Data)
	block.WriteRTWParam('string','STM32_PWM_TIM9_IRQ_PRIORITY', block.DialogPrm(137).Data);
else
	block.WriteRTWParam('string','STM32_PWM_TIM9_IRQ_PRIORITY', num2str(block.DialogPrm(137).Data));
end

% Enable Serial USART1
if block.DialogPrm(138).Data
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART1', 'FALSE');
end

% USART1 IRQ Priority
if ischar(block.DialogPrm(139).Data)
	block.WriteRTWParam('string','STM32_SERIAL_USART1_PRIORITY', block.DialogPrm(139).Data);
else
	block.WriteRTWParam('string','STM32_SERIAL_USART1_PRIORITY', num2str(block.DialogPrm(139).Data));
end

% Enable Serial USART2
if block.DialogPrm(140).Data
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART2', 'FALSE');
end

% USART2 IRQ Priority
if ischar(block.DialogPrm(141).Data)
	block.WriteRTWParam('string','STM32_SERIAL_USART2_PRIORITY', block.DialogPrm(141).Data);
else
	block.WriteRTWParam('string','STM32_SERIAL_USART2_PRIORITY', num2str(block.DialogPrm(141).Data));
end

% Enable Serial USART3
if block.DialogPrm(142).Data
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART3', 'FALSE');
end

% USART3 IRQ Priority
if ischar(block.DialogPrm(143).Data)
	block.WriteRTWParam('string','STM32_SERIAL_USART3_PRIORITY', block.DialogPrm(143).Data);
else
	block.WriteRTWParam('string','STM32_SERIAL_USART3_PRIORITY', num2str(block.DialogPrm(143).Data));
end

% Enable Serial UART4
if block.DialogPrm(144).Data
	block.WriteRTWParam('string','STM32_SERIAL_USE_UART4', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SERIAL_USE_UART4', 'FALSE');
end

% UART4 IRQ Priority
if ischar(block.DialogPrm(145).Data)
	block.WriteRTWParam('string','STM32_SERIAL_UART4_PRIORITY', block.DialogPrm(145).Data);
else
	block.WriteRTWParam('string','STM32_SERIAL_UART4_PRIORITY', num2str(block.DialogPrm(145).Data));
end

% Enable Serial UART5
if block.DialogPrm(146).Data
	block.WriteRTWParam('string','STM32_SERIAL_USE_UART5', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SERIAL_USE_UART5', 'FALSE');
end

% UART5 IRQ Priority
if ischar(block.DialogPrm(147).Data)
	block.WriteRTWParam('string','STM32_SERIAL_UART5_PRIORITY', block.DialogPrm(147).Data);
else
	block.WriteRTWParam('string','STM32_SERIAL_UART5_PRIORITY', num2str(block.DialogPrm(147).Data));
end

% Enable Serial USART6
if block.DialogPrm(148).Data
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART6', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SERIAL_USE_USART6', 'FALSE');
end

% USART6 IRQ Priority
if ischar(block.DialogPrm(149).Data)
	block.WriteRTWParam('string','STM32_SERIAL_USART6_PRIORITY', block.DialogPrm(149).Data);
else
	block.WriteRTWParam('string','STM32_SERIAL_USART6_PRIORITY', num2str(block.DialogPrm(149).Data));
end

% Enable SPI 1
if block.DialogPrm(150).Data
	block.WriteRTWParam('string','STM32_SPI_USE_SPI1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SPI_USE_SPI1', 'FALSE');
end

% SPI 1 Rx DMA Stream
if ischar(block.DialogPrm(151).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI1_RX_DMA_STREAM', block.DialogPrm(151).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI1_RX_DMA_STREAM', num2str(block.DialogPrm(151).Data));
end

% SPI 1 Tx DMA Stream
if ischar(block.DialogPrm(152).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI1_TX_DMA_STREAM', block.DialogPrm(152).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI1_TX_DMA_STREAM', num2str(block.DialogPrm(152).Data));
end

% SPI 1 IRQ Priority
if ischar(block.DialogPrm(153).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI1_IRQ_PRIORITY', block.DialogPrm(153).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI1_IRQ_PRIORITY', num2str(block.DialogPrm(153).Data));
end

% SPI 1 DMA Priority
if ischar(block.DialogPrm(154).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI1_DMA_PRIORITY', block.DialogPrm(154).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI1_DMA_PRIORITY', num2str(block.DialogPrm(154).Data));
end

% Enable SPI 2
if block.DialogPrm(155).Data
	block.WriteRTWParam('string','STM32_SPI_USE_SPI2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SPI_USE_SPI2', 'FALSE');
end

% SPI 2 Rx DMA Stream
if ischar(block.DialogPrm(156).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI2_RX_DMA_STREAM', block.DialogPrm(156).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI2_RX_DMA_STREAM', num2str(block.DialogPrm(156).Data));
end

% SPI 2 Tx DMA Stream
if ischar(block.DialogPrm(157).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI2_TX_DMA_STREAM', block.DialogPrm(157).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI2_TX_DMA_STREAM', num2str(block.DialogPrm(157).Data));
end

% SPI 2 DMA Priority
if ischar(block.DialogPrm(158).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI2_DMA_PRIORITY', block.DialogPrm(158).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI2_DMA_PRIORITY', num2str(block.DialogPrm(158).Data));
end

% SPI 2 IRQ Priority
if ischar(block.DialogPrm(159).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI2_IRQ_PRIORITY', block.DialogPrm(159).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI2_IRQ_PRIORITY', num2str(block.DialogPrm(159).Data));
end

% Enable SPI 3
if block.DialogPrm(160).Data
	block.WriteRTWParam('string','STM32_SPI_USE_SPI3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_SPI_USE_SPI3', 'FALSE');
end

% SPI 3 Rx DMA Stream
if ischar(block.DialogPrm(161).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI3_RX_DMA_STREAM', block.DialogPrm(161).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI3_RX_DMA_STREAM', num2str(block.DialogPrm(161).Data));
end

% SPI 3 Tx DMA Stream
if ischar(block.DialogPrm(162).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI3_TX_DMA_STREAM', block.DialogPrm(162).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI3_TX_DMA_STREAM', num2str(block.DialogPrm(162).Data));
end

% SPI 3 DMA Priority
if ischar(block.DialogPrm(163).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI3_DMA_PRIORITY', block.DialogPrm(163).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI3_DMA_PRIORITY', num2str(block.DialogPrm(163).Data));
end

% SPI 3 IRQ Priority
if ischar(block.DialogPrm(164).Data)
	block.WriteRTWParam('string','STM32_SPI_SPI3_IRQ_PRIORITY', block.DialogPrm(164).Data);
else
	block.WriteRTWParam('string','STM32_SPI_SPI3_IRQ_PRIORITY', num2str(block.DialogPrm(164).Data));
end

% SPI DMA Error Hook
if ischar(block.DialogPrm(165).Data)
	block.WriteRTWParam('string','STM32_SPI_DMA_ERROR_HOOK', block.DialogPrm(165).Data);
else
	block.WriteRTWParam('string','STM32_SPI_DMA_ERROR_HOOK', num2str(block.DialogPrm(165).Data));
end

% USART 1 Enable
if block.DialogPrm(166).Data
	block.WriteRTWParam('string','STM32_UART_USE_USART1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_UART_USE_USART1', 'FALSE');
end

% USART 1 Rx DMA Stream
if ischar(block.DialogPrm(167).Data)
	block.WriteRTWParam('string','STM32_UART_USART1_RX_DMA_STREAM', block.DialogPrm(167).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART1_RX_DMA_STREAM', num2str(block.DialogPrm(167).Data));
end

% USART 1 Tx DMA Stream
if ischar(block.DialogPrm(168).Data)
	block.WriteRTWParam('string','STM32_UART_USART1_TX_DMA_STREAM', block.DialogPrm(168).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART1_TX_DMA_STREAM', num2str(block.DialogPrm(168).Data));
end

% USART 1 IRQ Priority
if ischar(block.DialogPrm(169).Data)
	block.WriteRTWParam('string','STM32_UART_USART1_IRQ_PRIORITY', block.DialogPrm(169).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART1_IRQ_PRIORITY', num2str(block.DialogPrm(169).Data));
end

% USART 1 DMA Priority
if ischar(block.DialogPrm(170).Data)
	block.WriteRTWParam('string','STM32_UART_USART1_DMA_PRIORITY', block.DialogPrm(170).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART1_DMA_PRIORITY', num2str(block.DialogPrm(170).Data));
end

% USART 2 Enable
if block.DialogPrm(171).Data
	block.WriteRTWParam('string','STM32_UART_USE_USART2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_UART_USE_USART2', 'FALSE');
end

% USART 2 Rx DMA Stream
if ischar(block.DialogPrm(172).Data)
	block.WriteRTWParam('string','STM32_UART_USART2_RX_DMA_STREAM', block.DialogPrm(172).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART2_RX_DMA_STREAM', num2str(block.DialogPrm(172).Data));
end

% USART 2 Tx DMA Stream
if ischar(block.DialogPrm(173).Data)
	block.WriteRTWParam('string','STM32_UART_USART2_TX_DMA_STREAM', block.DialogPrm(173).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART2_TX_DMA_STREAM', num2str(block.DialogPrm(173).Data));
end

% USART 2 IRQ Priority
if ischar(block.DialogPrm(174).Data)
	block.WriteRTWParam('string','STM32_UART_USART2_IRQ_PRIORITY', block.DialogPrm(174).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART2_IRQ_PRIORITY', num2str(block.DialogPrm(174).Data));
end

% USART 2 DMA Priority
if ischar(block.DialogPrm(175).Data)
	block.WriteRTWParam('string','STM32_UART_USART2_DMA_PRIORITY', block.DialogPrm(175).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART2_DMA_PRIORITY', num2str(block.DialogPrm(175).Data));
end

% USART 2 Enable
if block.DialogPrm(176).Data
	block.WriteRTWParam('string','STM32_UART_USE_USART3', 'TRUE');
else
	block.WriteRTWParam('string','STM32_UART_USE_USART3', 'FALSE');
end

% USART 3 Rx DMA Stream
if ischar(block.DialogPrm(177).Data)
	block.WriteRTWParam('string','STM32_UART_USART3_RX_DMA_STREAM', block.DialogPrm(177).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART3_RX_DMA_STREAM', num2str(block.DialogPrm(177).Data));
end

% USART 3 Tx DMA Stream
if ischar(block.DialogPrm(178).Data)
	block.WriteRTWParam('string','STM32_UART_USART3_TX_DMA_STREAM', block.DialogPrm(178).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART3_TX_DMA_STREAM', num2str(block.DialogPrm(178).Data));
end

% USART 3 IRQ Priority
if ischar(block.DialogPrm(179).Data)
	block.WriteRTWParam('string','STM32_UART_USART3_IRQ_PRIORITY', block.DialogPrm(179).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART3_IRQ_PRIORITY', num2str(block.DialogPrm(179).Data));
end

% USART 3 DMA Priority
if ischar(block.DialogPrm(180).Data)
	block.WriteRTWParam('string','STM32_UART_USART3_DMA_PRIORITY', block.DialogPrm(180).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART3_DMA_PRIORITY', num2str(block.DialogPrm(180).Data));
end

% USART 6 Enable
if block.DialogPrm(181).Data
	block.WriteRTWParam('string','STM32_UART_USE_USART6', 'TRUE');
else
	block.WriteRTWParam('string','STM32_UART_USE_USART6', 'FALSE');
end

% USART 6 Rx DMA Stream
if ischar(block.DialogPrm(182).Data)
	block.WriteRTWParam('string','STM32_UART_USART6_RX_DMA_STREAM', block.DialogPrm(182).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART6_RX_DMA_STREAM', num2str(block.DialogPrm(182).Data));
end

% USART 6 Tx DMA Stream
if ischar(block.DialogPrm(183).Data)
	block.WriteRTWParam('string','STM32_UART_USART6_TX_DMA_STREAM', block.DialogPrm(183).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART6_TX_DMA_STREAM', num2str(block.DialogPrm(183).Data));
end

% USART 6 IRQ Priority
if ischar(block.DialogPrm(184).Data)
	block.WriteRTWParam('string','STM32_UART_USART6_IRQ_PRIORITY', block.DialogPrm(184).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART6_IRQ_PRIORITY', num2str(block.DialogPrm(184).Data));
end

% USART 6 DMA Priority
if ischar(block.DialogPrm(185).Data)
	block.WriteRTWParam('string','STM32_UART_USART6_DMA_PRIORITY', block.DialogPrm(185).Data);
else
	block.WriteRTWParam('string','STM32_UART_USART6_DMA_PRIORITY', num2str(block.DialogPrm(185).Data));
end

% UART DMA Error Hook
if ischar(block.DialogPrm(186).Data)
	block.WriteRTWParam('string','STM32_UART_DMA_ERROR_HOOK', block.DialogPrm(186).Data);
else
	block.WriteRTWParam('string','STM32_UART_DMA_ERROR_HOOK', num2str(block.DialogPrm(186).Data));
end

% USB On-The-Go 1 Enable
if block.DialogPrm(187).Data
	block.WriteRTWParam('string','STM32_USB_USE_OTG1', 'TRUE');
else
	block.WriteRTWParam('string','STM32_USB_USE_OTG1', 'FALSE');
end

% USB On-The Go 1 IRQ Priority
if ischar(block.DialogPrm(188).Data)
	block.WriteRTWParam('string','STM32_USB_OTG1_IRQ_PRIORITY', block.DialogPrm(188).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTG1_IRQ_PRIORITY', num2str(block.DialogPrm(188).Data));
end

% USB On-The-Go 1 Rx FIFO Size
if ischar(block.DialogPrm(189).Data)
	block.WriteRTWParam('string','STM32_USB_OTG1_RX_FIFO_SIZE', block.DialogPrm(189).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTG1_RX_FIFO_SIZE', num2str(block.DialogPrm(189).Data));
end

% USB On-The-Go 2 Enable
if block.DialogPrm(190).Data
	block.WriteRTWParam('string','STM32_USB_USE_OTG2', 'TRUE');
else
	block.WriteRTWParam('string','STM32_USB_USE_OTG2', 'FALSE');
end

% USB On-The Go 2 IRQ Priority
if ischar(block.DialogPrm(191).Data)
	block.WriteRTWParam('string','STM32_USB_OTG2_IRQ_PRIORITY', block.DialogPrm(191).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTG2_IRQ_PRIORITY', num2str(block.DialogPrm(191).Data));
end

% USB On-The-Go 2 Rx FIFO Size
if ischar(block.DialogPrm(192).Data)
	block.WriteRTWParam('string','STM32_USB_OTG2_RX_FIFO_SIZE', block.DialogPrm(192).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTG2_RX_FIFO_SIZE', num2str(block.DialogPrm(192).Data));
end

% USB On-The-Go Thread Priority
if ischar(block.DialogPrm(193).Data)
	block.WriteRTWParam('string','STM32_USB_OTG_THREAD_PRIO', block.DialogPrm(193).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTG_THREAD_PRIO', num2str(block.DialogPrm(193).Data));
end

% USB On-The-Go Stack Size
if ischar(block.DialogPrm(194).Data)
	block.WriteRTWParam('string','STM32_USB_OTG_THREAD_STACK_SIZE', block.DialogPrm(194).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTG_THREAD_STACK_SIZE', num2str(block.DialogPrm(194).Data));
end

% USB On-The-Go FIFO Fill Base Priority
if ischar(block.DialogPrm(195).Data)
	block.WriteRTWParam('string','STM32_USB_OTGFIFO_FILL_BASEPRI', block.DialogPrm(195).Data);
else
	block.WriteRTWParam('string','STM32_USB_OTGFIFO_FILL_BASEPRI', num2str(block.DialogPrm(195).Data));
end