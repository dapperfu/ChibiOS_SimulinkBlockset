/**************************************************************************
   Code generated for Simulink model: chibiOS_Config_Test_PWM.
   Model version                    : 1.198
   Simulink Coder version           : 8.3 (R2012b) 20-Jul-2012
   TLC version                      : 8.3 (Jul 21 2012)
   C/C++ source code generated on   : Wed Dec 18 00:18:49 2013
 ***************************************************************************
 *
 * Target selection: ChibiOS.tlc
 * Embedded hardware selection: STMicroelectronics->STM32F4xx 32-bit Cortex-M4
 * Code generation objectives: Unspecified
 * Validation result: Not run

 ***************************************************************************
   ChibiOS/RT Simulink Blockset - Copyright (c) 2013, Jedediah Frey
   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
   - Neither the name of Jedediah Frey nor the names of its contributors may
   be used to endorse or promote products derived from this software
   without specific prior written permission.
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
 ***************************************************************************
   ChibiOS/RT - Copyright (C) 2006-2013 Giovanni Di Sirio
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
   http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 **************************************************************************/
/* Includes */
#ifndef RTW_HEADER_mcuconf_h_
#define RTW_HEADER_mcuconf_h_

/* Defines */

/*
 * STM32F4xx drivers configuration.
 * The following settings override the default settings present in
 * the various device driver implementation headers.
 * Note that the settings for each driver only have effect if the whole
 * driver is enabled in halconf.h.
 *
 * IRQ priorities:
 * 15...0       Lowest...Highest.
 *
 * DMA priorities:
 * 0...3        Lowest...Highest.
 */
#define STM32F4xx_MCUCONF

/*
 * HAL
 */
#define STM32_NO_INIT                  FALSE
#define STM32_HSI_ENABLED              TRUE
#define STM32_LSI_ENABLED              TRUE
#define STM32_HSE_ENABLED              TRUE
#define STM32_LSE_ENABLED              FALSE
#define STM32_CLOCK48_REQUIRED         TRUE
#define STM32_SW                       STM32_SW_PLL
#define STM32_PLLSRC                   STM32_PLLSRC_HSE
#define STM32_PLLM_VALUE               8
#define STM32_PLLN_VALUE               336
#define STM32_PLLP_VALUE               2
#define STM32_PLLQ_VALUE               7
#define STM32_HPRE                     STM32_HPRE_DIV1
#define STM32_PPRE1                    STM32_PPRE1_DIV4
#define STM32_PPRE2                    STM32_PPRE2_DIV2
#define STM32_RTCSEL                   STM32_RTCSEL_LSI
#define STM32_RTCPRE_VALUE             8
#define STM32_MCO1SEL                  STM32_MCO1SEL_HSI
#define STM32_MCO1PRE                  STM32_MCO1PRE_DIV1
#define STM32_MCO2SEL                  STM32_MCO2SEL_SYSCLK
#define STM32_MCO2PRE                  STM32_MCO2PRE_DIV5
#define STM32_I2SSRC                   STM32_I2SSRC_CKIN
#define STM32_PLLI2SN_VALUE            192
#define STM32_PLLI2SR_VALUE            5
#define STM32_PVD_ENABLE               FALSE
#define STM32_PLS                      STM32_PLS_LEV0

/*
 * ADC
 */
#define STM32_ADC_ADCPRE               STM32_RTCPRE_DIV2
#define STM32_ADC_USE_ADC1             FALSE
#define STM32_ADC_USE_ADC2             FALSE
#define STM32_ADC_USE_ADC3             FALSE
#define STM32_ADC_ADC1_DMA_STREAM      STM32_DMA_STREAM_ID(2, 4)
#define STM32_ADC_ADC2_DMA_STREAM      STM32_DMA_STREAM_ID(2, 3)
#define STM32_ADC_ADC3_DMA_STREAM      STM32_DMA_STREAM_ID(2, 1)
#define STM32_ADC_ADC1_DMA_PRIORITY    2
#define STM32_ADC_ADC2_DMA_PRIORITY    2
#define STM32_ADC_ADC3_DMA_PRIORITY    2
#define STM32_ADC_IRQ_PRIORITY         6
#define STM32_ADC_ADC1_DMA_IRQ_PRIORITY 6
#define STM32_ADC_ADC2_DMA_IRQ_PRIORITY 6
#define STM32_ADC_ADC3_DMA_IRQ_PRIORITY 6

