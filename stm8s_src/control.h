#ifndef  _CONTROL_H_
#define  _CONTROL_H_

#include "stm8s.h"

#define DLY_ADVANCED
//#define STROM_PROTENT_ENB

/* Private vars and define */
#define BIT0 0x01
#define BIT1 0x02
#define BIT2 0x04
#define BIT3 0x08
#define BIT4 0x10
#define BIT5 0x20
#define BIT6 0x40
#define BIT7 0x80

#define TIM1_DIV2		(uint8)1
#define TIM4_DIV16		(uint8)4
#define ADC_DIV2		(uint8)0

#define TIMER1_CNT    1000  // T=1000*0.125=125U  //PWM频率  8KHZ

#define PHASE_C_BEMF_ADC_CHAN	ADC2_CHANNEL_3
#define PHASE_B_BEMF_ADC_CHAN	ADC2_CHANNEL_4
#define PHASE_A_BEMF_ADC_CHAN	ADC2_CHANNEL_5
#define PHASE_FED_ADC_CHAN		ADC2_CHANNEL_6
#define PHASE_REF_ADC_CHAN		ADC2_CHANNEL_7
#define ADC_BUS_CHANNEL			ADC2_CHANNEL_8	// BUS Voltage channel
#define ADC_CURRENT_CHANNEL		ADC2_CHANNEL_9	// Current Feedback channel

#define ToCMPxH(CMP,Value)     ( CMP = (u8)((Value >> 8 ) & 0xFF))
#define ToCMPxL(CMP,Value)     ( CMP = (u8)(Value & 0xFF) )

//Low side driver logic input (active low)
#define CNT_AL_OUT_EN()  (GPIOB->ODR &= (uint8_t)(~GPIO_PIN_0))
#define CNT_AL_OUT_DIS() (GPIOB->ODR |= GPIO_PIN_0)
#define CNT_BL_OUT_EN()  (GPIOB->ODR &= (uint8_t)(~GPIO_PIN_1))
#define CNT_BL_OUT_DIS() (GPIOB->ODR |= GPIO_PIN_1)
#define CNT_CL_OUT_EN()  (GPIOB->ODR &= (uint8_t)(~GPIO_PIN_2))
#define CNT_CL_OUT_DIS() (GPIOB->ODR |= GPIO_PIN_2)
// High side driver logic input (active high) 
#define PWM_AH_OUT_EN()  (TIM1->CCER1 |= TIM1_CCER1_CC1E)
#define PWM_AH_OUT_DIS() (TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E))
#define PWM_BH_OUT_EN()  (TIM1->CCER1 |= TIM1_CCER1_CC2E)
#define PWM_BH_OUT_DIS() (TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E))
#define PWM_CH_OUT_EN()  (TIM1->CCER2 |= TIM1_CCER2_CC3E)
#define PWM_CH_OUT_DIS() (TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E))

// pwm out control --- active low
#define PWM_OUT_EN()  (GPIOE->ODR &= (uint8_t)(~GPIO_PIN_2))
#define PWM_OUT_DIS() (GPIOE->ODR |= GPIO_PIN_2)
// T1
#define TEST1_ON()  (GPIOD->ODR &= (uint8_t)(~GPIO_PIN_4))
#define TEST1_OFF() (GPIOD->ODR |= GPIO_PIN_4)

// LED-ERR --- active low
#define LED_ERROR_ON()  (GPIOD->ODR &= (uint8_t)(~GPIO_PIN_2))
#define LED_ERROR_OFF() (GPIOD->ODR |= GPIO_PIN_2)
// LED-RUN --- active low
#define LED_RUN_ON()    (GPIOD->ODR &= (uint8_t)(~GPIO_PIN_3))
#define LED_RUN_OFF()   (GPIOD->ODR |= GPIO_PIN_3)

// T2
#define TEST2_ON()  (GPIOD->ODR |= GPIO_PIN_5)
#define TEST2_OFF() (GPIOD->ODR &= (uint8_t)(~GPIO_PIN_5))
// TIMER1 compare interrupt
#define TIM1_CMP4_IEN_ENB()	 (TIM1->IER |= (1<<4))
#define TIM1_CMP4_IEN_DIS()	 (TIM1->IER &= ~(1<<4))
// TIMER1 break interrupt
#define TIM1_BREAK_IER_ENB() (TIM1->IER |= BIT7)
#define TIM1_BREAK_IER_DIS() (TIM1->IER &= (uint8_t)(~BIT7))
// TIMER1 break enable
#define TIM1_BREAK_ENB()   (TIM1->BKR |= TIM1_BREAK_ENABLE)
#define TIM1_BREAK_DIS()   (TIM1->BKR &= (uint8_t)(~TIM1_BREAK_ENABLE))

#define FAN  1 // 反转
#define ZEN  2 // 正转

#define STEP_RAMP_SIZE 64

