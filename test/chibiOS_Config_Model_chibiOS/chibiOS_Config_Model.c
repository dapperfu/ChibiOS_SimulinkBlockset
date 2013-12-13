/**************************************************************************
   Code generated for Simulink model: chibiOS_Config_Model.
   Model version                    : 1.138
   Simulink Coder version           : 8.3 (R2012b) 20-Jul-2012
   TLC version                      : 8.3 (Jul 21 2012)
   C/C++ source code generated on   : Tue Dec 10 23:47:43 2013
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
/* Includes - BlockInstanceSetup (<Root>/pwm_Config)*/
/* Includes - BlockInstanceSetup (<Root>/pwm_Config1)*/
#include "ch.h"
#include "hal.h"
#include "chibiOS_Config_Model.h"
#include "chibiOS_Config_Model_private.h"

/* Defines */

/* Defines - BlockInstanceSetup (<Root>/pwm_Config)*/
/* Defines - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* Types */

/* IntrinsicTypes - BlockInstanceSetup (<Root>/pwm_Config)*/
/* IntrinsicTypes - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* PrimitiveTypedefs - BlockInstanceSetup (<Root>/pwm_Config)*/
/* PrimitiveTypedefs - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* UserTop - BlockInstanceSetup (<Root>/pwm_Config)*/
/* UserTop - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* Typedefs - BlockInstanceSetup (<Root>/pwm_Config)*/
/* Typedefs - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* Enums */

/* Enums - BlockInstanceSetup (<Root>/pwm_Config)*/
/* Enums - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* Definitions */

/* Real-time model */
RT_MODEL_chibiOS_Config_Model chibiOS_Config_Model_M_;
RT_MODEL_chibiOS_Config_Model *const chibiOS_Config_Model_M =
  &chibiOS_Config_Model_M_;

/* Declarations */
static void rate_monotonic_scheduler(void);

/* Declarations - BlockInstanceSetup (<Root>/pwm_Config)*/
static PWMConfig pwmcfg3 = {
  100000,
  128,
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

/* Functions - BlockInstanceSetup (<Root>/pwm_Config)*/
/* Functions - BlockInstanceSetup (<Root>/pwm_Config1)*/

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
   */
  (chibiOS_Config_Model_M->Timing.TaskCounters.TID[1])++;
  if ((chibiOS_Config_Model_M->Timing.TaskCounters.TID[1]) > 49) {/* Sample time: [0.5s, 0.0s] */
    chibiOS_Config_Model_M->Timing.TaskCounters.TID[1] = 0;
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
  /* Output Block: <Root>/pwm_Config */

  /* Output Block: <Root>/pwm_Config1 */

  /* Update Block: <Root>/pwm_Config */
  pwmEnableChannel(&PWMD3, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant1_Value));
  pwmEnableChannel(&PWMD3, 1, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant2_Value));
  pwmEnableChannel(&PWMD3, 2, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant3_Value));
  pwmEnableChannel(&PWMD3, 3, PWM_PERCENTAGE_TO_WIDTH(&PWMD3,
    chibiOS_Config_Model_P.Constant4_Value));

  /* Update Block: <Root>/pwm_Config1 */
  pwmEnableChannel(&PWMD4, 0, PWM_PERCENTAGE_TO_WIDTH(&PWMD4, 100));
  pwmEnableChannel(&PWMD4, 1, PWM_PERCENTAGE_TO_WIDTH(&PWMD4, 2500));
  pwmEnableChannel(&PWMD4, 2, PWM_PERCENTAGE_TO_WIDTH(&PWMD4, 5000));
  pwmEnableChannel(&PWMD4, 3, PWM_PERCENTAGE_TO_WIDTH(&PWMD4, 7500));
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

   default :
    break;
  }
}

/* Model initialize function */
void chibiOS_Config_Model_initialize(void)
{
  /* Start Block: <Root>/pwm_Config */

  /* Start Block: <Root>/pwm_Config1 */

  /* InitializeConditions Block: <Root>/pwm_Config */
  pwmStart(&PWMD3, &pwmcfg3);
  palSetPadMode(GPIOC, 6, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOC, 7, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOC, 8, PAL_MODE_ALTERNATE(2));
  palSetPadMode(GPIOC, 9, PAL_MODE_ALTERNATE(2));

  /* InitializeConditions Block: <Root>/pwm_Config1 */
  pwmStart(&PWMD4, &pwmcfg4);
  palSetPadMode(GPIOD, GPIOD_LED4, PAL_MODE_ALTERNATE(2));      /* Green.   */
  palSetPadMode(GPIOD, GPIOD_LED3, PAL_MODE_ALTERNATE(2));      /* Orange.  */
  palSetPadMode(GPIOD, GPIOD_LED5, PAL_MODE_ALTERNATE(2));      /* Red.     */
  palSetPadMode(GPIOD, GPIOD_LED6, PAL_MODE_ALTERNATE(2));      /* Blue.    */
}

/* CompilerErrors - BlockInstanceSetup (<Root>/pwm_Config)*/
/* CompilerErrors - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* CompilerWarnings - BlockInstanceSetup (<Root>/pwm_Config)*/
/* CompilerWarnings - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* Documentation - BlockInstanceSetup (<Root>/pwm_Config)*/
/* Documentation - BlockInstanceSetup (<Root>/pwm_Config1)*/

/* UserBottom - BlockTypeSetup .c */
/* UserBottom - BlockInstanceSetup (<Root>/pwm_Config).c */
/* UserBottom - BlockInstanceSetup (<Root>/pwm_Config1).c */

/* [EOF] chibiOS_Config_Model.c */
