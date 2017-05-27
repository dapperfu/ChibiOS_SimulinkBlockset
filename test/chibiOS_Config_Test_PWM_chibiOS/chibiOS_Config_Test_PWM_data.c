/**************************************************************************
   Code generated for Simulink model: chibiOS_Config_Test_PWM.
   Model version                    : 1.210
   Simulink Coder version           : 8.9 (R2015b) 13-Aug-2015
   TLC version                      : 8.9 (Jul 31 2015)
   C/C++ source code generated on   : Sat May 27 00:58:14 2017
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
#include "chibiOS_Config_Test_PWM.h"
#include "chibiOS_Config_Test_PWM_private.h"

/* Defines */

/* Types */

/* Enums */

/* Definitions */

/* Block parameters (auto storage) */
Parameters_chibiOS_Config_Test_ chibiOS_Config_Test_PWM_P = {
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
  5.0,                                 /* Expression: 5
                                        * Referenced by: '<Root>/Step'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/Step'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<Root>/Step'
                                        */
  10.0,                                /* Expression: 10
                                        * Referenced by: '<Root>/Step1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/Step1'
                                        */
  -1.0,                                /* Expression: -1
                                        * Referenced by: '<Root>/Step1'
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
  1696.83789F,                         /* Expression: single(rand(1,1)*2500)
                                        * Referenced by: '<S2>/Constant3'
                                        */
  1.5689081F,                          /* Expression: single(rand(1,1)*4)
                                        * Referenced by: '<S2>/Constant4'
                                        */
  3474.14307F,                         /* Expression: single(rand(1,1)*5000)
                                        * Referenced by: '<S1>/Constant5'
                                        */
  172.230408F,                         /* Expression: single(rand(1,1)*5000)
                                        * Referenced by: '<S1>/Constant6'
                                        */
  7060U,                               /* Expression: uint32(rand(1,1)*10000)
                                        * Referenced by: '<S1>/Constant1'
                                        */
  3026U                                /* Expression: uint16(rand(1,1)*2^16)
                                        * Referenced by: '<S1>/Constant2'
                                        */
};

/* Declarations */

/* Functions */

/* [EOF] chibiOS_Config_Test_PWM_data.c */
