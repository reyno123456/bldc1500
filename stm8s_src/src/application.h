#ifndef _APPLICATION_H
#define _APPLICATION_H

typedef void (*tp_func)(void);  /* pointer to a function */

#define APP_INIT                0   /* Application states */
#define APP_CALIB               1
#define APP_ALIGNMENT           2
#define APP_START               3
#define APP_RUN                 4
#define APP_STOP                5
#define APP_FAULT               6

#define ADC_SAMPLE_SIZE				20

void delay_us(unsigned int us);
void delay_ms(unsigned int ms);
void AppInit(void);
void AppCalib(void);
void AppAlignment(void);
void AppStart(void);
void AppRun(void);
void AppStop(void);
void AppFault(void);
void function_test(void);
unsigned short get_adc(unsigned char);
void init_timer2(unsigned short Tcon,unsigned char Pscr);
void timer2_service(void);

extern unsigned char g_app_state;
extern const tp_func AppStateMachine[];
extern unsigned short g_pwm_on_duty;
extern unsigned short g_counter_ms;
#endif
