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
 229                     ; 178 void init_timer4(uint8 Tcon,uint8 Pscr)
 229                     ; 179 {								
 230                     	switch	.text
 231  006a               _init_timer4:
 235                     ; 180 	TIM4->IER = 0x00 ;		// 禁止中断
 237  006a 725f5341      	clr	21313
 238                     ; 181 	TIM4->EGR = 0x01 ;		// 允许产生更新事件
 240  006e 35015343      	mov	21315,#1
 241                     ; 182 	TIM4->PSCR = Pscr ;		// 计数器时钟=16MHZ/16=1M
 243  0072 9f            	ld	a,xl
 244  0073 c75345        	ld	21317,a
 245                     ; 186 	TIM4->ARR = Tcon;			// 1U*20 = 20U   
 247  0076 9e            	ld	a,xh
 248  0077 c75346        	ld	21318,a
 249                     ; 187 	TIM4->CNTR = 0;				// 设定计数器的初值
 251  007a 725f5344      	clr	21316
 252                     ; 191 	TIM4->CR1 |= 0 ;
 254  007e c65340        	ld	a,21312
 255                     ; 194 	TIM4->IER |= 0x01;
 257  0081 72105341      	bset	21313,#0
 258                     ; 195 	TIM4->CR1 |= 0x01;
 260  0085 72105340      	bset	21312,#0
 261                     ; 196 }
 264  0089 81            	ret
 287                     ; 204 void init_io(void)
 287                     ; 205 {
 288                     	switch	.text
 289  008a               _init_io:
 293                     ; 206 	GPIOA->DDR = 0b11111111;
 295  008a 35ff5002      	mov	20482,#255
 296                     ; 207 	GPIOA->CR1 = 0xFF;
 298  008e 35ff5003      	mov	20483,#255
 299                     ; 208 	GPIOA->CR2 = 0;
 301  0092 725f5004      	clr	20484
 302                     ; 210 	GPIOB->DDR = 0b00000111;   // UL,VL,WL, ADC
 304  0096 35075007      	mov	20487,#7
 305                     ; 211 	GPIOB->CR1 = 0b00000111;
 307  009a 35075008      	mov	20488,#7
 308                     ; 212 	GPIOB->CR2 = 0;
 310  009e 725f5009      	clr	20489
 311                     ; 214 	GPIOC->DDR = 0b11111111;   // NULL,AH,BH,CH,NONE,SCK,MOSI,MISO
 313  00a2 35ff500c      	mov	20492,#255
 314                     ; 215 	GPIOC->CR1 = 0b11111111;
 316  00a6 35ff500d      	mov	20493,#255
 317                     ; 216 	GPIOC->CR2 = 0;
 319  00aa 725f500e      	clr	20494
 320                     ; 218 	GPIOD->DDR = 0b11111101;   // NONE,SWIM,LED-ERR,LED-RUN,T1,T2,T3,T4
 322  00ae 35fd5011      	mov	20497,#253
 323                     ; 219 	GPIOD->CR1 = 0b11111101;
 325  00b2 35fd5012      	mov	20498,#253
 326                     ; 220 	GPIOD->CR2 = 0;
 328  00b6 725f5013      	clr	20499
 329                     ; 222 	GPIOE->DDR = 0b11110101;  // NONE,RUN,PWM-EN,BKIN,NULL,RCK,NULL,NULL
 331  00ba 35f55016      	mov	20502,#245
 332                     ; 223 	GPIOE->CR1 = 0b11110111;
 334  00be 35f75017      	mov	20503,#247
 335                     ; 224 	GPIOE->CR2 = 0;
 337  00c2 725f5018      	clr	20504
 338                     ; 226 	PWM_OUT_DIS();
 340  00c6 72145014      	bset	20500,#2
 341                     ; 231 	LED_ERROR_OFF();
 343  00ca 7214500f      	bset	20495,#2
 344                     ; 232 	LED_RUN_OFF();
 346  00ce 7216500f      	bset	20495,#3
 347                     ; 233 }
 350  00d2 81            	ret
 393                     ; 241 void init_adc( void )
 393                     ; 242 {
 394                     	switch	.text
 395  00d3               _init_adc:
 397  00d3 5203          	subw	sp,#3
 398       00000003      OFST:	set	3
 401                     ; 246 	ADC2->CR1 = 0;
 403  00d5 725f5401      	clr	21505
 404                     ; 249 	ADC2->CSR = PHASE_C_BEMF_ADC_CHAN;
 406  00d9 35035400      	mov	21504,#3
 407                     ; 251 	ADC_TDR_tmp = 0;
 409  00dd 5f            	clrw	x
 410  00de 1f02          	ldw	(OFST-1,sp),x
 411                     ; 252 	ADC_TDR_tmp |= (u16)(1) << PHASE_A_BEMF_ADC_CHAN;
 413  00e0 7b03          	ld	a,(OFST+0,sp)
 414  00e2 aa20          	or	a,#32
 415  00e4 6b03          	ld	(OFST+0,sp),a
 416                     ; 253 	ADC_TDR_tmp |= (u16)(1) << PHASE_B_BEMF_ADC_CHAN;
 418  00e6 7b03          	ld	a,(OFST+0,sp)
 419  00e8 aa10          	or	a,#16
 420  00ea 6b03          	ld	(OFST+0,sp),a
 421                     ; 254 	ADC_TDR_tmp |= (u16)(1) << PHASE_C_BEMF_ADC_CHAN;
 423  00ec 7b03          	ld	a,(OFST+0,sp)
 424  00ee aa08          	or	a,#8
 425  00f0 6b03          	ld	(OFST+0,sp),a
 426                     ; 255 	ADC_TDR_tmp |= (u16)(1) << ADC_CURRENT_CHANNEL;
 428  00f2 7b02          	ld	a,(OFST-1,sp)
 429  00f4 aa02          	or	a,#2
 430  00f6 6b02          	ld	(OFST-1,sp),a
 431                     ; 256 	ADC_TDR_tmp |= (u16)(1) << ADC_BUS_CHANNEL;
 433  00f8 7b02          	ld	a,(OFST-1,sp)
 434  00fa aa01          	or	a,#1
 435  00fc 6b02          	ld	(OFST-1,sp),a
 436                     ; 257 	ADC_TDR_tmp |= (u16)(1) << PHASE_REF_ADC_CHAN;
 438  00fe 7b03          	ld	a,(OFST+0,sp)
 439  0100 aa80          	or	a,#128
 440  0102 6b03          	ld	(OFST+0,sp),a
 441                     ; 258 	ADC_TDR_tmp |= (u16)(1) << PHASE_FED_ADC_CHAN;
 443  0104 7b03          	ld	a,(OFST+0,sp)
 444  0106 aa40          	or	a,#64
 445  0108 6b03          	ld	(OFST+0,sp),a
 446                     ; 260 	ToCMPxH( ADC2->TDRH, ADC_TDR_tmp);
 448  010a 35035406      	mov	21510,#3
 449                     ; 261 	ToCMPxL( ADC2->TDRL, ADC_TDR_tmp);
 451  010e 35f85407      	mov	21511,#248
 452                     ; 264 	ADC2->CR1 |= BIT0;
 454  0112 72105401      	bset	21505,#0
 455                     ; 266 	value=30;
 457  0116 a61e          	ld	a,#30
 458  0118 6b01          	ld	(OFST-2,sp),a
 460  011a               L321:
 461                     ; 267 	while(value--);                    
 463  011a 7b01          	ld	a,(OFST-2,sp)
 464  011c 0a01          	dec	(OFST-2,sp)
 465  011e 4d            	tnz	a
 466  011f 26f9          	jrne	L321
 467                     ; 269 	ADC2->CSR &= (u8)(~BIT7);
 469  0121 721f5400      	bres	21504,#7
 470                     ; 272 }
 473  0125 5b03          	addw	sp,#3
 474  0127 81            	ret
 509                     ; 274 unsigned short get_adc(void)
 509                     ; 275 {
 510                     	switch	.text
 511  0128               _get_adc:
 513  0128 89            	pushw	x
 514       00000002      OFST:	set	2
 517                     ; 277 	AdcSwitch(PHASE_C_BEMF_ADC_CHAN);
 519  0129 a603          	ld	a,#3
 520  012b cd0000        	call	_AdcSwitch
 522                     ; 278 	value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
 524  012e c65404        	ld	a,21508
 525  0131 5f            	clrw	x
 526  0132 97            	ld	xl,a
 527  0133 58            	sllw	x
 528  0134 58            	sllw	x
 529  0135 01            	rrwa	x,a
 530  0136 cb5405        	add	a,21509
 531  0139 2401          	jrnc	L02
 532  013b 5c            	incw	x
 533  013c               L02:
 534  013c 02            	rlwa	x,a
 535  013d 1f01          	ldw	(OFST-1,sp),x
 536  013f 01            	rrwa	x,a
 537                     ; 279 	return value; 
 539  0140 1e01          	ldw	x,(OFST-1,sp)
 542  0142 5b02          	addw	sp,#2
 543  0144 81            	ret
 566                     ; 282 void init_timer2(void)
 566                     ; 283 {								
 567                     	switch	.text
 568  0145               _init_timer2:
 572                     ; 284 	TIM2->IER = 0x00 ;		// 禁止中断
 574  0145 725f5301      	clr	21249
 575                     ; 285 	TIM2->EGR = 0x01 ;		// 允许产生更新事件
 577  0149 35015304      	mov	21252,#1
 578                     ; 286 	TIM2->PSCR = 32768 ;		// 计数器时钟=16MHZ/16=1M
 580  014d 3500530c      	mov	21260,#0
 581                     ; 288 	TIM2->ARRH = 60;
 583  0151 353c530d      	mov	21261,#60
 584                     ; 289 	TIM2->ARRL = 200;
 586  0155 35c8530e      	mov	21262,#200
 587                     ; 291 	TIM2->CNTRH = 0;				// 设定计数器的初值
 589  0159 725f530a      	clr	21258
 590                     ; 292 	TIM2->CNTRL = 0;				// 设定计数器的初值												
 592  015d 725f530b      	clr	21259
 593                     ; 295 	TIM2->CR1 |= 0 ;
 595  0161 c65300        	ld	a,21248
 596                     ; 298 	TIM2->IER |= 0x01;
 598  0164 72105301      	bset	21249,#0
 599                     ; 299 	TIM2->CR1 |= 0x01;
 601  0168 72105300      	bset	21248,#0
 602                     ; 300 }
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
 658  0171 cd008a        	call	_init_io
 660                     ; 309 	init_timer1(1000, 1);  // 8k
 662  0174 ae0001        	ldw	x,#1
 663  0177 89            	pushw	x
 664  0178 ae03e8        	ldw	x,#1000
 665  017b cd0005        	call	_init_timer1
 667  017e 85            	popw	x
 668                     ; 310 	init_adc();
 670  017f cd00d3        	call	_init_adc
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
 756                     	xdef	_init_timer2
 757                     	xdef	_get_adc
 758                     	xdef	_init_adc
 759                     	xdef	_init_io
 760                     	xdef	_init_timer4
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