/*
 * CAN
 */
#define STM32_CAN_USE_CAN1             FALSE
#define STM32_CAN_USE_CAN2             FALSE
#define STM32_CAN_CAN1_IRQ_PRIORITY    11
#define STM32_CAN_CAN2_IRQ_PRIORITY    11

/*
 * EXT
 */
#define STM32_EXT_EXTI0_IRQ_PRIORITY   10
#define STM32_EXT_EXTI1_IRQ_PRIORITY   10
#define STM32_EXT_EXTI2_IRQ_PRIORITY   10
#define STM32_EXT_EXTI3_IRQ_PRIORITY   10
#define STM32_EXT_EXTI4_IRQ_PRIORITY   10
#define STM32_EXT_EXTI5_9_IRQ_PRIORITY 10
#define STM32_EXT_EXTI10_15_IRQ_PRIORITY 10
#define STM32_EXT_EXTI16_IRQ_PRIORITY  10
#define STM32_EXT_EXTI17_IRQ_PRIORITY  1
#define STM32_EXT_EXTI18_IRQ_PRIORITY  10
#define STM32_EXT_EXTI19_IRQ_PRIORITY  10
#define STM32_EXT_EXTI20_IRQ_PRIORITY  10
#define STM32_EXT_EXTI21_IRQ_PRIORITY  1
#define STM32_EXT_EXTI22_IRQ_PRIORITY  1

/*
 * GPT
 */
#define STM32_GPT_USE_TIM1             FALSE
#define STM32_GPT_USE_TIM2             FALSE
#define STM32_GPT_USE_TIM3             FALSE
#define STM32_GPT_USE_TIM4             FALSE
#define STM32_GPT_USE_TIM5             FALSE
#define STM32_GPT_USE_TIM6             FALSE
#define STM32_GPT_USE_TIM7             FALSE
#define STM32_GPT_USE_TIM8             FALSE
#define STM32_GPT_USE_TIM9             FALSE
#define STM32_GPT_USE_TIM11            FALSE
#define STM32_GPT_USE_TIM12            FALSE
#define STM32_GPT_USE_TIM14            FALSE
#define STM32_GPT_TIM1_IRQ_PRIORITY    9
#define STM32_GPT_TIM2_IRQ_PRIORITY    9
#define STM32_GPT_TIM3_IRQ_PRIORITY    9
#define STM32_GPT_TIM4_IRQ_PRIORITY    9
#define STM32_GPT_TIM5_IRQ_PRIORITY    9
#define STM32_GPT_TIM6_IRQ_PRIORITY    9
#define STM32_GPT_TIM7_IRQ_PRIORITY    9
#define STM32_GPT_TIM8_IRQ_PRIORITY    9
#define STM32_GPT_TIM9_IRQ_PRIORITY    9
#define STM32_GPT_TIM11_IRQ_PRIORITY   9
#define STM32_GPT_TIM12_IRQ_PRIORITY   9
#define STM32_GPT_TIM14_IRQ_PRIORITY   9

/*
 * I2C
 */
