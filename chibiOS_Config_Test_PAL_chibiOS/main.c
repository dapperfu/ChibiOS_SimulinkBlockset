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
#include <math.h>
#include "chibiOS_Config_Test_PAL.h"   /* Model's header file */
#include "chibiOS_Config_Test_PAL_private.h" /* Model's private header file */

/* Defines */

/* 	SolverMode = MultiTasking */
/* Model has 4 rates */
msg_t periodicThread0(void *param)
{
  systime_t time;
  chRegSetThreadName("thread_0.015s");
  while (TRUE) {
    time = chTimeNow() + MS2ST(15);
    chibiOS_Config_Test_PAL_step0();
    chThdSleepUntil(time);
  }
}

msg_t periodicThread1(void *param)
{
  systime_t time;
  chRegSetThreadName("thread_0.06s");
  while (TRUE) {
    time = chTimeNow() + MS2ST(60);
    chibiOS_Config_Test_PAL_step1();
    chThdSleepUntil(time);
  }
}

msg_t periodicThread2(void *param)
{
  systime_t time;
  chRegSetThreadName("thread_0.09s");
  while (TRUE) {
    time = chTimeNow() + MS2ST(90);
    chibiOS_Config_Test_PAL_step2();
    chThdSleepUntil(time);
  }
}

msg_t periodicThread3(void *param)
{
  systime_t time;
  chRegSetThreadName("thread_0.9s");
  while (TRUE) {
    time = chTimeNow() + MS2ST(900);
    chibiOS_Config_Test_PAL_step3();
    chThdSleepUntil(time);
  }
}

/* Create a Thread Working Area */
static WORKING_AREA(waPeriodicThread0, 128);
static WORKING_AREA(waPeriodicThread1, 128);
static WORKING_AREA(waPeriodicThread2, 128);
static WORKING_AREA(waPeriodicThread3, 128);

/* Types */

/* Enums */

/* Definitions */

/* Declarations */

/* Functions */
void main (void)
{
  /* Create Static Threads */
  Thread *tp0;
  Thread *tp1;
  Thread *tp2;
  Thread *tp3;

  /* ChibiOS Init */
  halInit();
  chSysInit();
  palSetPad(GPIOD, GPIOD_LED3);
  palSetPad(GPIOD, GPIOD_LED4);
  palSetPad(GPIOD, GPIOD_LED5);
  palSetPad(GPIOD, GPIOD_LED6);
  chThdSleep(MS2ST(500));
  chibiOS_Config_Test_PAL_initialize();

  /* Start Static Threads */
  tp0 = chThdCreateStatic(waPeriodicThread0,
    sizeof(waPeriodicThread0),
    NORMALPRIO+0,
    periodicThread0,
    NULL);
  tp1 = chThdCreateStatic(waPeriodicThread1,
    sizeof(waPeriodicThread1),
    NORMALPRIO+1,
    periodicThread1,
    NULL);
  tp2 = chThdCreateStatic(waPeriodicThread2,
    sizeof(waPeriodicThread2),
    NORMALPRIO+2,
    periodicThread2,
    NULL);
  tp3 = chThdCreateStatic(waPeriodicThread3,
    sizeof(waPeriodicThread3),
    NORMALPRIO+3,
    periodicThread3,
    NULL);

  /* Reduce priority of main thread */
  chThdSetPriority(NORMALPRIO-10);

  /* Infinite loop */
  while (1) {
    /* Add code here */
  }

  return;
}

/* [EOF] main.c */
