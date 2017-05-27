/**************************************************************************
   Code generated for Simulink model: chibiOS_Config_Test_PAL.
   Model version                    : 1.300
   Simulink Coder version           : 8.9 (R2015b) 13-Aug-2015
   TLC version                      : 8.9 (Jul 31 2015)
   C/C++ source code generated on   : Sat May 27 00:55:32 2017
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
#include "chibiOS_Config_Test_PAL.h"
#include "chibiOS_Config_Test_PAL_private.h"

/* Defines */

/* Types */

/* Enums */

/* Definitions */

/* Block parameters (auto storage) */
Parameters_chibiOS_Config_Test_ chibiOS_Config_Test_PAL_P = {
  1000.0,                              /* Mask Parameter: chibiOS_Config_CH_FREQUENCY
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  0.0,                                 /* Mask Parameter: chibiOS_Config_CH_MEMCORE_SIZE
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  0.0,                                 /* Mask Parameter: chibiOS_Config_CH_NO_IDLE_THREA
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  20.0,                                /* Mask Parameter: chibiOS_Config_CH_TIME_QUANTUM
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_OPTIMIZE_SPEED
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_REGISTRY
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_WAITEXIT
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_SEMAPHORES
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  0.0,                                 /* Expression: CH_USE_SEMAPHORES_PRIORITY
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_SEMSW
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_MUTEXES
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_CONDVARS
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_CONDVARS_TIMEOUT
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_EVENTS
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_EVENTS_TIMEOUT
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_MESSAGES
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  0.0,                                 /* Expression: CH_USE_MESSAGES_PRIORITY
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_MAILBOXES
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_QUEUES
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_MEMCORE
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_HEAP
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  0.0,                                 /* Expression: CH_USE_MALLOC_HEAP
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_MEMPOOLS
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_USE_DYNAMIC
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_SYSTEM_STATE_CHECK
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_ENABLE_CHECKS
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_ENABLE_ASSERTS
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_ENABLE_TRACE
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_ENABLE_STACK_CHECK
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_FILL_THREADS
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1.0,                                 /* Expression: CH_DBG_THREADS_PROFILING
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  1,                                   /* Computed Parameter: PD0_const_Value
                                        * Referenced by: '<S2>/PD0_const'
                                        */
  1,                                   /* Computed Parameter: PD10_const_Value
                                        * Referenced by: '<S2>/PD10_const'
                                        */
  1,                                   /* Computed Parameter: PD11_const_Value
                                        * Referenced by: '<S2>/PD11_const'
                                        */
  1,                                   /* Computed Parameter: PD12_const_Value
                                        * Referenced by: '<S2>/PD12_const'
                                        */
  1,                                   /* Computed Parameter: PD14_const_Value
                                        * Referenced by: '<S2>/PD14_const'
                                        */
  1,                                   /* Computed Parameter: PD15_const_Value
                                        * Referenced by: '<S2>/PD15_const'
                                        */
  1,                                   /* Computed Parameter: PD1_const_Value
                                        * Referenced by: '<S2>/PD1_const'
                                        */
  1,                                   /* Computed Parameter: PD2_const_Value
                                        * Referenced by: '<S2>/PD2_const'
                                        */
  1,                                   /* Computed Parameter: PD3_const_Value
                                        * Referenced by: '<S2>/PD3_const'
                                        */
  1,                                   /* Computed Parameter: PD4_const_Value
                                        * Referenced by: '<S2>/PD4_const'
                                        */
  1,                                   /* Computed Parameter: PD5_const_Value
                                        * Referenced by: '<S2>/PD5_const'
                                        */
  1,                                   /* Computed Parameter: PD6_const_Value
                                        * Referenced by: '<S2>/PD6_const'
                                        */
  1,                                   /* Computed Parameter: PD7_const_Value
                                        * Referenced by: '<S2>/PD7_const'
                                        */
  1,                                   /* Computed Parameter: PD8_const_Value
                                        * Referenced by: '<S2>/PD8_const'
                                        */
  1,                                   /* Computed Parameter: PD9_const_Value
                                        * Referenced by: '<S2>/PD9_const'
                                        */
  1,                                   /* Computed Parameter: PA0_const_Value
                                        * Referenced by: '<S5>/PA0_const'
                                        */
  1,                                   /* Computed Parameter: PA1_const_Value
                                        * Referenced by: '<S5>/PA1_const'
                                        */
  1,                                   /* Computed Parameter: PA2_const_Value
                                        * Referenced by: '<S5>/PA2_const'
                                        */
  1,                                   /* Computed Parameter: PA3_const_Value
                                        * Referenced by: '<S5>/PA3_const'
                                        */
  1,                                   /* Computed Parameter: PA4_const_Value
                                        * Referenced by: '<S5>/PA4_const'
                                        */
  1,                                   /* Computed Parameter: PA5_const_Value
                                        * Referenced by: '<S5>/PA5_const'
                                        */
  1,                                   /* Computed Parameter: PA6_const_Value
                                        * Referenced by: '<S5>/PA6_const'
                                        */
  1,                                   /* Computed Parameter: PA7_const_Value
                                        * Referenced by: '<S5>/PA7_const'
                                        */
  1,                                   /* Computed Parameter: PA8_const_Value
                                        * Referenced by: '<S5>/PA8_const'
                                        */
  1,                                   /* Computed Parameter: PA9_const_Value
                                        * Referenced by: '<S5>/PA9_const'
                                        */
  1,                                   /* Computed Parameter: PA10_const_Value
                                        * Referenced by: '<S5>/PA10_const'
                                        */
  1,                                   /* Computed Parameter: PA11_const_Value
                                        * Referenced by: '<S5>/PA11_const'
                                        */
  1,                                   /* Computed Parameter: PA12_const_Value
                                        * Referenced by: '<S5>/PA12_const'
                                        */
  1,                                   /* Computed Parameter: PA13_const_Value
                                        * Referenced by: '<S5>/PA13_const'
                                        */
  1,                                   /* Computed Parameter: PA14_const_Value
                                        * Referenced by: '<S5>/PA14_const'
                                        */
  1,                                   /* Computed Parameter: PA15_const_Value
                                        * Referenced by: '<S5>/PA15_const'
                                        */
  1,                                   /* Computed Parameter: PD0_const_Value_o
                                        * Referenced by: '<S3>/PD0_const'
                                        */
  1,                                   /* Computed Parameter: PD10_const_Value_i
                                        * Referenced by: '<S3>/PD10_const'
                                        */
  1,                                   /* Computed Parameter: PD11_const_Value_b
                                        * Referenced by: '<S3>/PD11_const'
                                        */
  1,                                   /* Computed Parameter: PD12_const_Value_b
                                        * Referenced by: '<S3>/PD12_const'
                                        */
  1,                                   /* Computed Parameter: PD13_const_Value
                                        * Referenced by: '<S3>/PD13_const'
                                        */
  1,                                   /* Computed Parameter: PD14_const_Value_o
                                        * Referenced by: '<S3>/PD14_const'
                                        */
  1,                                   /* Computed Parameter: PD1_const_Value_g
                                        * Referenced by: '<S3>/PD1_const'
                                        */
  1,                                   /* Computed Parameter: PD2_const_Value_h
                                        * Referenced by: '<S3>/PD2_const'
                                        */
  1,                                   /* Computed Parameter: PD3_const_Value_m
                                        * Referenced by: '<S3>/PD3_const'
                                        */
  1,                                   /* Computed Parameter: PD4_const_Value_p
                                        * Referenced by: '<S3>/PD4_const'
                                        */
  1,                                   /* Computed Parameter: PD5_const_Value_a
                                        * Referenced by: '<S3>/PD5_const'
                                        */
  1,                                   /* Computed Parameter: PD6_const_Value_k
                                        * Referenced by: '<S3>/PD6_const'
                                        */
  1,                                   /* Computed Parameter: PD7_const_Value_o
                                        * Referenced by: '<S3>/PD7_const'
                                        */
  1,                                   /* Computed Parameter: PD8_const_Value_m
                                        * Referenced by: '<S3>/PD8_const'
                                        */
  1,                                   /* Computed Parameter: PD9_const_Value_p
                                        * Referenced by: '<S3>/PD9_const'
                                        */
  1,                                   /* Computed Parameter: PD0_const_Value_k
                                        * Referenced by: '<S4>/PD0_const'
                                        */
  1,                                   /* Computed Parameter: PD10_const_Value_f
                                        * Referenced by: '<S4>/PD10_const'
                                        */
  1,                                   /* Computed Parameter: PD11_const_Value_d
                                        * Referenced by: '<S4>/PD11_const'
                                        */
  1,                                   /* Computed Parameter: PD13_const_Value_i
                                        * Referenced by: '<S4>/PD13_const'
                                        */
  1,                                   /* Computed Parameter: PD14_const_Value_f
                                        * Referenced by: '<S4>/PD14_const'
                                        */
  1,                                   /* Computed Parameter: PD15_const_Value_o
                                        * Referenced by: '<S4>/PD15_const'
                                        */
  1,                                   /* Computed Parameter: PD1_const_Value_d
                                        * Referenced by: '<S4>/PD1_const'
                                        */
  1,                                   /* Computed Parameter: PD2_const_Value_k
                                        * Referenced by: '<S4>/PD2_const'
                                        */
  1,                                   /* Computed Parameter: PD3_const_Value_n
                                        * Referenced by: '<S4>/PD3_const'
                                        */
  1,                                   /* Computed Parameter: PD4_const_Value_m
                                        * Referenced by: '<S4>/PD4_const'
                                        */
  1,                                   /* Computed Parameter: PD5_const_Value_f
                                        * Referenced by: '<S4>/PD5_const'
                                        */
  1,                                   /* Computed Parameter: PD6_const_Value_c
                                        * Referenced by: '<S4>/PD6_const'
                                        */
  1,                                   /* Computed Parameter: PD7_const_Value_m
                                        * Referenced by: '<S4>/PD7_const'
                                        */
  1,                                   /* Computed Parameter: PD8_const_Value_p
                                        * Referenced by: '<S4>/PD8_const'
                                        */
  1,                                   /* Computed Parameter: PD9_const_Value_d
                                        * Referenced by: '<S4>/PD9_const'
                                        */
  1,                                   /* Computed Parameter: PD0_const_Value_e
                                        * Referenced by: '<S1>/PD0_const'
                                        */
  1,                                   /* Computed Parameter: PD10_const_Value_n
                                        * Referenced by: '<S1>/PD10_const'
                                        */
  1,                                   /* Computed Parameter: PD11_const_Value_bn
                                        * Referenced by: '<S1>/PD11_const'
                                        */
  1,                                   /* Computed Parameter: PD12_const_Value_d
                                        * Referenced by: '<S1>/PD12_const'
                                        */
  1,                                   /* Computed Parameter: PD13_const_Value_k
                                        * Referenced by: '<S1>/PD13_const'
                                        */
  1,                                   /* Computed Parameter: PD14_const_Value_m
                                        * Referenced by: '<S1>/PD14_const'
                                        */
  1,                                   /* Computed Parameter: PD15_const_Value_g
                                        * Referenced by: '<S1>/PD15_const'
                                        */
  1,                                   /* Computed Parameter: PD1_const_Value_m
                                        * Referenced by: '<S1>/PD1_const'
                                        */
  1,                                   /* Computed Parameter: PD2_const_Value_a
                                        * Referenced by: '<S1>/PD2_const'
                                        */
  1,                                   /* Computed Parameter: PD3_const_Value_nq
                                        * Referenced by: '<S1>/PD3_const'
                                        */
  1,                                   /* Computed Parameter: PD4_const_Value_e
                                        * Referenced by: '<S1>/PD4_const'
                                        */
  1,                                   /* Computed Parameter: PD5_const_Value_j
                                        * Referenced by: '<S1>/PD5_const'
                                        */
  1,                                   /* Computed Parameter: PD6_const_Value_l
                                        * Referenced by: '<S1>/PD6_const'
                                        */
  1,                                   /* Computed Parameter: PD7_const_Value_h
                                        * Referenced by: '<S1>/PD7_const'
                                        */
  1,                                   /* Computed Parameter: PD8_const_Value_f
                                        * Referenced by: '<S1>/PD8_const'
                                        */
  1                                    /* Computed Parameter: PD9_const_Value_a
                                        * Referenced by: '<S1>/PD9_const'
                                        */
};

/* Declarations */

/* Functions */

/* [EOF] chibiOS_Config_Test_PAL_data.c */
