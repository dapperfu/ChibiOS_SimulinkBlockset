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

/* Includes - BlockInstanceSetup */
/* Includes - BlockInstanceSetup */
/* Includes - BlockInstanceSetup */
/* Includes - BlockInstanceSetup */
/* Includes - BlockInstanceSetup */
#include "chibiOS_Config_Test_PAL.h"
#include "chibiOS_Config_Test_PAL_private.h"

/* Defines */

/* Defines - BlockInstanceSetup */
/* Defines - BlockInstanceSetup */
/* Defines - BlockInstanceSetup */
/* Defines - BlockInstanceSetup */
/* Defines - BlockInstanceSetup */

/* Types */

/* IntrinsicTypes - BlockInstanceSetup */
/* IntrinsicTypes - BlockInstanceSetup */
/* IntrinsicTypes - BlockInstanceSetup */
/* IntrinsicTypes - BlockInstanceSetup */
/* IntrinsicTypes - BlockInstanceSetup */

/* PrimitiveTypedefs - BlockInstanceSetup */
/* PrimitiveTypedefs - BlockInstanceSetup */
/* PrimitiveTypedefs - BlockInstanceSetup */
/* PrimitiveTypedefs - BlockInstanceSetup */
/* PrimitiveTypedefs - BlockInstanceSetup */

/* UserTop - BlockInstanceSetup */
/* UserTop - BlockInstanceSetup */
/* UserTop - BlockInstanceSetup */
/* UserTop - BlockInstanceSetup */
/* UserTop - BlockInstanceSetup */

/* Typedefs - BlockInstanceSetup */
/* Typedefs - BlockInstanceSetup */
/* Typedefs - BlockInstanceSetup */
/* Typedefs - BlockInstanceSetup */
/* Typedefs - BlockInstanceSetup */

/* Enums */

/* Enums - BlockInstanceSetup */
/* Enums - BlockInstanceSetup */
/* Enums - BlockInstanceSetup */
/* Enums - BlockInstanceSetup */
/* Enums - BlockInstanceSetup */

/* Definitions */

/* Block signals (auto storage) */
BlockIO_chibiOS_Config_Test_PAL chibiOS_Config_Test_PAL_B;

/* Real-time model */
RT_MODEL_chibiOS_Config_Test_PA chibiOS_Config_Test_PAL_M_;
RT_MODEL_chibiOS_Config_Test_PA *const chibiOS_Config_Test_PAL_M =
  &chibiOS_Config_Test_PAL_M_;

/* Declarations */
static void rate_monotonic_scheduler(void);

/* Declarations - BlockInstanceSetup */
/* Declarations - BlockInstanceSetup */
/* Declarations - BlockInstanceSetup */
/* Declarations - BlockInstanceSetup */
/* Declarations - BlockInstanceSetup */

/* Functions */

/* Functions - BlockInstanceSetup */
/* Functions - BlockInstanceSetup */
/* Functions - BlockInstanceSetup */
/* Functions - BlockInstanceSetup */
/* Functions - BlockInstanceSetup */

/*
 * Set which subrates need to run this base step (base rate always runs).
 * This function must be called prior to calling the model step function
 * in order to "remember" which rates need to run this base step.  The
 * buffering of events allows for overlapping preemption.
 */
void chibiOS_Config_Test_PAL_SetEventsForThisBaseStep(boolean_T *eventFlags)
{
  /* Task runs when its counter is zero, computed via rtmStepTask macro */
  eventFlags[1] = ((boolean_T)rtmStepTask(chibiOS_Config_Test_PAL_M, 1));
  eventFlags[2] = ((boolean_T)rtmStepTask(chibiOS_Config_Test_PAL_M, 2));
  eventFlags[3] = ((boolean_T)rtmStepTask(chibiOS_Config_Test_PAL_M, 3));
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
  /* To ensure a deterministic data transfer between two rates,
   * data is transferred at the priority of a fast task and the frequency
   * of the slow task.  The following flags indicate when the data transfer
   * happens.  That is, a rate interaction flag is set true when both rates
   * will run, and false otherwise.
   */

  /* tid 0 shares data with slower tid rates: 1, 2 */
  chibiOS_Config_Test_PAL_M->Timing.RateInteraction.TID0_1 =
    (chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[1] == 0);
  chibiOS_Config_Test_PAL_M->Timing.RateInteraction.TID0_2 =
    (chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[2] == 0);

  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[1])++;
  if ((chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[1]) > 3) {/* Sample time: [0.06s, 0.0s] */
    chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[1] = 0;
  }

  (chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[2])++;
  if ((chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[2]) > 5) {/* Sample time: [0.09s, 0.0s] */
    chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[2] = 0;
  }

  (chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[3])++;
  if ((chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[3]) > 59) {/* Sample time: [0.9s, 0.0s] */
    chibiOS_Config_Test_PAL_M->Timing.TaskCounters.TID[3] = 0;
  }
}

