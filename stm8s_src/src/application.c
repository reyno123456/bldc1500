#include "application.h"
#include "control.h"
#include "stm8s.h"

unsigned char g_app_state = 0;
unsigned short g_pwm_on_duty = 0;
unsigned short g_counter_ms = 0;

static unsigned short g_adc_phase_a[ADC_SAMPLE_SIZE];
static unsigned short g_adc_phase_b[ADC_SAMPLE_SIZE];
static unsigned short g_adc_phase_c[ADC_SAMPLE_SIZE];
static unsigned short g_adc_bus = 0;


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
				//init_timer2(g_pwm_on_duty/3,1);
			break;
			
			case 2:
				//init_timer2(g_pwm_on_duty/3,1);
			break;

			case 3:
				delay_us(746);
				init_timer2(1000,1);
			break;

			case 4:
				//init_timer2(g_pwm_on_duty/3,1);
			break;

			case 5:
			break;

			case 6:
			break;
			default:break;
		}
		if (ms > 100)
			delay_us(ms);
		else
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

	static unsigned int phase_us = 2500;

	g_pwm_on_duty = 45;
	while(1)
	{
		bldc_one_loop(g_pwm_on_duty, phase_us);

		if (--phase_us < 1950)
			phase_us = 1950;
		//if (g_counter_ms > 5000)
		//	break;
		//bldc_stop();
		//delay_ms(1000);
	}

	while(1)
	{
		bldc_one_loop(g_pwm_on_duty, 1720);
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

void timer2_service(void)
{
	static unsigned char flag = 0;
	static unsigned char i = 0;

	(GPIOD->ODR &= (uint8_t)(~GPIO_PIN_7));
	g_adc_phase_a[i] = get_adc(PHASE_A_BEMF_ADC_CHAN);
	g_adc_phase_b[i] = get_adc(PHASE_B_BEMF_ADC_CHAN);
	g_adc_phase_c[i] = get_adc(PHASE_C_BEMF_ADC_CHAN);
	g_adc_bus = get_adc(ADC_BUS_CHANNEL);
	(GPIOD->ODR |= GPIO_PIN_7);
	if(++i >= ADC_SAMPLE_SIZE)
	{
		i = 0;
		TIM2->IER &=~ 1 << 0;
		if (g_counter_ms > 10000)
		{
			g_counter_ms = 0;
		}
	}
}

void init_timer2(unsigned short Tcon,unsigned char Pscr)
{								
	TIM2->IER = 0x00;		// 禁止中断
	TIM2->EGR = 0x01;		// 允许产生更新事件

	TIM2->PSCR = Pscr;
	
	TIM2->ARRH = (Tcon >> 8) & 0xff;
	TIM2->ARRL = Tcon & 0xff;

	TIM2->CNTRH = 0;
	TIM2->CNTRL = 0;								

	TIM2->CR1 |= 0x01;
	TIM2->IER |=  1 << 6 | 1 << 0;
}

