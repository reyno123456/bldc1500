   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _KLST:
  17  0000 00            	dc.b	0
  18  0001               _KSTB:
  19  0001 00            	dc.b	0
  20  0002               _KSTBL:
  21  0002 00            	dc.b	0
  22                     .const:	section	.text
  23  0000               _Tab_StepFan:
  24  0000 02            	dc.b	2
  25  0001 03            	dc.b	3
  26  0002 04            	dc.b	4
  27  0003 05            	dc.b	5
  28  0004 06            	dc.b	6
  29  0005 01            	dc.b	1
  30  0006               _Tab_StepZen:
  31  0006 06            	dc.b	6
  32  0007 01            	dc.b	1
  33  0008 02            	dc.b	2
  34  0009 03            	dc.b	3
  35  000a 04            	dc.b	4
  36  000b 05            	dc.b	5
  37                     	bsct
  38  0003               _DISP_TAB:
  39  0003 3f            	dc.b	63
  40  0004 06            	dc.b	6
  41  0005 5b            	dc.b	91
  42  0006 4f            	dc.b	79
  43  0007 66            	dc.b	102
  44  0008 6d            	dc.b	109
  45  0009 7d            	dc.b	125
  46  000a 07            	dc.b	7
  47  000b 7f            	dc.b	127
  48  000c 6f            	dc.b	111
  88                     ; 36 void Nop(uint8 T_Dly)
  88                     ; 37 {	
  90                     	switch	.text
  91  0000               _Nop:
  93  0000 88            	push	a
  94       00000000      OFST:	set	0
  97  0001               L13:
  98                     ; 38 	while(T_Dly--);		
 100  0001 7b01          	ld	a,(OFST+1,sp)
 101  0003 0a01          	dec	(OFST+1,sp)
 102  0005 4d            	tnz	a
 103  0006 26f9          	jrne	L13
 104                     ; 39 	return ;
 107  0008 84            	pop	a
 108  0009 81            	ret
 111                     	bsct
 112  000d               L53_BitNo:
 113  000d 00            	dc.b	0
 168                     ; 43 void DISP_Display(void)
 168                     ; 44 {
 169                     	switch	.text
 170  000a               _DISP_Display:
 172  000a 5203          	subw	sp,#3
 173       00000003      OFST:	set	3
 176                     ; 50 	GPIO_WriteLow(GPIOE,GPIO_PIN_5);
 178  000c 4b20          	push	#32
 179  000e ae5014        	ldw	x,#20500
 180  0011 cd0000        	call	_GPIO_WriteLow
 182  0014 84            	pop	a
 183                     ; 52 	data = DISP_TAB[BitNo];
 185  0015 b60d          	ld	a,L53_BitNo
 186  0017 5f            	clrw	x
 187  0018 97            	ld	xl,a
 188  0019 e603          	ld	a,(_DISP_TAB,x)
 189                     ; 53 	usPos = (0x01<<BitNo);
 191  001b ae0001        	ldw	x,#1
 192  001e b60d          	ld	a,L53_BitNo
 193  0020 4d            	tnz	a
 194  0021 2704          	jreq	L01
 195  0023               L21:
 196  0023 58            	sllw	x
 197  0024 4a            	dec	a
 198  0025 26fc          	jrne	L21
 199  0027               L01:
 200  0027 1f02          	ldw	(OFST-1,sp),x
 202  0029               L17:
 203                     ; 55 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 205  0029 a602          	ld	a,#2
 206  002b cd0000        	call	_SPI_GetFlagStatus
 208  002e 4d            	tnz	a
 209  002f 27f8          	jreq	L17
 210                     ; 56 	SPI_SendData(usPos);
 212  0031 7b03          	ld	a,(OFST+0,sp)
 213  0033 cd0000        	call	_SPI_SendData
 216  0036               L77:
 217                     ; 57 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 219  0036 a602          	ld	a,#2
 220  0038 cd0000        	call	_SPI_GetFlagStatus
 222  003b 4d            	tnz	a
 223  003c 27f8          	jreq	L77
 224                     ; 58 	SPI_SendData(0xFF);
 226  003e a6ff          	ld	a,#255
 227  0040 cd0000        	call	_SPI_SendData
 230  0043               L501:
 231                     ; 59 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 233  0043 a602          	ld	a,#2
 234  0045 cd0000        	call	_SPI_GetFlagStatus
 236  0048 4d            	tnz	a
 237  0049 27f8          	jreq	L501
 238                     ; 61 	GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
 240  004b 4b20          	push	#32
 241  004d ae5014        	ldw	x,#20500
 242  0050 cd0000        	call	_GPIO_WriteHigh
 244  0053 84            	pop	a
 245                     ; 63 	BitNo++;
 247  0054 3c0d          	inc	L53_BitNo
 248                     ; 64 	if (BitNo > 3)
 250  0056 b60d          	ld	a,L53_BitNo
 251  0058 a104          	cp	a,#4
 252  005a 2502          	jrult	L111
 253                     ; 66 		BitNo = 0;
 255  005c 3f0d          	clr	L53_BitNo
 256  005e               L111:
 257                     ; 68 }
 260  005e 5b03          	addw	sp,#3
 261  0060 81            	ret
 284                     ; 73 void OffSixPin(void)
 284                     ; 74 {
 285                     	switch	.text
 286  0061               _OffSixPin:
 290                     ; 75 	CNT_AL_OUT_DIS();
 292  0061 72105005      	bset	20485,#0
 293                     ; 76 	CNT_BL_OUT_DIS();
 295  0065 72125005      	bset	20485,#1
 296                     ; 77 	CNT_CL_OUT_DIS();
 298  0069 72145005      	bset	20485,#2
 299                     ; 78 	PWM_AH_OUT_DIS();
 301  006d 7211525c      	bres	21084,#0
 302                     ; 79 	PWM_BH_OUT_DIS();
 304  0071 7219525c      	bres	21084,#4
 305                     ; 80 	PWM_CH_OUT_DIS();
 307  0075 7211525d      	bres	21085,#0
 308                     ; 82 }
 311  0079 81            	ret
 334                     ; 90 void BldcBak(void)
 334                     ; 91 {
 335                     	switch	.text
 336  007a               _BldcBak:
 340                     ; 92 	PWM_BH_OUT_DIS();
 342  007a 7219525c      	bres	21084,#4
 343                     ; 93 	PWM_BH_OUT_DIS();
 345  007e 7219525c      	bres	21084,#4
 346                     ; 94 	PWM_CH_OUT_DIS();
 348  0082 7211525d      	bres	21085,#0
 349                     ; 95 	CNT_AL_OUT_EN();
 351  0086 72115005      	bres	20485,#0
 352                     ; 96 	CNT_BL_OUT_EN();
 354  008a 72135005      	bres	20485,#1
 355                     ; 97 	CNT_CL_OUT_EN();									
 357  008e 72155005      	bres	20485,#2
 358                     ; 98 }
 361  0092 81            	ret
 395                     ; 101 void Timer1_CCR4_Value(uint16 InValue)
 395                     ; 102 {
 396                     	switch	.text
 397  0093               _Timer1_CCR4_Value:
 401                     ; 103 	ToCMPxH(TIM1->CCR4H,InValue);
 403  0093 9e            	ld	a,xh
 404  0094 c7526b        	ld	21099,a
 405                     ; 104 	ToCMPxL(TIM1->CCR4L,InValue);		
 407  0097 9f            	ld	a,xl
 408  0098 a4ff          	and	a,#255
 409  009a c7526c        	ld	21100,a
 410                     ; 105 }
 413  009d 81            	ret
 447                     ; 108 void Timer1_PWM_Value(uint16 OUT_PWM)
 447                     ; 109 {
 448                     	switch	.text
 449  009e               _Timer1_PWM_Value:
 451  009e 89            	pushw	x
 452       00000000      OFST:	set	0
 455                     ; 110 	ToCMPxH(TIM1->CCR1H,OUT_PWM);
 457  009f 9e            	ld	a,xh
 458  00a0 c75265        	ld	21093,a
 459                     ; 111 	ToCMPxL(TIM1->CCR1L,OUT_PWM);
 461  00a3 9f            	ld	a,xl
 462  00a4 a4ff          	and	a,#255
 463  00a6 c75266        	ld	21094,a
 464                     ; 112 	ToCMPxH(TIM1->CCR2H,OUT_PWM);
 466  00a9 7b01          	ld	a,(OFST+1,sp)
 467  00ab c75267        	ld	21095,a
 468                     ; 113 	ToCMPxL(TIM1->CCR2L,OUT_PWM);
 470  00ae 7b02          	ld	a,(OFST+2,sp)
 471  00b0 a4ff          	and	a,#255
 472  00b2 c75268        	ld	21096,a
 473                     ; 114 	ToCMPxH(TIM1->CCR3H,OUT_PWM);
 475  00b5 7b01          	ld	a,(OFST+1,sp)
 476  00b7 c75269        	ld	21097,a
 477                     ; 115 	ToCMPxL(TIM1->CCR3L,OUT_PWM);
 479  00ba 7b02          	ld	a,(OFST+2,sp)
 480  00bc a4ff          	and	a,#255
 481  00be c7526a        	ld	21098,a
 482                     ; 116 }
 485  00c1 85            	popw	x
 486  00c2 81            	ret
 513                     ; 121 void Key_Check(void)
 513                     ; 122 {
 514                     	switch	.text
 515  00c3               _Key_Check:
 519                     ; 123 	Direction = ZEN;
 521  00c3 35020014      	mov	_tBC_Param+19,#2
 522                     ; 125 	tBC_Param.R_Err = Error_code.all;
 524  00c7 450029        	mov	_tBC_Param+40,_Error_code
 525                     ; 128 	if (GPIOE->IDR & GPIO_PIN_1)
 527  00ca c65015        	ld	a,20501
 528  00cd a502          	bcp	a,#2
 529  00cf 2706          	jreq	L771
 530                     ; 130 		tBC_Param.ucCmdKey = 1;
 532  00d1 3501002a      	mov	_tBC_Param+41,#1
 534  00d5 2002          	jra	L102
 535  00d7               L771:
 536                     ; 134 		tBC_Param.ucCmdKey = 0;
 538  00d7 3f2a          	clr	_tBC_Param+41
 539  00d9               L102:
 540                     ; 137 	if(tBC_Param.ucCmdKey != KSTB) 	//第一次按下
 542  00d9 b62a          	ld	a,_tBC_Param+41
 543  00db b101          	cp	a,_KSTB
 544  00dd 270f          	jreq	L302
 545                     ; 139 		if (KSTBL++>20)
 547  00df b602          	ld	a,_KSTBL
 548  00e1 3c02          	inc	_KSTBL
 549  00e3 a115          	cp	a,#21
 550  00e5 2509          	jrult	L702
 551                     ; 141 			KSTB = tBC_Param.ucCmdKey;
 553  00e7 452a01        	mov	_KSTB,_tBC_Param+41
 554                     ; 142 			KSTBL = 0;
 556  00ea 3f02          	clr	_KSTBL
 557  00ec 2002          	jra	L702
 558  00ee               L302:
 559                     ; 147 		KSTBL = 0;
 561  00ee 3f02          	clr	_KSTBL
 562  00f0               L702:
 563                     ; 150 	if ((KSTB == 1) && (tBC_Param.ucRunProtect == 0))  //开关按下
 565  00f0 b601          	ld	a,_KSTB
 566  00f2 a101          	cp	a,#1
 567  00f4 260a          	jrne	L112
 569  00f6 3d28          	tnz	_tBC_Param+39
 570  00f8 2606          	jrne	L112
 571                     ; 152 		tBC_Param.RunCmd = 1;
 573  00fa 35010015      	mov	_tBC_Param+20,#1
 575  00fe 2002          	jra	L312
 576  0100               L112:
 577                     ; 156 		tBC_Param.RunCmd = 0;
 579  0100 3f15          	clr	_tBC_Param+20
 580  0102               L312:
 581                     ; 159 	if (tBC_Param.ucRunProtect)
 583  0102 3d28          	tnz	_tBC_Param+39
 584  0104 2708          	jreq	L512
 585                     ; 161 		if (KSTB == 0)
 587  0106 3d01          	tnz	_KSTB
 588  0108 2610          	jrne	L122
 589                     ; 163 			tBC_Param.ucRunProtect = 0;
 591  010a 3f28          	clr	_tBC_Param+39
 592  010c 200c          	jra	L122
 593  010e               L512:
 594                     ; 168 		if ((KSTB) && (tBC_Param.R_Err))
 596  010e 3d01          	tnz	_KSTB
 597  0110 2708          	jreq	L122
 599  0112 3d29          	tnz	_tBC_Param+40
 600  0114 2704          	jreq	L122
 601                     ; 170 			tBC_Param.ucRunProtect = 1;
 603  0116 35010028      	mov	_tBC_Param+39,#1
 604  011a               L122:
 605                     ; 173 }
 608  011a 81            	ret
 632                     ; 175 void SpeedRefAccDec(void)
 632                     ; 176 {
 633                     	switch	.text
 634  011b               _SpeedRefAccDec:
 638                     ; 177 	tBC_Param.R_VRAD = 100;   // debug_winson
 640  011b ae0064        	ldw	x,#100
 641  011e bf22          	ldw	_tBC_Param+33,x
 642                     ; 189 		R_SetPwm = tBC_Param.R_VRAD ;
 644  0120 ae0064        	ldw	x,#100
 645  0123 bf01          	ldw	_tBC_Param,x
 646                     ; 191 }
 649  0125 81            	ret
 674                     ; 197 void CmdPwmSlow(void)
 674                     ; 198 {
 675                     	switch	.text
 676  0126               _CmdPwmSlow:
 680                     ; 199 	if (BldcStatus > STATUS_START)
 682  0126 b609          	ld	a,_tBC_Param+8
 683  0128 a102          	cp	a,#2
 684  012a 2522          	jrult	L542
 685                     ; 201 		if (R_SetPwm == R_CurPwm) // tBC_Param.R_VRAD
 687  012c be01          	ldw	x,_tBC_Param
 688  012e b303          	cpw	x,_tBC_Param+2
 689  0130 2601          	jrne	L742
 690                     ; 203 			return ;
 693  0132 81            	ret
 694  0133               L742:
 695                     ; 205 		else if (R_SetPwm < R_CurPwm)
 697  0133 be01          	ldw	x,_tBC_Param
 698  0135 b303          	cpw	x,_tBC_Param+2
 699  0137 2409          	jruge	L352
 700                     ; 207 			R_CurPwm--;
 702  0139 be03          	ldw	x,_tBC_Param+2
 703  013b 1d0001        	subw	x,#1
 704  013e bf03          	ldw	_tBC_Param+2,x
 706  0140 2007          	jra	L152
 707  0142               L352:
 708                     ; 211 			R_CurPwm ++;
 710  0142 be03          	ldw	x,_tBC_Param+2
 711  0144 1c0001        	addw	x,#1
 712  0147 bf03          	ldw	_tBC_Param+2,x
 713  0149               L152:
 714                     ; 214 		Timer1_PWM_Value(R_CurPwm);
 716  0149 be03          	ldw	x,_tBC_Param+2
 717  014b cd009e        	call	_Timer1_PWM_Value
 719  014e               L542:
 720                     ; 216 }
 723  014e 81            	ret
 726                     	bsct
 727  000e               L752_usChargeCnt:
 728  000e 0000          	dc.w	0
 765                     ; 223 void Run_Ctl(void)
 765                     ; 224 {
 766                     	switch	.text
 767  014f               _Run_Ctl:
 771                     ; 227 	switch (tBC_Param.ucState)
 773  014f b627          	ld	a,_tBC_Param+38
 775                     ; 294 	default:
 775                     ; 295 		break;
 776  0151 4d            	tnz	a
 777  0152 270d          	jreq	L162
 778  0154 4a            	dec	a
 779  0155 274d          	jreq	L362
 780  0157 4a            	dec	a
 781  0158 2603          	jrne	L43
 782  015a cc0204        	jp	L562
 783  015d               L43:
 784  015d ac0a020a      	jpf	L113
 785  0161               L162:
 786                     ; 229 	case 0:
 786                     ; 230 		if (tBC_Param.RunCmd == 1)
 788  0161 b615          	ld	a,_tBC_Param+20
 789  0163 a101          	cp	a,#1
 790  0165 2616          	jrne	L313
 791                     ; 232 			tBC_Param.R_Mode = MODE_ON;
 793  0167 35010026      	mov	_tBC_Param+37,#1
 794                     ; 233 			PWM_OUT_EN();
 796  016b 72155014      	bres	20500,#2
 797                     ; 234 			TEST1_ON();
 799  016f 7219500f      	bres	20495,#4
 800                     ; 235 			tBC_Param.ucState = 1;
 802  0173 35010027      	mov	_tBC_Param+38,#1
 803                     ; 236 			usChargeCnt = 0;
 805  0177 5f            	clrw	x
 806  0178 bf0e          	ldw	L752_usChargeCnt,x
 808  017a cc020a        	jra	L113
 809  017d               L313:
 810                     ; 240 			TIM1_BREAK_DIS();      // Break input (BKIN) disabled
 812  017d 7219526d      	bres	21101,#4
 813                     ; 241 			TIM1_BREAK_IER_DIS();
 815  0181 721f5254      	bres	21076,#7
 816                     ; 242 			TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
 818  0185 721f526d      	bres	21101,#7
 819                     ; 243 			OffSixPin();
 821  0189 cd0061        	call	_OffSixPin
 823                     ; 244 			tBC_Param.R_Mode = MODE_OFF;
 825  018c 3f26          	clr	_tBC_Param+37
 826                     ; 245 			BldcStatus = STATUS_STOP;
 828  018e 3f09          	clr	_tBC_Param+8
 829                     ; 246 			TIM1_CMP4_IEN_DIS();   // CC4 interrupt disabled
 831  0190 72195254      	bres	21076,#4
 832                     ; 247 			Timer1_PWM_Value(0);
 834  0194 5f            	clrw	x
 835  0195 cd009e        	call	_Timer1_PWM_Value
 837                     ; 248 			PWM_OUT_DIS();
 839  0198 72145014      	bset	20500,#2
 840                     ; 249 			TEST1_OFF();
 842  019c 7218500f      	bset	20495,#4
 843                     ; 251 			Error_code.all = 0;  // debug_winson
 845  01a0 3f00          	clr	_Error_code
 846  01a2 2066          	jra	L113
 847  01a4               L362:
 848                     ; 255 	case 1:
 848                     ; 256 		if (usChargeCnt++ < 20)
 850  01a4 be0e          	ldw	x,L752_usChargeCnt
 851  01a6 1c0001        	addw	x,#1
 852  01a9 bf0e          	ldw	L752_usChargeCnt,x
 853  01ab 1d0001        	subw	x,#1
 854  01ae a30014        	cpw	x,#20
 855  01b1 240e          	jruge	L713
 856                     ; 258 			CNT_AL_OUT_EN();
 858  01b3 72115005      	bres	20485,#0
 859                     ; 259 			CNT_BL_OUT_EN();
 861  01b7 72135005      	bres	20485,#1
 862                     ; 260 			CNT_CL_OUT_EN();
 864  01bb 72155005      	bres	20485,#2
 866  01bf 2049          	jra	L113
 867  01c1               L713:
 868                     ; 264 			usChargeCnt = 0;
 870  01c1 5f            	clrw	x
 871  01c2 bf0e          	ldw	L752_usChargeCnt,x
 872                     ; 265 			CNT_AL_OUT_DIS();
 874  01c4 72105005      	bset	20485,#0
 875                     ; 266 			CNT_BL_OUT_DIS();
 877  01c8 72125005      	bset	20485,#1
 878                     ; 267 			CNT_CL_OUT_DIS();
 880  01cc 72145005      	bset	20485,#2
 881                     ; 269 			TIM1_BREAK_ENB();
 883  01d0 7218526d      	bset	21101,#4
 884                     ; 270 			TIM1->SR1 &= (u8)(~BIT7);
 886  01d4 721f5255      	bres	21077,#7
 887                     ; 271 			TIM1_BREAK_IER_ENB();
 889  01d8 721e5254      	bset	21076,#7
 890                     ; 272 			TIM1->BKR |= TIM1_BKR_MOE;
 892  01dc 721e526d      	bset	21101,#7
 893                     ; 273 			Timer1_CCR4_Value(1);
 895  01e0 ae0001        	ldw	x,#1
 896  01e3 cd0093        	call	_Timer1_CCR4_Value
 898                     ; 276 			R_CurPwm = V_PWMSTART;			//当前值					
 900  01e6 ae000f        	ldw	x,#15
 901  01e9 bf03          	ldw	_tBC_Param+2,x
 902                     ; 277 			R_SetPwm= V_PWMRUN_MIN ;		//设定值	
 904  01eb ae0014        	ldw	x,#20
 905  01ee bf01          	ldw	_tBC_Param,x
 906                     ; 278 			tBC_Param.StartStep = 0 ;//正常启动
 908  01f0 5f            	clrw	x
 909  01f1 bf12          	ldw	_tBC_Param+17,x
 910                     ; 279 			BldcStep = V_BLDC_DING ;
 912  01f3 3501000a      	mov	_tBC_Param+9,#1
 913                     ; 280 			T_Dly60C = 0;
 915  01f7 5f            	clrw	x
 916  01f8 bf05          	ldw	_tBC_Param+4,x
 917                     ; 281 			BldcStatus = STATUS_START ;  //启动
 919  01fa 35010009      	mov	_tBC_Param+8,#1
 920                     ; 283 			tBC_Param.ucState = 2;
 922  01fe 35020027      	mov	_tBC_Param+38,#2
 923  0202 2006          	jra	L113
 924  0204               L562:
 925                     ; 287 	case 2:
 925                     ; 288 		if (tBC_Param.RunCmd == 0)
 927  0204 3d15          	tnz	_tBC_Param+20
 928  0206 2602          	jrne	L113
 929                     ; 290 			tBC_Param.ucState = 0;
 931  0208 3f27          	clr	_tBC_Param+38
 932  020a               L762:
 933                     ; 294 	default:
 933                     ; 295 		break;
 935  020a               L113:
 936                     ; 297 }
 939  020a 81            	ret
 963                     ; 299 void Led_Light(void)
 963                     ; 300 {
 964                     	switch	.text
 965  020b               _Led_Light:
 969                     ; 301 	if (BldcStatus == STATUS_STOP)
 971  020b 3d09          	tnz	_tBC_Param+8
 972  020d 2606          	jrne	L533
 973                     ; 303 		LED_RUN_OFF();
 975  020f 7216500f      	bset	20495,#3
 977  0213 2004          	jra	L733
 978  0215               L533:
 979                     ; 307 		LED_RUN_ON();
 981  0215 7217500f      	bres	20495,#3
 982  0219               L733:
 983                     ; 310 	if (tBC_Param.R_Err)
 985  0219 3d29          	tnz	_tBC_Param+40
 986  021b 2706          	jreq	L143
 987                     ; 312 		LED_ERROR_ON();
 989  021d 7215500f      	bres	20495,#2
 991  0221 2004          	jra	L343
 992  0223               L143:
 993                     ; 316 		LED_ERROR_OFF();
 995  0223 7214500f      	bset	20495,#2
 996  0227               L343:
 997                     ; 318 }
1000  0227 81            	ret
1034                     ; 326 void AdcSwitch(uint8 Chanel)
1034                     ; 327 {
1035                     	switch	.text
1036  0228               _AdcSwitch:
1040                     ; 328 	ADC2->CSR = Chanel;	//选择转换通道	
1042  0228 c75400        	ld	21504,a
1043                     ; 329 	ADC2->CR1 |= 0x01 ;		// 启动ADC
1045  022b 72105401      	bset	21505,#0
1047  022f               L563:
1048                     ; 331 	while(!(ADC2->CSR & BIT7));	//等待转换
1050  022f c65400        	ld	a,21504
1051  0232 a580          	bcp	a,#128
1052  0234 27f9          	jreq	L563
1053                     ; 332 	ADC2->CSR &= 0x7f;
1055  0236 721f5400      	bres	21504,#7
1056                     ; 333 }
1059  023a 81            	ret
1095                     ; 337 void Check_BEMF_Voltage(void)
1095                     ; 338 {	
1096                     	switch	.text
1097  023b               _Check_BEMF_Voltage:
1099  023b 89            	pushw	x
1100       00000002      OFST:	set	2
1103                     ; 339 	uint16 Value=0 ;
1105                     ; 342 	switch(BldcStep)
1107  023c b60a          	ld	a,_tBC_Param+9
1109                     ; 364 			break ;
1110  023e 4a            	dec	a
1111  023f 2714          	jreq	L173
1112  0241 4a            	dec	a
1113  0242 2729          	jreq	L373
1114  0244 4a            	dec	a
1115  0245 273e          	jreq	L573
1116  0247 4a            	dec	a
1117  0248 270b          	jreq	L173
1118  024a 4a            	dec	a
1119  024b 2720          	jreq	L373
1120  024d 4a            	dec	a
1121  024e 2735          	jreq	L573
1122  0250               L773:
1123                     ; 362 		default : 
1123                     ; 363 			Value = 0 ;
1125  0250 5f            	clrw	x
1126  0251 1f01          	ldw	(OFST-1,sp),x
1127                     ; 364 			break ;
1129  0253 2046          	jra	L124
1130  0255               L173:
1131                     ; 344 		case 1 : //AB  取 读C点W
1131                     ; 345 		case 4 :
1131                     ; 346 			AdcSwitch(PHASE_C_BEMF_ADC_CHAN);
1133  0255 a603          	ld	a,#3
1134  0257 adcf          	call	_AdcSwitch
1136                     ; 347 			Value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1138  0259 c65404        	ld	a,21508
1139  025c 5f            	clrw	x
1140  025d 97            	ld	xl,a
1141  025e 58            	sllw	x
1142  025f 58            	sllw	x
1143  0260 01            	rrwa	x,a
1144  0261 cb5405        	add	a,21509
1145  0264 2401          	jrnc	L44
1146  0266 5c            	incw	x
1147  0267               L44:
1148  0267 02            	rlwa	x,a
1149  0268 1f01          	ldw	(OFST-1,sp),x
1150  026a 01            	rrwa	x,a
1151                     ; 348 			break ;
1153  026b 202e          	jra	L124
1154  026d               L373:
1155                     ; 350 		case 2 : //AC 通  取B点 
1155                     ; 351 		case 5 :
1155                     ; 352 			AdcSwitch(PHASE_B_BEMF_ADC_CHAN);
1157  026d a604          	ld	a,#4
1158  026f adb7          	call	_AdcSwitch
1160                     ; 353 			Value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1162  0271 c65404        	ld	a,21508
1163  0274 5f            	clrw	x
1164  0275 97            	ld	xl,a
1165  0276 58            	sllw	x
1166  0277 58            	sllw	x
1167  0278 01            	rrwa	x,a
1168  0279 cb5405        	add	a,21509
1169  027c 2401          	jrnc	L64
1170  027e 5c            	incw	x
1171  027f               L64:
1172  027f 02            	rlwa	x,a
1173  0280 1f01          	ldw	(OFST-1,sp),x
1174  0282 01            	rrwa	x,a
1175                     ; 354 			break ;	
1177  0283 2016          	jra	L124
1178  0285               L573:
1179                     ; 356 		case 3 : //BC  取 读A点 
1179                     ; 357 		case 6 :
1179                     ; 358 			AdcSwitch(PHASE_A_BEMF_ADC_CHAN);
1181  0285 a605          	ld	a,#5
1182  0287 ad9f          	call	_AdcSwitch
1184                     ; 359 			Value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1186  0289 c65404        	ld	a,21508
1187  028c 5f            	clrw	x
1188  028d 97            	ld	xl,a
1189  028e 58            	sllw	x
1190  028f 58            	sllw	x
1191  0290 01            	rrwa	x,a
1192  0291 cb5405        	add	a,21509
1193  0294 2401          	jrnc	L05
1194  0296 5c            	incw	x
1195  0297               L05:
1196  0297 02            	rlwa	x,a
1197  0298 1f01          	ldw	(OFST-1,sp),x
1198  029a 01            	rrwa	x,a
1199                     ; 360 			break ;
1201  029b               L124:
1202                     ; 367 	VoCple = Value ;
1204  029b 1e01          	ldw	x,(OFST-1,sp)
1205  029d bf0e          	ldw	_tBC_Param+13,x
1206                     ; 369 	AdcSwitch(ADC_BUS_CHANNEL);// DC BUS 电压
1208  029f a608          	ld	a,#8
1209  02a1 ad85          	call	_AdcSwitch
1211                     ; 370 	tBC_Param.usAD_DCbus = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1213  02a3 c65404        	ld	a,21508
1214  02a6 5f            	clrw	x
1215  02a7 97            	ld	xl,a
1216  02a8 58            	sllw	x
1217  02a9 58            	sllw	x
1218  02aa 01            	rrwa	x,a
1219  02ab cb5405        	add	a,21509
1220  02ae 2401          	jrnc	L25
1221  02b0 5c            	incw	x
1222  02b1               L25:
1223  02b1 b71b          	ld	_tBC_Param+26,a
1224  02b3 9f            	ld	a,xl
1225  02b4 b71a          	ld	_tBC_Param+25,a
1226                     ; 371 	M_VoCple = tBC_Param.usAD_DCbus>>1;
1228  02b6 be1a          	ldw	x,_tBC_Param+25
1229  02b8 54            	srlw	x
1230  02b9 bf10          	ldw	_tBC_Param+15,x
1231                     ; 372 }
1234  02bb 85            	popw	x
1235  02bc 81            	ret
1272                     ; 375 uint8 TstAndSwit(void)
1272                     ; 376 {	
1273                     	switch	.text
1274  02bd               _TstAndSwit:
1276  02bd 88            	push	a
1277       00000001      OFST:	set	1
1280                     ; 377 	uint8 F_OK = 0 ;
1282  02be 0f01          	clr	(OFST+0,sp)
1283                     ; 396 	if(Direction == FAN)  //反转
1285  02c0 b614          	ld	a,_tBC_Param+19
1286  02c2 a101          	cp	a,#1
1287  02c4 2703cc0348    	jrne	L574
1288                     ; 398 		switch(BldcStep)
1290  02c9 b60a          	ld	a,_tBC_Param+9
1292                     ; 442 			default : 
1292                     ; 443 				break ;
1293  02cb 4a            	dec	a
1294  02cc 2713          	jreq	L324
1295  02ce 4a            	dec	a
1296  02cf 2721          	jreq	L524
1297  02d1 4a            	dec	a
1298  02d2 272f          	jreq	L724
1299  02d4 4a            	dec	a
1300  02d5 273d          	jreq	L134
1301  02d7 4a            	dec	a
1302  02d8 274b          	jreq	L334
1303  02da 4a            	dec	a
1304  02db 2759          	jreq	L534
1305  02dd acbc03bc      	jpf	L715
1306  02e1               L324:
1307                     ; 400 			case 1 : //AB   C DOWN
1307                     ; 401 				if(VoCple < M_VoCple)
1309  02e1 be0e          	ldw	x,_tBC_Param+13
1310  02e3 b310          	cpw	x,_tBC_Param+15
1311  02e5 2503          	jrult	L65
1312  02e7 cc03bc        	jp	L715
1313  02ea               L65:
1314                     ; 403 					F_OK = 1 ;
1316  02ea a601          	ld	a,#1
1317  02ec 6b01          	ld	(OFST+0,sp),a
1318  02ee acbc03bc      	jpf	L715
1319  02f2               L524:
1320                     ; 407 			case 2 : //AC   B UP
1320                     ; 408 				if(VoCple > M_VoCple)
1322  02f2 be0e          	ldw	x,_tBC_Param+13
1323  02f4 b310          	cpw	x,_tBC_Param+15
1324  02f6 2203          	jrugt	L06
1325  02f8 cc03bc        	jp	L715
1326  02fb               L06:
1327                     ; 410 					F_OK = 1 ;
1329  02fb a601          	ld	a,#1
1330  02fd 6b01          	ld	(OFST+0,sp),a
1331  02ff acbc03bc      	jpf	L715
1332  0303               L724:
1333                     ; 414 			case 3 : //BC   A DOWN
1333                     ; 415 				if(VoCple < M_VoCple)
1335  0303 be0e          	ldw	x,_tBC_Param+13
1336  0305 b310          	cpw	x,_tBC_Param+15
1337  0307 2503          	jrult	L26
1338  0309 cc03bc        	jp	L715
1339  030c               L26:
1340                     ; 417 					F_OK = 1 ;
1342  030c a601          	ld	a,#1
1343  030e 6b01          	ld	(OFST+0,sp),a
1344  0310 acbc03bc      	jpf	L715
1345  0314               L134:
1346                     ; 421 			case 4 : //BA   C UP	
1346                     ; 422 				if(VoCple > M_VoCple)
1348  0314 be0e          	ldw	x,_tBC_Param+13
1349  0316 b310          	cpw	x,_tBC_Param+15
1350  0318 2203          	jrugt	L46
1351  031a cc03bc        	jp	L715
1352  031d               L46:
1353                     ; 424 					F_OK = 1 ;
1355  031d a601          	ld	a,#1
1356  031f 6b01          	ld	(OFST+0,sp),a
1357  0321 acbc03bc      	jpf	L715
1358  0325               L334:
1359                     ; 428 			case 5 ://CA  B DWON 		
1359                     ; 429 				if(VoCple < M_VoCple)
1361  0325 be0e          	ldw	x,_tBC_Param+13
1362  0327 b310          	cpw	x,_tBC_Param+15
1363  0329 2503          	jrult	L66
1364  032b cc03bc        	jp	L715
1365  032e               L66:
1366                     ; 431 					F_OK = 1 ;				
1368  032e a601          	ld	a,#1
1369  0330 6b01          	ld	(OFST+0,sp),a
1370  0332 acbc03bc      	jpf	L715
1371  0336               L534:
1372                     ; 435 			case 6 ://CB  A UP
1372                     ; 436 				if(VoCple > M_VoCple)
1374  0336 be0e          	ldw	x,_tBC_Param+13
1375  0338 b310          	cpw	x,_tBC_Param+15
1376  033a 2202          	jrugt	L07
1377  033c 207e          	jp	L715
1378  033e               L07:
1379                     ; 438 					F_OK = 1 ;
1381  033e a601          	ld	a,#1
1382  0340 6b01          	ld	(OFST+0,sp),a
1383  0342 2078          	jra	L715
1384  0344               L734:
1385                     ; 442 			default : 
1385                     ; 443 				break ;
1387  0344 2076          	jra	L715
1388  0346               L105:
1390  0346 2074          	jra	L715
1391  0348               L574:
1392                     ; 448 		switch(BldcStep)
1394  0348 b60a          	ld	a,_tBC_Param+9
1396                     ; 504 			default : 
1396                     ; 505 				break ;
1397  034a 4a            	dec	a
1398  034b 2711          	jreq	L144
1399  034d 4a            	dec	a
1400  034e 2722          	jreq	L344
1401  0350 4a            	dec	a
1402  0351 272b          	jreq	L544
1403  0353 4a            	dec	a
1404  0354 273c          	jreq	L744
1405  0356 4a            	dec	a
1406  0357 2745          	jreq	L154
1407  0359 4a            	dec	a
1408  035a 2756          	jreq	L354
1409  035c 205e          	jra	L715
1410  035e               L144:
1411                     ; 450 			case 1 : //AB   C UP
1411                     ; 451 				if(VoCple > M_VoCple)
1413  035e be0e          	ldw	x,_tBC_Param+13
1414  0360 b310          	cpw	x,_tBC_Param+15
1415  0362 2358          	jrule	L715
1416                     ; 453 					F_OK = 1 ;
1418  0364 a601          	ld	a,#1
1419  0366 6b01          	ld	(OFST+0,sp),a
1420                     ; 454 					if ( BldcStatus == STATUS_START)
1422  0368 b609          	ld	a,_tBC_Param+8
1423  036a a101          	cp	a,#1
1424  036c 264e          	jrne	L715
1425                     ; 456 						F_OK = 0;
1427  036e 0f01          	clr	(OFST+0,sp)
1428  0370 204a          	jra	L715
1429  0372               L344:
1430                     ; 461 			case 2 : //AC   B DOWN
1430                     ; 462 				if(VoCple < M_VoCple)
1432  0372 be0e          	ldw	x,_tBC_Param+13
1433  0374 b310          	cpw	x,_tBC_Param+15
1434  0376 2444          	jruge	L715
1435                     ; 464 					F_OK = 1 ;						
1437  0378 a601          	ld	a,#1
1438  037a 6b01          	ld	(OFST+0,sp),a
1439  037c 203e          	jra	L715
1440  037e               L544:
1441                     ; 468 			case 3 : //BC   A UP
1441                     ; 469 				if(VoCple > M_VoCple)
1443  037e be0e          	ldw	x,_tBC_Param+13
1444  0380 b310          	cpw	x,_tBC_Param+15
1445  0382 2338          	jrule	L715
1446                     ; 471 					F_OK = 1 ;
1448  0384 a601          	ld	a,#1
1449  0386 6b01          	ld	(OFST+0,sp),a
1450                     ; 472 					if ( BldcStatus == STATUS_START)
1452  0388 b609          	ld	a,_tBC_Param+8
1453  038a a101          	cp	a,#1
1454  038c 262e          	jrne	L715
1455                     ; 474 						F_OK = 0;
1457  038e 0f01          	clr	(OFST+0,sp)
1458  0390 202a          	jra	L715
1459  0392               L744:
1460                     ; 479 			case 4 : //BA   C DOWN	
1460                     ; 480 				if(VoCple < M_VoCple)
1462  0392 be0e          	ldw	x,_tBC_Param+13
1463  0394 b310          	cpw	x,_tBC_Param+15
1464  0396 2424          	jruge	L715
1465                     ; 482 					F_OK = 1 ;
1467  0398 a601          	ld	a,#1
1468  039a 6b01          	ld	(OFST+0,sp),a
1469  039c 201e          	jra	L715
1470  039e               L154:
1471                     ; 486 			case 5 ://CA  B UP
1471                     ; 487 				if(VoCple > M_VoCple)
1473  039e be0e          	ldw	x,_tBC_Param+13
1474  03a0 b310          	cpw	x,_tBC_Param+15
1475  03a2 2318          	jrule	L715
1476                     ; 489 					F_OK = 1 ;
1478  03a4 a601          	ld	a,#1
1479  03a6 6b01          	ld	(OFST+0,sp),a
1480                     ; 490 					if ( BldcStatus == STATUS_START)
1482  03a8 b609          	ld	a,_tBC_Param+8
1483  03aa a101          	cp	a,#1
1484  03ac 260e          	jrne	L715
1485                     ; 492 						F_OK = 0;
1487  03ae 0f01          	clr	(OFST+0,sp)
1488  03b0 200a          	jra	L715
1489  03b2               L354:
1490                     ; 497 			case 6 ://CB  A DOWN
1490                     ; 498 				if(VoCple < M_VoCple)
1492  03b2 be0e          	ldw	x,_tBC_Param+13
1493  03b4 b310          	cpw	x,_tBC_Param+15
1494  03b6 2404          	jruge	L715
1495                     ; 500 					F_OK = 1 ;
1497  03b8 a601          	ld	a,#1
1498  03ba 6b01          	ld	(OFST+0,sp),a
1499  03bc               L554:
1500                     ; 504 			default : 
1500                     ; 505 				break ;
1502  03bc               L325:
1503  03bc               L715:
1504                     ; 510 	if(F_OK)
1506  03bc 0d01          	tnz	(OFST+0,sp)
1507  03be 2728          	jreq	L745
1508                     ; 512 		if (tBC_Param.ucZeroCrossFlag)
1510  03c0 3d2b          	tnz	_tBC_Param+42
1511  03c2 271e          	jreq	L155
1512                     ; 514 			if (Direction == FAN)
1514  03c4 b614          	ld	a,_tBC_Param+19
1515  03c6 a101          	cp	a,#1
1516  03c8 260c          	jrne	L355
1517                     ; 516 				BldcStep = Tab_StepFan[BldcStep-1];
1519  03ca b60a          	ld	a,_tBC_Param+9
1520  03cc 5f            	clrw	x
1521  03cd 97            	ld	xl,a
1522  03ce 5a            	decw	x
1523  03cf d60000        	ld	a,(_Tab_StepFan,x)
1524  03d2 b70a          	ld	_tBC_Param+9,a
1526  03d4 2012          	jra	L745
1527  03d6               L355:
1528                     ; 520 				BldcStep = Tab_StepZen[BldcStep-1];
1530  03d6 b60a          	ld	a,_tBC_Param+9
1531  03d8 5f            	clrw	x
1532  03d9 97            	ld	xl,a
1533  03da 5a            	decw	x
1534  03db d60006        	ld	a,(_Tab_StepZen,x)
1535  03de b70a          	ld	_tBC_Param+9,a
1536  03e0 2006          	jra	L745
1537  03e2               L155:
1538                     ; 525 			tBC_Param.ucZeroCrossFlag = 1 ;
1540  03e2 3501002b      	mov	_tBC_Param+42,#1
1541                     ; 526 			F_OK = 0 ;
1543  03e6 0f01          	clr	(OFST+0,sp)
1544  03e8               L745:
1545                     ; 530 	return  F_OK  ;
1547  03e8 7b01          	ld	a,(OFST+0,sp)
1550  03ea 5b01          	addw	sp,#1
1551  03ec 81            	ret
1588                     ; 535 void BldcLik(void)
1588                     ; 536 {		
1589                     	switch	.text
1590  03ed               _BldcLik:
1592  03ed 88            	push	a
1593       00000001      OFST:	set	1
1596                     ; 537 	uint8 i =0 ;
1598  03ee 0f01          	clr	(OFST+0,sp)
1599                     ; 539 	if(T_DlyTest != 0)
1601  03f0 be0c          	ldw	x,_tBC_Param+11
1602  03f2 2709          	jreq	L775
1603                     ; 541 		T_DlyTest-- ;
1605  03f4 be0c          	ldw	x,_tBC_Param+11
1606  03f6 1d0001        	subw	x,#1
1607  03f9 bf0c          	ldw	_tBC_Param+11,x
1608                     ; 542 		return ;
1611  03fb 84            	pop	a
1612  03fc 81            	ret
1613  03fd               L775:
1614                     ; 545 	return;  // debug_winson
1617  03fd 84            	pop	a
1618  03fe 81            	ret
1645                     ; 561 void BldcRun(void)
1645                     ; 562 {	
1646                     	switch	.text
1647  03ff               _BldcRun:
1651                     ; 563 	if(T_DlyTest != 0) 
1653  03ff be0c          	ldw	x,_tBC_Param+11
1654  0401 2701          	jreq	L116
1655                     ; 564 		return ;
1658  0403 81            	ret
1659  0404               L116:
1660                     ; 566 	if(T_Dly60C > 15000)		
1662  0404 be05          	ldw	x,_tBC_Param+4
1663  0406 a33a99        	cpw	x,#15001
1664  0409 2508          	jrult	L316
1665                     ; 568 		T_Dly60C = 0 ;
1667  040b 5f            	clrw	x
1668  040c bf05          	ldw	_tBC_Param+4,x
1669                     ; 569 		Error_code.bit.ErRun = 1 ;	
1671  040e 72120000      	bset	_Error_code,#1
1672                     ; 570 		return ;
1675  0412 81            	ret
1676  0413               L316:
1677                     ; 573 	if(TstAndSwit())
1679  0413 cd02bd        	call	_TstAndSwit
1681  0416 4d            	tnz	a
1682  0417 273b          	jreq	L516
1683                     ; 576 		T_Dly30C = T_Dly60C ;
1685  0419 be05          	ldw	x,_tBC_Param+4
1686  041b bf07          	ldw	_tBC_Param+6,x
1687                     ; 582 		T_Dly30C -= 1 ; //减去滤波的时间
1689  041d be07          	ldw	x,_tBC_Param+6
1690  041f 1d0001        	subw	x,#1
1691  0422 bf07          	ldw	_tBC_Param+6,x
1692                     ; 584 		if(T_ReRun != 0)
1694  0424 3d0b          	tnz	_tBC_Param+10
1695  0426 270f          	jreq	L716
1696                     ; 586 			T_ReRun -- ;			
1698  0428 3a0b          	dec	_tBC_Param+10
1699                     ; 587 			BLDC_RUN_ONESTEP(BldcStep);	
1701  042a b60a          	ld	a,_tBC_Param+9
1702  042c ad48          	call	_BLDC_RUN_ONESTEP
1704                     ; 588 			T_DlyTest =  T_Dly30C>>1 ;	
1706  042e be07          	ldw	x,_tBC_Param+6
1707  0430 54            	srlw	x
1708  0431 bf0c          	ldw	_tBC_Param+11,x
1709                     ; 589 			T_Dly60C = 0 ;	
1711  0433 5f            	clrw	x
1712  0434 bf05          	ldw	_tBC_Param+4,x
1713                     ; 590 			return ;
1716  0436 81            	ret
1717  0437               L716:
1718                     ; 593 		BldcStatus = STATUS_DLY3C;
1720  0437 350b0009      	mov	_tBC_Param+8,#11
1721                     ; 595 		T_DlyTest = (T_Dly30C >> 1);
1723  043b be07          	ldw	x,_tBC_Param+6
1724  043d 54            	srlw	x
1725  043e bf0c          	ldw	_tBC_Param+11,x
1726                     ; 597 		if(R_CurPwm > 800)
1728  0440 be03          	ldw	x,_tBC_Param+2
1729  0442 a30321        	cpw	x,#801
1730  0445 250d          	jrult	L516
1731                     ; 599 			T_DlyTest += (T_Dly30C / 6) ;//20	
1733  0447 be07          	ldw	x,_tBC_Param+6
1734  0449 90ae0006      	ldw	y,#6
1735  044d 65            	divw	x,y
1736  044e 72bb000c      	addw	x,_tBC_Param+11
1737  0452 bf0c          	ldw	_tBC_Param+11,x
1738  0454               L516:
1739                     ; 602 }
1742  0454 81            	ret
1767                     ; 608 void  AutoRunOne(void)
1767                     ; 609 {
1768                     	switch	.text
1769  0455               _AutoRunOne:
1773                     ; 610 	if (Direction == FAN)
1775  0455 b614          	ld	a,_tBC_Param+19
1776  0457 a101          	cp	a,#1
1777  0459 260e          	jrne	L336
1778                     ; 612 		if(++BldcStep == 7)
1780  045b 3c0a          	inc	_tBC_Param+9
1781  045d b60a          	ld	a,_tBC_Param+9
1782  045f a107          	cp	a,#7
1783  0461 260e          	jrne	L736
1784                     ; 613 			BldcStep = 1 ;		
1786  0463 3501000a      	mov	_tBC_Param+9,#1
1787  0467 2008          	jra	L736
1788  0469               L336:
1789                     ; 617 		if(--BldcStep == 0)
1791  0469 3a0a          	dec	_tBC_Param+9
1792  046b 2604          	jrne	L736
1793                     ; 618 			BldcStep = 6 ;		
1795  046d 3506000a      	mov	_tBC_Param+9,#6
1796  0471               L736:
1797                     ; 621 	BLDC_RUN_ONESTEP(BldcStep);
1799  0471 b60a          	ld	a,_tBC_Param+9
1800  0473 ad01          	call	_BLDC_RUN_ONESTEP
1802                     ; 622 }
1805  0475 81            	ret
1839                     ; 631 void BLDC_RUN_ONESTEP(uint8 STEP)
1839                     ; 632 {
1840                     	switch	.text
1841  0476               _BLDC_RUN_ONESTEP:
1845                     ; 633 	TIM1->CNTRH = 0 ;  //计数器清0
1847  0476 725f525e      	clr	21086
1848                     ; 634 	TIM1->CNTRL = 0 ;
1850  047a 725f525f      	clr	21087
1851                     ; 636 	switch(STEP)
1854                     ; 686 		default : 	
1854                     ; 687 			break ;
1855  047e 4a            	dec	a
1856  047f 2715          	jreq	L346
1857  0481 4a            	dec	a
1858  0482 272d          	jreq	L546
1859  0484 4a            	dec	a
1860  0485 2744          	jreq	L746
1861  0487 4a            	dec	a
1862  0488 275b          	jreq	L156
1863  048a 4a            	dec	a
1864  048b 2772          	jreq	L356
1865  048d 4a            	dec	a
1866  048e 2603cc0519    	jreq	L556
1867  0493 cc0531        	jra	L107
1868  0496               L346:
1869                     ; 638 		case 1 : // AB
1869                     ; 639 			PWM_AH_OUT_EN();
1871  0496 7210525c      	bset	21084,#0
1872                     ; 640 			PWM_BH_OUT_DIS();
1874  049a 7219525c      	bres	21084,#4
1875                     ; 641 			PWM_CH_OUT_DIS();
1877  049e 7211525d      	bres	21085,#0
1878                     ; 642 			CNT_AL_OUT_DIS();
1880  04a2 72105005      	bset	20485,#0
1881                     ; 643 			CNT_BL_OUT_EN();
1883  04a6 72135005      	bres	20485,#1
1884                     ; 644 			CNT_CL_OUT_DIS();
1886  04aa 72145005      	bset	20485,#2
1887                     ; 645 			break ;
1889  04ae cc0531        	jra	L107
1890  04b1               L546:
1891                     ; 646 		case 2 :	//AC
1891                     ; 647 			PWM_AH_OUT_EN();
1893  04b1 7210525c      	bset	21084,#0
1894                     ; 648 			PWM_BH_OUT_DIS();
1896  04b5 7219525c      	bres	21084,#4
1897                     ; 649 			PWM_CH_OUT_DIS();
1899  04b9 7211525d      	bres	21085,#0
1900                     ; 650 			CNT_AL_OUT_DIS();
1902  04bd 72105005      	bset	20485,#0
1903                     ; 651 			CNT_BL_OUT_DIS();
1905  04c1 72125005      	bset	20485,#1
1906                     ; 652 			CNT_CL_OUT_EN();
1908  04c5 72155005      	bres	20485,#2
1909                     ; 653 			break ;
1911  04c9 2066          	jra	L107
1912  04cb               L746:
1913                     ; 654 		case 3 : //BC
1913                     ; 655 			PWM_AH_OUT_DIS();
1915  04cb 7211525c      	bres	21084,#0
1916                     ; 656 			PWM_BH_OUT_EN();
1918  04cf 7218525c      	bset	21084,#4
1919                     ; 657 			PWM_CH_OUT_DIS();
1921  04d3 7211525d      	bres	21085,#0
1922                     ; 658 			CNT_AL_OUT_DIS();
1924  04d7 72105005      	bset	20485,#0
1925                     ; 659 			CNT_BL_OUT_DIS();
1927  04db 72125005      	bset	20485,#1
1928                     ; 660 			CNT_CL_OUT_EN();
1930  04df 72155005      	bres	20485,#2
1931                     ; 661 			break ;
1933  04e3 204c          	jra	L107
1934  04e5               L156:
1935                     ; 662 		case 4 ://BA
1935                     ; 663 			PWM_AH_OUT_DIS();
1937  04e5 7211525c      	bres	21084,#0
1938                     ; 664 			PWM_BH_OUT_EN();
1940  04e9 7218525c      	bset	21084,#4
1941                     ; 665 			PWM_CH_OUT_DIS();
1943  04ed 7211525d      	bres	21085,#0
1944                     ; 666 			CNT_AL_OUT_EN();
1946  04f1 72115005      	bres	20485,#0
1947                     ; 667 			CNT_BL_OUT_DIS();
1949  04f5 72125005      	bset	20485,#1
1950                     ; 668 			CNT_CL_OUT_DIS();
1952  04f9 72145005      	bset	20485,#2
1953                     ; 669 			break ;
1955  04fd 2032          	jra	L107
1956  04ff               L356:
1957                     ; 670 		case 5 ://CA
1957                     ; 671 			PWM_AH_OUT_DIS();
1959  04ff 7211525c      	bres	21084,#0
1960                     ; 672 			PWM_BH_OUT_DIS();
1962  0503 7219525c      	bres	21084,#4
1963                     ; 673 			PWM_CH_OUT_EN();
1965  0507 7210525d      	bset	21085,#0
1966                     ; 674 			CNT_AL_OUT_EN();
1968  050b 72115005      	bres	20485,#0
1969                     ; 675 			CNT_BL_OUT_DIS();
1971  050f 72125005      	bset	20485,#1
1972                     ; 676 			CNT_CL_OUT_DIS();
1974  0513 72145005      	bset	20485,#2
1975                     ; 677 			break ;
1977  0517 2018          	jra	L107
1978  0519               L556:
1979                     ; 678 		case 6 :	//CB
1979                     ; 679 			PWM_AH_OUT_DIS();
1981  0519 7211525c      	bres	21084,#0
1982                     ; 680 			PWM_BH_OUT_DIS();
1984  051d 7219525c      	bres	21084,#4
1985                     ; 681 			PWM_CH_OUT_EN();
1987  0521 7210525d      	bset	21085,#0
1988                     ; 682 			CNT_AL_OUT_DIS();
1990  0525 72105005      	bset	20485,#0
1991                     ; 683 			CNT_BL_OUT_EN();
1993  0529 72135005      	bres	20485,#1
1994                     ; 684 			CNT_CL_OUT_DIS();
1996  052d 72145005      	bset	20485,#2
1997                     ; 685 			break ;		
1999  0531               L756:
2000                     ; 686 		default : 	
2000                     ; 687 			break ;
2002  0531               L107:
2003                     ; 689 }
2006  0531 81            	ret
2419                     	xdef	_TstAndSwit
2420                     	xdef	_Nop
2421                     	xdef	_DISP_TAB
2422                     	xdef	_Tab_StepZen
2423                     	xdef	_Tab_StepFan
2424                     	xdef	_KSTBL
2425                     	xdef	_KSTB
2426                     	xdef	_KLST
2427                     	xdef	_BLDC_RUN_ONESTEP
2428                     	xdef	_AutoRunOne
2429                     	xdef	_BldcRun
2430                     	xdef	_BldcLik
2431                     	xdef	_Check_BEMF_Voltage
2432                     	xdef	_SpeedRefAccDec
2433                     	xdef	_CmdPwmSlow
2434                     	xdef	_DISP_Display
2435                     	xdef	_BldcBak
2436                     	xdef	_Key_Check
2437                     	xdef	_Run_Ctl
2438                     	xdef	_Led_Light
2439                     	xdef	_Timer1_PWM_Value
2440                     	xdef	_Timer1_CCR4_Value
2441                     	xdef	_AdcSwitch
2442                     	xdef	_OffSixPin
2443                     	switch	.ubsct
2444  0000               _Error_code:
2445  0000 00            	ds.b	1
2446                     	xdef	_Error_code
2447  0001               _tBC_Param:
2448  0001 000000000000  	ds.b	46
2449                     	xdef	_tBC_Param
2450                     	xref	_SPI_GetFlagStatus
2451                     	xref	_SPI_SendData
2452                     	xref	_GPIO_WriteLow
2453                     	xref	_GPIO_WriteHigh
2473                     	end