/* Model step function for TID0 */
void chibiOS_Config_Test_PAL_step0(void) /* Sample time: [0.015s, 0.0s] */
{
  {                                    /* Sample time: [0.015s, 0.0s] */
    rate_monotonic_scheduler();
  }

  /* Output Block: <S5>/pal_Config */
  chibiOS_Config_Test_PAL_B.pal_Config_o1= palReadPad(GPIOA,0);

  /* Pin 1 Disabled */
  /* Pin 2 Disabled */
  /* Pin 3 Disabled */
  /* Pin 4 Disabled */
  /* Pin 5 Disabled */
  /* Pin 6 Disabled */
  /* Pin 7 Disabled */
  /* Pin 8 Disabled */
  /* Pin 9 Disabled */
  /* Pin 10 Disabled */
  /* Pin 11 Disabled */
  /* Pin 12 Disabled */
  /* Pin 13 Disabled */
  /* Pin 14 Disabled */
  /* Pin 15 Disabled */

  /* RateTransition: '<Root>/Rate Transition2' */
  if (chibiOS_Config_Test_PAL_M->Timing.RateInteraction.TID0_2) {
    chibiOS_Config_Test_PAL_B.RateTransition2 =
      chibiOS_Config_Test_PAL_B.pal_Config_o1;
  }

  /* End of RateTransition: '<Root>/Rate Transition2' */
  /* Output Block: <S3>/pal_Config */
  /* Pin 0 Disabled */
  /* Pin 1 Disabled */
  /* Pin 2 Disabled */
  /* Pin 3 Disabled */
  /* Pin 4 Disabled */
  /* Pin 5 Disabled */
  /* Pin 6 Disabled */
  /* Pin 7 Disabled */
  /* Pin 8 Disabled */
  /* Pin 9 Disabled */
  /* Pin 10 Disabled */
  /* Pin 11 Disabled */
  /* Pin 12 Disabled */
  /* Pin 13 Disabled */
  /* Pin 14 Disabled */
  palWritePad(GPIOD,15,chibiOS_Config_Test_PAL_B.pal_Config_o1);

  /* RateTransition: '<Root>/Rate Transition3' */
  if (chibiOS_Config_Test_PAL_M->Timing.RateInteraction.TID0_1) {
    chibiOS_Config_Test_PAL_B.RateTransition3 =
      chibiOS_Config_Test_PAL_B.pal_Config_o1;
  }

  /* End of RateTransition: '<Root>/Rate Transition3' */

  /* Update Block: <S5>/pal_Config */

  /* Update Block: <S3>/pal_Config */
}

/* Model step function for TID1 */
void chibiOS_Config_Test_PAL_step1(void) /* Sample time: [0.06s, 0.0s] */
{
  /* Output Block: <S4>/pal_Config */
  /* Pin 0 Disabled */
  /* Pin 1 Disabled */
  /* Pin 2 Disabled */
  /* Pin 3 Disabled */
  /* Pin 4 Disabled */
  /* Pin 5 Disabled */
  /* Pin 6 Disabled */
  /* Pin 7 Disabled */
  /* Pin 8 Disabled */
  /* Pin 9 Disabled */
  /* Pin 10 Disabled */
  /* Pin 11 Disabled */
  palWritePad(GPIOD,12,chibiOS_Config_Test_PAL_B.RateTransition3);

  /* Pin 13 Disabled */
  /* Pin 14 Disabled */
  /* Pin 15 Disabled */

  /* Update Block: <S4>/pal_Config */
}

/* Model step function for TID2 */
void chibiOS_Config_Test_PAL_step2(void) /* Sample time: [0.09s, 0.0s] */
{
  /* Output Block: <S2>/pal_Config */
  /* Pin 0 Disabled */
  /* Pin 1 Disabled */
  /* Pin 2 Disabled */
  /* Pin 3 Disabled */
  /* Pin 4 Disabled */
  /* Pin 5 Disabled */
  /* Pin 6 Disabled */
  /* Pin 7 Disabled */
  /* Pin 8 Disabled */
  /* Pin 9 Disabled */
  /* Pin 10 Disabled */
  /* Pin 11 Disabled */
  /* Pin 12 Disabled */
  palWritePad(GPIOD,13,chibiOS_Config_Test_PAL_B.RateTransition2);

  /* Pin 14 Disabled */
  /* Pin 15 Disabled */

  /* Update Block: <S2>/pal_Config */
}

