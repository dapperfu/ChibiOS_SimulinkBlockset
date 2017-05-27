/**************************************************************************
   Code generated for Simulink model: chibiOS_Config_Test_PAL.
   Model version                    : 1.299
   Simulink Coder version           : 8.9 (R2015b) 13-Aug-2015
   TLC version                      : 8.9 (Jul 31 2015)
   C/C++ source code generated on   : Sat May 27 00:45:00 2017
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
#ifndef RTW_HEADER_chibiOS_Config_Test_PAL_h_
#define RTW_HEADER_chibiOS_Config_Test_PAL_h_
#include <string.h>
#ifndef chibiOS_Config_Test_PAL_COMMON_INCLUDES_
# define chibiOS_Config_Test_PAL_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "ch.h"
#include "hal.h"
#endif                                 /* chibiOS_Config_Test_PAL_COMMON_INCLUDES_ */

#include "chibiOS_Config_Test_PAL_types.h"

/* Defines */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmStepTask
# define rtmStepTask(rtm, idx)         ((rtm)->Timing.TaskCounters.TID[(idx)] == 0)
#endif

#ifndef rtmTaskCounter
# define rtmTaskCounter(rtm, idx)      ((rtm)->Timing.TaskCounters.TID[(idx)])
#endif

/* Types */

/* Block signals (auto storage) */
typedef struct {
  boolean_T pal_Config_o1;             /* '<S5>/pal_Config' */
  boolean_T RateTransition2;           /* '<Root>/Rate Transition2' */
  boolean_T RateTransition3;           /* '<Root>/Rate Transition3' */
} BlockIO_chibiOS_Config_Test_PAL;

