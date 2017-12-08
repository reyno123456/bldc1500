#include "application.h"
#include "control.h"

unsigned char g_app_state = 0;

static void bldc_one_loop(unsigned short duty, unsigned int ms);


void delay_us(unsigned int us)
{
	unsigned int i;
	for (i = 0; i < us; i++)
	{
		
	}
}

void delay_ms(unsigned int ms)
{
	unsigned int i,j;
	for (j = 0; j < ms; j++)
	{
		for (i = 0; i < 1000; i++)
		{
			
		}
	}
}

static void AppStopToAlignment(void)
{
	Timer1_PWM_Value(400);
	PWM_AH_OUT_DIS();
	PWM_BH_OUT_DIS();
	PWM_CH_OUT_EN();
	CNT_AL_OUT_EN();
	CNT_BL_OUT_EN();
	CNT_CL_OUT_DIS();

	delay_ms(100);

	Timer1_PWM_Value(50);
	PWM_AH_OUT_DIS();
	PWM_BH_OUT_DIS();
	PWM_CH_OUT_DIS();
	CNT_AL_OUT_DIS();
	CNT_BL_OUT_DIS();
	CNT_CL_OUT_DIS();	
}

static void bldc_one_loop(unsigned short duty, unsigned int ms)
{
	unsigned char flag;
	Timer1_PWM_Value(duty);

	for (flag = 1; flag <= 6; flag++)
	{
		bldc_run_onestep(flag);
		delay_ms(ms);
	}
}

static void bldc_open_loop(void)
{
	unsigned short duty;
	unsigned int ms = 121;
	static unsigned char step = 1;
	unsigned int i;
	static unsigned short adc_value = 0;
/*
	for (duty = 1; duty < 120; ms--)
	{
		bldc_one_loop(duty, ms);
		duty++;
	}
*/

	bldc_one_loop(10, 100);
	bldc_one_loop(20, 80);
	bldc_one_loop(30, 60);
	bldc_one_loop(40, 50);
	bldc_one_loop(50, 40);
	bldc_one_loop(60, 30);
	bldc_one_loop(70, 20);

while(1)
{
	for (i = 0; i < 10; i++)
	{
		bldc_one_loop(70, 20);
		//bldc_one_loop(10, 100);
	}	
}
	for (i = 0; i < 10; i++)
	{
		bldc_one_loop(100, 3);
	}

	for (i = 0; i < 10; i++)
	{
		bldc_one_loop(100, 5);
	}

while(1)
{
	for (i = 0; i < 10; i++)
	{
		bldc_one_loop(150, 2);
	}
}

while(1)
{
	for (i = 0; i < 10; i++)
	{
		bldc_one_loop(150, 2);
	}	
}
	for (i = 0; i < 100; i++)
	{
		bldc_one_loop(200, 3);
	}

	for (i = 0; i < 100; i++)
	{
		bldc_one_loop(280,2);
	}

		bldc_one_loop(300,2);


#if 0
	i = 0;
	while(1)
	{
		if (step == 5)
		{
			if (i == 10)
				i = 0;
		}
		bldc_run_onestep(step++);
		if (step == 8)
		{
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
			
			adc_value = get_adc();
			adc_table[i++] = adc_value;
			delay_us(300);
		}
		
		delay_ms(8);
		if (step > 6){
			step = 1;
		}
	}
#endif
}


const tp_func AppStateMachine[] = 
{
    AppInit,
    AppCalib,
    AppAlignment,
    AppStart,
    AppRun,
    AppStop,
    AppFault
};

void AppInit(void)
{
	g_app_state = APP_CALIB;
}

void AppCalib(void)
{
	AppStopToAlignment();
	
	g_app_state = APP_ALIGNMENT;
}

void AppAlignment(void)
{
	g_app_state = APP_START;
}

void AppStart(void)
{
	bldc_open_loop();
	g_app_state = APP_RUN;
}

void AppRun(void)
{

}

void AppStop(void)
{

}

void AppFault(void)
{

}

void function_test(void)
{
	static uint16 flag = 0;
	while(1)
	{
		if (flag == 0){
			LED_RUN_ON();
			delay_ms(1000);
			flag = 1;
		}else{		
			LED_RUN_OFF();
			delay_ms(1000);
			flag = 0;
		}
	}	
}
