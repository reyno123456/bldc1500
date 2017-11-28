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
 173                     ; 99 	TIM1->CR1 |= TIM1_CR1_CEN;
 175  005c 72105250      	bset	21072,#0
 176                     ; 102 	TIM1->BKR = (TIM1_BREAKPOLARITY_LOW|TIM1_BREAK_ENABLE|TIM1_OSSISTATE_ENABLE|TIM1_LOCKLEVEL_2);
 178  0060 3516526d      	mov	21101,#22
 179                     ; 103 	TIM1->BKR |= TIM1_BKR_MOE;
 181  0064 721e526d      	bset	21101,#7
 182                     ; 107 }
 185  0068 85            	popw	x
 186  0069 81            	ret
 229                     ; 115 void Init_TIM4(uint8 Tcon,uint8 Pscr)
 229                     ; 116 {								
 230                     	switch	.text
 231  006a               _Init_TIM4:
 235                     ; 117 	TIM4->IER = 0x00 ;		// 禁止中断
 237  006a 725f5341      	clr	21313
 238                     ; 118 	TIM4->EGR = 0x01 ;		// 允许产生更新事件
 240  006e 35015343      	mov	21315,#1
 241                     ; 119 	TIM4->PSCR = Pscr ;		// 计数器时钟=16MHZ/16=1M
 243  0072 9f            	ld	a,xl
 244  0073 c75345        	ld	21317,a
 245                     ; 123 	TIM4->ARR = Tcon;			// 1U*20 = 20U   
 247  0076 9e            	ld	a,xh
 248  0077 c75346        	ld	21318,a
 249                     ; 124 	TIM4->CNTR = 0;				// 设定计数器的初值
 251  007a 725f5344      	clr	21316
 252                     ; 128 	TIM4->CR1 |= 0 ;
 254  007e c65340        	ld	a,21312
 255                     ; 131 	TIM4->IER |= 0x01;
 257  0081 72105341      	bset	21313,#0
 258                     ; 132 	TIM4->CR1 |= 0x01;
 260  0085 72105340      	bset	21312,#0
 261                     ; 133 }
 264  0089 81            	ret
 287                     ; 141 void Init_Io(void)
 287                     ; 142 {
 288                     	switch	.text
 289  008a               _Init_Io:
 293                     ; 143 	GPIOA->DDR = 0b11111111;
 295  008a 35ff5002      	mov	20482,#255
 296                     ; 144 	GPIOA->CR1 = 0xFF;
 298  008e 35ff5003      	mov	20483,#255
 299                     ; 145 	GPIOA->CR2 = 0;
 301  0092 725f5004      	clr	20484
 302                     ; 147 	GPIOB->DDR = 0b00000111;   // UL,VL,WL, ADC
 304  0096 35075007      	mov	20487,#7
 305                     ; 148 	GPIOB->CR1 = 0b00000111;
 307  009a 35075008      	mov	20488,#7
 308                     ; 149 	GPIOB->CR2 = 0;
 310  009e 725f5009      	clr	20489
 311                     ; 151 	GPIOC->DDR = 0b11111111;   // NULL,AH,BH,CH,NONE,SCK,MOSI,MISO
 313  00a2 35ff500c      	mov	20492,#255
 314                     ; 152 	GPIOC->CR1 = 0b11111111;
 316  00a6 35ff500d      	mov	20493,#255
 317                     ; 153 	GPIOC->CR2 = 0;
 319  00aa 725f500e      	clr	20494
 320                     ; 155 	GPIOD->DDR = 0b11111101;   // NONE,SWIM,LED-ERR,LED-RUN,T1,T2,T3,T4
 322  00ae 35fd5011      	mov	20497,#253
 323                     ; 156 	GPIOD->CR1 = 0b11111101;
 325  00b2 35fd5012      	mov	20498,#253
 326                     ; 157 	GPIOD->CR2 = 0;
 328  00b6 725f5013      	clr	20499
 329                     ; 159 	GPIOE->DDR = 0b11110101;  // NONE,RUN,PWM-EN,BKIN,NULL,RCK,NULL,NULL
 331  00ba 35f55016      	mov	20502,#245
 332                     ; 160 	GPIOE->CR1 = 0b11110111;
 334  00be 35f75017      	mov	20503,#247
 335                     ; 161 	GPIOE->CR2 = 0;
 337  00c2 725f5018      	clr	20504
 338                     ; 163 	PWM_OUT_DIS();
 340  00c6 72145014      	bset	20500,#2
 341                     ; 164 	CNT_AL_OUT_DIS();
 343  00ca 72105005      	bset	20485,#0
 344                     ; 165 	CNT_BL_OUT_DIS();
 346  00ce 72125005      	bset	20485,#1
 347                     ; 166 	CNT_CL_OUT_DIS();
 349  00d2 72145005      	bset	20485,#2
 350                     ; 168 	LED_ERROR_OFF();
 352  00d6 7214500f      	bset	20495,#2
 353                     ; 169 	LED_RUN_OFF();
 355  00da 7216500f      	bset	20495,#3
 356                     ; 170 }
 359  00de 81            	ret
 402                     ; 178 void Init_ADC( void )
 402                     ; 179 {
 403                     	switch	.text
 404  00df               _Init_ADC:
 406  00df 5203          	subw	sp,#3
 407       00000003      OFST:	set	3
 410                     ; 183 	ADC2->CR1 = 0;
 412  00e1 725f5401      	clr	21505
 413                     ; 186 	ADC2->CSR = PHASE_C_BEMF_ADC_CHAN;
 415  00e5 35035400      	mov	21504,#3
 416                     ; 188 	ADC_TDR_tmp = 0;
 418  00e9 5f            	clrw	x
 419  00ea 1f02          	ldw	(OFST-1,sp),x
 420                     ; 189 	ADC_TDR_tmp |= (u16)(1) << PHASE_A_BEMF_ADC_CHAN;
 422  00ec 7b03          	ld	a,(OFST+0,sp)
 423  00ee aa20          	or	a,#32
 424  00f0 6b03          	ld	(OFST+0,sp),a
 425                     ; 190 	ADC_TDR_tmp |= (u16)(1) << PHASE_B_BEMF_ADC_CHAN;
 427  00f2 7b03          	ld	a,(OFST+0,sp)
 428  00f4 aa10          	or	a,#16
 429  00f6 6b03          	ld	(OFST+0,sp),a
 430                     ; 191 	ADC_TDR_tmp |= (u16)(1) << PHASE_C_BEMF_ADC_CHAN;
 432  00f8 7b03          	ld	a,(OFST+0,sp)
 433  00fa aa08          	or	a,#8
 434  00fc 6b03          	ld	(OFST+0,sp),a
 435                     ; 192 	ADC_TDR_tmp |= (u16)(1) << ADC_CURRENT_CHANNEL;
 437  00fe 7b02          	ld	a,(OFST-1,sp)
 438  0100 aa02          	or	a,#2
 439  0102 6b02          	ld	(OFST-1,sp),a
 440                     ; 193 	ADC_TDR_tmp |= (u16)(1) << ADC_BUS_CHANNEL;
 442  0104 7b02          	ld	a,(OFST-1,sp)
 443  0106 aa01          	or	a,#1
 444  0108 6b02          	ld	(OFST-1,sp),a
 445                     ; 194 	ADC_TDR_tmp |= (u16)(1) << PHASE_REF_ADC_CHAN;
 447  010a 7b03          	ld	a,(OFST+0,sp)
 448  010c aa80          	or	a,#128
 449  010e 6b03          	ld	(OFST+0,sp),a
 450                     ; 195 	ADC_TDR_tmp |= (u16)(1) << PHASE_FED_ADC_CHAN;
 452  0110 7b03          	ld	a,(OFST+0,sp)
 453  0112 aa40          	or	a,#64
 454  0114 6b03          	ld	(OFST+0,sp),a
 455                     ; 197 	ToCMPxH( ADC2->TDRH, ADC_TDR_tmp);
 457  0116 35035406      	mov	21510,#3
 458                     ; 198 	ToCMPxL( ADC2->TDRL, ADC_TDR_tmp);
 460  011a 35f85407      	mov	21511,#248
 461                     ; 201 	ADC2->CR1 |= BIT0;
 463  011e 72105401      	bset	21505,#0
 464                     ; 203 	value=30;
 466  0122 a61e          	ld	a,#30
 467  0124 6b01          	ld	(OFST-2,sp),a
 469  0126               L521:
 470                     ; 204 	while(value--);                    
 472  0126 7b01          	ld	a,(OFST-2,sp)
 473  0128 0a01          	dec	(OFST-2,sp)
 474  012a 4d            	tnz	a
 475  012b 26f9          	jrne	L521
 476                     ; 206 	ADC2->CSR &= (u8)(~BIT7);
 478  012d 721f5400      	bres	21504,#7
 479                     ; 209 }
 482  0131 5b03          	addw	sp,#3
 483  0133 81            	ret
 518                     ; 211 unsigned short get_adc(void)
 518                     ; 212 {
 519                     	switch	.text
 520  0134               _get_adc:
 522  0134 89            	pushw	x
 523       00000002      OFST:	set	2
 526                     ; 214 	AdcSwitch(PHASE_C_BEMF_ADC_CHAN);
 528  0135 a603          	ld	a,#3
 529  0137 cd0000        	call	_AdcSwitch
 531                     ; 215 	value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
 533  013a c65404        	ld	a,21508
 534  013d 5f            	clrw	x
 535  013e 97            	ld	xl,a
 536  013f 58            	sllw	x
 537  0140 58            	sllw	x
 538  0141 01            	rrwa	x,a
 539  0142 cb5405        	add	a,21509
 540  0145 2401          	jrnc	L02
 541  0147 5c            	incw	x
 542  0148               L02:
 543  0148 02            	rlwa	x,a
 544  0149 1f01          	ldw	(OFST-1,sp),x
 545  014b 01            	rrwa	x,a
 546                     ; 216 	return value; 
 548  014c 1e01          	ldw	x,(OFST-1,sp)
 551  014e 5b02          	addw	sp,#2
 552  0150 81            	ret
 575                     ; 219 void init_timer2(void)
 575                     ; 220 {								
 576                     	switch	.text
 577  0151               _init_timer2:
 581                     ; 221 	TIM2->IER = 0x00 ;		// 禁止中断
 583  0151 725f5301      	clr	21249
 584                     ; 222 	TIM2->EGR = 0x01 ;		// 允许产生更新事件
 586  0155 35015304      	mov	21252,#1
 587                     ; 223 	TIM2->PSCR = 32768 ;		// 计数器时钟=16MHZ/16=1M
 589  0159 3500530c      	mov	21260,#0
 590                     ; 225 	TIM2->ARRH = 60;
 592  015d 353c530d      	mov	21261,#60
 593                     ; 226 	TIM2->ARRL = 200;
 595  0161 35c8530e      	mov	21262,#200
 596                     ; 228 	TIM2->CNTRH = 0;				// 设定计数器的初值
 598  0165 725f530a      	clr	21258
 599                     ; 229 	TIM2->CNTRL = 0;				// 设定计数器的初值												
 601  0169 725f530b      	clr	21259
 602                     ; 232 	TIM2->CR1 |= 0 ;
 604  016d c65300        	ld	a,21248
 605                     ; 235 	TIM2->IER |= 0x01;
 607  0170 72105301      	bset	21249,#0
 608                     ; 236 	TIM2->CR1 |= 0x01;
 610  0174 72105300      	bset	21248,#0
 611                     ; 237 }
 614  0178 81            	ret
 657                     ; 239 void delay_us(unsigned int us)
 657                     ; 240 {
 658                     	switch	.text
 659  0179               _delay_us:
 661  0179 89            	pushw	x
 662  017a 89            	pushw	x
 663       00000002      OFST:	set	2
 666                     ; 242 	for (i = 0; i < us; i++)
 668  017b 5f            	clrw	x
 669  017c 1f01          	ldw	(OFST-1,sp),x
 671  017e 2007          	jra	L502
 672  0180               L102:
 675  0180 1e01          	ldw	x,(OFST-1,sp)
 676  0182 1c0001        	addw	x,#1
 677  0185 1f01          	ldw	(OFST-1,sp),x
 678  0187               L502:
 681  0187 1e01          	ldw	x,(OFST-1,sp)
 682  0189 1303          	cpw	x,(OFST+1,sp)
 683  018b 25f3          	jrult	L102
 684                     ; 246 }
 687  018d 5b04          	addw	sp,#4
 688  018f 81            	ret
 740                     ; 248 void delay_ms(unsigned int ms)
 740                     ; 249 {
 741                     	switch	.text
 742  0190               _delay_ms:
 744  0190 89            	pushw	x
 745  0191 5204          	subw	sp,#4
 746       00000004      OFST:	set	4
 749                     ; 251 	for (j = 0; j < ms; j++)
 751  0193 5f            	clrw	x
 752  0194 1f01          	ldw	(OFST-3,sp),x
 754  0196 2018          	jra	L342
 755  0198               L732:
 756                     ; 253 		for (i = 0; i < 1000; i++)
 758  0198 5f            	clrw	x
 759  0199 1f03          	ldw	(OFST-1,sp),x
 760  019b               L742:
 763  019b 1e03          	ldw	x,(OFST-1,sp)
 764  019d 1c0001        	addw	x,#1
 765  01a0 1f03          	ldw	(OFST-1,sp),x
 768  01a2 1e03          	ldw	x,(OFST-1,sp)
 769  01a4 a303e8        	cpw	x,#1000
 770  01a7 25f2          	jrult	L742
 771                     ; 251 	for (j = 0; j < ms; j++)
 773  01a9 1e01          	ldw	x,(OFST-3,sp)
 774  01ab 1c0001        	addw	x,#1
 775  01ae 1f01          	ldw	(OFST-3,sp),x
 776  01b0               L342:
 779  01b0 1e01          	ldw	x,(OFST-3,sp)
 780  01b2 1305          	cpw	x,(OFST+1,sp)
 781  01b4 25e2          	jrult	L732
 782                     ; 258 }
 785  01b6 5b06          	addw	sp,#6
 786  01b8 81            	ret
 841                     ; 260 void bldc_one_loop(unsigned short duty, unsigned int ms)
 841                     ; 261 {
 842                     	switch	.text
 843  01b9               _bldc_one_loop:
 845  01b9 89            	pushw	x
 846  01ba 88            	push	a
 847       00000001      OFST:	set	1
 850                     ; 262 	unsigned char flag = 1;
 852                     ; 263 	Timer1_PWM_Value(duty);
 854  01bb cd0000        	call	_Timer1_PWM_Value
 856                     ; 265 	for (flag = 1; flag <= 6; flag++)
 858  01be a601          	ld	a,#1
 859  01c0 6b01          	ld	(OFST+0,sp),a
 860  01c2               L303:
 861                     ; 267 		BLDC_RUN_ONESTEP(flag);
 863  01c2 7b01          	ld	a,(OFST+0,sp)
 864  01c4 cd0000        	call	_BLDC_RUN_ONESTEP
 866                     ; 268 		delay_ms(ms);
 868  01c7 1e06          	ldw	x,(OFST+5,sp)
 869  01c9 adc5          	call	_delay_ms
 871                     ; 265 	for (flag = 1; flag <= 6; flag++)
 873  01cb 0c01          	inc	(OFST+0,sp)
 876  01cd 7b01          	ld	a,(OFST+0,sp)
 877  01cf a107          	cp	a,#7
 878  01d1 25ef          	jrult	L303
 879                     ; 270 }
 882  01d3 5b03          	addw	sp,#3
 883  01d5 81            	ret
 886                     	bsct
 887  0000               L113_step:
 888  0000 01            	dc.b	1
 889  0001               L313_adc_value:
 890  0001 0000          	dc.w	0
 950                     ; 272 void bldc_open_loop(void)
 950                     ; 273 {
 951                     	switch	.text
 952  01d6               _bldc_open_loop:
 954  01d6 5204          	subw	sp,#4
 955       00000004      OFST:	set	4
 958                     ; 275 	unsigned int ms = 121;
 960  01d8 ae0079        	ldw	x,#121
 961  01db 1f01          	ldw	(OFST-3,sp),x
 962                     ; 294 	for (i = 0; i < 10; i++)
 964  01dd 5f            	clrw	x
 965  01de 1f03          	ldw	(OFST-1,sp),x
 966  01e0               L743:
 967                     ; 296 		bldc_one_loop(70, 28);
 969  01e0 ae001c        	ldw	x,#28
 970  01e3 89            	pushw	x
 971  01e4 ae0046        	ldw	x,#70
 972  01e7 add0          	call	_bldc_one_loop
 974  01e9 85            	popw	x
 975                     ; 294 	for (i = 0; i < 10; i++)
 977  01ea 1e03          	ldw	x,(OFST-1,sp)
 978  01ec 1c0001        	addw	x,#1
 979  01ef 1f03          	ldw	(OFST-1,sp),x
 982  01f1 1e03          	ldw	x,(OFST-1,sp)
 983  01f3 a3000a        	cpw	x,#10
 984  01f6 25e8          	jrult	L743
 985                     ; 298 	for (i = 0; i < 10; i++)
 987  01f8 5f            	clrw	x
 988  01f9 1f03          	ldw	(OFST-1,sp),x
 989  01fb               L553:
 990                     ; 300 		bldc_one_loop(100, 15);
 992  01fb ae000f        	ldw	x,#15
 993  01fe 89            	pushw	x
 994  01ff ae0064        	ldw	x,#100
 995  0202 adb5          	call	_bldc_one_loop
 997  0204 85            	popw	x
 998                     ; 298 	for (i = 0; i < 10; i++)
1000  0205 1e03          	ldw	x,(OFST-1,sp)
1001  0207 1c0001        	addw	x,#1
1002  020a 1f03          	ldw	(OFST-1,sp),x
1005  020c 1e03          	ldw	x,(OFST-1,sp)
1006  020e a3000a        	cpw	x,#10
1007  0211 25e8          	jrult	L553
1008                     ; 303 	for (i = 0; i < 10; i++)
1010  0213 5f            	clrw	x
1011  0214 1f03          	ldw	(OFST-1,sp),x
1012  0216               L363:
1013                     ; 305 		bldc_one_loop(150, 10);
1015  0216 ae000a        	ldw	x,#10
1016  0219 89            	pushw	x
1017  021a ae0096        	ldw	x,#150
1018  021d ad9a          	call	_bldc_one_loop
1020  021f 85            	popw	x
1021                     ; 303 	for (i = 0; i < 10; i++)
1023  0220 1e03          	ldw	x,(OFST-1,sp)
1024  0222 1c0001        	addw	x,#1
1025  0225 1f03          	ldw	(OFST-1,sp),x
1028  0227 1e03          	ldw	x,(OFST-1,sp)
1029  0229 a3000a        	cpw	x,#10
1030  022c 25e8          	jrult	L363
1031                     ; 308 	for (i = 0; i < 10; i++)
1033  022e 5f            	clrw	x
1034  022f 1f03          	ldw	(OFST-1,sp),x
1035  0231               L173:
1036                     ; 310 		bldc_one_loop(200, 8);
1038  0231 ae0008        	ldw	x,#8
1039  0234 89            	pushw	x
1040  0235 ae00c8        	ldw	x,#200
1041  0238 cd01b9        	call	_bldc_one_loop
1043  023b 85            	popw	x
1044                     ; 308 	for (i = 0; i < 10; i++)
1046  023c 1e03          	ldw	x,(OFST-1,sp)
1047  023e 1c0001        	addw	x,#1
1048  0241 1f03          	ldw	(OFST-1,sp),x
1051  0243 1e03          	ldw	x,(OFST-1,sp)
1052  0245 a3000a        	cpw	x,#10
1053  0248 25e7          	jrult	L173
1054                     ; 313 	for (i = 0; i < 10; i++)
1056  024a 5f            	clrw	x
1057  024b 1f03          	ldw	(OFST-1,sp),x
1058  024d               L773:
1059                     ; 315 		bldc_one_loop(200, 4);
1061  024d ae0004        	ldw	x,#4
1062  0250 89            	pushw	x
1063  0251 ae00c8        	ldw	x,#200
1064  0254 cd01b9        	call	_bldc_one_loop
1066  0257 85            	popw	x
1067                     ; 313 	for (i = 0; i < 10; i++)
1069  0258 1e03          	ldw	x,(OFST-1,sp)
1070  025a 1c0001        	addw	x,#1
1071  025d 1f03          	ldw	(OFST-1,sp),x
1074  025f 1e03          	ldw	x,(OFST-1,sp)
1075  0261 a3000a        	cpw	x,#10
1076  0264 25e7          	jrult	L773
1077                     ; 318 	for (i = 0; i < 100; i++)
1079  0266 5f            	clrw	x
1080  0267 1f03          	ldw	(OFST-1,sp),x
1081  0269               L504:
1082                     ; 320 		bldc_one_loop(200, 3);
1084  0269 ae0003        	ldw	x,#3
1085  026c 89            	pushw	x
1086  026d ae00c8        	ldw	x,#200
1087  0270 cd01b9        	call	_bldc_one_loop
1089  0273 85            	popw	x
1090                     ; 318 	for (i = 0; i < 100; i++)
1092  0274 1e03          	ldw	x,(OFST-1,sp)
1093  0276 1c0001        	addw	x,#1
1094  0279 1f03          	ldw	(OFST-1,sp),x
1097  027b 1e03          	ldw	x,(OFST-1,sp)
1098  027d a30064        	cpw	x,#100
1099  0280 25e7          	jrult	L504
1100                     ; 323 	for (i = 0; i < 100; i++)
1102  0282 5f            	clrw	x
1103  0283 1f03          	ldw	(OFST-1,sp),x
1104  0285               L314:
1105                     ; 325 		bldc_one_loop(280,2);
1107  0285 ae0002        	ldw	x,#2
1108  0288 89            	pushw	x
1109  0289 ae0118        	ldw	x,#280
1110  028c cd01b9        	call	_bldc_one_loop
1112  028f 85            	popw	x
1113                     ; 323 	for (i = 0; i < 100; i++)
1115  0290 1e03          	ldw	x,(OFST-1,sp)
1116  0292 1c0001        	addw	x,#1
1117  0295 1f03          	ldw	(OFST-1,sp),x
1120  0297 1e03          	ldw	x,(OFST-1,sp)
1121  0299 a30064        	cpw	x,#100
1122  029c 25e7          	jrult	L314
1123  029e               L124:
1124                     ; 330 		bldc_one_loop(300,2);
1126  029e ae0002        	ldw	x,#2
1127  02a1 89            	pushw	x
1128  02a2 ae012c        	ldw	x,#300
1129  02a5 cd01b9        	call	_bldc_one_loop
1131  02a8 85            	popw	x
1133  02a9 20f3          	jra	L124
1158                     ; 394 static void AppStopToAlignment(void)
1158                     ; 395 {
1159                     	switch	.text
1160  02ab               L3_AppStopToAlignment:
1164                     ; 396 	Timer1_PWM_Value(400);
1166  02ab ae0190        	ldw	x,#400
1167  02ae cd0000        	call	_Timer1_PWM_Value
1169                     ; 397 	PWM_AH_OUT_DIS();
1171  02b1 7211525c      	bres	21084,#0
1172                     ; 398 	PWM_BH_OUT_DIS();
1174  02b5 7219525c      	bres	21084,#4
1175                     ; 399 	PWM_CH_OUT_EN();
1177  02b9 7210525d      	bset	21085,#0
1178                     ; 400 	CNT_AL_OUT_EN();
1180  02bd 72115005      	bres	20485,#0
1181                     ; 401 	CNT_BL_OUT_EN();
1183  02c1 72135005      	bres	20485,#1
1184                     ; 402 	CNT_CL_OUT_DIS();
1186  02c5 72145005      	bset	20485,#2
1187                     ; 404 	delay_ms(100);
1189  02c9 ae0064        	ldw	x,#100
1190  02cc cd0190        	call	_delay_ms
1192                     ; 406 	Timer1_PWM_Value(50);
1194  02cf ae0032        	ldw	x,#50
1195  02d2 cd0000        	call	_Timer1_PWM_Value
1197                     ; 407 	PWM_AH_OUT_DIS();
1199  02d5 7211525c      	bres	21084,#0
1200                     ; 408 	PWM_BH_OUT_DIS();
1202  02d9 7219525c      	bres	21084,#4
1203                     ; 409 	PWM_CH_OUT_DIS();
1205  02dd 7211525d      	bres	21085,#0
1206                     ; 410 	CNT_AL_OUT_DIS();
1208  02e1 72105005      	bset	20485,#0
1209                     ; 411 	CNT_BL_OUT_DIS();
1211  02e5 72125005      	bset	20485,#1
1212                     ; 412 	CNT_CL_OUT_DIS();	
1214  02e9 72145005      	bset	20485,#2
1215                     ; 413 }
1218  02ed 81            	ret
1221                     	bsct
1222  0003               L534_flag:
1223  0003 0000          	dc.w	0
1270                     ; 415 void main(void)
1270                     ; 416 {
1271                     	switch	.text
1272  02ee               _main:
1276                     ; 418 	_asm("sim");
1279  02ee 9b            sim
1281                     ; 420 	Init_Clk();
1283  02ef cd0000        	call	_Init_Clk
1285                     ; 421 	Init_Io();
1287  02f2 cd008a        	call	_Init_Io
1289                     ; 422 	memset(&tBC_Param, 0, sizeof(tBC_Param));
1291  02f5 ae002e        	ldw	x,#46
1292  02f8               L04:
1293  02f8 6fff          	clr	(_tBC_Param-1,x)
1294  02fa 5a            	decw	x
1295  02fb 26fb          	jrne	L04
1296                     ; 423 	Init_Timer1_PWM(2400, TIM1_DIV2);  // 8k
1298  02fd ae0001        	ldw	x,#1
1299  0300 89            	pushw	x
1300  0301 ae0960        	ldw	x,#2400
1301  0304 cd0005        	call	_Init_Timer1_PWM
1303  0307 85            	popw	x
1304                     ; 425 	Init_ADC();
1306  0308 cd00df        	call	_Init_ADC
1308                     ; 441 	_asm("rim");
1311  030b 9a            rim
1313                     ; 442 	Timer1_PWM_Value(50);
1315  030c ae0032        	ldw	x,#50
1316  030f cd0000        	call	_Timer1_PWM_Value
1318                     ; 443 	AppStopToAlignment();
1320  0312 ad97          	call	L3_AppStopToAlignment
1322                     ; 444 	bldc_open_loop();
1324  0314 cd01d6        	call	_bldc_open_loop
1326  0317               L554:
1327                     ; 476 		if (tBC_Param.usTick1ms & 0x01)
1329  0317 b618          	ld	a,_tBC_Param+24
1330  0319 a501          	bcp	a,#1
1331  031b 2708          	jreq	L164
1332                     ; 478 			Run_Ctl();
1334  031d cd0000        	call	_Run_Ctl
1336                     ; 479 			SpeedRefAccDec();
1338  0320 cd0000        	call	_SpeedRefAccDec
1341  0323 20f2          	jra	L554
1342  0325               L164:
1343                     ; 481 		else if (tBC_Param.usTick1ms & 0x02)
1345  0325 b618          	ld	a,_tBC_Param+24
1346  0327 a502          	bcp	a,#2
1347  0329 2765          	jreq	L564
1348                     ; 483 			if (BldcStatus == STATUS_STOP)
1350  032b 3d08          	tnz	_tBC_Param+8
1351  032d 2618          	jrne	L764
1352                     ; 485 				AdcSwitch(ADC_BUS_CHANNEL);
1354  032f a608          	ld	a,#8
1355  0331 cd0000        	call	_AdcSwitch
1357                     ; 486 				tBC_Param.usAD_DCbus = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1359  0334 c65404        	ld	a,21508
1360  0337 5f            	clrw	x
1361  0338 97            	ld	xl,a
1362  0339 58            	sllw	x
1363  033a 58            	sllw	x
1364  033b 01            	rrwa	x,a
1365  033c cb5405        	add	a,21509
1366  033f 2401          	jrnc	L24
1367  0341 5c            	incw	x
1368  0342               L24:
1369  0342 b71a          	ld	_tBC_Param+26,a
1370  0344 9f            	ld	a,xl
1371  0345 b719          	ld	_tBC_Param+25,a
1372  0347               L764:
1373                     ; 488 			FILTER_LP(tBC_Param.lDCbusVoltAcc, tBC_Param.usAD_DCbus, 4);
1375  0347 be19          	ldw	x,_tBC_Param+25
1376  0349 cd0000        	call	c_uitolx
1378  034c a610          	ld	a,#16
1379  034e cd0000        	call	c_llsh
1381  0351 ae001d        	ldw	x,#_tBC_Param+29
1382  0354 cd0000        	call	c_lsub
1384  0357 a604          	ld	a,#4
1385  0359 cd0000        	call	c_lrsh
1387  035c ae001d        	ldw	x,#_tBC_Param+29
1388  035f cd0000        	call	c_lgadd
1390                     ; 489 			tBC_Param.usDCbusVolt = tBC_Param.lDCbusVoltAcc>>16;
1393  0362 be1d          	ldw	x,_tBC_Param+29
1394  0364 bf1b          	ldw	_tBC_Param+27,x
1395                     ; 491 			if (tBC_Param.usDCbusVolt > 930)  // 410V 过压
1397  0366 be1b          	ldw	x,_tBC_Param+27
1398  0368 a303a3        	cpw	x,#931
1399  036b 2506          	jrult	L174
1400                     ; 493 				Error_code.bit.OverVoltage = 1;
1402  036d 72160000      	bset	_Error_code,#3
1404  0371 2018          	jra	L374
1405  0373               L174:
1406                     ; 495 			else if (tBC_Param.usDCbusVolt < 453)  // 200V 欠压 
1408  0373 be1b          	ldw	x,_tBC_Param+27
1409  0375 a301c5        	cpw	x,#453
1410  0378 2406          	jruge	L574
1411                     ; 497 				if (BldcStatus != STATUS_STOP)
1413  037a 3d08          	tnz	_tBC_Param+8
1414                     ; 501 				tBC_Param.ucPowerOn = 0;
1416  037c 3f2b          	clr	_tBC_Param+43
1418  037e 200b          	jra	L374
1419  0380               L574:
1420                     ; 503 			else if (tBC_Param.usDCbusVolt > 470)
1422  0380 be1b          	ldw	x,_tBC_Param+27
1423  0382 a301d7        	cpw	x,#471
1424  0385 2504          	jrult	L374
1425                     ; 505 				tBC_Param.ucPowerOn = 1;
1427  0387 3501002b      	mov	_tBC_Param+43,#1
1428  038b               L374:
1429                     ; 508 			Key_Check();
1431  038b cd0000        	call	_Key_Check
1434  038e 2087          	jra	L554
1435  0390               L564:
1436                     ; 512 			Led_Light();
1438  0390 cd0000        	call	_Led_Light
1440  0393 2082          	jra	L554
1475                     ; 526 void assert_failed(u8* file, u32 line)
1475                     ; 527 { 
1476                     	switch	.text
1477  0395               _assert_failed:
1481  0395               L525:
1482  0395 20fe          	jra	L525
1507                     	xdef	_main
1508                     	xdef	_bldc_open_loop
1509                     	xdef	_bldc_one_loop
1510                     	xdef	_delay_ms
1511                     	xdef	_init_timer2
1512                     	xdef	_get_adc
1513                     	xdef	_Init_ADC
1514                     	xdef	_Init_Io
1515                     	xdef	_Init_TIM4
1516                     	xdef	_Init_Timer1_PWM
1517                     	xdef	_Init_Clk
1518                     	switch	.ubsct
1519  0000               _adc_table:
1520  0000 000000000000  	ds.b	20
1521                     	xdef	_adc_table
1522                     	xdef	_delay_us
1523                     	xref	_BLDC_RUN_ONESTEP
1524                     	xref	_SpeedRefAccDec
1525                     	xref	_Key_Check
1526                     	xref	_Run_Ctl
1527                     	xref	_Led_Light
1528                     	xref	_Timer1_PWM_Value
1529                     	xref	_AdcSwitch
1530                     	xref.b	_Error_code
1531                     	xref.b	_tBC_Param
1532                     	xdef	_assert_failed
1552                     	xref	c_lgadd
1553                     	xref	c_lrsh
1554                     	xref	c_lsub
1555                     	xref	c_llsh
1556                     	xref	c_uitolx
1557                     	end