/* Model step function for TID3 */
void chibiOS_Config_Test_PAL_step3(void) /* Sample time: [0.9s, 0.0s] */
{
  /* Output Block: <S1>/pal_Config */
  /* Pin 0 Disabled */
  /* Pin 1 Disabled */
  /* Pin 2 Disabled */
  /* Pin 3 Disabled */
  /* Pin 4 Disabled */
  /* Pin 5 Disabled */
  /* Pin 6 Disabled */
  /* Pin 7 Disabled */
  /* Pin 8 Disabled */
  /* Pin 9 Disabled */
  /* Pin 10 Disabled */
  /* Pin 11 Disabled */
  /* Pin 12 Disabled */
  /* Pin 13 Disabled */
  palTogglePad(GPIOD,14);

  /* Pin 15 Disabled */

  /* Update Block: <S1>/pal_Config */
}

/* Model step wrapper function for compatibility with a static main program */
void chibiOS_Config_Test_PAL_step(int_T tid)
{
  switch (tid) {
   case 0 :
    chibiOS_Config_Test_PAL_step0();
    break;

   case 1 :
    chibiOS_Config_Test_PAL_step1();
    break;

   case 2 :
    chibiOS_Config_Test_PAL_step2();
    break;

   case 3 :
    chibiOS_Config_Test_PAL_step3();
    break;

   default :
    break;
  }
}

/* Model initialize function */
void chibiOS_Config_Test_PAL_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)chibiOS_Config_Test_PAL_M, 0,
                sizeof(RT_MODEL_chibiOS_Config_Test_PA));

  /* block I/O */
  (void) memset(((void *) &chibiOS_Config_Test_PAL_B), 0,
                sizeof(BlockIO_chibiOS_Config_Test_PAL));

  {
    /* user code (Start function Header) */

    /* Header Custom Code: <S5>/pal_Config */
    /* Declaration Custom Code: <S5>/pal_Config */
    /* Header Custom Code: <S2>/pal_Config */
    /* Declaration Custom Code: <S2>/pal_Config */
    /* Header Custom Code: <S3>/pal_Config */
    /* Declaration Custom Code: <S3>/pal_Config */
    /* Header Custom Code: <S4>/pal_Config */
    /* Declaration Custom Code: <S4>/pal_Config */
    /* Header Custom Code: <S1>/pal_Config */
    /* Declaration Custom Code: <S1>/pal_Config */

    /* user code (Start function Body) */

    /* Header Custom Code: <S5>/pal_Config */
    /* Header Custom Code: <S2>/pal_Config */
    /* Header Custom Code: <S3>/pal_Config */
    /* Header Custom Code: <S4>/pal_Config */
    /* Header Custom Code: <S1>/pal_Config */

    /* Start Block: <S5>/pal_Config */

    /* Start Block: <S2>/pal_Config */

    /* Start Block: <S3>/pal_Config */

    /* Start Block: <S4>/pal_Config */

    /* Start Block: <S1>/pal_Config */

    /* user code (Start function Trailer) */

    /* Header Custom Code: <S5>/pal_Config */
    /* Header Custom Code: <S2>/pal_Config */
    /* Header Custom Code: <S3>/pal_Config */
    /* Header Custom Code: <S4>/pal_Config */
    /* Header Custom Code: <S1>/pal_Config */
  }

  /* InitializeConditions Block: <S5>/pal_Config */
  palSetPadMode(GPIOA,0,PAL_MODE_INPUT);

  /* InitializeConditions Block: <S2>/pal_Config */
  palSetPadMode(GPIOD,13,PAL_MODE_OUTPUT_PUSHPULL);

  /* InitializeConditions Block: <S3>/pal_Config */
  palSetPadMode(GPIOD,15,PAL_MODE_OUTPUT_PUSHPULL);

  /* InitializeConditions Block: <S4>/pal_Config */
  palSetPadMode(GPIOD,12,PAL_MODE_OUTPUT_PUSHPULL);

  /* InitializeConditions Block: <S1>/pal_Config */
}

/* CompilerErrors - BlockInstanceSetup */
/* CompilerErrors - BlockInstanceSetup */
/* CompilerErrors - BlockInstanceSetup */
/* CompilerErrors - BlockInstanceSetup */
/* CompilerErrors - BlockInstanceSetup */

/* CompilerWarnings - BlockInstanceSetup */
/* CompilerWarnings - BlockInstanceSetup */
/* CompilerWarnings - BlockInstanceSetup */
/* CompilerWarnings - BlockInstanceSetup */
/* CompilerWarnings - BlockInstanceSetup */

/* Documentation - BlockInstanceSetup */
/* Documentation - BlockInstanceSetup */
/* Documentation - BlockInstanceSetup */
/* Documentation - BlockInstanceSetup */
/* Documentation - BlockInstanceSetup */

/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */
/* UserBottom - BlockInstanceSetup .c */

/* [EOF] chibiOS_Config_Test_PAL.c */
