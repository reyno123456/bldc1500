   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 45 void Init_Clk(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _Init_Clk:
  50                     ; 47   CLK->CKDIVR = 0x00;   	// 16M
  52  0000 725f50c6      	clr	20678
  53                     ; 48 }
  56  0004 81            	ret
  99                     ; 56 void Init_Timer1_PWM (uint16 Tcon,uint16 Pscr)
  99                     ; 57 {
 100                     	switch	.text
 101  0005               _Init_Timer1_PWM:
 103  0005 89            	pushw	x
 104       00000000      OFST:	set	0
 107                     ; 60 	TIM1->PSCRH = (Pscr >> 8) & 0xff ;
 109  0006 7b05          	ld	a,(OFST+5,sp)
 110  0008 c75260        	ld	21088,a
 111                     ; 61 	TIM1->PSCRL = Pscr & 0xff ;
 113  000b 7b06          	ld	a,(OFST+6,sp)
 114  000d a4ff          	and	a,#255
 115  000f c75261        	ld	21089,a
 116                     ; 64 	TIM1->ARRH = (Tcon >> 8) & 0xff ;
 118  0012 9e            	ld	a,xh
 119  0013 c75262        	ld	21090,a
 120                     ; 65 	TIM1->ARRL = Tcon & 0xff ;
 122  0016 9f            	ld	a,xl
 123  0017 a4ff          	and	a,#255
 124  0019 c75263        	ld	21091,a
 125                     ; 68 	TIM1->CCMR1 =0x6C ; 
 127  001c 356c5258      	mov	21080,#108
 128                     ; 70 	TIM1->CCMR2 =0x6C ; 
 130  0020 356c5259      	mov	21081,#108
 131                     ; 72 	TIM1->CCMR3 =0x6C ; 
 133  0024 356c525a      	mov	21082,#108
 134                     ; 74 	TIM1->CCMR4 =0x08 ; 
 136  0028 3508525b      	mov	21083,#8
 137                     ; 77 	TIM1->CCR1H = 0;
 139  002c 725f5265      	clr	21093
 140                     ; 78 	TIM1->CCR1L = 0;
 142  0030 725f5266      	clr	21094
 143                     ; 79 	TIM1->CCR2H = 0;
 145  0034 725f5267      	clr	21095
 146                     ; 80 	TIM1->CCR2L = 0;
 148  0038 725f5268      	clr	21096
 149                     ; 81 	TIM1->CCR3H = 0;
 151  003c 725f5269      	clr	21097
 152                     ; 82 	TIM1->CCR3L = 0;
 154  0040 725f526a      	clr	21098
 155                     ; 87 	PWM_AH_OUT_DIS();
 157  0044 7211525c      	bres	21084,#0
 158                     ; 88 	PWM_BH_OUT_DIS();
 160  0048 7219525c      	bres	21084,#4
 161                     ; 89 	PWM_CH_OUT_DIS();
 163  004c 7211525d      	bres	21085,#0
 164                     ; 91 	TIM1->EGR = BIT0 ; //UG = 1 ;初始化计数器 预装载载入影子寄存器中
 166  0050 35015257      	mov	21079,#1
 167                     ; 92 	TIM1->CNTRH = 0 ;   //计数器清0
 169  0054 725f525e      	clr	21086
 170                     ; 93 	TIM1->CNTRL = 0 ;
 172  0058 725f525f      	clr	21087
 173                     ; 94 	TIM1->CR1 |= TIM1_CR1_CEN;
 175  005c 72105250      	bset	21072,#0
 176                     ; 97 	TIM1->BKR = (TIM1_BREAKPOLARITY_LOW|TIM1_BREAK_ENABLE|TIM1_OSSISTATE_ENABLE|TIM1_LOCKLEVEL_2);
 178  0060 3516526d      	mov	21101,#22
 179                     ; 98 	TIM1->BKR |= TIM1_BKR_MOE;
 181  0064 721e526d      	bset	21101,#7
 182                     ; 102 }
 185  0068 85            	popw	x
 186  0069 81            	ret
 229                     ; 110 void Init_TIM4(uint8 Tcon,uint8 Pscr)
 229                     ; 111 {								
 230                     	switch	.text
 231  006a               _Init_TIM4:
 235                     ; 112 	TIM4->IER = 0x00 ;		// 禁止中断
 237  006a 725f5341      	clr	21313
 238                     ; 113 	TIM4->EGR = 0x01 ;		// 允许产生更新事件
 240  006e 35015343      	mov	21315,#1
 241                     ; 114 	TIM4->PSCR = Pscr ;		// 计数器时钟=16MHZ/16=1M
 243  0072 9f            	ld	a,xl
 244  0073 c75345        	ld	21317,a
 245                     ; 118 	TIM4->ARR = Tcon;			// 1U*20 = 20U   
 247  0076 9e            	ld	a,xh
 248  0077 c75346        	ld	21318,a
 249                     ; 119 	TIM4->CNTR = 0;				// 设定计数器的初值
 251  007a 725f5344      	clr	21316
 252                     ; 123 	TIM4->CR1 |= 0 ;
 254  007e c65340        	ld	a,21312
 255                     ; 126 	TIM4->IER |= 0x01;
 257  0081 72105341      	bset	21313,#0
 258                     ; 127 	TIM4->CR1 |= 0x01;
 260  0085 72105340      	bset	21312,#0
 261                     ; 128 }
 264  0089 81            	ret
 287                     ; 136 void Init_Io(void)
 287                     ; 137 {
 288                     	switch	.text
 289  008a               _Init_Io:
 293                     ; 138 	GPIOA->DDR = 0b11111111;
 295  008a 35ff5002      	mov	20482,#255
 296                     ; 139 	GPIOA->CR1 = 0xFF;
 298  008e 35ff5003      	mov	20483,#255
 299                     ; 140 	GPIOA->CR2 = 0;
 301  0092 725f5004      	clr	20484
 302                     ; 142 	GPIOB->DDR = 0b00000111;   // UL,VL,WL, ADC
 304  0096 35075007      	mov	20487,#7
 305                     ; 143 	GPIOB->CR1 = 0b00000111;
 307  009a 35075008      	mov	20488,#7
 308                     ; 144 	GPIOB->CR2 = 0;
 310  009e 725f5009      	clr	20489
 311                     ; 146 	GPIOC->DDR = 0b11111111;   // NULL,AH,BH,CH,NONE,SCK,MOSI,MISO
 313  00a2 35ff500c      	mov	20492,#255
 314                     ; 147 	GPIOC->CR1 = 0b11111111;
 316  00a6 35ff500d      	mov	20493,#255
 317                     ; 148 	GPIOC->CR2 = 0;
 319  00aa 725f500e      	clr	20494
 320                     ; 150 	GPIOD->DDR = 0b11111101;   // NONE,SWIM,LED-ERR,LED-RUN,T1,T2,T3,T4
 322  00ae 35fd5011      	mov	20497,#253
 323                     ; 151 	GPIOD->CR1 = 0b11111101;
 325  00b2 35fd5012      	mov	20498,#253
 326                     ; 152 	GPIOD->CR2 = 0;
 328  00b6 725f5013      	clr	20499
 329                     ; 154 	GPIOE->DDR = 0b11110101;  // NONE,RUN,PWM-EN,BKIN,NULL,RCK,NULL,NULL
 331  00ba 35f55016      	mov	20502,#245
 332                     ; 155 	GPIOE->CR1 = 0b11110111;
 334  00be 35f75017      	mov	20503,#247
 335                     ; 156 	GPIOE->CR2 = 0;
 337  00c2 725f5018      	clr	20504
 338                     ; 158 	PWM_OUT_DIS();
 340  00c6 72145014      	bset	20500,#2
 341                     ; 159 	CNT_AL_OUT_DIS();
 343  00ca 72105005      	bset	20485,#0
 344                     ; 160 	CNT_BL_OUT_DIS();
 346  00ce 72125005      	bset	20485,#1
 347                     ; 161 	CNT_CL_OUT_DIS();
 349  00d2 72145005      	bset	20485,#2
 350                     ; 163 	LED_ERROR_OFF();
 352  00d6 7214500f      	bset	20495,#2
 353                     ; 164 	LED_RUN_OFF();
 355  00da 7216500f      	bset	20495,#3
 356                     ; 165 }
 359  00de 81            	ret
 402                     ; 173 void Init_ADC( void )
 402                     ; 174 {
 403                     	switch	.text
 404  00df               _Init_ADC:
 406  00df 5203          	subw	sp,#3
 407       00000003      OFST:	set	3
 410                     ; 178 	ADC2->CR1 = 0;
 412  00e1 725f5401      	clr	21505
 413                     ; 181 	ADC2->CSR = PHASE_C_BEMF_ADC_CHAN;
 415  00e5 35035400      	mov	21504,#3
 416                     ; 183 	ADC_TDR_tmp = 0;
 418  00e9 5f            	clrw	x
 419  00ea 1f02          	ldw	(OFST-1,sp),x
 420                     ; 184 	ADC_TDR_tmp |= (u16)(1) << PHASE_A_BEMF_ADC_CHAN;
 422  00ec 7b03          	ld	a,(OFST+0,sp)
 423  00ee aa20          	or	a,#32
 424  00f0 6b03          	ld	(OFST+0,sp),a
 425                     ; 185 	ADC_TDR_tmp |= (u16)(1) << PHASE_B_BEMF_ADC_CHAN;
 427  00f2 7b03          	ld	a,(OFST+0,sp)
 428  00f4 aa10          	or	a,#16
 429  00f6 6b03          	ld	(OFST+0,sp),a
 430                     ; 186 	ADC_TDR_tmp |= (u16)(1) << PHASE_C_BEMF_ADC_CHAN;
 432  00f8 7b03          	ld	a,(OFST+0,sp)
 433  00fa aa08          	or	a,#8
 434  00fc 6b03          	ld	(OFST+0,sp),a
 435                     ; 187 	ADC_TDR_tmp |= (u16)(1) << ADC_CURRENT_CHANNEL;
 437  00fe 7b02          	ld	a,(OFST-1,sp)
 438  0100 aa02          	or	a,#2
 439  0102 6b02          	ld	(OFST-1,sp),a
 440                     ; 188 	ADC_TDR_tmp |= (u16)(1) << ADC_BUS_CHANNEL;
 442  0104 7b02          	ld	a,(OFST-1,sp)
 443  0106 aa01          	or	a,#1
 444  0108 6b02          	ld	(OFST-1,sp),a
 445                     ; 189 	ADC_TDR_tmp |= (u16)(1) << PHASE_REF_ADC_CHAN;
 447  010a 7b03          	ld	a,(OFST+0,sp)
 448  010c aa80          	or	a,#128
 449  010e 6b03          	ld	(OFST+0,sp),a
 450                     ; 190 	ADC_TDR_tmp |= (u16)(1) << PHASE_FED_ADC_CHAN;
 452  0110 7b03          	ld	a,(OFST+0,sp)
 453  0112 aa40          	or	a,#64
 454  0114 6b03          	ld	(OFST+0,sp),a
 455                     ; 192 	ToCMPxH( ADC2->TDRH, ADC_TDR_tmp);
 457  0116 35035406      	mov	21510,#3
 458                     ; 193 	ToCMPxL( ADC2->TDRL, ADC_TDR_tmp);
 460  011a 35f85407      	mov	21511,#248
 461                     ; 196 	ADC2->CR1 |= BIT0;
 463  011e 72105401      	bset	21505,#0
 464                     ; 198 	value=30;
 466  0122 a61e          	ld	a,#30
 467  0124 6b01          	ld	(OFST-2,sp),a
 469  0126               L321:
 470                     ; 199 	while(value--);                    
 472  0126 7b01          	ld	a,(OFST-2,sp)
 473  0128 0a01          	dec	(OFST-2,sp)
 474  012a 4d            	tnz	a
 475  012b 26f9          	jrne	L321
 476                     ; 201 	ADC2->CSR &= (u8)(~BIT7);
 478  012d 721f5400      	bres	21504,#7
 479                     ; 204 }
 482  0131 5b03          	addw	sp,#3
 483  0133 81            	ret
 486                     	bsct
 487  0000               L721_flag:
 488  0000 0000          	dc.w	0
 533                     ; 206 void main(void)
 533                     ; 207 {
 534                     	switch	.text
 535  0134               _main:
 539                     ; 209 	_asm("sim");
 542  0134 9b            sim
 544                     ; 211 	Init_Clk();
 546  0135 cd0000        	call	_Init_Clk
 548                     ; 212 	Init_Io();
 550  0138 cd008a        	call	_Init_Io
 552                     ; 213 	memset(&tBC_Param, 0, sizeof(tBC_Param));
 554  013b ae002e        	ldw	x,#46
 555  013e               L02:
 556  013e 6fff          	clr	(_tBC_Param-1,x)
 557  0140 5a            	decw	x
 558  0141 26fb          	jrne	L02
 559                     ; 214 	Init_Timer1_PWM(TIMER1_CNT, TIM1_DIV2);  // 8k
 561  0143 ae0001        	ldw	x,#1
 562  0146 89            	pushw	x
 563  0147 ae03e8        	ldw	x,#1000
 564  014a cd0005        	call	_Init_Timer1_PWM
 566  014d 85            	popw	x
 567                     ; 215 	Init_TIM4(20,TIM4_DIV16);
 569  014e ae0004        	ldw	x,#4
 570  0151 a614          	ld	a,#20
 571  0153 95            	ld	xh,a
 572  0154 cd006a        	call	_Init_TIM4
 574                     ; 216 	Init_ADC();
 576  0157 ad86          	call	_Init_ADC
 578                     ; 218 	_asm("rim");
 581  0159 9a            rim
 583  015a               L741:
 584                     ; 222 		if (tBC_Param.usTick1ms & 0x01)
 586  015a b618          	ld	a,_tBC_Param+24
 587  015c a501          	bcp	a,#1
 588  015e 2708          	jreq	L351
 589                     ; 224 			Run_Ctl();
 591  0160 cd0000        	call	_Run_Ctl
 593                     ; 225 			SpeedRefAccDec();
 595  0163 cd0000        	call	_SpeedRefAccDec
 598  0166 20f2          	jra	L741
 599  0168               L351:
 600                     ; 227 		else if (tBC_Param.usTick1ms & 0x02)
 602  0168 b618          	ld	a,_tBC_Param+24
 603  016a a502          	bcp	a,#2
 604  016c 2765          	jreq	L751
 605                     ; 229 			if (BldcStatus == STATUS_STOP)
 607  016e 3d08          	tnz	_tBC_Param+8
 608  0170 2618          	jrne	L161
 609                     ; 231 				AdcSwitch(ADC_BUS_CHANNEL);
 611  0172 a608          	ld	a,#8
 612  0174 cd0000        	call	_AdcSwitch
 614                     ; 232 				tBC_Param.usAD_DCbus = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
 616  0177 c65404        	ld	a,21508
 617  017a 5f            	clrw	x
 618  017b 97            	ld	xl,a
 619  017c 58            	sllw	x
 620  017d 58            	sllw	x
 621  017e 01            	rrwa	x,a
 622  017f cb5405        	add	a,21509
 623  0182 2401          	jrnc	L22
 624  0184 5c            	incw	x
 625  0185               L22:
 626  0185 b71a          	ld	_tBC_Param+26,a
 627  0187 9f            	ld	a,xl
 628  0188 b719          	ld	_tBC_Param+25,a
 629  018a               L161:
 630                     ; 234 			FILTER_LP(tBC_Param.lDCbusVoltAcc, tBC_Param.usAD_DCbus, 4);
 632  018a be19          	ldw	x,_tBC_Param+25
 633  018c cd0000        	call	c_uitolx
 635  018f a610          	ld	a,#16
 636  0191 cd0000        	call	c_llsh
 638  0194 ae001d        	ldw	x,#_tBC_Param+29
 639  0197 cd0000        	call	c_lsub
 641  019a a604          	ld	a,#4
 642  019c cd0000        	call	c_lrsh
 644  019f ae001d        	ldw	x,#_tBC_Param+29
 645  01a2 cd0000        	call	c_lgadd
 647                     ; 235 			tBC_Param.usDCbusVolt = tBC_Param.lDCbusVoltAcc>>16;
 650  01a5 be1d          	ldw	x,_tBC_Param+29
 651  01a7 bf1b          	ldw	_tBC_Param+27,x
 652                     ; 237 			if (tBC_Param.usDCbusVolt > 930)  // 410V 过压
 654  01a9 be1b          	ldw	x,_tBC_Param+27
 655  01ab a303a3        	cpw	x,#931
 656  01ae 2506          	jrult	L361
 657                     ; 239 				Error_code.bit.OverVoltage = 1;
 659  01b0 72160000      	bset	_Error_code,#3
 661  01b4 2018          	jra	L561
 662  01b6               L361:
 663                     ; 241 			else if (tBC_Param.usDCbusVolt < 453)  // 200V 欠压 
 665  01b6 be1b          	ldw	x,_tBC_Param+27
 666  01b8 a301c5        	cpw	x,#453
 667  01bb 2406          	jruge	L761
 668                     ; 243 				if (BldcStatus != STATUS_STOP)
 670  01bd 3d08          	tnz	_tBC_Param+8
 671                     ; 247 				tBC_Param.ucPowerOn = 0;
 673  01bf 3f2b          	clr	_tBC_Param+43
 675  01c1 200b          	jra	L561
 676  01c3               L761:
 677                     ; 249 			else if (tBC_Param.usDCbusVolt > 470)
 679  01c3 be1b          	ldw	x,_tBC_Param+27
 680  01c5 a301d7        	cpw	x,#471
 681  01c8 2504          	jrult	L561
 682                     ; 251 				tBC_Param.ucPowerOn = 1;
 684  01ca 3501002b      	mov	_tBC_Param+43,#1
 685  01ce               L561:
 686                     ; 254 			Key_Check();
 688  01ce cd0000        	call	_Key_Check
 691  01d1 2087          	jra	L741
 692  01d3               L751:
 693                     ; 258 			Led_Light();
 695  01d3 cd0000        	call	_Led_Light
 697  01d6 2082          	jra	L741
 732                     ; 272 void assert_failed(u8* file, u32 line)
 732                     ; 273 { 
 733                     	switch	.text
 734  01d8               _assert_failed:
 738  01d8               L712:
 739  01d8 20fe          	jra	L712
 752                     	xdef	_main
 753                     	xdef	_Init_ADC
 754                     	xdef	_Init_Io
 755                     	xdef	_Init_TIM4
 756                     	xdef	_Init_Timer1_PWM
 757                     	xdef	_Init_Clk
 758                     	xref	_SpeedRefAccDec
 759                     	xref	_Key_Check
 760                     	xref	_Run_Ctl
 761                     	xref	_Led_Light
 762                     	xref	_AdcSwitch
 763                     	xref.b	_Error_code
 764                     	xref.b	_tBC_Param
 765                     	xdef	_assert_failed
 784                     	xref	c_lgadd
 785                     	xref	c_lrsh
 786                     	xref	c_lsub
 787                     	xref	c_llsh
 788                     	xref	c_uitolx
 789                     	end