#define STM32_I2C_USE_I2C1             FALSE
#define STM32_I2C_USE_I2C2             FALSE
#define STM32_I2C_USE_I2C3             FALSE
#define STM32_I2C_I2C1_RX_DMA_STREAM   STM32_DMA_STREAM_ID(1, 0)
#define STM32_I2C_I2C1_TX_DMA_STREAM   STM32_DMA_STREAM_ID(1, 6)
#define STM32_I2C_I2C2_RX_DMA_STREAM   STM32_DMA_STREAM_ID(1, 2)
#define STM32_I2C_I2C2_TX_DMA_STREAM   STM32_DMA_STREAM_ID(1, 7)
#define STM32_I2C_I2C3_RX_DMA_STREAM   STM32_DMA_STREAM_ID(1, 2)
#define STM32_I2C_I2C3_TX_DMA_STREAM   STM32_DMA_STREAM_ID(1, 4)
#define STM32_I2C_I2C1_IRQ_PRIORITY    11
#define STM32_I2C_I2C2_IRQ_PRIORITY    11
#define STM32_I2C_I2C3_IRQ_PRIORITY    11
#define STM32_I2C_I2C1_DMA_PRIORITY    3
#define STM32_I2C_I2C2_DMA_PRIORITY    3
#define STM32_I2C_I2C3_DMA_PRIORITY    3
#define STM32_I2C_I2C1_DMA_ERROR_HOOK  chSysHalt()
#define STM32_I2C_I2C2_DMA_ERROR_HOOK  chSysHalt()
#define STM32_I2C_I2C3_DMA_ERROR_HOOK  chSysHalt()

/*
 * ICU
 */
#define STM32_ICU_USE_TIM1             FALSE
#define STM32_ICU_USE_TIM2             FALSE
#define STM32_ICU_USE_TIM3             FALSE
#define STM32_ICU_USE_TIM4             FALSE
#define STM32_ICU_USE_TIM5             FALSE
#define STM32_ICU_USE_TIM8             FALSE
#define STM32_ICU_USE_TIM9             FALSE
#define STM32_ICU_TIM1_IRQ_PRIORITY    9
#define STM32_ICU_TIM2_IRQ_PRIORITY    9
#define STM32_ICU_TIM3_IRQ_PRIORITY    9
#define STM32_ICU_TIM4_IRQ_PRIORITY    9
#define STM32_ICU_TIM5_IRQ_PRIORITY    9
#define STM32_ICU_TIM8_IRQ_PRIORITY    9
#define STM32_ICU_TIM9_IRQ_PRIORITY    9

/*
 * MAC
 */
#define STM32_MAC_TRANSMIT_BUFFERS     2
#define STM32_MAC_RECEIVE_BUFFERS      4
#define STM32_MAC_BUFFERS_SIZE         1522
#define STM32_MAC_PHY_TIMEOUT          100
#define STM32_MAC_ETH1_CHANGE_PHY_STATE TRUE
#define STM32_MAC_ETH1_IRQ_PRIORITY    13
#define STM32_MAC_IP_CHECKSUM_OFFLOAD  0

/*
 * PWM
 */
#define STM32_PWM_USE_ADVANCED         FALSE
#define STM32_PWM_USE_TIM1             FALSE
#define STM32_PWM_USE_TIM2             FALSE
#define STM32_PWM_USE_TIM3             TRUE
#define STM32_PWM_USE_TIM4             TRUE
#define STM32_PWM_USE_TIM5             FALSE
#define STM32_PWM_USE_TIM8             FALSE
#define STM32_PWM_USE_TIM9             FALSE
#define STM32_PWM_TIM1_IRQ_PRIORITY    9
#define STM32_PWM_TIM2_IRQ_PRIORITY    9
#define STM32_PWM_TIM3_IRQ_PRIORITY    9
#define STM32_PWM_TIM4_IRQ_PRIORITY    9
#define STM32_PWM_TIM5_IRQ_PRIORITY    9
#define STM32_PWM_TIM8_IRQ_PRIORITY    9
#define STM32_PWM_TIM9_IRQ_PRIORITY    9

/*
 * Serial
 */
#define STM32_SERIAL_USE_USART1        FALSE
#define STM32_SERIAL_USE_USART2        FALSE
#define STM32_SERIAL_USE_USART3        FALSE
#define STM32_SERIAL_USE_UART4         FALSE
#define STM32_SERIAL_USE_UART5         FALSE
#define STM32_SERIAL_USE_USART6        FALSE
#define STM32_SERIAL_USART1_PRIORITY   4
#define STM32_SERIAL_USART2_PRIORITY   4
#define STM32_SERIAL_USART3_PRIORITY   4
#define STM32_SERIAL_UART4_PRIORITY    4
#define STM32_SERIAL_UART5_PRIORITY    4
#define STM32_SERIAL_USART6_PRIORITY   4

