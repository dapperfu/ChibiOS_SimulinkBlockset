/**************************************************************************
   Code generated for Simulink model: chibiOS_Config_Model.
   Model version                    : 1.171
   Simulink Coder version           : 8.3 (R2012b) 20-Jul-2012
   TLC version                      : 8.3 (Jul 21 2012)
   C/C++ source code generated on   : Sat Dec 14 01:14:19 2013
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
/* Includes - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* Includes - BlockInstanceSetup (<Root>/pwm_Config3)*/

#include "chibiOS_Config_Model.h"
#include "chibiOS_Config_Model_private.h"

/* Defines */

/* Defines - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* Defines - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* Types */

/* IntrinsicTypes - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* IntrinsicTypes - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* PrimitiveTypedefs - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* PrimitiveTypedefs - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* UserTop - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* UserTop - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* Typedefs - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* Typedefs - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* Enums */

/* Enums - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* Enums - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* Definitions */

/* Block signals (auto storage) */
BlockIO_chibiOS_Config_Model chibiOS_Config_Model_B;

/* Real-time model */
RT_MODEL_chibiOS_Config_Model chibiOS_Config_Model_M_;
RT_MODEL_chibiOS_Config_Model *const chibiOS_Config_Model_M =
  &chibiOS_Config_Model_M_;

/* Declarations */
static void rate_monotonic_scheduler(void);

/* Declarations - BlockInstanceSetup (<Root>/pwm_Config2)*/
static PWMConfig pwmcfg3 = {
  10000,
  10000,
  NULL,

  {
    { PWM_OUTPUT_ACTIVE_HIGH, NULL },

    { PWM_OUTPUT_ACTIVE_HIGH, NULL },

    { PWM_OUTPUT_ACTIVE_HIGH, NULL },

    { PWM_OUTPUT_ACTIVE_HIGH, NULL }
  },

  /* HW dependent part.*/
  0,
  0
};

/* Declarations - BlockInstanceSetup (<Root>/pwm_Config3)*/
static PWMConfig pwmcfg4 = {
  10000,
  10000,
  NULL,

  {
    { PWM_OUTPUT_ACTIVE_HIGH, NULL },

    { PWM_OUTPUT_ACTIVE_HIGH, NULL },

    { PWM_OUTPUT_ACTIVE_HIGH, NULL },

    { PWM_OUTPUT_ACTIVE_HIGH, NULL }
  },

  /* HW dependent part.*/
  0,
  0
};

/* Functions */

/* Functions - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* Functions - BlockInstanceSetup (<Root>/pwm_Config3)*/

/*
 * Set which subrates need to run this base step (base rate always runs).
 * This function must be called prior to calling the model step function
 * in order to "remember" which rates need to run this base step.  The
 * buffering of events allows for overlapping preemption.
 */
void chibiOS_Config_Model_SetEventsForThisBaseStep(boolean_T *eventFlags)
{
  /* Task runs when its counter is zero, computed via rtmStepTask macro */
  eventFlags[1] = ((boolean_T)rtmStepTask(chibiOS_Config_Model_M, 1));
  eventFlags[2] = ((boolean_T)rtmStepTask(chibiOS_Config_Model_M, 2));
}

/*
 *   This function updates active task flag for each subrate
 * and rate transition flags for tasks that exchange data.
 * The function assumes rate-monotonic multitasking scheduler.
 * The function must be called at model base rate so that
 * the generated code self-manages all its subrates and rate
 * transition flags.
 */
static void rate_monotonic_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   *
   * Sample time offsets are handled by priming the counter with the
   * appropriate non-zero value in the model's initialization function.
   */
  (chibiOS_Config_Model_M->Timing.TaskCounters.TID[1])++;
  if ((chibiOS_Config_Model_M->Timing.TaskCounters.TID[1]) > 49) {/* Sample time: [0.5s, 0.0s] */
    chibiOS_Config_Model_M->Timing.TaskCounters.TID[1] = 0;
  }

  (chibiOS_Config_Model_M->Timing.TaskCounters.TID[2])++;
  if ((chibiOS_Config_Model_M->Timing.TaskCounters.TID[2]) > 199) {/* Sample time: [2.0s, 1.0s] */
    chibiOS_Config_Model_M->Timing.TaskCounters.TID[2] = 0;
  }
}

/* Model step function for TID0 */
void chibiOS_Config_Model_step0(void)  /* Sample time: [0.01s, 0.0s] */
{
  {                                    /* Sample time: [0.01s, 0.0s] */
    rate_monotonic_scheduler();
  }
}

