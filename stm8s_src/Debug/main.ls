   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 49 void init_clk(void)
  43                     ; 50 {
  45                     	switch	.text
  46  0000               _init_clk:
  50                     ; 51   CLK->CKDIVR = 0x00;   	// 16M
  52  0000 725f50c6      	clr	20678
  53                     ; 52 }
  56  0004 81            	ret
  99                     ; 60 void init_timer1 (uint16 Tcon,uint16 Pscr)
  99                     ; 61 {
 100                     	switch	.text
 101  0005               _init_timer1:
 103  0005 89            	pushw	x
 104       00000000      OFST:	set	0
 107                     ; 65 	TIM1->PSCRH = (Pscr >> 8) & 0xff ;
 109  0006 7b05          	ld	a,(OFST+5,sp)
 110  0008 c75260        	ld	21088,a
 111                     ; 66 	TIM1->PSCRL = Pscr & 0xff ;
 113  000b 7b06          	ld	a,(OFST+6,sp)
 114  000d a4ff          	and	a,#255
 115  000f c75261        	ld	21089,a
 116                     ; 69 	TIM1->ARRH = (Tcon >> 8) & 0xff ;
 118  0012 9e            	ld	a,xh
 119  0013 c75262        	ld	21090,a
 120                     ; 70 	TIM1->ARRL = Tcon & 0xff ;
 122  0016 9f            	ld	a,xl
 123  0017 a4ff          	and	a,#255
 124  0019 c75263        	ld	21091,a
 125                     ; 73 	TIM1->CCMR1 =0x6C ; 
 127  001c 356c5258      	mov	21080,#108
 128                     ; 75 	TIM1->CCMR2 =0x6C ; 
 130  0020 356c5259      	mov	21081,#108
 131                     ; 77 	TIM1->CCMR3 =0x6C ; 
 133  0024 356c525a      	mov	21082,#108
 134                     ; 79 	TIM1->CCMR4 =0x08 ; 
 136  0028 3508525b      	mov	21083,#8
 137                     ; 82 	TIM1->CCR1H = 0;
 139  002c 725f5265      	clr	21093
 140                     ; 83 	TIM1->CCR1L = 0;
 142  0030 725f5266      	clr	21094
 143                     ; 84 	TIM1->CCR2H = 0;
 145  0034 725f5267      	clr	21095
 146                     ; 85 	TIM1->CCR2L = 0;
 148  0038 725f5268      	clr	21096
 149                     ; 86 	TIM1->CCR3H = 0;
 151  003c 725f5269      	clr	21097
 152                     ; 87 	TIM1->CCR3L = 0;
 154  0040 725f526a      	clr	21098
 155                     ; 92 	PWM_AH_OUT_DIS();
 157  0044 7211525c      	bres	21084,#0
 158                     ; 93 	PWM_BH_OUT_DIS();
 160  0048 7219525c      	bres	21084,#4
 161                     ; 94 	PWM_CH_OUT_DIS();
 163  004c 7211525d      	bres	21085,#0
 164                     ; 96 	TIM1->EGR = BIT0 ; //UG = 1 ;初始化计数器 预装载载入影子寄存器中
 166  0050 35015257      	mov	21079,#1
 167                     ; 97 	TIM1->CNTRH = 0 ;   //计数器清0
 169  0054 725f525e      	clr	21086
 170                     ; 98 	TIM1->CNTRL = 0 ;
 172  0058 725f525f      	clr	21087
 173                     ; 100 	TIM1->CR1 |= TIM1_CR1_CEN;
 175  005c 72105250      	bset	21072,#0
 176                     ; 107 	TIM1->BKR |= TIM1_BKR_MOE;
 178  0060 721e526d      	bset	21101,#7
 179                     ; 108 	TIM1->DTR = 0x10; //  死区时间 0.125us *TIM1_DTR
 181  0064 3510526e      	mov	21102,#16
 182                     ; 170 }
 185  0068 85            	popw	x
 186  0069 81            	ret
 209                     ; 172 void init_timer2(void)
 209                     ; 173 {								
 210                     	switch	.text
 211  006a               _init_timer2:
 215                     ; 174 	TIM2->IER = 0x00 ;		// 禁止中断
 217  006a 725f5301      	clr	21249
 218                     ; 175 	TIM2->EGR = 0x01 ;		// 允许产生更新事件
 220  006e 35015304      	mov	21252,#1
 221                     ; 176 	TIM2->PSCR = 32768 ;		// 计数器时钟=16MHZ/16=1M
 223  0072 3500530c      	mov	21260,#0
 224                     ; 178 	TIM2->ARRH = 60;
 226  0076 353c530d      	mov	21261,#60
 227                     ; 179 	TIM2->ARRL = 200;
 229  007a 35c8530e      	mov	21262,#200
 230                     ; 181 	TIM2->CNTRH = 0;				// 设定计数器的初值
 232  007e 725f530a      	clr	21258
 233                     ; 182 	TIM2->CNTRL = 0;				// 设定计数器的初值												
 235  0082 725f530b      	clr	21259
 236                     ; 185 	TIM2->CR1 |= 0 ;
 238  0086 c65300        	ld	a,21248
 239                     ; 188 	TIM2->IER |= 0x01;
 241  0089 72105301      	bset	21249,#0
 242                     ; 189 	TIM2->CR1 |= 0x01;
 244  008d 72105300      	bset	21248,#0
 245                     ; 190 }
 248  0091 81            	ret
 291                     ; 198 void init_timer4(uint8 Tcon,uint8 Pscr)
 291                     ; 199 {								
 292                     	switch	.text
 293  0092               _init_timer4:
 297                     ; 200 	TIM4->IER = 0x00 ;		// 禁止中断
 299  0092 725f5341      	clr	21313
 300                     ; 201 	TIM4->EGR = 0x01 ;		// 允许产生更新事件
 302  0096 35015343      	mov	21315,#1
 303                     ; 202 	TIM4->PSCR = Pscr ;		// 计数器时钟=16MHZ/16=1M
 305  009a 9f            	ld	a,xl
 306  009b c75345        	ld	21317,a
 307                     ; 206 	TIM4->ARR = Tcon;			// 1U*20 = 20U   
 309  009e 9e            	ld	a,xh
 310  009f c75346        	ld	21318,a
 311                     ; 207 	TIM4->CNTR = 0;				// 设定计数器的初值
 313  00a2 725f5344      	clr	21316
 314                     ; 211 	TIM4->CR1 |= 0 ;
 316  00a6 c65340        	ld	a,21312
 317                     ; 214 	TIM4->IER |= 0x01;
 319  00a9 72105341      	bset	21313,#0
 320                     ; 215 	TIM4->CR1 |= 0x01;
 322  00ad 72105340      	bset	21312,#0
 323                     ; 216 }
 326  00b1 81            	ret
 349                     ; 224 void init_io(void)
 349                     ; 225 {
 350                     	switch	.text
 351  00b2               _init_io:
 355                     ; 226 	GPIOA->DDR = 0b11111111;
 357  00b2 35ff5002      	mov	20482,#255
 358                     ; 227 	GPIOA->CR1 = 0xFF;
 360  00b6 35ff5003      	mov	20483,#255
 361                     ; 228 	GPIOA->CR2 = 0;
 363  00ba 725f5004      	clr	20484
 364                     ; 230 	GPIOB->DDR = 0b00000111;   // UL,VL,WL, ADC
 366  00be 35075007      	mov	20487,#7
 367                     ; 231 	GPIOB->CR1 = 0b00000111;
 369  00c2 35075008      	mov	20488,#7
 370                     ; 232 	GPIOB->CR2 = 0;
 372  00c6 725f5009      	clr	20489
 373                     ; 234 	GPIOC->DDR = 0b11111111;   // NULL,AH,BH,CH,NONE,SCK,MOSI,MISO
 375  00ca 35ff500c      	mov	20492,#255
 376                     ; 235 	GPIOC->CR1 = 0b11111111;
 378  00ce 35ff500d      	mov	20493,#255
 379                     ; 236 	GPIOC->CR2 = 0;
 381  00d2 725f500e      	clr	20494
 382                     ; 238 	GPIOD->DDR = 0b11111101;   // NONE,SWIM,LED-ERR,LED-RUN,T1,T2,T3,T4
 384  00d6 35fd5011      	mov	20497,#253
 385                     ; 239 	GPIOD->CR1 = 0b11111101;
 387  00da 35fd5012      	mov	20498,#253
 388                     ; 240 	GPIOD->CR2 = 0;
 390  00de 725f5013      	clr	20499
 391                     ; 242 	GPIOE->DDR = 0b11110101;  // NONE,RUN,PWM-EN,BKIN,NULL,RCK,NULL,NULL
 393  00e2 35f55016      	mov	20502,#245
 394                     ; 243 	GPIOE->CR1 = 0b11110111;
 396  00e6 35f75017      	mov	20503,#247
 397                     ; 244 	GPIOE->CR2 = 0;
 399  00ea 725f5018      	clr	20504
 400                     ; 246 	PWM_OUT_DIS();
 402  00ee 72145014      	bset	20500,#2
 403                     ; 251 	LED_ERROR_OFF();
 405  00f2 7214500f      	bset	20495,#2
 406                     ; 252 	LED_RUN_OFF();
 408  00f6 7216500f      	bset	20495,#3
 409                     ; 253 }
 412  00fa 81            	ret
 455                     ; 261 void init_adc( void )
 455                     ; 262 {
 456                     	switch	.text
 457  00fb               _init_adc:
 459  00fb 5203          	subw	sp,#3
 460       00000003      OFST:	set	3
 463                     ; 266 	ADC2->CR1 = 0;
 465  00fd 725f5401      	clr	21505
 466                     ; 269 	ADC2->CSR = PHASE_C_BEMF_ADC_CHAN;
 468  0101 35035400      	mov	21504,#3
 469                     ; 271 	ADC_TDR_tmp = 0;
 471  0105 5f            	clrw	x
 472  0106 1f02          	ldw	(OFST-1,sp),x
 473                     ; 272 	ADC_TDR_tmp |= (u16)(1) << PHASE_A_BEMF_ADC_CHAN;
 475  0108 7b03          	ld	a,(OFST+0,sp)
 476  010a aa20          	or	a,#32
 477  010c 6b03          	ld	(OFST+0,sp),a
 478                     ; 273 	ADC_TDR_tmp |= (u16)(1) << PHASE_B_BEMF_ADC_CHAN;
 480  010e 7b03          	ld	a,(OFST+0,sp)
 481  0110 aa10          	or	a,#16
 482  0112 6b03          	ld	(OFST+0,sp),a
 483                     ; 274 	ADC_TDR_tmp |= (u16)(1) << PHASE_C_BEMF_ADC_CHAN;
 485  0114 7b03          	ld	a,(OFST+0,sp)
 486  0116 aa08          	or	a,#8
 487  0118 6b03          	ld	(OFST+0,sp),a
 488                     ; 275 	ADC_TDR_tmp |= (u16)(1) << ADC_CURRENT_CHANNEL;
 490  011a 7b02          	ld	a,(OFST-1,sp)
 491  011c aa02          	or	a,#2
 492  011e 6b02          	ld	(OFST-1,sp),a
 493                     ; 276 	ADC_TDR_tmp |= (u16)(1) << ADC_BUS_CHANNEL;
 495  0120 7b02          	ld	a,(OFST-1,sp)
 496  0122 aa01          	or	a,#1
 497  0124 6b02          	ld	(OFST-1,sp),a
 498                     ; 277 	ADC_TDR_tmp |= (u16)(1) << PHASE_REF_ADC_CHAN;
 500  0126 7b03          	ld	a,(OFST+0,sp)
 501  0128 aa80          	or	a,#128
 502  012a 6b03          	ld	(OFST+0,sp),a
 503                     ; 278 	ADC_TDR_tmp |= (u16)(1) << PHASE_FED_ADC_CHAN;
 505  012c 7b03          	ld	a,(OFST+0,sp)
 506  012e aa40          	or	a,#64
 507  0130 6b03          	ld	(OFST+0,sp),a
 508                     ; 280 	ToCMPxH( ADC2->TDRH, ADC_TDR_tmp);
 510  0132 35035406      	mov	21510,#3
 511                     ; 281 	ToCMPxL( ADC2->TDRL, ADC_TDR_tmp);
 513  0136 35f85407      	mov	21511,#248
 514                     ; 284 	ADC2->CR1 |= BIT0;
 516  013a 72105401      	bset	21505,#0
 517                     ; 286 	value=30;
 519  013e a61e          	ld	a,#30
 520  0140 6b01          	ld	(OFST-2,sp),a
 522  0142               L331:
 523                     ; 287 	while(value--);                    
 525  0142 7b01          	ld	a,(OFST-2,sp)
 526  0144 0a01          	dec	(OFST-2,sp)
 527  0146 4d            	tnz	a
 528  0147 26f9          	jrne	L331
 529                     ; 289 	ADC2->CSR &= (u8)(~BIT7);
 531  0149 721f5400      	bres	21504,#7
 532                     ; 292 }
 535  014d 5b03          	addw	sp,#3
 536  014f 81            	ret
 571                     ; 294 unsigned short get_adc(void)
 571                     ; 295 {
 572                     	switch	.text
 573  0150               _get_adc:
 575  0150 89            	pushw	x
 576       00000002      OFST:	set	2
 579                     ; 297 	AdcSwitch(PHASE_C_BEMF_ADC_CHAN);
 581  0151 a603          	ld	a,#3
 582  0153 cd0000        	call	_AdcSwitch
 584                     ; 298 	value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
 586  0156 c65404        	ld	a,21508
 587  0159 5f            	clrw	x
 588  015a 97            	ld	xl,a
 589  015b 58            	sllw	x
 590  015c 58            	sllw	x
 591  015d 01            	rrwa	x,a
 592  015e cb5405        	add	a,21509
 593  0161 2401          	jrnc	L22
 594  0163 5c            	incw	x
 595  0164               L22:
 596  0164 02            	rlwa	x,a
 597  0165 1f01          	ldw	(OFST-1,sp),x
 598  0167 01            	rrwa	x,a
 599                     ; 299 	return value; 
 601  0168 1e01          	ldw	x,(OFST-1,sp)
 604  016a 5b02          	addw	sp,#2
 605  016c 81            	ret
 641                     ; 302 void main(void)
 641                     ; 303 {
 642                     	switch	.text
 643  016d               _main:
 647                     ; 304 	_asm("sim");
 650  016d 9b            sim
 652                     ; 306 	init_clk();
 654  016e cd0000        	call	_init_clk
 656                     ; 307 	init_io();
 658  0171 cd00b2        	call	_init_io
 660                     ; 309 	init_timer1(1000, 1);  // 8k
 662  0174 ae0001        	ldw	x,#1
 663  0177 89            	pushw	x
 664  0178 ae03e8        	ldw	x,#1000
 665  017b cd0005        	call	_init_timer1
 667  017e 85            	popw	x
 668                     ; 310 	init_adc();
 670  017f cd00fb        	call	_init_adc
 672                     ; 312 	_asm("rim");
 675  0182 9a            rim
 677  0183               L561:
 678                     ; 317 		AppStateMachine[g_app_state]();
 680  0183 b600          	ld	a,_g_app_state
 681  0185 5f            	clrw	x
 682  0186 97            	ld	xl,a
 683  0187 58            	sllw	x
 684  0188 de0000        	ldw	x,(_AppStateMachine,x)
 685  018b fd            	call	(x)
 688  018c 20f5          	jra	L561
 723                     ; 401 void assert_failed(u8* file, u32 line)
 723                     ; 402 { 
 724                     	switch	.text
 725  018e               _assert_failed:
 729  018e               L702:
 730  018e 20fe          	jra	L702
 755                     	xdef	_main
 756                     	xdef	_get_adc
 757                     	xdef	_init_adc
 758                     	xdef	_init_io
 759                     	xdef	_init_timer4
 760                     	xdef	_init_timer2
 761                     	xdef	_init_timer1
 762                     	xdef	_init_clk
 763                     	switch	.ubsct
 764  0000               _adc_table:
 765  0000 000000000000  	ds.b	20
 766                     	xdef	_adc_table
 767                     	xref	_AppStateMachine
 768                     	xref.b	_g_app_state
 769                     	xref	_SpeedRefAccDec
 770                     	xref	_Key_Check
 771                     	xref	_Run_Ctl
 772                     	xref	_Led_Light
 773                     	xref	_AdcSwitch
 774                     	xref.b	_Error_code
 775                     	xref.b	_tBC_Param
 776                     	xdef	_assert_failed
 796                     	end
