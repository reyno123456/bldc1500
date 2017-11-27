#ifndef  _BLDCDEF_H_
#define  _BLDCDEF_H_


#include "stm8s.h"

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

#define PHASE_C_BEMF_ADC_CHAN	ADC2_CHANNEL_3
#define PHASE_B_BEMF_ADC_CHAN	ADC2_CHANNEL_4
#define PHASE_A_BEMF_ADC_CHAN	ADC2_CHANNEL_5
#define PHASE_FED_ADC_CHAN		ADC2_CHANNEL_6
#define PHASE_REF_ADC_CHAN		ADC2_CHANNEL_7
#define ADC_BUS_CHANNEL			ADC2_CHANNEL_8	// BUS Voltage channel
#define ADC_CURRENT_CHANNEL		ADC2_CHANNEL_9	// Current Feedback channel

#define ToCMPxH(CMP,Value)     ( CMP = (u8)((Value >> 8 ) & 0xFF))
#define ToCMPxL(CMP,Value)     ( CMP = (u8)(Value & 0xFF) )

// GPIO-PIN define
#define GPIO_PIN_7  ((uint8_t)0x80)
#define GPIO_PIN_6  ((uint8_t)0x40)
#define GPIO_PIN_5  ((uint8_t)0x20)
#define GPIO_PIN_4  ((uint8_t)0x10)
#define GPIO_PIN_3  ((uint8_t)0x08) 
#define GPIO_PIN_2  ((uint8_t)0x04)
#define GPIO_PIN_1  ((uint8_t)0x02)
#define GPIO_PIN_0  ((uint8_t)0x01)

// 下桥低有效
#define CNT_AL_OUT_EN()  (GPIOB->ODR &= (uint8_t)(~GPIO_PIN_0))
#define CNT_AL_OUT_DIS() (GPIOB->ODR |= GPIO_PIN_0)
#define CNT_BL_OUT_EN()  (GPIOB->ODR &= (uint8_t)(~GPIO_PIN_1))
#define CNT_BL_OUT_DIS() (GPIOB->ODR |= GPIO_PIN_1)
#define CNT_CL_OUT_EN()  (GPIOB->ODR &= (uint8_t)(~GPIO_PIN_2))
#define CNT_CL_OUT_DIS() (GPIOB->ODR |= GPIO_PIN_2)
// 上桥高有效
#define PWM_AH_OUT_EN()  (TIM1->CCER1 |= TIM1_CCER1_CC1E)
#define PWM_AH_OUT_DIS() (TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E))
#define PWM_BH_OUT_EN()  (TIM1->CCER1 |= TIM1_CCER1_CC2E)
#define PWM_BH_OUT_DIS() (TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E))
#define PWM_CH_OUT_EN()  (TIM1->CCER2 |= TIM1_CCER2_CC3E)
#define PWM_CH_OUT_DIS() (TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E))

// pwm out control
#define PWM_OUT_EN()  (GPIOE->ODR |= GPIO_PIN_2)
#define PWM_OUT_DIS() (GPIOE->ODR &= (uint8_t)(~GPIO_PIN_2))

// LED-ERR
#define LED_ERROR_ON()  (GPIOD->ODR &= (uint8_t)(~GPIO_PIN_2))
#define LED_ERROR_OFF() (GPIOD->ODR |= GPIO_PIN_2)
// LED-RUN
#define LED_RUN_ON()    (GPIOD->ODR &= (uint8_t)(~GPIO_PIN_3))
#define LED_RUN_OFF()   (GPIOD->ODR |= GPIO_PIN_3)

#define TIM1_CMP4_IEN_ENB()	 (TIM1->IER |= (1<<4))
#define TIM1_CMP4_IEN_DIS()	 (TIM1->IER &= ~(1<<4))

#endif
