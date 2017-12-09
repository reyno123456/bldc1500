#include "application.h"
#include "control.h"

unsigned char g_app_state = 0;

static void bldc_one_loop(unsigned short duty, unsigned int ms);

unsigned short get_adc(unsigned char channel)
{
	unsigned short value;
	AdcSwitch(channel);
	value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
	return value; 
}

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
	unsigned short adc_value;
	unsigned short adc_bus;
	Timer1_PWM_Value(duty);

	for (flag = 1; flag <= 6; flag++)
	{
		bldc_run_onestep(flag);
		switch (flag)
		{
			case 1:
				adc_value = get_adc(PHASE_C_BEMF_ADC_CHAN);
				adc_bus = get_adc(ADC_BUS_CHANNEL);
				if (adc_value == 1 || adc_bus == 1)
				{
					delay_us(1);
				}
			default:break;
		}
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

	while(1)
	{
		bldc_one_loop(80, 12);
	}
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
