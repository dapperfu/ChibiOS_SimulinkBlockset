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
#ifndef RTW_HEADER_chibiOS_Config_Test_PWM_h_
#define RTW_HEADER_chibiOS_Config_Test_PWM_h_
#include <string.h>
#ifndef chibiOS_Config_Test_PWM_COMMON_INCLUDES_
# define chibiOS_Config_Test_PWM_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "hal.h"
#include "ch.h"
#endif                                 /* chibiOS_Config_Test_PWM_COMMON_INCLUDES_ */

#include "chibiOS_Config_Test_PWM_types.h"

/* Child system includes */
#include "AtomicSubsystem.h"

/* Defines */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

/* Types */

/* Block signals (auto storage) */
typedef struct {
  real32_T Sum;                        /* '<S1>/Sum' */
  real32_T RateTransition2;            /* '<S1>/Rate Transition2' */
  real32_T RateTransition3;            /* '<S1>/Rate Transition3' */
  real32_T Product;                    /* '<S2>/Product' */
  uint32_T RateTransition;             /* '<S1>/Rate Transition' */
  uint16_T RateTransition1;            /* '<S1>/Rate Transition1' */
} BlockIO_chibiOS_Config_Test_PWM;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  boolean_T Subsystem_MODE;            /* '<Root>/Subsystem' */
} D_Work_chibiOS_Config_Test_PWM;

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
  real_T Step_Time;                    /* Expression: 5
                                        * Referenced by: '<Root>/Step'
                                        */
  real_T Step_Y0;                      /* Expression: 0
                                        * Referenced by: '<Root>/Step'
                                        */
  real_T Step_YFinal;                  /* Expression: 1
                                        * Referenced by: '<Root>/Step'
                                        */
  real_T Step1_Time;                   /* Expression: 10
                                        * Referenced by: '<Root>/Step1'
                                        */
  real_T Step1_Y0;                     /* Expression: 0
                                        * Referenced by: '<Root>/Step1'
                                        */
  real_T Step1_YFinal;                 /* Expression: -1
                                        * Referenced by: '<Root>/Step1'
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
  real32_T Constant3_Value;            /* Expression: single(rand(1,1)*2500)
                                        * Referenced by: '<S2>/Constant3'
                                        */
  real32_T Constant4_Value;            /* Expression: single(rand(1,1)*4)
                                        * Referenced by: '<S2>/Constant4'
                                        */
  real32_T Constant5_Value;            /* Expression: single(rand(1,1)*5000)
                                        * Referenced by: '<S1>/Constant5'
                                        */
  real32_T Constant6_Value;            /* Expression: single(rand(1,1)*5000)
                                        * Referenced by: '<S1>/Constant6'
                                        */
  uint32_T Constant1_Value;            /* Expression: uint32(rand(1,1)*10000)
                                        * Referenced by: '<S1>/Constant1'
                                        */
  uint16_T Constant2_Value;            /* Expression: uint16(rand(1,1)*2^16)
                                        * Referenced by: '<S1>/Constant2'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_chibiOS_Config_Test_PWM {
  const char_T *errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    struct {
      uint8_T TID[5];
    } TaskCounters;
  } Timing;
};

/* Enums */

/* Definitions */

/* Declarations */

/* Block parameters (auto storage) */
extern Parameters_chibiOS_Config_Test_ chibiOS_Config_Test_PWM_P;

/* Block signals (auto storage) */
extern BlockIO_chibiOS_Config_Test_PWM chibiOS_Config_Test_PWM_B;

/* Block states (auto storage) */
extern D_Work_chibiOS_Config_Test_PWM chibiOS_Config_Test_PWM_DWork;

/* Model entry point functions */
extern void chibiOS_Config_Test_PWM_initialize(void);
extern void chibiOS_Config_Test_PWM_step(void);

/* Real-time Model object */
extern RT_MODEL_chibiOS_Config_Test_PW *const chibiOS_Config_Test_PWM_M;

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
 * '<Root>' : 'chibiOS_Config_Test_PWM'
 * '<S1>'   : 'chibiOS_Config_Test_PWM/Subsystem'
 * '<S2>'   : 'chibiOS_Config_Test_PWM/Subsystem/AtomicSubsystem'
 */

/*-
 * Requirements for '<Root>': chibiOS_Config_Test_PWM
 */

/* UserBottom - BlockTypeSetup .h */
/* UserBottom - BlockInstanceSetup (<S1>/pwm_Config3).h */
#endif                                 /* RTW_HEADER_chibiOS_Config_Test_PWM_h_ */

/* [EOF] chibiOS_Config_Test_PWM.h */
