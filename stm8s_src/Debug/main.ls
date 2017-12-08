   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 50 void Init_Clk(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _Init_Clk:
  50                     ; 52   CLK->CKDIVR = 0x00;   	// 16M
  52  0000 725f50c6      	clr	20678
  53                     ; 53 }
  56  0004 81            	ret
  99                     ; 61 void Init_Timer1_PWM (uint16 Tcon,uint16 Pscr)
  99                     ; 62 {
 100                     	switch	.text
 101  0005               _Init_Timer1_PWM:
 103  0005 89            	pushw	x
 104       00000000      OFST:	set	0
 107                     ; 66 	TIM1->PSCRH = (Pscr >> 8) & 0xff ;
 109  0006 7b05          	ld	a,(OFST+5,sp)
 110  0008 c75260        	ld	21088,a
 111                     ; 67 	TIM1->PSCRL = Pscr & 0xff ;
 113  000b 7b06          	ld	a,(OFST+6,sp)
 114  000d a4ff          	and	a,#255
 115  000f c75261        	ld	21089,a
 116                     ; 70 	TIM1->ARRH = (Tcon >> 8) & 0xff ;
 118  0012 9e            	ld	a,xh
 119  0013 c75262        	ld	21090,a
 120                     ; 71 	TIM1->ARRL = Tcon & 0xff ;
 122  0016 9f            	ld	a,xl
 123  0017 a4ff          	and	a,#255
 124  0019 c75263        	ld	21091,a
 125                     ; 74 	TIM1->CCMR1 =0x6C ; 
 127  001c 356c5258      	mov	21080,#108
 128                     ; 76 	TIM1->CCMR2 =0x6C ; 
 130  0020 356c5259      	mov	21081,#108
 131                     ; 78 	TIM1->CCMR3 =0x6C ; 
 133  0024 356c525a      	mov	21082,#108
 134                     ; 80 	TIM1->CCMR4 =0x08 ; 
 136  0028 3508525b      	mov	21083,#8
 137                     ; 83 	TIM1->CCR1H = 0;
 139  002c 725f5265      	clr	21093
 140                     ; 84 	TIM1->CCR1L = 0;
 142  0030 725f5266      	clr	21094
 143                     ; 85 	TIM1->CCR2H = 0;
 145  0034 725f5267      	clr	21095
 146                     ; 86 	TIM1->CCR2L = 0;
 148  0038 725f5268      	clr	21096
 149                     ; 87 	TIM1->CCR3H = 0;
 151  003c 725f5269      	clr	21097
 152                     ; 88 	TIM1->CCR3L = 0;
 154  0040 725f526a      	clr	21098
 155                     ; 93 	PWM_AH_OUT_DIS();
 157  0044 7211525c      	bres	21084,#0
 158                     ; 94 	PWM_BH_OUT_DIS();
 160  0048 7219525c      	bres	21084,#4
 161                     ; 95 	PWM_CH_OUT_DIS();
 163  004c 7211525d      	bres	21085,#0
 164                     ; 97 	TIM1->EGR = BIT0 ; //UG = 1 ;初始化计数器 预装载载入影子寄存器中
 166  0050 35015257      	mov	21079,#1
 167                     ; 98 	TIM1->CNTRH = 0 ;   //计数器清0
 169  0054 725f525e      	clr	21086
 170                     ; 99 	TIM1->CNTRL = 0 ;
 172  0058 725f525f      	clr	21087
 173                     ; 101 	TIM1->CR1 |= TIM1_CR1_CEN;
 175  005c 72105250      	bset	21072,#0
 176                     ; 108 	TIM1->BKR |= TIM1_BKR_MOE;
 178  0060 721e526d      	bset	21101,#7
 179                     ; 109 	TIM1->DTR = 0x10; //  死区时间 0.125us *TIM1_DTR
 181  0064 3510526e      	mov	21102,#16
 182                     ; 171 }
 185  0068 85            	popw	x
 186  0069 81            	ret
 229                     ; 179 void Init_TIM4(uint8 Tcon,uint8 Pscr)
 229                     ; 180 {								
 230                     	switch	.text
 231  006a               _Init_TIM4:
 235                     ; 181 	TIM4->IER = 0x00 ;		// 禁止中断
 237  006a 725f5341      	clr	21313
 238                     ; 182 	TIM4->EGR = 0x01 ;		// 允许产生更新事件
 240  006e 35015343      	mov	21315,#1
 241                     ; 183 	TIM4->PSCR = Pscr ;		// 计数器时钟=16MHZ/16=1M
 243  0072 9f            	ld	a,xl
 244  0073 c75345        	ld	21317,a
 245                     ; 187 	TIM4->ARR = Tcon;			// 1U*20 = 20U   
 247  0076 9e            	ld	a,xh
 248  0077 c75346        	ld	21318,a
 249                     ; 188 	TIM4->CNTR = 0;				// 设定计数器的初值
 251  007a 725f5344      	clr	21316
 252                     ; 192 	TIM4->CR1 |= 0 ;
 254  007e c65340        	ld	a,21312
 255                     ; 195 	TIM4->IER |= 0x01;
 257  0081 72105341      	bset	21313,#0
 258                     ; 196 	TIM4->CR1 |= 0x01;
 260  0085 72105340      	bset	21312,#0
 261                     ; 197 }
 264  0089 81            	ret
 287                     ; 205 void Init_Io(void)
 287                     ; 206 {
 288                     	switch	.text
 289  008a               _Init_Io:
 293                     ; 207 	GPIOA->DDR = 0b11111111;
 295  008a 35ff5002      	mov	20482,#255
 296                     ; 208 	GPIOA->CR1 = 0xFF;
 298  008e 35ff5003      	mov	20483,#255
 299                     ; 209 	GPIOA->CR2 = 0;
 301  0092 725f5004      	clr	20484
 302                     ; 211 	GPIOB->DDR = 0b00000111;   // UL,VL,WL, ADC
 304  0096 35075007      	mov	20487,#7
 305                     ; 212 	GPIOB->CR1 = 0b00000111;
 307  009a 35075008      	mov	20488,#7
 308                     ; 213 	GPIOB->CR2 = 0;
 310  009e 725f5009      	clr	20489
 311                     ; 215 	GPIOC->DDR = 0b11111111;   // NULL,AH,BH,CH,NONE,SCK,MOSI,MISO
 313  00a2 35ff500c      	mov	20492,#255
 314                     ; 216 	GPIOC->CR1 = 0b11111111;
 316  00a6 35ff500d      	mov	20493,#255
 317                     ; 217 	GPIOC->CR2 = 0;
 319  00aa 725f500e      	clr	20494
 320                     ; 219 	GPIOD->DDR = 0b11111101;   // NONE,SWIM,LED-ERR,LED-RUN,T1,T2,T3,T4
 322  00ae 35fd5011      	mov	20497,#253
 323                     ; 220 	GPIOD->CR1 = 0b11111101;
 325  00b2 35fd5012      	mov	20498,#253
 326                     ; 221 	GPIOD->CR2 = 0;
 328  00b6 725f5013      	clr	20499
 329                     ; 223 	GPIOE->DDR = 0b11110101;  // NONE,RUN,PWM-EN,BKIN,NULL,RCK,NULL,NULL
 331  00ba 35f55016      	mov	20502,#245
 332                     ; 224 	GPIOE->CR1 = 0b11110111;
 334  00be 35f75017      	mov	20503,#247
 335                     ; 225 	GPIOE->CR2 = 0;
 337  00c2 725f5018      	clr	20504
 338                     ; 227 	PWM_OUT_DIS();
 340  00c6 72145014      	bset	20500,#2
 341                     ; 232 	LED_ERROR_OFF();
 343  00ca 7214500f      	bset	20495,#2
 344                     ; 233 	LED_RUN_OFF();
 346  00ce 7216500f      	bset	20495,#3
 347                     ; 234 }
 350  00d2 81            	ret
 393                     ; 242 void Init_ADC( void )
 393                     ; 243 {
 394                     	switch	.text
 395  00d3               _Init_ADC:
 397  00d3 5203          	subw	sp,#3
 398       00000003      OFST:	set	3
 401                     ; 247 	ADC2->CR1 = 0;
 403  00d5 725f5401      	clr	21505
 404                     ; 250 	ADC2->CSR = PHASE_C_BEMF_ADC_CHAN;
 406  00d9 35035400      	mov	21504,#3
 407                     ; 252 	ADC_TDR_tmp = 0;
 409  00dd 5f            	clrw	x
 410  00de 1f02          	ldw	(OFST-1,sp),x
 411                     ; 253 	ADC_TDR_tmp |= (u16)(1) << PHASE_A_BEMF_ADC_CHAN;
 413  00e0 7b03          	ld	a,(OFST+0,sp)
 414  00e2 aa20          	or	a,#32
 415  00e4 6b03          	ld	(OFST+0,sp),a
 416                     ; 254 	ADC_TDR_tmp |= (u16)(1) << PHASE_B_BEMF_ADC_CHAN;
 418  00e6 7b03          	ld	a,(OFST+0,sp)
 419  00e8 aa10          	or	a,#16
 420  00ea 6b03          	ld	(OFST+0,sp),a
 421                     ; 255 	ADC_TDR_tmp |= (u16)(1) << PHASE_C_BEMF_ADC_CHAN;
 423  00ec 7b03          	ld	a,(OFST+0,sp)
 424  00ee aa08          	or	a,#8
 425  00f0 6b03          	ld	(OFST+0,sp),a
 426                     ; 256 	ADC_TDR_tmp |= (u16)(1) << ADC_CURRENT_CHANNEL;
 428  00f2 7b02          	ld	a,(OFST-1,sp)
 429  00f4 aa02          	or	a,#2
 430  00f6 6b02          	ld	(OFST-1,sp),a
 431                     ; 257 	ADC_TDR_tmp |= (u16)(1) << ADC_BUS_CHANNEL;
 433  00f8 7b02          	ld	a,(OFST-1,sp)
 434  00fa aa01          	or	a,#1
 435  00fc 6b02          	ld	(OFST-1,sp),a
 436                     ; 258 	ADC_TDR_tmp |= (u16)(1) << PHASE_REF_ADC_CHAN;
 438  00fe 7b03          	ld	a,(OFST+0,sp)
 439  0100 aa80          	or	a,#128
 440  0102 6b03          	ld	(OFST+0,sp),a
 441                     ; 259 	ADC_TDR_tmp |= (u16)(1) << PHASE_FED_ADC_CHAN;
 443  0104 7b03          	ld	a,(OFST+0,sp)
 444  0106 aa40          	or	a,#64
 445  0108 6b03          	ld	(OFST+0,sp),a
 446                     ; 261 	ToCMPxH( ADC2->TDRH, ADC_TDR_tmp);
 448  010a 35035406      	mov	21510,#3
 449                     ; 262 	ToCMPxL( ADC2->TDRL, ADC_TDR_tmp);
 451  010e 35f85407      	mov	21511,#248
 452                     ; 265 	ADC2->CR1 |= BIT0;
 454  0112 72105401      	bset	21505,#0
 455                     ; 267 	value=30;
 457  0116 a61e          	ld	a,#30
 458  0118 6b01          	ld	(OFST-2,sp),a
 460  011a               L521:
 461                     ; 268 	while(value--);                    
 463  011a 7b01          	ld	a,(OFST-2,sp)
 464  011c 0a01          	dec	(OFST-2,sp)
 465  011e 4d            	tnz	a
 466  011f 26f9          	jrne	L521
 467                     ; 270 	ADC2->CSR &= (u8)(~BIT7);
 469  0121 721f5400      	bres	21504,#7
 470                     ; 273 }
 473  0125 5b03          	addw	sp,#3
 474  0127 81            	ret
 509                     ; 275 unsigned short get_adc(void)
 509                     ; 276 {
 510                     	switch	.text
 511  0128               _get_adc:
 513  0128 89            	pushw	x
 514       00000002      OFST:	set	2
 517                     ; 278 	AdcSwitch(PHASE_C_BEMF_ADC_CHAN);
 519  0129 a603          	ld	a,#3
 520  012b cd0000        	call	_AdcSwitch
 522                     ; 279 	value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
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
 537                     ; 280 	return value; 
 539  0140 1e01          	ldw	x,(OFST-1,sp)
 542  0142 5b02          	addw	sp,#2
 543  0144 81            	ret
 566                     ; 283 void init_timer2(void)
 566                     ; 284 {								
 567                     	switch	.text
 568  0145               _init_timer2:
 572                     ; 285 	TIM2->IER = 0x00 ;		// 禁止中断
 574  0145 725f5301      	clr	21249
 575                     ; 286 	TIM2->EGR = 0x01 ;		// 允许产生更新事件
 577  0149 35015304      	mov	21252,#1
 578                     ; 287 	TIM2->PSCR = 32768 ;		// 计数器时钟=16MHZ/16=1M
 580  014d 3500530c      	mov	21260,#0
 581                     ; 289 	TIM2->ARRH = 60;
 583  0151 353c530d      	mov	21261,#60
 584                     ; 290 	TIM2->ARRL = 200;
 586  0155 35c8530e      	mov	21262,#200
 587                     ; 292 	TIM2->CNTRH = 0;				// 设定计数器的初值
 589  0159 725f530a      	clr	21258
 590                     ; 293 	TIM2->CNTRL = 0;				// 设定计数器的初值												
 592  015d 725f530b      	clr	21259
 593                     ; 296 	TIM2->CR1 |= 0 ;
 595  0161 c65300        	ld	a,21248
 596                     ; 299 	TIM2->IER |= 0x01;
 598  0164 72105301      	bset	21249,#0
 599                     ; 300 	TIM2->CR1 |= 0x01;
 601  0168 72105300      	bset	21248,#0
 602                     ; 301 }
 605  016c 81            	ret
 648                     ; 303 void delay_us(unsigned int us)
 648                     ; 304 {
 649                     	switch	.text
 650  016d               _delay_us:
 652  016d 89            	pushw	x
 653  016e 89            	pushw	x
 654       00000002      OFST:	set	2
 657                     ; 306 	for (i = 0; i < us; i++)
 659  016f 5f            	clrw	x
 660  0170 1f01          	ldw	(OFST-1,sp),x
 662  0172 2007          	jra	L502
 663  0174               L102:
 666  0174 1e01          	ldw	x,(OFST-1,sp)
 667  0176 1c0001        	addw	x,#1
 668  0179 1f01          	ldw	(OFST-1,sp),x
 669  017b               L502:
 672  017b 1e01          	ldw	x,(OFST-1,sp)
 673  017d 1303          	cpw	x,(OFST+1,sp)
 674  017f 25f3          	jrult	L102
 675                     ; 310 }
 678  0181 5b04          	addw	sp,#4
 679  0183 81            	ret
 731                     ; 312 void delay_ms(unsigned int ms)
 731                     ; 313 {
 732                     	switch	.text
 733  0184               _delay_ms:
 735  0184 89            	pushw	x
 736  0185 5204          	subw	sp,#4
 737       00000004      OFST:	set	4
 740                     ; 315 	for (j = 0; j < ms; j++)
 742  0187 5f            	clrw	x
 743  0188 1f01          	ldw	(OFST-3,sp),x
 745  018a 2018          	jra	L342
 746  018c               L732:
 747                     ; 317 		for (i = 0; i < 1000; i++)
 749  018c 5f            	clrw	x
 750  018d 1f03          	ldw	(OFST-1,sp),x
 751  018f               L742:
 754  018f 1e03          	ldw	x,(OFST-1,sp)
 755  0191 1c0001        	addw	x,#1
 756  0194 1f03          	ldw	(OFST-1,sp),x
 759  0196 1e03          	ldw	x,(OFST-1,sp)
 760  0198 a303e8        	cpw	x,#1000
 761  019b 25f2          	jrult	L742
 762                     ; 315 	for (j = 0; j < ms; j++)
 764  019d 1e01          	ldw	x,(OFST-3,sp)
 765  019f 1c0001        	addw	x,#1
 766  01a2 1f01          	ldw	(OFST-3,sp),x
 767  01a4               L342:
 770  01a4 1e01          	ldw	x,(OFST-3,sp)
 771  01a6 1305          	cpw	x,(OFST+1,sp)
 772  01a8 25e2          	jrult	L732
 773                     ; 322 }
 776  01aa 5b06          	addw	sp,#6
 777  01ac 81            	ret
 832                     ; 324 void bldc_one_loop(unsigned short duty, unsigned int ms)
 832                     ; 325 {
 833                     	switch	.text
 834  01ad               _bldc_one_loop:
 836  01ad 89            	pushw	x
 837  01ae 88            	push	a
 838       00000001      OFST:	set	1
 841                     ; 327 	Timer1_PWM_Value(duty);
 843  01af cd0000        	call	_Timer1_PWM_Value
 845                     ; 329 	for (flag = 1; flag <= 6; flag++)
 847  01b2 a601          	ld	a,#1
 848  01b4 6b01          	ld	(OFST+0,sp),a
 849  01b6               L303:
 850                     ; 331 		bldc_run_onestep(flag);
 852  01b6 7b01          	ld	a,(OFST+0,sp)
 853  01b8 cd0000        	call	_bldc_run_onestep
 855                     ; 332 		delay_ms(ms);
 857  01bb 1e06          	ldw	x,(OFST+5,sp)
 858  01bd adc5          	call	_delay_ms
 860                     ; 329 	for (flag = 1; flag <= 6; flag++)
 862  01bf 0c01          	inc	(OFST+0,sp)
 865  01c1 7b01          	ld	a,(OFST+0,sp)
 866  01c3 a107          	cp	a,#7
 867  01c5 25ef          	jrult	L303
 868                     ; 334 }
 871  01c7 5b03          	addw	sp,#3
 872  01c9 81            	ret
 875                     	bsct
 876  0000               L113_step:
 877  0000 01            	dc.b	1
 878  0001               L313_adc_value:
 879  0001 0000          	dc.w	0
 939                     ; 336 void bldc_open_loop(void)
 939                     ; 337 {
 940                     	switch	.text
 941  01ca               _bldc_open_loop:
 943  01ca 5204          	subw	sp,#4
 944       00000004      OFST:	set	4
 947                     ; 339 	unsigned int ms = 121;
 949  01cc ae0079        	ldw	x,#121
 950  01cf 1f01          	ldw	(OFST-3,sp),x
 951                     ; 351 	bldc_one_loop(10, 100);
 953  01d1 ae0064        	ldw	x,#100
 954  01d4 89            	pushw	x
 955  01d5 ae000a        	ldw	x,#10
 956  01d8 add3          	call	_bldc_one_loop
 958  01da 85            	popw	x
 959                     ; 352 	bldc_one_loop(20, 80);
 961  01db ae0050        	ldw	x,#80
 962  01de 89            	pushw	x
 963  01df ae0014        	ldw	x,#20
 964  01e2 adc9          	call	_bldc_one_loop
 966  01e4 85            	popw	x
 967                     ; 353 	bldc_one_loop(30, 60);
 969  01e5 ae003c        	ldw	x,#60
 970  01e8 89            	pushw	x
 971  01e9 ae001e        	ldw	x,#30
 972  01ec adbf          	call	_bldc_one_loop
 974  01ee 85            	popw	x
 975                     ; 354 	bldc_one_loop(40, 50);
 977  01ef ae0032        	ldw	x,#50
 978  01f2 89            	pushw	x
 979  01f3 ae0028        	ldw	x,#40
 980  01f6 adb5          	call	_bldc_one_loop
 982  01f8 85            	popw	x
 983                     ; 355 	bldc_one_loop(50, 40);
 985  01f9 ae0028        	ldw	x,#40
 986  01fc 89            	pushw	x
 987  01fd ae0032        	ldw	x,#50
 988  0200 adab          	call	_bldc_one_loop
 990  0202 85            	popw	x
 991                     ; 356 	bldc_one_loop(60, 30);
 993  0203 ae001e        	ldw	x,#30
 994  0206 89            	pushw	x
 995  0207 ae003c        	ldw	x,#60
 996  020a ada1          	call	_bldc_one_loop
 998  020c 85            	popw	x
 999                     ; 357 	bldc_one_loop(70, 20);
1001  020d ae0014        	ldw	x,#20
1002  0210 89            	pushw	x
1003  0211 ae0046        	ldw	x,#70
1004  0214 ad97          	call	_bldc_one_loop
1006  0216 85            	popw	x
1007  0217               L743:
1008                     ; 361 	for (i = 0; i < 10; i++)
1010  0217 5f            	clrw	x
1011  0218 1f03          	ldw	(OFST-1,sp),x
1012  021a               L353:
1013                     ; 363 		bldc_one_loop(70, 20);
1015  021a ae0014        	ldw	x,#20
1016  021d 89            	pushw	x
1017  021e ae0046        	ldw	x,#70
1018  0221 ad8a          	call	_bldc_one_loop
1020  0223 85            	popw	x
1021                     ; 361 	for (i = 0; i < 10; i++)
1023  0224 1e03          	ldw	x,(OFST-1,sp)
1024  0226 1c0001        	addw	x,#1
1025  0229 1f03          	ldw	(OFST-1,sp),x
1028  022b 1e03          	ldw	x,(OFST-1,sp)
1029  022d a3000a        	cpw	x,#10
1030  0230 25e8          	jrult	L353
1032  0232 20e3          	jra	L743
1057                     ; 466 static void AppStopToAlignment(void)
1057                     ; 467 {
1058                     	switch	.text
1059  0234               L3_AppStopToAlignment:
1063                     ; 468 	Timer1_PWM_Value(400);
1065  0234 ae0190        	ldw	x,#400
1066  0237 cd0000        	call	_Timer1_PWM_Value
1068                     ; 469 	PWM_AH_OUT_DIS();
1070  023a 7211525c      	bres	21084,#0
1071                     ; 470 	PWM_BH_OUT_DIS();
1073  023e 7219525c      	bres	21084,#4
1074                     ; 471 	PWM_CH_OUT_EN();
1076  0242 7210525d      	bset	21085,#0
1077                     ; 472 	CNT_AL_OUT_EN();
1079  0246 72105005      	bset	20485,#0
1080                     ; 473 	CNT_BL_OUT_EN();
1082  024a 72125005      	bset	20485,#1
1083                     ; 474 	CNT_CL_OUT_DIS();
1085  024e 72155005      	bres	20485,#2
1086                     ; 476 	delay_ms(100);
1088  0252 ae0064        	ldw	x,#100
1089  0255 cd0184        	call	_delay_ms
1091                     ; 478 	Timer1_PWM_Value(50);
1093  0258 ae0032        	ldw	x,#50
1094  025b cd0000        	call	_Timer1_PWM_Value
1096                     ; 479 	PWM_AH_OUT_DIS();
1098  025e 7211525c      	bres	21084,#0
1099                     ; 480 	PWM_BH_OUT_DIS();
1101  0262 7219525c      	bres	21084,#4
1102                     ; 481 	PWM_CH_OUT_DIS();
1104  0266 7211525d      	bres	21085,#0
1105                     ; 482 	CNT_AL_OUT_DIS();
1107  026a 72115005      	bres	20485,#0
1108                     ; 483 	CNT_BL_OUT_DIS();
1110  026e 72135005      	bres	20485,#1
1111                     ; 484 	CNT_CL_OUT_DIS();	
1113  0272 72155005      	bres	20485,#2
1114                     ; 485 }
1117  0276 81            	ret
1120                     	bsct
1121  0003               L173_flag:
1122  0003 0000          	dc.w	0
1169                     ; 487 void main(void)
1169                     ; 488 {
1170                     	switch	.text
1171  0277               _main:
1175                     ; 490 	_asm("sim");
1178  0277 9b            sim
1180                     ; 492 	Init_Clk();
1182  0278 cd0000        	call	_Init_Clk
1184                     ; 493 	Init_Io();
1186  027b cd008a        	call	_Init_Io
1188                     ; 494 	memset(&tBC_Param, 0, sizeof(tBC_Param));
1190  027e ae002e        	ldw	x,#46
1191  0281               L04:
1192  0281 6fff          	clr	(_tBC_Param-1,x)
1193  0283 5a            	decw	x
1194  0284 26fb          	jrne	L04
1195                     ; 495 	Init_Timer1_PWM(1000, 1);  // 8k
1197  0286 ae0001        	ldw	x,#1
1198  0289 89            	pushw	x
1199  028a ae03e8        	ldw	x,#1000
1200  028d cd0005        	call	_Init_Timer1_PWM
1202  0290 85            	popw	x
1203                     ; 496 	Init_ADC();
1205  0291 cd00d3        	call	_Init_ADC
1207                     ; 512 	_asm("rim");
1210  0294 9a            rim
1212                     ; 513 	Timer1_PWM_Value(50);
1214  0295 ae0032        	ldw	x,#50
1215  0298 cd0000        	call	_Timer1_PWM_Value
1217                     ; 514 	AppStopToAlignment();
1219  029b ad97          	call	L3_AppStopToAlignment
1221                     ; 515 	bldc_open_loop();
1223  029d cd01ca        	call	_bldc_open_loop
1225  02a0               L114:
1226                     ; 547 		if (tBC_Param.usTick1ms & 0x01)
1228  02a0 b618          	ld	a,_tBC_Param+24
1229  02a2 a501          	bcp	a,#1
1230  02a4 2708          	jreq	L514
1231                     ; 549 			Run_Ctl();
1233  02a6 cd0000        	call	_Run_Ctl
1235                     ; 550 			SpeedRefAccDec();
1237  02a9 cd0000        	call	_SpeedRefAccDec
1240  02ac 20f2          	jra	L114
1241  02ae               L514:
1242                     ; 552 		else if (tBC_Param.usTick1ms & 0x02)
1244  02ae b618          	ld	a,_tBC_Param+24
1245  02b0 a502          	bcp	a,#2
1246  02b2 2765          	jreq	L124
1247                     ; 554 			if (BldcStatus == STATUS_STOP)
1249  02b4 3d08          	tnz	_tBC_Param+8
1250  02b6 2618          	jrne	L324
1251                     ; 556 				AdcSwitch(ADC_BUS_CHANNEL);
1253  02b8 a608          	ld	a,#8
1254  02ba cd0000        	call	_AdcSwitch
1256                     ; 557 				tBC_Param.usAD_DCbus = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1258  02bd c65404        	ld	a,21508
1259  02c0 5f            	clrw	x
1260  02c1 97            	ld	xl,a
1261  02c2 58            	sllw	x
1262  02c3 58            	sllw	x
1263  02c4 01            	rrwa	x,a
1264  02c5 cb5405        	add	a,21509
1265  02c8 2401          	jrnc	L24
1266  02ca 5c            	incw	x
1267  02cb               L24:
1268  02cb b71a          	ld	_tBC_Param+26,a
1269  02cd 9f            	ld	a,xl
1270  02ce b719          	ld	_tBC_Param+25,a
1271  02d0               L324:
1272                     ; 559 			FILTER_LP(tBC_Param.lDCbusVoltAcc, tBC_Param.usAD_DCbus, 4);
1274  02d0 be19          	ldw	x,_tBC_Param+25
1275  02d2 cd0000        	call	c_uitolx
1277  02d5 a610          	ld	a,#16
1278  02d7 cd0000        	call	c_llsh
1280  02da ae001d        	ldw	x,#_tBC_Param+29
1281  02dd cd0000        	call	c_lsub
1283  02e0 a604          	ld	a,#4
1284  02e2 cd0000        	call	c_lrsh
1286  02e5 ae001d        	ldw	x,#_tBC_Param+29
1287  02e8 cd0000        	call	c_lgadd
1289                     ; 560 			tBC_Param.usDCbusVolt = tBC_Param.lDCbusVoltAcc>>16;
1292  02eb be1d          	ldw	x,_tBC_Param+29
1293  02ed bf1b          	ldw	_tBC_Param+27,x
1294                     ; 562 			if (tBC_Param.usDCbusVolt > 930)  // 410V 过压
1296  02ef be1b          	ldw	x,_tBC_Param+27
1297  02f1 a303a3        	cpw	x,#931
1298  02f4 2506          	jrult	L524
1299                     ; 564 				Error_code.bit.OverVoltage = 1;
1301  02f6 72160000      	bset	_Error_code,#3
1303  02fa 2018          	jra	L724
1304  02fc               L524:
1305                     ; 566 			else if (tBC_Param.usDCbusVolt < 453)  // 200V 欠压 
1307  02fc be1b          	ldw	x,_tBC_Param+27
1308  02fe a301c5        	cpw	x,#453
1309  0301 2406          	jruge	L134
1310                     ; 568 				if (BldcStatus != STATUS_STOP)
1312  0303 3d08          	tnz	_tBC_Param+8
1313                     ; 572 				tBC_Param.ucPowerOn = 0;
1315  0305 3f2b          	clr	_tBC_Param+43
1317  0307 200b          	jra	L724
1318  0309               L134:
1319                     ; 574 			else if (tBC_Param.usDCbusVolt > 470)
1321  0309 be1b          	ldw	x,_tBC_Param+27
1322  030b a301d7        	cpw	x,#471
1323  030e 2504          	jrult	L724
1324                     ; 576 				tBC_Param.ucPowerOn = 1;
1326  0310 3501002b      	mov	_tBC_Param+43,#1
1327  0314               L724:
1328                     ; 579 			Key_Check();
1330  0314 cd0000        	call	_Key_Check
1333  0317 2087          	jra	L114
1334  0319               L124:
1335                     ; 583 			Led_Light();
1337  0319 cd0000        	call	_Led_Light
1339  031c 2082          	jra	L114
1374                     ; 597 void assert_failed(u8* file, u32 line)
1374                     ; 598 { 
1375                     	switch	.text
1376  031e               _assert_failed:
1380  031e               L164:
1381  031e 20fe          	jra	L164
1406                     	xdef	_main
1407                     	xdef	_bldc_open_loop
1408                     	xdef	_bldc_one_loop
1409                     	xdef	_delay_ms
1410                     	xdef	_init_timer2
1411                     	xdef	_get_adc
1412                     	xdef	_Init_ADC
1413                     	xdef	_Init_Io
1414                     	xdef	_Init_TIM4
1415                     	xdef	_Init_Timer1_PWM
1416                     	xdef	_Init_Clk
1417                     	switch	.ubsct
1418  0000               _adc_table:
1419  0000 000000000000  	ds.b	20
1420                     	xdef	_adc_table
1421                     	xdef	_delay_us
1422                     	xref	_bldc_run_onestep
1423                     	xref	_SpeedRefAccDec
1424                     	xref	_Key_Check
1425                     	xref	_Run_Ctl
1426                     	xref	_Led_Light
1427                     	xref	_Timer1_PWM_Value
1428                     	xref	_AdcSwitch
1429                     	xref.b	_Error_code
1430                     	xref.b	_tBC_Param
1431                     	xdef	_assert_failed
1451                     	xref	c_lgadd
1452                     	xref	c_lrsh
1453                     	xref	c_lsub
1454                     	xref	c_llsh
1455                     	xref	c_uitolx
1456                     	end
