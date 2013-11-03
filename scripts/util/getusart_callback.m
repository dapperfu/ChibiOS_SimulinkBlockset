function getusart_callback(hObj,event) %#ok<INUSD>
    % Called when user activates popup menu 
    global usartSelection ;	
    val = get(hObj,'Value');
    if val ==1
		usartSelection = 'USART1:PA10/PA9'
    elseif val == 2
		usartSelection = 'USART1:PB7/PB6'
    elseif val == 3
		usartSelection = 'USART2:PA3/PA2'
    elseif val == 4
		usartSelection = 'USART2:PD6/PD5'
    elseif val == 5
		usartSelection = 'USART3:PC11/PC10'
    elseif val == 6
		usartSelection = 'USART3:PB11/PB10'
    elseif val == 7
		usartSelection = 'USART3:PD9/PD8'
    elseif val == 8
		usartSelection = 'UART4:PC11/PC10'
    elseif val == 9
		usartSelection = 'UART4:PA1/PA0'
    elseif val == 10
		usartSelection = 'UART5:PD2/PC12'
    elseif val == 11
		usartSelection = 'USART6:PC7/PC6'
    elseif val == 12
		usartSelection = 'USART6:PG9/PG14'
	end
end
