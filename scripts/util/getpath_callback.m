function getpath_callback(hDlg, hSrc, paramName)
%Callback to get toolpath automatically from registry.
%Also set default parameters for compil, link and asm


%IAR (Ewarm) toolchain management
if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'IAR'))
    %Add preference for toolchain selection
    setpref('STM32F4xx', 'stm32f4ToolChain','IAR');
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, 'ToolPathFromRegistry'),'on'))
        installedProducts = getToolPath('IAR');
        slConfigUISetVal(hDlg, hSrc, 'CompilerPath', installedProducts);
        clear installedProducts
    end
    %Set dongle possibilities
    slConfigUISetVal(hDlg, hSrc, 'Dongle', 'J-Link');
    slConfigUISetVal(hDlg, hSrc, 'CompilerSettings', '--cpu Cortex-M4 --debug -D ARM_MATH_CM4 -D STM32F4XX -D USE_STDPERIPH_DRIVER --endian=little');
    slConfigUISetVal(hDlg, hSrc, 'LinkerSettings', '--map $(MODEL)_IAR_$(BOOT_MODE).map --config $(LDDIR)\$(STM32TARGET)_$(BOOT_MODE).icf --search .. --search $(TOOLPATH)\..\lib');
    slConfigUISetVal(hDlg, hSrc, 'AssemblerSettings', '-s+ -w+ -r --cpu cortex-M3 --fpu None --endian little');
end

%KEIL (µVision4) toolchain management
if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'KEIL'))
    %Add preference for toolchain selection
    setpref('STM32F4xx', 'stm32f4ToolChain','KEIL');
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, 'ToolPathFromRegistry'),'on'))
        installedProducts = getToolPath('KEIL');
        slConfigUISetVal(hDlg, hSrc, 'CompilerPath', installedProducts);
        clear installedProducts
    end
    %Set dongle possibilities
    slConfigUISetVal(hDlg, hSrc, 'Dongle', 'STLinkV2');
    slConfigUISetVal(hDlg, hSrc, 'CompilerSettings', '--cpu Cortex-M4.fp -c -g -O0 -DARM_MATH_CM4 -DSTM32F4XX -DUSE_STDPERIPH_DRIVER --apcs=interwork --split_sections --c99');
    slConfigUISetVal(hDlg, hSrc, 'LinkerSettings', '--cpu Cortex-M4.fp --map --list=$(MODEL)_KEIL_$(BOOT_MODE).map --scatter $(LDDIR)\$(STM32TARGET).sct --scanlib ');
    slConfigUISetVal(hDlg, hSrc, 'AssemblerSettings', '--via $(LDDIR)\asm.cmd');
end

%ATOLLIC (TrueSTUDIO) toolchain management
if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'ATOLLIC'))
    %Add preference for toolchain selection
    setpref('STM32F4xx', 'stm32f4ToolChain','ATOLLIC');
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, 'ToolPathFromRegistry'),'on'))
        installedProducts = getToolPath('ATOLLIC');
        slConfigUISetVal(hDlg, hSrc, 'CompilerPath', installedProducts);
        slConfigUISetVal(0, hSrc, 'CompilerPath', installedProducts);
        clear installedProducts
    end
    %Set dongle possibilities
    slConfigUISetVal(hDlg, hSrc, 'Dongle', 'STLinkV2');
    slConfigUISetVal(hDlg, hSrc, 'CompilerSettings', '-c -g -mcpu=cortex-m4 -O0 -Wall -ffunction-sections -fdata-sections -mthumb -D STM32F4XX -D USE_STDPERIPH_DRIVER  -D ARM_MATH_CM4');
    slConfigUISetVal(hDlg, hSrc, 'LinkerSettings', '-lm -mthumb -mcpu=cortex-m4 -Wl,--gc-sections -T$(LDDIR)\$(STM32TARGET).ld -T$(LDDIR)\stm32_$(BOOT_MODE).ld -static  -Wl,-cref -Wl,-Map=$(MODEL)_ATOLLIC_$(BOOT_MODE).map -Wl,--defsym=malloc_getpagesize_P=0x1000');
    slConfigUISetVal(hDlg, hSrc, 'AssemblerSettings', '-c -g -O0 -mcpu=cortex-m4 -mthumb  -x assembler-with-cpp');
end

% GCC toolchain management
if (strcmp(slConfigUIGetVal(hDlg, hSrc, paramName),'GCC'))
    %Add preference for toolchain selection
    setpref('STM32F4xx', 'stm32f4ToolChain','GCC');
    if (strcmp(slConfigUIGetVal(hDlg, hSrc, 'ToolPathFromRegistry'),'on'))
        installedProducts = getToolPath('GCC');
        slConfigUISetVal(hDlg, hSrc, 'CompilerPath', installedProducts);
        slConfigUISetVal(0, hSrc, 'CompilerPath', installedProducts);
        clear installedProducts
    end
    %Set dongle possibilities
    slConfigUISetVal(hDlg, hSrc, 'Dongle', 'STLinkV2');
    slConfigUISetVal(hDlg, hSrc, 'CompilerSettings', '-c -g -mcpu=cortex-m4 -O0 -Wall -ffunction-sections -fdata-sections -mthumb -D STM32F4XX -D USE_STDPERIPH_DRIVER  -D ARM_MATH_CM4');
    slConfigUISetVal(hDlg, hSrc, 'LinkerSettings', '-lm -mthumb -mcpu=cortex-m4 -Wl,--gc-sections -T$(LDDIR)\$(STM32TARGET).ld -T$(LDDIR)\stm32_$(BOOT_MODE).ld -static  -Wl,-cref -Wl,-Map=$(MODEL)_ATOLLIC_$(BOOT_MODE).map -Wl,--defsym=malloc_getpagesize_P=0x1000');
    slConfigUISetVal(hDlg, hSrc, 'AssemblerSettings', '-c -g -O0 -mcpu=cortex-m4 -mthumb  -x assembler-with-cpp');
end
end