/* Model step function for TID1 */
void chibiOS_Config_Model_step1(void)  /* Sample time: [0.5s, 0.0s] */
{
  /* Output Block: <Root>/pwm_Config2 */

  /* Update Block: <Root>/pwm_Config2 */
  pwmEnableChannel(&PWMD3, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant1_Value));
  pwmEnableChannel(&PWMD3, 1, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant2_Value));
  pwmEnableChannel(&PWMD3, 2, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant3_Value));
  pwmEnableChannel(&PWMD3, 3, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant4_Value));
}

/* Model step function for TID2 */
void chibiOS_Config_Model_step2(void)  /* Sample time: [2.0s, 1.0s] */
{
  /* RateTransition: '<Root>/Rate Transition' incorporates:
   *  Constant: '<Root>/Constant1'
   */
  chibiOS_Config_Model_B.RateTransition = chibiOS_Config_Model_P.Constant1_Value;

  /* RateTransition: '<Root>/Rate Transition1' incorporates:
   *  Constant: '<Root>/Constant2'
   */
  chibiOS_Config_Model_B.RateTransition1 =
    chibiOS_Config_Model_P.Constant2_Value;

  /* RateTransition: '<Root>/Rate Transition2' incorporates:
   *  Constant: '<Root>/Constant3'
   */
  chibiOS_Config_Model_B.RateTransition2 =
    chibiOS_Config_Model_P.Constant3_Value;

  /* RateTransition: '<Root>/Rate Transition3' incorporates:
   *  Constant: '<Root>/Constant4'
   */
  chibiOS_Config_Model_B.RateTransition3 =
    chibiOS_Config_Model_P.Constant4_Value;

  /* Output Block: <Root>/pwm_Config3 */

  /* Update Block: <Root>/pwm_Config3 */
  pwmEnableChannel(&PWMD4, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD4,
    chibiOS_Config_Model_B.RateTransition));
  pwmEnableChannel(&PWMD4, 1, PWM_PERCENTAGE_TO_WIDTH(&PWMD4,
    chibiOS_Config_Model_B.RateTransition1));
  pwmEnableChannel(&PWMD4, 2, PWM_PERCENTAGE_TO_WIDTH(&PWMD4,
    chibiOS_Config_Model_B.RateTransition2));
  pwmEnableChannel(&PWMD4, 3, PWM_PERCENTAGE_TO_WIDTH(&PWMD4,
    chibiOS_Config_Model_B.RateTransition3));
}

/* Model step wrapper function for compatibility with a static main program */
void chibiOS_Config_Model_step(int_T tid)
{
  switch (tid) {
   case 0 :
    chibiOS_Config_Model_step0();
    break;

   case 1 :
    chibiOS_Config_Model_step1();
    break;

   case 2 :
    chibiOS_Config_Model_step2();
    break;

   default :
    break;
  }
}

/* Model initialize function */
void chibiOS_Config_Model_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)chibiOS_Config_Model_M, 0,
                sizeof(RT_MODEL_chibiOS_Config_Model));

  /* initialize sample time offsets */
  chibiOS_Config_Model_M->Timing.TaskCounters.TID[2] = 100;/* Sample time: [2.0s, 1.0s] */

  /* block I/O */
  (void) memset(((void *) &chibiOS_Config_Model_B), 0,
                sizeof(BlockIO_chibiOS_Config_Model));

  /* Start Block: <Root>/pwm_Config2 */

  /* Start Block: <Root>/pwm_Config3 */

  /* InitializeConditions Block: <Root>/pwm_Config2 */
  pwmStart(&PWMD3, &pwmcfg3);
  palSetPadMode(GPIOC, 6, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOC, 7, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOC, 8, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOC, 9, PAL_MODE_ALTERNATE(2));

  /* InitializeConditions Block: <Root>/pwm_Config3 */
  pwmStart(&PWMD4, &pwmcfg4);
  palSetPadMode(GPIOD, 12, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOD, 13, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOD, 14, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOD, 15, PAL_MODE_ALTERNATE(2));
}

/* CompilerErrors - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* CompilerErrors - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* CompilerWarnings - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* CompilerWarnings - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* Documentation - BlockInstanceSetup (<Root>/pwm_Config2)*/
/* Documentation - BlockInstanceSetup (<Root>/pwm_Config3)*/

/* UserBottom - BlockTypeSetup .c */
/* UserBottom - BlockInstanceSetup (<Root>/pwm_Config2).c */
/* UserBottom - BlockInstanceSetup (<Root>/pwm_Config3).c */

/* [EOF] chibiOS_Config_Model.c */
