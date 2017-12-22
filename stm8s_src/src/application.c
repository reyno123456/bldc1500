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
	PWM_AH_OUT_DIS();
	PWM_BH_OUT_DIS();
	PWM_CH_OUT_DIS();
	
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

		if (phase_us < 1600)
			phase_us = 1600;
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

			if (g_pwm_on_duty > 150){
				g_pwm_on_duty = 150;
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
				//TIM1->CNTRH = 0 ;  //计数器清0
				//TIM1->CNTRL = 0 ;
				//init_timer2(400,56 + TIM1->CNTRL,1);
				//init_timer2(400,56,1);
				init_timer2(400,TIM1->CNTRL,1);
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
				init_timer3(0xFFFF, 0x04);		// 16M / 16 = 1us 
				g_flags.commutation_enable = 1;
				//init_timer2(400,0,1);
				//init_timer2(400,56 + TIM1->CNTRL,1);
				init_timer2(400,56,1);
				//delay_us(4);
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
	volatile unsigned short phase_count_us = 0;
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

				if (adc_value > 139 && 
					adc_value < 300 &&
					i > 3)
				{
					phase_count_us = TIM3->CNTRH;
					phase_count_us <<= 8;
					phase_count_us += TIM3->CNTRL; 
					phase_count_us <<= 1;
					
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

void timer2_enable(void)
{
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

void init_timer3(unsigned short Tcon,uint8 Pscr)
{								
	TIM3->IER = 0x00;		// 禁止中断
	// TIM3->EGR = 0x01;		// 允许产生更新事件

	TIM3->PSCR = Pscr;
	
	TIM3->ARRH = Tcon >> 8;
	TIM3->ARRL = Tcon;

	TIM3->CNTRH = 0;
	TIM3->CNTRL = 0;								

	TIM3->CR1 = 0x01;
	//TIM3->IER = 0x01;	
}

void test_timer3(void)
{
	volatile unsigned char test_count_high = 0;
	volatile unsigned char test_count_low = 0;
	
	//init_timer3(0, 0x04);		// 16M / 16 = 1us 
	delay_ms(5000);

	test_count_high = TIM1->CNTRH;
	test_count_low = TIM1->CNTRL;

	test_count_high = TIM3->CNTRH;
	test_count_low = TIM3->CNTRL;
	
	while (1)
	{
		test_count_high = TIM3->CNTRH;
		test_count_low = TIM3->CNTRL;
		delay_us(100);
	}
}


//*************************************
// 函数名称：Init_Timer1_PWM
// 函数功能：定时器1作PWM输出时初始化
// 入口参数：PWM等级 每级0.125U (1000*0.125 = 12.5U = 8K)
// 出口参数：无
/***************************************/
void init_timer1 (uint16 Tcon,uint16 Pscr)
{

	//16M系统时钟经预分频f=fck/(PSCR+1)  
	//f=16M/2=8M，每个计数周期0.125U
	TIM1->PSCRH = (Pscr >> 8) & 0xff ;
	TIM1->PSCRL = Pscr & 0xff ;
	
	//设定重装载时的寄存器值，255是最大值			
	TIM1->ARRH = (Tcon >> 8) & 0xff ;
	TIM1->ARRL = Tcon & 0xff ;
	
	//PWM1模式,TIM1_CNT<TIM1_CCR1时有效		
	TIM1->CCMR1 =0x6C ; 
	//PWM1模式,TIM1_CNT<TIM1_CCR1时有效		
	TIM1->CCMR2 =0x6C ; 
	//PWM1模式,TIM1_CNT<TIM1_CCR1时有效		
	TIM1->CCMR3 =0x6C ; 
	//冻结模式,TIM1_CNT<TIM1_CCR1时有效		
	TIM1->CCMR4 =0x08 ; 
		
	//PWM 占空比 清0
	TIM1->CCR1H = 0;
	TIM1->CCR1L = 0;
	TIM1->CCR2H = 0;
	TIM1->CCR2L = 0;
	TIM1->CCR3H = 0;
	TIM1->CCR3L = 0;
		
	//允许比较4中断
	//TIM1->IER |= BIT4 ;
			
	TIM1->EGR = BIT0 ; //UG = 1 ;初始化计数器 预装载载入影子寄存器中
	TIM1->CNTRH = 0 ;   //计数器清0
	TIM1->CNTRL = 0 ;
	
	TIM1->CR1 |= TIM1_CR1_CEN;

	TIM1->BKR |= TIM1_BKR_MOE;
	TIM1->DTR = 0x10; //  死区时间 0.125us *TIM1_DTR
}

void reload_timer1 (uint16 Tcon,uint16 Pscr)
{

	//16M系统时钟经预分频f=fck/(PSCR+1)  
	//f=16M/2=8M，每个计数周期0.125U
	TIM1->PSCRH = (Pscr >> 8) & 0xff ;
	TIM1->PSCRL = Pscr & 0xff ;
	
	//设定重装载时的寄存器值，255是最大值			
	TIM1->ARRH = (Tcon >> 8) & 0xff ;
	TIM1->ARRL = Tcon & 0xff ;
				
	//允许比较4中断
	//TIM1->IER |= BIT4 ;
			
	TIM1->EGR = BIT0 ; //UG = 1 ;初始化计数器 预装载载入影子寄存器中
	TIM1->CNTRH = 0 ;   //计数器清0
	TIM1->CNTRL = 0 ;
	
	TIM1->CR1 |= TIM1_CR1_CEN;

	TIM1->BKR |= TIM1_BKR_MOE;
	TIM1->DTR = 0x10; //  死区时间 0.125us *TIM1_DTR
}


