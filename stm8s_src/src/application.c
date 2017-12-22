#include "application.h"
#include "control.h"
#include "stm8s.h"

unsigned char g_app_state = 0;
unsigned short g_pwm_on_duty = 0;
unsigned short g_counter_ms = 0;

static unsigned short g_adc_phase_a[ADC_SAMPLE_SIZE];
static unsigned short g_adc_phase_b[ADC_SAMPLE_SIZE];
static unsigned short g_adc_phase_c[ADC_SAMPLE_SIZE];

static unsigned short g_adc_close_loop_phase_b[4][10];

static unsigned short g_adc_bus = 0;

s_flags g_flags = {0};
s_global_value g_values = {0};


static void bldc_one_open_loop(unsigned short duty, unsigned int us);
static void bldc_open_loop(void);
static void bldc_close_loop(void);
static void bldc_one_close_loop(unsigned short duty, unsigned int us);

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

static void bldc_open_loop(void)
{
	unsigned short duty;
	unsigned int ms = 121;
	static unsigned char step = 1;
	unsigned int i;
	static unsigned short adc_value = 0;

	static unsigned int phase_us = 5000;

	g_pwm_on_duty = 45;
	while(1)
	{
		bldc_one_open_loop(g_pwm_on_duty, phase_us);

		if (phase_us < 1300)
			phase_us = 1300;
		phase_us -= 10;

		if (g_flags.open_loop_finished)
		{
			g_values.phase_60degree_cnt = phase_us;
			break;
		}
	}
}

static void bldc_close_loop(void)
{
	while(1)
	{
		bldc_one_close_loop(g_pwm_on_duty, g_values.phase_60degree_cnt);
		
		if (g_values.ms_cnt % 100 == 0)
		{
			g_values.ms_cnt++;
			g_pwm_on_duty++;

			if (g_pwm_on_duty > 300){
				g_pwm_on_duty = 300;
			}
		}
		
	}
}

static void bldc_one_open_loop(unsigned short duty, unsigned int us)
{
	unsigned short adc_value;
	unsigned short adc_bus;
	Timer1_PWM_Value(duty);

	for (g_flags.commutation = 0; g_flags.commutation < 6; g_flags.commutation++)
	{
		bldc_run_onestep(g_flags.commutation);
		switch (g_flags.commutation)
		{
			case 0:
				//init_timer2(g_pwm_on_duty/3,1);
			break;
			
			case 1:
				init_timer2(400,56,1);
			break;

			case 2:
				//init_timer2(400*2,32,1);
			break;

			case 3:
				//init_timer2(g_pwm_on_duty/3,1);
			break;

			case 4:
			break;

			case 5:
			break;
			default:break;
		}
		delay_us(us);
		//delay_us_with_timer(us / 10);
	}
}

static void bldc_one_close_loop(unsigned short duty, unsigned int us)
{
	unsigned short adc_value;
	unsigned short adc_bus;
	Timer1_PWM_Value(duty);

	for (g_flags.commutation = 0; g_flags.commutation < 6; g_flags.commutation++)
	{
		bldc_run_onestep(g_flags.commutation);
		switch (g_flags.commutation)
		{
			case 0:
				//init_timer2(g_pwm_on_duty/3,1);
			break;
			
			case 1:
				g_flags.commutation_enable = 1;
				g_values.commutation_cnt = 0;
				init_timer2(400,56,1);
			break;

			case 2:
				//init_timer2(400*2,32,1);
			break;

			case 3:
				//init_timer2(g_pwm_on_duty/3,1);
			break;

			case 4:
			break;

			case 5:
			break;
			default:break;
		}
		delay_us(us);
		//delay_us_with_timer(us / 10);
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
	bldc_close_loop();
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
	//g_adc_phase_a[i] = get_adc(PHASE_A_BEMF_ADC_CHAN);
	g_adc_phase_b[i] = get_adc(PHASE_B_BEMF_ADC_CHAN);
	(GPIOD->ODR |= GPIO_PIN_7);
	//g_adc_phase_c[i] = get_adc(PHASE_C_BEMF_ADC_CHAN);
	if(++i >= ADC_SAMPLE_SIZE)
	{
		i = 0;
		timer2_disable();
		if (g_values.ms_cnt > 10000)
		{
			//g_values.ms_cnt = 0;
			g_flags.open_loop_finished = 1;
		}
	}
	g_adc_bus = get_adc(ADC_BUS_CHANNEL);
}

void timer2_service_close_loop(void)
{
	unsigned short adc_value;
	volatile static unsigned char i = 0;
	static unsigned short phase_count_us = 0;
	unsigned char j,k;

	switch(g_flags.commutation)
	{
		case 0:
		break;

		case 1:
			if (g_flags.commutation_enable)
			{
				(GPIOD->ODR &= (uint8_t)(~GPIO_PIN_7));
				adc_value = get_adc(PHASE_B_BEMF_ADC_CHAN);
				(GPIOD->ODR |= GPIO_PIN_7);

				j = i/10;
				k = i - j*10;
				g_adc_close_loop_phase_b[j][k] = adc_value;

				if (adc_value > 140 && 
					adc_value < 300)
				{
					phase_count_us = g_values.commutation_cnt;
					phase_count_us =  phase_count_us*2*10;
					if (phase_count_us > g_values.phase_60degree_cnt + 30)
					{
						g_values.phase_60degree_cnt += 1;
					}
					else if(phase_count_us < g_values.phase_60degree_cnt - 30)
					{
						g_values.phase_60degree_cnt -= 1;
					}
					i = 0;
					g_flags.commutation_enable = 0;
					timer2_disable();
				}
				if(++i > ADC_SAMPLE_SIZE)
				{
					i = 0;
					g_flags.commutation_enable = 0;
					timer2_disable();
				}
			}
		break;

		case 2:
		break;

		case 3:
		break;

		case 4:
		break;

		case 5:
		break;
	}
}

void init_timer2(unsigned short Tcon,unsigned short init_cnt, unsigned char Pscr)
{								
	TIM2->IER = 0x00;		// 禁止中断
	TIM2->EGR = 0x01;		// 允许产生更新事件

	TIM2->PSCR = Pscr;
	
	TIM2->ARRH = Tcon >> 8;
	TIM2->ARRL = Tcon;

	TIM2->CNTRH = init_cnt >> 8;
	TIM2->CNTRL = init_cnt;								

	TIM2->CR1 |= 0x01;
	TIM2->IER |=  1 << 6 | 1 << 0;
}

void timer2_disable(void)
{
	TIM2->IER = 0x00;		// 禁止中断
}

void delay_us_with_timer(unsigned int us)
{
	//TIM4->IER = 0x00;		// 禁止中断
	g_values.us_cnt_top = us;
	g_values.us_cnt = 0;
	g_flags.us_timeout = 0;
	g_flags.us_enable = 1;
	//TIM4->IER = 0x01;

	while(g_flags.us_timeout == 0);
	g_flags.us_enable = 0;
	//TIM4->IER = 0x00;
}

unsigned char check_commutation(unsigned char phase, unsigned char up_down)
{

}