/*
 * SPI
 */
#define STM32_SPI_USE_SPI1             FALSE
#define STM32_SPI_USE_SPI2             FALSE
#define STM32_SPI_USE_SPI3             TRUE
#define STM32_SPI_SPI1_RX_DMA_STREAM   STM32_DMA_STREAM_ID(2,0)
#define STM32_SPI_SPI1_TX_DMA_STREAM   STM32_DMA_STREAM_ID(2,3)
#define STM32_SPI_SPI2_RX_DMA_STREAM   STM32_DMA_STREAM_ID(1,3)
#define STM32_SPI_SPI2_TX_DMA_STREAM   STM32_DMA_STREAM_ID(1,4)
#define STM32_SPI_SPI3_RX_DMA_STREAM   STM32_DMA_STREAM_ID(1,0)
#define STM32_SPI_SPI3_TX_DMA_STREAM   STM32_DMA_STREAM_ID(1,7)
#define STM32_SPI_SPI1_DMA_PRIORITY    2
#define STM32_SPI_SPI2_DMA_PRIORITY    2
#define STM32_SPI_SPI3_DMA_PRIORITY    2
#define STM32_SPI_SPI1_IRQ_PRIORITY    6
#define STM32_SPI_SPI2_IRQ_PRIORITY    6
#define STM32_SPI_SPI3_IRQ_PRIORITY    6
#define STM32_SPI_DMA_ERROR_HOOK       chSysHalt()

/*
 * UART
 */
#define STM32_UART_USE_USART1          FALSE
#define STM32_UART_USE_USART2          FALSE
#define STM32_UART_USE_USART3          FALSE
#define STM32_UART_USE_USART6          FALSE
#define STM32_UART_USART1_RX_DMA_STREAM STM32_DMA_STREAM_ID(2, 5)
#define STM32_UART_USART1_TX_DMA_STREAM STM32_DMA_STREAM_ID(2, 7)
#define STM32_UART_USART2_RX_DMA_STREAM STM32_DMA_STREAM_ID(1, 5)
#define STM32_UART_USART2_TX_DMA_STREAM STM32_DMA_STREAM_ID(1, 6)
#define STM32_UART_USART3_RX_DMA_STREAM STM32_DMA_STREAM_ID(1, 1)
#define STM32_UART_USART3_TX_DMA_STREAM STM32_DMA_STREAM_ID(1, 3)
#define STM32_UART_USART6_RX_DMA_STREAM STM32_DMA_STREAM_ID(2, 2)
#define STM32_UART_USART6_TX_DMA_STREAM STM32_DMA_STREAM_ID(2, 7)
#define STM32_UART_USART1_IRQ_PRIORITY 4
#define STM32_UART_USART2_IRQ_PRIORITY 4
#define STM32_UART_USART3_IRQ_PRIORITY 4
#define STM32_UART_USART6_IRQ_PRIORITY 4
#define STM32_UART_USART1_DMA_PRIORITY 1
#define STM32_UART_USART2_DMA_PRIORITY 1
#define STM32_UART_USART3_DMA_PRIORITY 1
#define STM32_UART_USART6_DMA_PRIORITY 1
#define STM32_UART_DMA_ERROR_HOOK      chSysHalt()

/*
 * USB
 */
#define STM32_USB_USE_OTG1             FALSE
#define STM32_USB_USE_OTG2             FALSE
#define STM32_USB_OTG1_IRQ_PRIORITY    2
#define STM32_USB_OTG2_IRQ_PRIORITY    2
#define STM32_USB_OTG1_RX_FIFO_SIZE    512
#define STM32_USB_OTG2_RX_FIFO_SIZE    1024
#define STM32_USB_OTG_THREAD_PRIO      LOWPRIO
#define STM32_USB_OTG_THREAD_STACK_SIZE 128
#define STM32_USB_OTGFIFO_FILL_BASEPRI 0

/* Types */

/* Enums */

/* Definitions */

/* Declarations */

/* Functions */
#endif                                 /* RTW_HEADER_mcuconf_h_ */

/* [EOF] mcuconf.h */