#define START_INIT_PERIOD  1000   	// 20us*1000 = 20ms
#define DEMAGNETIZE        16    	// 125us*175 = 2ms
#define START_ORIEN_PERIOD 2000

#define V_BLDC_DING  	1		  // 定点到此步
#define V_PWMSTART		15		// 启动时PWM初值
#define V_PWMRUN_MIN	20		//120 // 启动时PWM结束值
#define V_MINSPEED		20      // 最小给定值

#define	V_RERUN			1   //启动后不延时再跑次数

//#define STROM_PROTENT_ENB  //电流保护使能
#define V_TIMER_PRO			3     //过流滤波次数  800-100ms  1600-200ms
#define V_CUR_PROTECT		102   // 1.6倍的额定电流 

//延时检测反电动势时间在启动完成后第一次 
//#define		V_DLYTEST				150//300//100

//滤波次数
//#define		V_Judge			2

//系统工作模式
#define		MODE_OFF	0
#define		MODE_ON		1	

#define V_VROFF		15

// BLDC 运行状态
typedef enum 
{
	STATUS_STOP,
	STATUS_START,
	STATUS_LIK,
	STATUS_RUN = 10,
	STATUS_DLY3C = 11
} State_t;


//======变量定义===========================
typedef struct BLDC_PARAM
{
	uint16 	R_SetPwm ;		//PWM设定值   最大500
	uint16	R_CurPwm ;		//PWM 当前值
	uint16	T_Dly60C ;		//换相时间
	uint16	T_Dly30C ;		//30度延时时间
	uint8 	BldcStatus ;   //BLDC 运行状态
	uint8 	BldcStep ; 		//PWM 六步状态

	uint8	T_ReRun ;  	//不延时运行次数
	uint16	T_DlyTest ;	//延时检测
	uint16	VoCple ;   //当前反电动势电压
	uint16	M_VoCple  ; //中点电压

	uint16	StartStep ;
	uint8	Direction ; //运转方向
	uint8   RunCmd;   // 运行
	uint8	R_CurAd ;  //电机电流值
	uint8	T_Judge ;
	uint16 usTick1ms;
	uint16 usAD_DCbus;
	uint16 usDCbusVolt;
	int32  lDCbusVoltAcc;
	uint16 R_VRAD;	   // analog reference
	uint16 PresFedAD;  // analog feedback
	uint8  R_Mode;	// 运行模式	
	uint8  ucState;
	uint8  ucRunProtect;
	uint8  R_Err;
	uint8  ucCmdKey;
	uint8  ucZeroCrossFlag;
	uint8  ucPowerOn;
	uint16 usOrientateTd;
}tBLDC_Param ;

extern tBLDC_Param tBC_Param ;
//==========变量声明=======================
#define		R_SetPwm	tBC_Param.R_SetPwm
#define		R_CurPwm	tBC_Param.R_CurPwm
#define		T_Dly60C	tBC_Param.T_Dly60C
#define		T_Dly30C	tBC_Param.T_Dly30C
#define		BldcStatus	tBC_Param.BldcStatus
#define		BldcStep	tBC_Param.BldcStep

#define		T_ReRun		tBC_Param.T_ReRun
#define		T_DlyTest	tBC_Param.T_DlyTest
#define		VoCple		tBC_Param.VoCple
#define		M_VoCple	tBC_Param.M_VoCple

#define		Direction	tBC_Param.Direction

#define		R_CurAd		tBC_Param.R_CurAd

#define		T_Judge		tBC_Param.T_Judge

#define	FILTER_LP(filtreValue, Value, Factor) { filtreValue += ((((int32)Value<<16) - filtreValue)>>Factor);}

typedef union 
{
	uint8 all;
	struct 
	{
		uint8 ErStart     : 1 ;  // F_ErStart
		uint8 ErRun       : 1 ;  // F_ErRun
		uint8 OverCurrent : 1 ;  // F_ErIOvrf
		uint8 OverVoltage : 1 ;
		uint8 UnderVoltage: 1 ;
		uint8 Poff: 1 ;
		uint8 Flg7: 1 ;
		uint8 Flg8: 1 ;	
	}bit;
}tFlg;


extern 	tFlg Error_code; 
//=======   变量 声明   ==============================

void OffSixPin(void);
void AdcSwitch(uint8 Chanel);
void Timer1_CCR4_Value(uint16 InValue);
void Timer1_PWM_Value(uint16 OUT_PWM);
void Led_Light(void);
void Run_Ctl(void);
void Key_Check(void);
void BldcBak(void);
void DISP_Display(void);
void CmdPwmSlow(void);
void SpeedRefAccDec(void);


extern	void Check_BEMF_Voltage(void) ;
extern	void  BldcLik(void) ;
extern  void  BldcRun(void) ;
extern	void  AutoRunOne(void) ;
extern  void BLDC_RUN_ONESTEP(uint8 OUT_BLDC_STEP);


#endif