/* Parameters (auto storage) */
struct Parameters_chibiOS_Config_Test__ {
  real_T chibiOS_Config_CH_FREQUENCY;  /* Mask Parameter: chibiOS_Config_CH_FREQUENCY
                                        * Referenced by: '<Root>/chibiOS_Config'
                                        */
  real_T chibiOS_Config_CH_MEMCORE_SIZE;/* Mask Parameter: chibiOS_Config_CH_MEMCORE_SIZE
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_CH_NO_IDLE_THREA;/* Mask Parameter: chibiOS_Config_CH_NO_IDLE_THREA
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_CH_TIME_QUANTUM;/* Mask Parameter: chibiOS_Config_CH_TIME_QUANTUM
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_MSFcnParameter5;/* Expression: CH_OPTIMIZE_SPEED
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_MSFcnParameter6;/* Expression: CH_USE_REGISTRY
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_MSFcnParameter7;/* Expression: CH_USE_WAITEXIT
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_MSFcnParameter8;/* Expression: CH_USE_SEMAPHORES
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_MSFcnParameter9;/* Expression: CH_USE_SEMAPHORES_PRIORITY
                                         * Referenced by: '<Root>/chibiOS_Config'
                                         */
  real_T chibiOS_Config_MSFcnParameter10;/* Expression: CH_USE_SEMSW
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter11;/* Expression: CH_USE_MUTEXES
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter12;/* Expression: CH_USE_CONDVARS
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter13;/* Expression: CH_USE_CONDVARS_TIMEOUT
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter14;/* Expression: CH_USE_EVENTS
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter15;/* Expression: CH_USE_EVENTS_TIMEOUT
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter16;/* Expression: CH_USE_MESSAGES
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter17;/* Expression: CH_USE_MESSAGES_PRIORITY
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter18;/* Expression: CH_USE_MAILBOXES
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter19;/* Expression: CH_USE_QUEUES
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter20;/* Expression: CH_USE_MEMCORE
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter21;/* Expression: CH_USE_HEAP
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter22;/* Expression: CH_USE_MALLOC_HEAP
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter23;/* Expression: CH_USE_MEMPOOLS
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter24;/* Expression: CH_USE_DYNAMIC
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter25;/* Expression: CH_DBG_SYSTEM_STATE_CHECK
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter26;/* Expression: CH_DBG_ENABLE_CHECKS
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter27;/* Expression: CH_DBG_ENABLE_ASSERTS
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter28;/* Expression: CH_DBG_ENABLE_TRACE
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter29;/* Expression: CH_DBG_ENABLE_STACK_CHECK
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter30;/* Expression: CH_DBG_FILL_THREADS
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  real_T chibiOS_Config_MSFcnParameter31;/* Expression: CH_DBG_THREADS_PROFILING
                                          * Referenced by: '<Root>/chibiOS_Config'
                                          */
  boolean_T PD0_const_Value;           /* Computed Parameter: PD0_const_Value
                                        * Referenced by: '<S2>/PD0_const'
                                        */
  boolean_T PD10_const_Value;          /* Computed Parameter: PD10_const_Value
                                        * Referenced by: '<S2>/PD10_const'
                                        */
  boolean_T PD11_const_Value;          /* Computed Parameter: PD11_const_Value
                                        * Referenced by: '<S2>/PD11_const'
                                        */
  boolean_T PD12_const_Value;          /* Computed Parameter: PD12_const_Value
                                        * Referenced by: '<S2>/PD12_const'
                                        */
  boolean_T PD14_const_Value;          /* Computed Parameter: PD14_const_Value
                                        * Referenced by: '<S2>/PD14_const'
                                        */
  boolean_T PD15_const_Value;          /* Computed Parameter: PD15_const_Value
                                        * Referenced by: '<S2>/PD15_const'
                                        */
  boolean_T PD1_const_Value;           /* Computed Parameter: PD1_const_Value
                                        * Referenced by: '<S2>/PD1_const'
                                        */
  boolean_T PD2_const_Value;           /* Computed Parameter: PD2_const_Value
                                        * Referenced by: '<S2>/PD2_const'
                                        */
  boolean_T PD3_const_Value;           /* Computed Parameter: PD3_const_Value
                                        * Referenced by: '<S2>/PD3_const'
                                        */
  boolean_T PD4_const_Value;           /* Computed Parameter: PD4_const_Value
                                        * Referenced by: '<S2>/PD4_const'
                                        */
  boolean_T PD5_const_Value;           /* Computed Parameter: PD5_const_Value
                                        * Referenced by: '<S2>/PD5_const'
                                        */
  boolean_T PD6_const_Value;           /* Computed Parameter: PD6_const_Value
                                        * Referenced by: '<S2>/PD6_const'
                                        */
  boolean_T PD7_const_Value;           /* Computed Parameter: PD7_const_Value
                                        * Referenced by: '<S2>/PD7_const'
                                        */
  boolean_T PD8_const_Value;           /* Computed Parameter: PD8_const_Value
                                        * Referenced by: '<S2>/PD8_const'
                                        */
  boolean_T PD9_const_Value;           /* Computed Parameter: PD9_const_Value
                                        * Referenced by: '<S2>/PD9_const'
                                        */
  boolean_T PA0_const_Value;           /* Computed Parameter: PA0_const_Value
                                        * Referenced by: '<S5>/PA0_const'
                                        */
  boolean_T PA1_const_Value;           /* Computed Parameter: PA1_const_Value
                                        * Referenced by: '<S5>/PA1_const'
                                        */
  boolean_T PA2_const_Value;           /* Computed Parameter: PA2_const_Value
                                        * Referenced by: '<S5>/PA2_const'
                                        */
  boolean_T PA3_const_Value;           /* Computed Parameter: PA3_const_Value
                                        * Referenced by: '<S5>/PA3_const'
                                        */
  boolean_T PA4_const_Value;           /* Computed Parameter: PA4_const_Value
                                        * Referenced by: '<S5>/PA4_const'
                                        */
  boolean_T PA5_const_Value;           /* Computed Parameter: PA5_const_Value
                                        * Referenced by: '<S5>/PA5_const'
                                        */
  boolean_T PA6_const_Value;           /* Computed Parameter: PA6_const_Value
                                        * Referenced by: '<S5>/PA6_const'
                                        */
  boolean_T PA7_const_Value;           /* Computed Parameter: PA7_const_Value
                                        * Referenced by: '<S5>/PA7_const'
                                        */
  boolean_T PA8_const_Value;           /* Computed Parameter: PA8_const_Value
                                        * Referenced by: '<S5>/PA8_const'
                                        */
  boolean_T PA9_const_Value;           /* Computed Parameter: PA9_const_Value
                                        * Referenced by: '<S5>/PA9_const'
                                        */
  boolean_T PA10_const_Value;          /* Computed Parameter: PA10_const_Value
                                        * Referenced by: '<S5>/PA10_const'
                                        */
  boolean_T PA11_const_Value;          /* Computed Parameter: PA11_const_Value
                                        * Referenced by: '<S5>/PA11_const'
                                        */
  boolean_T PA12_const_Value;          /* Computed Parameter: PA12_const_Value
                                        * Referenced by: '<S5>/PA12_const'
                                        */
  boolean_T PA13_const_Value;          /* Computed Parameter: PA13_const_Value
                                        * Referenced by: '<S5>/PA13_const'
                                        */
  boolean_T PA14_const_Value;          /* Computed Parameter: PA14_const_Value
                                        * Referenced by: '<S5>/PA14_const'
                                        */
  boolean_T PA15_const_Value;          /* Computed Parameter: PA15_const_Value
                                        * Referenced by: '<S5>/PA15_const'
                                        */
  boolean_T PD0_const_Value_o;         /* Computed Parameter: PD0_const_Value_o
                                        * Referenced by: '<S3>/PD0_const'
                                        */
  boolean_T PD10_const_Value_i;        /* Computed Parameter: PD10_const_Value_i
                                        * Referenced by: '<S3>/PD10_const'
                                        */
  boolean_T PD11_const_Value_b;        /* Computed Parameter: PD11_const_Value_b
                                        * Referenced by: '<S3>/PD11_const'
                                        */
  boolean_T PD12_const_Value_b;        /* Computed Parameter: PD12_const_Value_b
                                        * Referenced by: '<S3>/PD12_const'
                                        */
  boolean_T PD13_const_Value;          /* Computed Parameter: PD13_const_Value
                                        * Referenced by: '<S3>/PD13_const'
                                        */
  boolean_T PD14_const_Value_o;        /* Computed Parameter: PD14_const_Value_o
                                        * Referenced by: '<S3>/PD14_const'
                                        */
  boolean_T PD1_const_Value_g;         /* Computed Parameter: PD1_const_Value_g
                                        * Referenced by: '<S3>/PD1_const'
                                        */
  boolean_T PD2_const_Value_h;         /* Computed Parameter: PD2_const_Value_h
                                        * Referenced by: '<S3>/PD2_const'
                                        */
  boolean_T PD3_const_Value_m;         /* Computed Parameter: PD3_const_Value_m
                                        * Referenced by: '<S3>/PD3_const'
                                        */
  boolean_T PD4_const_Value_p;         /* Computed Parameter: PD4_const_Value_p
                                        * Referenced by: '<S3>/PD4_const'
                                        */
  boolean_T PD5_const_Value_a;         /* Computed Parameter: PD5_const_Value_a
                                        * Referenced by: '<S3>/PD5_const'
                                        */
  boolean_T PD6_const_Value_k;         /* Computed Parameter: PD6_const_Value_k
                                        * Referenced by: '<S3>/PD6_const'
                                        */
  boolean_T PD7_const_Value_o;         /* Computed Parameter: PD7_const_Value_o
                                        * Referenced by: '<S3>/PD7_const'
                                        */
  boolean_T PD8_const_Value_m;         /* Computed Parameter: PD8_const_Value_m
                                        * Referenced by: '<S3>/PD8_const'
                                        */
  boolean_T PD9_const_Value_p;         /* Computed Parameter: PD9_const_Value_p
                                        * Referenced by: '<S3>/PD9_const'
                                        */
  boolean_T PD0_const_Value_k;         /* Computed Parameter: PD0_const_Value_k
                                        * Referenced by: '<S4>/PD0_const'
                                        */
  boolean_T PD10_const_Value_f;        /* Computed Parameter: PD10_const_Value_f
                                        * Referenced by: '<S4>/PD10_const'
                                        */
  boolean_T PD11_const_Value_d;        /* Computed Parameter: PD11_const_Value_d
                                        * Referenced by: '<S4>/PD11_const'
                                        */
  boolean_T PD13_const_Value_i;        /* Computed Parameter: PD13_const_Value_i
                                        * Referenced by: '<S4>/PD13_const'
                                        */
  boolean_T PD14_const_Value_f;        /* Computed Parameter: PD14_const_Value_f
                                        * Referenced by: '<S4>/PD14_const'
                                        */
  boolean_T PD15_const_Value_o;        /* Computed Parameter: PD15_const_Value_o
                                        * Referenced by: '<S4>/PD15_const'
                                        */
  boolean_T PD1_const_Value_d;         /* Computed Parameter: PD1_const_Value_d
                                        * Referenced by: '<S4>/PD1_const'
                                        */
  boolean_T PD2_const_Value_k;         /* Computed Parameter: PD2_const_Value_k
                                        * Referenced by: '<S4>/PD2_const'
                                        */
  boolean_T PD3_const_Value_n;         /* Computed Parameter: PD3_const_Value_n
                                        * Referenced by: '<S4>/PD3_const'
                                        */
  boolean_T PD4_const_Value_m;         /* Computed Parameter: PD4_const_Value_m
                                        * Referenced by: '<S4>/PD4_const'
                                        */
  boolean_T PD5_const_Value_f;         /* Computed Parameter: PD5_const_Value_f
                                        * Referenced by: '<S4>/PD5_const'
                                        */
  boolean_T PD6_const_Value_c;         /* Computed Parameter: PD6_const_Value_c
                                        * Referenced by: '<S4>/PD6_const'
                                        */
  boolean_T PD7_const_Value_m;         /* Computed Parameter: PD7_const_Value_m
                                        * Referenced by: '<S4>/PD7_const'
                                        */
  boolean_T PD8_const_Value_p;         /* Computed Parameter: PD8_const_Value_p
                                        * Referenced by: '<S4>/PD8_const'
                                        */
  boolean_T PD9_const_Value_d;         /* Computed Parameter: PD9_const_Value_d
                                        * Referenced by: '<S4>/PD9_const'
                                        */
  boolean_T PD0_const_Value_e;         /* Computed Parameter: PD0_const_Value_e
                                        * Referenced by: '<S1>/PD0_const'
                                        */
  boolean_T PD10_const_Value_n;        /* Computed Parameter: PD10_const_Value_n
                                        * Referenced by: '<S1>/PD10_const'
                                        */
  boolean_T PD11_const_Value_bn;       /* Computed Parameter: PD11_const_Value_bn
                                        * Referenced by: '<S1>/PD11_const'
                                        */
  boolean_T PD12_const_Value_d;        /* Computed Parameter: PD12_const_Value_d
                                        * Referenced by: '<S1>/PD12_const'
                                        */
  boolean_T PD13_const_Value_k;        /* Computed Parameter: PD13_const_Value_k
                                        * Referenced by: '<S1>/PD13_const'
                                        */
  boolean_T PD14_const_Value_m;        /* Computed Parameter: PD14_const_Value_m
                                        * Referenced by: '<S1>/PD14_const'
                                        */
  boolean_T PD15_const_Value_g;        /* Computed Parameter: PD15_const_Value_g
                                        * Referenced by: '<S1>/PD15_const'
                                        */
  boolean_T PD1_const_Value_m;         /* Computed Parameter: PD1_const_Value_m
                                        * Referenced by: '<S1>/PD1_const'
                                        */
  boolean_T PD2_const_Value_a;         /* Computed Parameter: PD2_const_Value_a
                                        * Referenced by: '<S1>/PD2_const'
                                        */
  boolean_T PD3_const_Value_nq;        /* Computed Parameter: PD3_const_Value_nq
                                        * Referenced by: '<S1>/PD3_const'
                                        */
  boolean_T PD4_const_Value_e;         /* Computed Parameter: PD4_const_Value_e
                                        * Referenced by: '<S1>/PD4_const'
                                        */
  boolean_T PD5_const_Value_j;         /* Computed Parameter: PD5_const_Value_j
                                        * Referenced by: '<S1>/PD5_const'
                                        */
  boolean_T PD6_const_Value_l;         /* Computed Parameter: PD6_const_Value_l
                                        * Referenced by: '<S1>/PD6_const'
                                        */
  boolean_T PD7_const_Value_h;         /* Computed Parameter: PD7_const_Value_h
                                        * Referenced by: '<S1>/PD7_const'
                                        */
  boolean_T PD8_const_Value_f;         /* Computed Parameter: PD8_const_Value_f
                                        * Referenced by: '<S1>/PD8_const'
                                        */
  boolean_T PD9_const_Value_a;         /* Computed Parameter: PD9_const_Value_a
                                        * Referenced by: '<S1>/PD9_const'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_chibiOS_Config_Test_PAL {
  const char_T *errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    struct {
      uint8_T TID[4];
    } TaskCounters;

    struct {
      boolean_T TID0_1;
      boolean_T TID0_2;
    } RateInteraction;
  } Timing;
};

/* Enums */

/* Definitions */

/* Declarations */

/* Block parameters (auto storage) */
extern Parameters_chibiOS_Config_Test_ chibiOS_Config_Test_PAL_P;

/* Block signals (auto storage) */
extern BlockIO_chibiOS_Config_Test_PAL chibiOS_Config_Test_PAL_B;

/* External function called from main */
extern void chibiOS_Config_Test_PAL_SetEventsForThisBaseStep(boolean_T
  *eventFlags);

/* Model entry point functions */
extern void chibiOS_Config_Test_PAL_SetEventsForThisBaseStep(boolean_T
  *eventFlags);
extern void chibiOS_Config_Test_PAL_initialize(void);
extern void chibiOS_Config_Test_PAL_step(int_T tid);

/* Real-time Model object */
extern RT_MODEL_chibiOS_Config_Test_PA *const chibiOS_Config_Test_PAL_M;

/* Functions */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'chibiOS_Config_Test_PAL'
 * '<S1>'   : 'chibiOS_Config_Test_PAL/Subsystem1'
 * '<S2>'   : 'chibiOS_Config_Test_PAL/Subsystem2'
 * '<S3>'   : 'chibiOS_Config_Test_PAL/Subsystem3'
 * '<S4>'   : 'chibiOS_Config_Test_PAL/Subsystem4'
 * '<S5>'   : 'chibiOS_Config_Test_PAL/pal_Config'
 */

/*-
 * Requirements for '<Root>': chibiOS_Config_Test_PAL
 */

/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
#endif                                 /* RTW_HEADER_chibiOS_Config_Test_PAL_h_ */

/* [EOF] chibiOS_Config_Test_PAL.h */
