   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _g_direction:
  17  0000 00            	dc.b	0
  18  0001               _KLST:
  19  0001 00            	dc.b	0
  20  0002               _KSTB:
  21  0002 00            	dc.b	0
  22  0003               _KSTBL:
  23  0003 00            	dc.b	0
  24                     .const:	section	.text
  25  0000               _Tab_StepFan:
  26  0000 02            	dc.b	2
  27  0001 03            	dc.b	3
  28  0002 04            	dc.b	4
  29  0003 05            	dc.b	5
  30  0004 06            	dc.b	6
  31  0005 01            	dc.b	1
  32  0006               _Tab_StepZen:
  33  0006 06            	dc.b	6
  34  0007 01            	dc.b	1
  35  0008 02            	dc.b	2
  36  0009 03            	dc.b	3
  37  000a 04            	dc.b	4
  38  000b 05            	dc.b	5
  39                     	bsct
  40  0004               _DISP_TAB:
  41  0004 3f            	dc.b	63
  42  0005 06            	dc.b	6
  43  0006 5b            	dc.b	91
  44  0007 4f            	dc.b	79
  45  0008 66            	dc.b	102
  46  0009 6d            	dc.b	109
  47  000a 7d            	dc.b	125
  48  000b 07            	dc.b	7
  49  000c 7f            	dc.b	127
  50  000d 6f            	dc.b	111
  90                     ; 38 void Nop(uint8 T_Dly)
  90                     ; 39 {	
  92                     	switch	.text
  93  0000               _Nop:
  95  0000 88            	push	a
  96       00000000      OFST:	set	0
  99  0001               L13:
 100                     ; 40 	while(T_Dly--);		
 102  0001 7b01          	ld	a,(OFST+1,sp)
 103  0003 0a01          	dec	(OFST+1,sp)
 104  0005 4d            	tnz	a
 105  0006 26f9          	jrne	L13
 106                     ; 41 	return ;
 109  0008 84            	pop	a
 110  0009 81            	ret
 113                     	bsct
 114  000e               L53_BitNo:
 115  000e 00            	dc.b	0
 170                     ; 45 void DISP_Display(void)
 170                     ; 46 {
 171                     	switch	.text
 172  000a               _DISP_Display:
 174  000a 5203          	subw	sp,#3
 175       00000003      OFST:	set	3
 178                     ; 52 	GPIO_WriteLow(GPIOE,GPIO_PIN_5);
 180  000c 4b20          	push	#32
 181  000e ae5014        	ldw	x,#20500
 182  0011 cd0000        	call	_GPIO_WriteLow
 184  0014 84            	pop	a
 185                     ; 54 	data = DISP_TAB[BitNo];
 187  0015 b60e          	ld	a,L53_BitNo
 188  0017 5f            	clrw	x
 189  0018 97            	ld	xl,a
 190  0019 e604          	ld	a,(_DISP_TAB,x)
 191                     ; 55 	usPos = (0x01<<BitNo);
 193  001b ae0001        	ldw	x,#1
 194  001e b60e          	ld	a,L53_BitNo
 195  0020 4d            	tnz	a
 196  0021 2704          	jreq	L01
 197  0023               L21:
 198  0023 58            	sllw	x
 199  0024 4a            	dec	a
 200  0025 26fc          	jrne	L21
 201  0027               L01:
 202  0027 1f02          	ldw	(OFST-1,sp),x
 204  0029               L17:
 205                     ; 57 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 207  0029 a602          	ld	a,#2
 208  002b cd0000        	call	_SPI_GetFlagStatus
 210  002e 4d            	tnz	a
 211  002f 27f8          	jreq	L17
 212                     ; 58 	SPI_SendData(usPos);
 214  0031 7b03          	ld	a,(OFST+0,sp)
 215  0033 cd0000        	call	_SPI_SendData
 218  0036               L77:
 219                     ; 59 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 221  0036 a602          	ld	a,#2
 222  0038 cd0000        	call	_SPI_GetFlagStatus
 224  003b 4d            	tnz	a
 225  003c 27f8          	jreq	L77
 226                     ; 60 	SPI_SendData(0xFF);
 228  003e a6ff          	ld	a,#255
 229  0040 cd0000        	call	_SPI_SendData
 232  0043               L501:
 233                     ; 61 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
 235  0043 a602          	ld	a,#2
 236  0045 cd0000        	call	_SPI_GetFlagStatus
 238  0048 4d            	tnz	a
 239  0049 27f8          	jreq	L501
 240                     ; 63 	GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
 242  004b 4b20          	push	#32
 243  004d ae5014        	ldw	x,#20500
 244  0050 cd0000        	call	_GPIO_WriteHigh
 246  0053 84            	pop	a
 247                     ; 65 	BitNo++;
 249  0054 3c0e          	inc	L53_BitNo
 250                     ; 66 	if (BitNo > 3)
 252  0056 b60e          	ld	a,L53_BitNo
 253  0058 a104          	cp	a,#4
 254  005a 2502          	jrult	L111
 255                     ; 68 		BitNo = 0;
 257  005c 3f0e          	clr	L53_BitNo
 258  005e               L111:
 259                     ; 70 }
 262  005e 5b03          	addw	sp,#3
 263  0060 81            	ret
 286                     ; 75 void OffSixPin(void)
 286                     ; 76 {
 287                     	switch	.text
 288  0061               _OffSixPin:
 292                     ; 77 	CNT_AL_OUT_DIS();
 294  0061 72115005      	bres	20485,#0
 295                     ; 78 	CNT_BL_OUT_DIS();
 297  0065 72135005      	bres	20485,#1
 298                     ; 79 	CNT_CL_OUT_DIS();
 300  0069 72155005      	bres	20485,#2
 301                     ; 80 	PWM_AH_OUT_DIS();
 303  006d 7211525c      	bres	21084,#0
 304                     ; 81 	PWM_BH_OUT_DIS();
 306  0071 7219525c      	bres	21084,#4
 307                     ; 82 	PWM_CH_OUT_DIS();
 309  0075 7211525d      	bres	21085,#0
 310                     ; 84 }
 313  0079 81            	ret
 336                     ; 92 void BldcBak(void)
 336                     ; 93 {
 337                     	switch	.text
 338  007a               _BldcBak:
 342                     ; 94 	PWM_BH_OUT_DIS();
 344  007a 7219525c      	bres	21084,#4
 345                     ; 95 	PWM_BH_OUT_DIS();
 347  007e 7219525c      	bres	21084,#4
 348                     ; 96 	PWM_CH_OUT_DIS();
 350  0082 7211525d      	bres	21085,#0
 351                     ; 97 	CNT_AL_OUT_EN();
 353  0086 72105005      	bset	20485,#0
 354                     ; 98 	CNT_BL_OUT_EN();
 356  008a 72125005      	bset	20485,#1
 357                     ; 99 	CNT_CL_OUT_EN();									
 359  008e 72145005      	bset	20485,#2
 360                     ; 100 }
 363  0092 81            	ret
 397                     ; 103 void Timer1_CCR4_Value(uint16 InValue)
 397                     ; 104 {
 398                     	switch	.text
 399  0093               _Timer1_CCR4_Value:
 403                     ; 105 	ToCMPxH(TIM1->CCR4H,InValue);
 405  0093 9e            	ld	a,xh
 406  0094 c7526b        	ld	21099,a
 407                     ; 106 	ToCMPxL(TIM1->CCR4L,InValue);		
 409  0097 9f            	ld	a,xl
 410  0098 a4ff          	and	a,#255
 411  009a c7526c        	ld	21100,a
 412                     ; 107 }
 415  009d 81            	ret
 449                     ; 110 void Timer1_PWM_Value(uint16 OUT_PWM)
 449                     ; 111 {
 450                     	switch	.text
 451  009e               _Timer1_PWM_Value:
 453  009e 89            	pushw	x
 454       00000000      OFST:	set	0
 457                     ; 113 	ToCMPxH(TIM1->CCR1H,OUT_PWM);
 459  009f 9e            	ld	a,xh
 460  00a0 c75265        	ld	21093,a
 461                     ; 114 	ToCMPxL(TIM1->CCR1L,OUT_PWM);
 463  00a3 9f            	ld	a,xl
 464  00a4 a4ff          	and	a,#255
 465  00a6 c75266        	ld	21094,a
 466                     ; 115 	ToCMPxH(TIM1->CCR2H,OUT_PWM);
 468  00a9 7b01          	ld	a,(OFST+1,sp)
 469  00ab c75267        	ld	21095,a
 470                     ; 116 	ToCMPxL(TIM1->CCR2L,OUT_PWM);
 472  00ae 7b02          	ld	a,(OFST+2,sp)
 473  00b0 a4ff          	and	a,#255
 474  00b2 c75268        	ld	21096,a
 475                     ; 117 	ToCMPxH(TIM1->CCR3H,OUT_PWM);
 477  00b5 7b01          	ld	a,(OFST+1,sp)
 478  00b7 c75269        	ld	21097,a
 479                     ; 118 	ToCMPxL(TIM1->CCR3L,OUT_PWM);
 481  00ba 7b02          	ld	a,(OFST+2,sp)
 482  00bc a4ff          	and	a,#255
 483  00be c7526a        	ld	21098,a
 484                     ; 119 }
 487  00c1 85            	popw	x
 488  00c2 81            	ret
 515                     ; 124 void Key_Check(void)
 515                     ; 125 {
 516                     	switch	.text
 517  00c3               _Key_Check:
 521                     ; 126 	Direction = ZEN;
 523  00c3 35020014      	mov	_tBC_Param+19,#2
 524                     ; 128 	tBC_Param.R_Err = Error_code.all;
 526  00c7 450029        	mov	_tBC_Param+40,_Error_code
 527                     ; 131 	if (GPIOE->IDR & GPIO_PIN_1)
 529  00ca c65015        	ld	a,20501
 530  00cd a502          	bcp	a,#2
 531  00cf 2706          	jreq	L771
 532                     ; 133 		tBC_Param.ucCmdKey = 1;
 534  00d1 3501002a      	mov	_tBC_Param+41,#1
 536  00d5 2002          	jra	L102
 537  00d7               L771:
 538                     ; 137 		tBC_Param.ucCmdKey = 0;
 540  00d7 3f2a          	clr	_tBC_Param+41
 541  00d9               L102:
 542                     ; 140 	if(tBC_Param.ucCmdKey != KSTB) 	//第一次按下
 544  00d9 b62a          	ld	a,_tBC_Param+41
 545  00db b102          	cp	a,_KSTB
 546  00dd 270f          	jreq	L302
 547                     ; 142 		if (KSTBL++>20)
 549  00df b603          	ld	a,_KSTBL
 550  00e1 3c03          	inc	_KSTBL
 551  00e3 a115          	cp	a,#21
 552  00e5 2509          	jrult	L702
 553                     ; 144 			KSTB = tBC_Param.ucCmdKey;
 555  00e7 452a02        	mov	_KSTB,_tBC_Param+41
 556                     ; 145 			KSTBL = 0;
 558  00ea 3f03          	clr	_KSTBL
 559  00ec 2002          	jra	L702
 560  00ee               L302:
 561                     ; 150 		KSTBL = 0;
 563  00ee 3f03          	clr	_KSTBL
 564  00f0               L702:
 565                     ; 153 	if ((KSTB == 1) && (tBC_Param.ucRunProtect == 0))  //开关按下
 567  00f0 b602          	ld	a,_KSTB
 568  00f2 a101          	cp	a,#1
 569  00f4 260a          	jrne	L112
 571  00f6 3d28          	tnz	_tBC_Param+39
 572  00f8 2606          	jrne	L112
 573                     ; 155 		tBC_Param.RunCmd = 1;
 575  00fa 35010015      	mov	_tBC_Param+20,#1
 577  00fe 2002          	jra	L312
 578  0100               L112:
 579                     ; 159 		tBC_Param.RunCmd = 0;
 581  0100 3f15          	clr	_tBC_Param+20
 582  0102               L312:
 583                     ; 162 	if (tBC_Param.ucRunProtect)
 585  0102 3d28          	tnz	_tBC_Param+39
 586  0104 2708          	jreq	L512
 587                     ; 164 		if (KSTB == 0)
 589  0106 3d02          	tnz	_KSTB
 590  0108 2610          	jrne	L122
 591                     ; 166 			tBC_Param.ucRunProtect = 0;
 593  010a 3f28          	clr	_tBC_Param+39
 594  010c 200c          	jra	L122
 595  010e               L512:
 596                     ; 171 		if ((KSTB) && (tBC_Param.R_Err))
 598  010e 3d02          	tnz	_KSTB
 599  0110 2708          	jreq	L122
 601  0112 3d29          	tnz	_tBC_Param+40
 602  0114 2704          	jreq	L122
 603                     ; 173 			tBC_Param.ucRunProtect = 1;
 605  0116 35010028      	mov	_tBC_Param+39,#1
 606  011a               L122:
 607                     ; 176 }
 610  011a 81            	ret
 634                     ; 178 void SpeedRefAccDec(void)
 634                     ; 179 {
 635                     	switch	.text
 636  011b               _SpeedRefAccDec:
 640                     ; 180 	tBC_Param.R_VRAD = 100;   // debug_winson
 642  011b ae0064        	ldw	x,#100
 643  011e bf22          	ldw	_tBC_Param+33,x
 644                     ; 192 		R_SetPwm = tBC_Param.R_VRAD ;
 646  0120 ae0064        	ldw	x,#100
 647  0123 bf01          	ldw	_tBC_Param,x
 648                     ; 194 }
 651  0125 81            	ret
 676                     ; 200 void CmdPwmSlow(void)
 676                     ; 201 {
 677                     	switch	.text
 678  0126               _CmdPwmSlow:
 682                     ; 202 	if (BldcStatus > STATUS_START)
 684  0126 b609          	ld	a,_tBC_Param+8
 685  0128 a102          	cp	a,#2
 686  012a 2522          	jrult	L542
 687                     ; 204 		if (R_SetPwm == R_CurPwm) // tBC_Param.R_VRAD
 689  012c be01          	ldw	x,_tBC_Param
 690  012e b303          	cpw	x,_tBC_Param+2
 691  0130 2601          	jrne	L742
 692                     ; 206 			return ;
 695  0132 81            	ret
 696  0133               L742:
 697                     ; 208 		else if (R_SetPwm < R_CurPwm)
 699  0133 be01          	ldw	x,_tBC_Param
 700  0135 b303          	cpw	x,_tBC_Param+2
 701  0137 2409          	jruge	L352
 702                     ; 210 			R_CurPwm--;
 704  0139 be03          	ldw	x,_tBC_Param+2
 705  013b 1d0001        	subw	x,#1
 706  013e bf03          	ldw	_tBC_Param+2,x
 708  0140 2007          	jra	L152
 709  0142               L352:
 710                     ; 214 			R_CurPwm ++;
 712  0142 be03          	ldw	x,_tBC_Param+2
 713  0144 1c0001        	addw	x,#1
 714  0147 bf03          	ldw	_tBC_Param+2,x
 715  0149               L152:
 716                     ; 217 		Timer1_PWM_Value(R_CurPwm);
 718  0149 be03          	ldw	x,_tBC_Param+2
 719  014b cd009e        	call	_Timer1_PWM_Value
 721  014e               L542:
 722                     ; 219 }
 725  014e 81            	ret
 728                     	bsct
 729  000f               L752_usChargeCnt:
 730  000f 0000          	dc.w	0
 767                     ; 226 void Run_Ctl(void)
 767                     ; 227 {
 768                     	switch	.text
 769  014f               _Run_Ctl:
 773                     ; 230 	switch (tBC_Param.ucState)
 775  014f b627          	ld	a,_tBC_Param+38
 777                     ; 297 	default:
 777                     ; 298 		break;
 778  0151 4d            	tnz	a
 779  0152 270d          	jreq	L162
 780  0154 4a            	dec	a
 781  0155 274d          	jreq	L362
 782  0157 4a            	dec	a
 783  0158 2603          	jrne	L43
 784  015a cc0204        	jp	L562
 785  015d               L43:
 786  015d ac0a020a      	jpf	L113
 787  0161               L162:
 788                     ; 232 	case 0:
 788                     ; 233 		if (tBC_Param.RunCmd == 1)
 790  0161 b615          	ld	a,_tBC_Param+20
 791  0163 a101          	cp	a,#1
 792  0165 2616          	jrne	L313
 793                     ; 235 			tBC_Param.R_Mode = MODE_ON;
 795  0167 35010026      	mov	_tBC_Param+37,#1
 796                     ; 236 			PWM_OUT_EN();
 798  016b 72155014      	bres	20500,#2
 799                     ; 237 			TEST1_ON();
 801  016f 7219500f      	bres	20495,#4
 802                     ; 238 			tBC_Param.ucState = 1;
 804  0173 35010027      	mov	_tBC_Param+38,#1
 805                     ; 239 			usChargeCnt = 0;
 807  0177 5f            	clrw	x
 808  0178 bf0f          	ldw	L752_usChargeCnt,x
 810  017a cc020a        	jra	L113
 811  017d               L313:
 812                     ; 243 			TIM1_BREAK_DIS();      // Break input (BKIN) disabled
 814  017d 7219526d      	bres	21101,#4
 815                     ; 244 			TIM1_BREAK_IER_DIS();
 817  0181 721f5254      	bres	21076,#7
 818                     ; 245 			TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
 820  0185 721f526d      	bres	21101,#7
 821                     ; 246 			OffSixPin();
 823  0189 cd0061        	call	_OffSixPin
 825                     ; 247 			tBC_Param.R_Mode = MODE_OFF;
 827  018c 3f26          	clr	_tBC_Param+37
 828                     ; 248 			BldcStatus = STATUS_STOP;
 830  018e 3f09          	clr	_tBC_Param+8
 831                     ; 249 			TIM1_CMP4_IEN_DIS();   // CC4 interrupt disabled
 833  0190 72195254      	bres	21076,#4
 834                     ; 250 			Timer1_PWM_Value(0);
 836  0194 5f            	clrw	x
 837  0195 cd009e        	call	_Timer1_PWM_Value
 839                     ; 251 			PWM_OUT_DIS();
 841  0198 72145014      	bset	20500,#2
 842                     ; 252 			TEST1_OFF();
 844  019c 7218500f      	bset	20495,#4
 845                     ; 254 			Error_code.all = 0;  // debug_winson
 847  01a0 3f00          	clr	_Error_code
 848  01a2 2066          	jra	L113
 849  01a4               L362:
 850                     ; 258 	case 1:
 850                     ; 259 		if (usChargeCnt++ < 20)
 852  01a4 be0f          	ldw	x,L752_usChargeCnt
 853  01a6 1c0001        	addw	x,#1
 854  01a9 bf0f          	ldw	L752_usChargeCnt,x
 855  01ab 1d0001        	subw	x,#1
 856  01ae a30014        	cpw	x,#20
 857  01b1 240e          	jruge	L713
 858                     ; 261 			CNT_AL_OUT_EN();
 860  01b3 72105005      	bset	20485,#0
 861                     ; 262 			CNT_BL_OUT_EN();
 863  01b7 72125005      	bset	20485,#1
 864                     ; 263 			CNT_CL_OUT_EN();
 866  01bb 72145005      	bset	20485,#2
 868  01bf 2049          	jra	L113
 869  01c1               L713:
 870                     ; 267 			usChargeCnt = 0;
 872  01c1 5f            	clrw	x
 873  01c2 bf0f          	ldw	L752_usChargeCnt,x
 874                     ; 268 			CNT_AL_OUT_DIS();
 876  01c4 72115005      	bres	20485,#0
 877                     ; 269 			CNT_BL_OUT_DIS();
 879  01c8 72135005      	bres	20485,#1
 880                     ; 270 			CNT_CL_OUT_DIS();
 882  01cc 72155005      	bres	20485,#2
 883                     ; 272 			TIM1_BREAK_ENB();
 885  01d0 7218526d      	bset	21101,#4
 886                     ; 273 			TIM1->SR1 &= (u8)(~BIT7);
 888  01d4 721f5255      	bres	21077,#7
 889                     ; 274 			TIM1_BREAK_IER_ENB();
 891  01d8 721e5254      	bset	21076,#7
 892                     ; 275 			TIM1->BKR |= TIM1_BKR_MOE;
 894  01dc 721e526d      	bset	21101,#7
 895                     ; 276 			Timer1_CCR4_Value(1);
 897  01e0 ae0001        	ldw	x,#1
 898  01e3 cd0093        	call	_Timer1_CCR4_Value
 900                     ; 279 			R_CurPwm = V_PWMSTART;			//当前值					
 902  01e6 ae000f        	ldw	x,#15
 903  01e9 bf03          	ldw	_tBC_Param+2,x
 904                     ; 280 			R_SetPwm= V_PWMRUN_MIN ;		//设定值	
 906  01eb ae0014        	ldw	x,#20
 907  01ee bf01          	ldw	_tBC_Param,x
 908                     ; 281 			tBC_Param.StartStep = 0 ;//正常启动
 910  01f0 5f            	clrw	x
 911  01f1 bf12          	ldw	_tBC_Param+17,x
 912                     ; 282 			BldcStep = V_BLDC_DING ;
 914  01f3 3501000a      	mov	_tBC_Param+9,#1
 915                     ; 283 			T_Dly60C = 0;
 917  01f7 5f            	clrw	x
 918  01f8 bf05          	ldw	_tBC_Param+4,x
 919                     ; 284 			BldcStatus = STATUS_START ;  //启动
 921  01fa 35010009      	mov	_tBC_Param+8,#1
 922                     ; 286 			tBC_Param.ucState = 2;
 924  01fe 35020027      	mov	_tBC_Param+38,#2
 925  0202 2006          	jra	L113
 926  0204               L562:
 927                     ; 290 	case 2:
 927                     ; 291 		if (tBC_Param.RunCmd == 0)
 929  0204 3d15          	tnz	_tBC_Param+20
 930  0206 2602          	jrne	L113
 931                     ; 293 			tBC_Param.ucState = 0;
 933  0208 3f27          	clr	_tBC_Param+38
 934  020a               L762:
 935                     ; 297 	default:
 935                     ; 298 		break;
 937  020a               L113:
 938                     ; 300 }
 941  020a 81            	ret
 965                     ; 302 void Led_Light(void)
 965                     ; 303 {
 966                     	switch	.text
 967  020b               _Led_Light:
 971                     ; 304 	if (BldcStatus == STATUS_STOP)
 973  020b 3d09          	tnz	_tBC_Param+8
 974  020d 2606          	jrne	L533
 975                     ; 306 		LED_RUN_OFF();
 977  020f 7216500f      	bset	20495,#3
 979  0213 2004          	jra	L733
 980  0215               L533:
 981                     ; 310 		LED_RUN_ON();
 983  0215 7217500f      	bres	20495,#3
 984  0219               L733:
 985                     ; 313 	if (tBC_Param.R_Err)
 987  0219 3d29          	tnz	_tBC_Param+40
 988  021b 2706          	jreq	L143
 989                     ; 315 		LED_ERROR_ON();
 991  021d 7215500f      	bres	20495,#2
 993  0221 2004          	jra	L343
 994  0223               L143:
 995                     ; 319 		LED_ERROR_OFF();
 997  0223 7214500f      	bset	20495,#2
 998  0227               L343:
 999                     ; 321 }
1002  0227 81            	ret
1036                     ; 329 void AdcSwitch(uint8 Chanel)
1036                     ; 330 {
1037                     	switch	.text
1038  0228               _AdcSwitch:
1042                     ; 331 	ADC2->CSR = Chanel;	//选择转换通道	
1044  0228 c75400        	ld	21504,a
1045                     ; 332 	ADC2->CR1 |= 0x01 ;		// 启动ADC
1047  022b 72105401      	bset	21505,#0
1049  022f               L563:
1050                     ; 334 	while(!(ADC2->CSR & BIT7));	//等待转换
1052  022f c65400        	ld	a,21504
1053  0232 a580          	bcp	a,#128
1054  0234 27f9          	jreq	L563
1055                     ; 335 	ADC2->CSR &= 0x7f;
1057  0236 721f5400      	bres	21504,#7
1058                     ; 336 }
1061  023a 81            	ret
1097                     ; 340 void Check_BEMF_Voltage(void)
1097                     ; 341 {	
1098                     	switch	.text
1099  023b               _Check_BEMF_Voltage:
1101  023b 89            	pushw	x
1102       00000002      OFST:	set	2
1105                     ; 342 	uint16 Value=0 ;
1107                     ; 345 	switch(BldcStep)
1109  023c b60a          	ld	a,_tBC_Param+9
1111                     ; 367 			break ;
1112  023e 4a            	dec	a
1113  023f 2714          	jreq	L173
1114  0241 4a            	dec	a
1115  0242 2729          	jreq	L373
1116  0244 4a            	dec	a
1117  0245 273e          	jreq	L573
1118  0247 4a            	dec	a
1119  0248 270b          	jreq	L173
1120  024a 4a            	dec	a
1121  024b 2720          	jreq	L373
1122  024d 4a            	dec	a
1123  024e 2735          	jreq	L573
1124  0250               L773:
1125                     ; 365 		default : 
1125                     ; 366 			Value = 0 ;
1127  0250 5f            	clrw	x
1128  0251 1f01          	ldw	(OFST-1,sp),x
1129                     ; 367 			break ;
1131  0253 2046          	jra	L124
1132  0255               L173:
1133                     ; 347 		case 1 : //AB  取 读C点W
1133                     ; 348 		case 4 :
1133                     ; 349 			AdcSwitch(PHASE_C_BEMF_ADC_CHAN);
1135  0255 a603          	ld	a,#3
1136  0257 adcf          	call	_AdcSwitch
1138                     ; 350 			Value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1140  0259 c65404        	ld	a,21508
1141  025c 5f            	clrw	x
1142  025d 97            	ld	xl,a
1143  025e 58            	sllw	x
1144  025f 58            	sllw	x
1145  0260 01            	rrwa	x,a
1146  0261 cb5405        	add	a,21509
1147  0264 2401          	jrnc	L44
1148  0266 5c            	incw	x
1149  0267               L44:
1150  0267 02            	rlwa	x,a
1151  0268 1f01          	ldw	(OFST-1,sp),x
1152  026a 01            	rrwa	x,a
1153                     ; 351 			break ;
1155  026b 202e          	jra	L124
1156  026d               L373:
1157                     ; 353 		case 2 : //AC 通  取B点 
1157                     ; 354 		case 5 :
1157                     ; 355 			AdcSwitch(PHASE_B_BEMF_ADC_CHAN);
1159  026d a604          	ld	a,#4
1160  026f adb7          	call	_AdcSwitch
1162                     ; 356 			Value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1164  0271 c65404        	ld	a,21508
1165  0274 5f            	clrw	x
1166  0275 97            	ld	xl,a
1167  0276 58            	sllw	x
1168  0277 58            	sllw	x
1169  0278 01            	rrwa	x,a
1170  0279 cb5405        	add	a,21509
1171  027c 2401          	jrnc	L64
1172  027e 5c            	incw	x
1173  027f               L64:
1174  027f 02            	rlwa	x,a
1175  0280 1f01          	ldw	(OFST-1,sp),x
1176  0282 01            	rrwa	x,a
1177                     ; 357 			break ;	
1179  0283 2016          	jra	L124
1180  0285               L573:
1181                     ; 359 		case 3 : //BC  取 读A点 
1181                     ; 360 		case 6 :
1181                     ; 361 			AdcSwitch(PHASE_A_BEMF_ADC_CHAN);
1183  0285 a605          	ld	a,#5
1184  0287 ad9f          	call	_AdcSwitch
1186                     ; 362 			Value = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1188  0289 c65404        	ld	a,21508
1189  028c 5f            	clrw	x
1190  028d 97            	ld	xl,a
1191  028e 58            	sllw	x
1192  028f 58            	sllw	x
1193  0290 01            	rrwa	x,a
1194  0291 cb5405        	add	a,21509
1195  0294 2401          	jrnc	L05
1196  0296 5c            	incw	x
1197  0297               L05:
1198  0297 02            	rlwa	x,a
1199  0298 1f01          	ldw	(OFST-1,sp),x
1200  029a 01            	rrwa	x,a
1201                     ; 363 			break ;
1203  029b               L124:
1204                     ; 370 	VoCple = Value ;
1206  029b 1e01          	ldw	x,(OFST-1,sp)
1207  029d bf0e          	ldw	_tBC_Param+13,x
1208                     ; 372 	AdcSwitch(ADC_BUS_CHANNEL);// DC BUS 电压
1210  029f a608          	ld	a,#8
1211  02a1 ad85          	call	_AdcSwitch
1213                     ; 373 	tBC_Param.usAD_DCbus = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
1215  02a3 c65404        	ld	a,21508
1216  02a6 5f            	clrw	x
1217  02a7 97            	ld	xl,a
1218  02a8 58            	sllw	x
1219  02a9 58            	sllw	x
1220  02aa 01            	rrwa	x,a
1221  02ab cb5405        	add	a,21509
1222  02ae 2401          	jrnc	L25
1223  02b0 5c            	incw	x
1224  02b1               L25:
1225  02b1 b71b          	ld	_tBC_Param+26,a
1226  02b3 9f            	ld	a,xl
1227  02b4 b71a          	ld	_tBC_Param+25,a
1228                     ; 374 	M_VoCple = tBC_Param.usAD_DCbus>>1;
1230  02b6 be1a          	ldw	x,_tBC_Param+25
1231  02b8 54            	srlw	x
1232  02b9 bf10          	ldw	_tBC_Param+15,x
1233                     ; 375 }
1236  02bb 85            	popw	x
1237  02bc 81            	ret
1274                     ; 378 uint8 TstAndSwit(void)
1274                     ; 379 {	
1275                     	switch	.text
1276  02bd               _TstAndSwit:
1278  02bd 88            	push	a
1279       00000001      OFST:	set	1
1282                     ; 380 	uint8 F_OK = 0 ;
1284  02be 0f01          	clr	(OFST+0,sp)
1285                     ; 399 	if(Direction == FAN)  //反转
1287  02c0 b614          	ld	a,_tBC_Param+19
1288  02c2 a101          	cp	a,#1
1289  02c4 2703cc0348    	jrne	L574
1290                     ; 401 		switch(BldcStep)
1292  02c9 b60a          	ld	a,_tBC_Param+9
1294                     ; 445 			default : 
1294                     ; 446 				break ;
1295  02cb 4a            	dec	a
1296  02cc 2713          	jreq	L324
1297  02ce 4a            	dec	a
1298  02cf 2721          	jreq	L524
1299  02d1 4a            	dec	a
1300  02d2 272f          	jreq	L724
1301  02d4 4a            	dec	a
1302  02d5 273d          	jreq	L134
1303  02d7 4a            	dec	a
1304  02d8 274b          	jreq	L334
1305  02da 4a            	dec	a
1306  02db 2759          	jreq	L534
1307  02dd acbc03bc      	jpf	L715
1308  02e1               L324:
1309                     ; 403 			case 1 : //AB   C DOWN
1309                     ; 404 				if(VoCple < M_VoCple)
1311  02e1 be0e          	ldw	x,_tBC_Param+13
1312  02e3 b310          	cpw	x,_tBC_Param+15
1313  02e5 2503          	jrult	L65
1314  02e7 cc03bc        	jp	L715
1315  02ea               L65:
1316                     ; 406 					F_OK = 1 ;
1318  02ea a601          	ld	a,#1
1319  02ec 6b01          	ld	(OFST+0,sp),a
1320  02ee acbc03bc      	jpf	L715
1321  02f2               L524:
1322                     ; 410 			case 2 : //AC   B UP
1322                     ; 411 				if(VoCple > M_VoCple)
1324  02f2 be0e          	ldw	x,_tBC_Param+13
1325  02f4 b310          	cpw	x,_tBC_Param+15
1326  02f6 2203          	jrugt	L06
1327  02f8 cc03bc        	jp	L715
1328  02fb               L06:
1329                     ; 413 					F_OK = 1 ;
1331  02fb a601          	ld	a,#1
1332  02fd 6b01          	ld	(OFST+0,sp),a
1333  02ff acbc03bc      	jpf	L715
1334  0303               L724:
1335                     ; 417 			case 3 : //BC   A DOWN
1335                     ; 418 				if(VoCple < M_VoCple)
1337  0303 be0e          	ldw	x,_tBC_Param+13
1338  0305 b310          	cpw	x,_tBC_Param+15
1339  0307 2503          	jrult	L26
1340  0309 cc03bc        	jp	L715
1341  030c               L26:
1342                     ; 420 					F_OK = 1 ;
1344  030c a601          	ld	a,#1
1345  030e 6b01          	ld	(OFST+0,sp),a
1346  0310 acbc03bc      	jpf	L715
1347  0314               L134:
1348                     ; 424 			case 4 : //BA   C UP	
1348                     ; 425 				if(VoCple > M_VoCple)
1350  0314 be0e          	ldw	x,_tBC_Param+13
1351  0316 b310          	cpw	x,_tBC_Param+15
1352  0318 2203          	jrugt	L46
1353  031a cc03bc        	jp	L715
1354  031d               L46:
1355                     ; 427 					F_OK = 1 ;
1357  031d a601          	ld	a,#1
1358  031f 6b01          	ld	(OFST+0,sp),a
1359  0321 acbc03bc      	jpf	L715
1360  0325               L334:
1361                     ; 431 			case 5 ://CA  B DWON 		
1361                     ; 432 				if(VoCple < M_VoCple)
1363  0325 be0e          	ldw	x,_tBC_Param+13
1364  0327 b310          	cpw	x,_tBC_Param+15
1365  0329 2503          	jrult	L66
1366  032b cc03bc        	jp	L715
1367  032e               L66:
1368                     ; 434 					F_OK = 1 ;				
1370  032e a601          	ld	a,#1
1371  0330 6b01          	ld	(OFST+0,sp),a
1372  0332 acbc03bc      	jpf	L715
1373  0336               L534:
1374                     ; 438 			case 6 ://CB  A UP
1374                     ; 439 				if(VoCple > M_VoCple)
1376  0336 be0e          	ldw	x,_tBC_Param+13
1377  0338 b310          	cpw	x,_tBC_Param+15
1378  033a 2202          	jrugt	L07
1379  033c 207e          	jp	L715
1380  033e               L07:
1381                     ; 441 					F_OK = 1 ;
1383  033e a601          	ld	a,#1
1384  0340 6b01          	ld	(OFST+0,sp),a
1385  0342 2078          	jra	L715
1386  0344               L734:
1387                     ; 445 			default : 
1387                     ; 446 				break ;
1389  0344 2076          	jra	L715
1390  0346               L105:
1392  0346 2074          	jra	L715
1393  0348               L574:
1394                     ; 451 		switch(BldcStep)
1396  0348 b60a          	ld	a,_tBC_Param+9
1398                     ; 507 			default : 
1398                     ; 508 				break ;
1399  034a 4a            	dec	a
1400  034b 2711          	jreq	L144
1401  034d 4a            	dec	a
1402  034e 2722          	jreq	L344
1403  0350 4a            	dec	a
1404  0351 272b          	jreq	L544
1405  0353 4a            	dec	a
1406  0354 273c          	jreq	L744
1407  0356 4a            	dec	a
1408  0357 2745          	jreq	L154
1409  0359 4a            	dec	a
1410  035a 2756          	jreq	L354
1411  035c 205e          	jra	L715
1412  035e               L144:
1413                     ; 453 			case 1 : //AB   C UP
1413                     ; 454 				if(VoCple > M_VoCple)
1415  035e be0e          	ldw	x,_tBC_Param+13
1416  0360 b310          	cpw	x,_tBC_Param+15
1417  0362 2358          	jrule	L715
1418                     ; 456 					F_OK = 1 ;
1420  0364 a601          	ld	a,#1
1421  0366 6b01          	ld	(OFST+0,sp),a
1422                     ; 457 					if ( BldcStatus == STATUS_START)
1424  0368 b609          	ld	a,_tBC_Param+8
1425  036a a101          	cp	a,#1
1426  036c 264e          	jrne	L715
1427                     ; 459 						F_OK = 0;
1429  036e 0f01          	clr	(OFST+0,sp)
1430  0370 204a          	jra	L715
1431  0372               L344:
1432                     ; 464 			case 2 : //AC   B DOWN
1432                     ; 465 				if(VoCple < M_VoCple)
1434  0372 be0e          	ldw	x,_tBC_Param+13
1435  0374 b310          	cpw	x,_tBC_Param+15
1436  0376 2444          	jruge	L715
1437                     ; 467 					F_OK = 1 ;						
1439  0378 a601          	ld	a,#1
1440  037a 6b01          	ld	(OFST+0,sp),a
1441  037c 203e          	jra	L715
1442  037e               L544:
1443                     ; 471 			case 3 : //BC   A UP
1443                     ; 472 				if(VoCple > M_VoCple)
1445  037e be0e          	ldw	x,_tBC_Param+13
1446  0380 b310          	cpw	x,_tBC_Param+15
1447  0382 2338          	jrule	L715
1448                     ; 474 					F_OK = 1 ;
1450  0384 a601          	ld	a,#1
1451  0386 6b01          	ld	(OFST+0,sp),a
1452                     ; 475 					if ( BldcStatus == STATUS_START)
1454  0388 b609          	ld	a,_tBC_Param+8
1455  038a a101          	cp	a,#1
1456  038c 262e          	jrne	L715
1457                     ; 477 						F_OK = 0;
1459  038e 0f01          	clr	(OFST+0,sp)
1460  0390 202a          	jra	L715
1461  0392               L744:
1462                     ; 482 			case 4 : //BA   C DOWN	
1462                     ; 483 				if(VoCple < M_VoCple)
1464  0392 be0e          	ldw	x,_tBC_Param+13
1465  0394 b310          	cpw	x,_tBC_Param+15
1466  0396 2424          	jruge	L715
1467                     ; 485 					F_OK = 1 ;
1469  0398 a601          	ld	a,#1
1470  039a 6b01          	ld	(OFST+0,sp),a
1471  039c 201e          	jra	L715
1472  039e               L154:
1473                     ; 489 			case 5 ://CA  B UP
1473                     ; 490 				if(VoCple > M_VoCple)
1475  039e be0e          	ldw	x,_tBC_Param+13
1476  03a0 b310          	cpw	x,_tBC_Param+15
1477  03a2 2318          	jrule	L715
1478                     ; 492 					F_OK = 1 ;
1480  03a4 a601          	ld	a,#1
1481  03a6 6b01          	ld	(OFST+0,sp),a
1482                     ; 493 					if ( BldcStatus == STATUS_START)
1484  03a8 b609          	ld	a,_tBC_Param+8
1485  03aa a101          	cp	a,#1
1486  03ac 260e          	jrne	L715
1487                     ; 495 						F_OK = 0;
1489  03ae 0f01          	clr	(OFST+0,sp)
1490  03b0 200a          	jra	L715
1491  03b2               L354:
1492                     ; 500 			case 6 ://CB  A DOWN
1492                     ; 501 				if(VoCple < M_VoCple)
1494  03b2 be0e          	ldw	x,_tBC_Param+13
1495  03b4 b310          	cpw	x,_tBC_Param+15
1496  03b6 2404          	jruge	L715
1497                     ; 503 					F_OK = 1 ;
1499  03b8 a601          	ld	a,#1
1500  03ba 6b01          	ld	(OFST+0,sp),a
1501  03bc               L554:
1502                     ; 507 			default : 
1502                     ; 508 				break ;
1504  03bc               L325:
1505  03bc               L715:
1506                     ; 513 	if(F_OK)
1508  03bc 0d01          	tnz	(OFST+0,sp)
1509  03be 2728          	jreq	L745
1510                     ; 515 		if (tBC_Param.ucZeroCrossFlag)
1512  03c0 3d2b          	tnz	_tBC_Param+42
1513  03c2 271e          	jreq	L155
1514                     ; 517 			if (Direction == FAN)
1516  03c4 b614          	ld	a,_tBC_Param+19
1517  03c6 a101          	cp	a,#1
1518  03c8 260c          	jrne	L355
1519                     ; 519 				BldcStep = Tab_StepFan[BldcStep-1];
1521  03ca b60a          	ld	a,_tBC_Param+9
1522  03cc 5f            	clrw	x
1523  03cd 97            	ld	xl,a
1524  03ce 5a            	decw	x
1525  03cf d60000        	ld	a,(_Tab_StepFan,x)
1526  03d2 b70a          	ld	_tBC_Param+9,a
1528  03d4 2012          	jra	L745
1529  03d6               L355:
1530                     ; 523 				BldcStep = Tab_StepZen[BldcStep-1];
1532  03d6 b60a          	ld	a,_tBC_Param+9
1533  03d8 5f            	clrw	x
1534  03d9 97            	ld	xl,a
1535  03da 5a            	decw	x
1536  03db d60006        	ld	a,(_Tab_StepZen,x)
1537  03de b70a          	ld	_tBC_Param+9,a
1538  03e0 2006          	jra	L745
1539  03e2               L155:
1540                     ; 528 			tBC_Param.ucZeroCrossFlag = 1 ;
1542  03e2 3501002b      	mov	_tBC_Param+42,#1
1543                     ; 529 			F_OK = 0 ;
1545  03e6 0f01          	clr	(OFST+0,sp)
1546  03e8               L745:
1547                     ; 533 	return  F_OK  ;
1549  03e8 7b01          	ld	a,(OFST+0,sp)
1552  03ea 5b01          	addw	sp,#1
1553  03ec 81            	ret
1590                     ; 538 void BldcLik(void)
1590                     ; 539 {		
1591                     	switch	.text
1592  03ed               _BldcLik:
1594  03ed 88            	push	a
1595       00000001      OFST:	set	1
1598                     ; 540 	uint8 i =0 ;
1600  03ee 0f01          	clr	(OFST+0,sp)
1601                     ; 542 	if(T_DlyTest != 0)
1603  03f0 be0c          	ldw	x,_tBC_Param+11
1604  03f2 2709          	jreq	L775
1605                     ; 544 		T_DlyTest-- ;
1607  03f4 be0c          	ldw	x,_tBC_Param+11
1608  03f6 1d0001        	subw	x,#1
1609  03f9 bf0c          	ldw	_tBC_Param+11,x
1610                     ; 545 		return ;
1613  03fb 84            	pop	a
1614  03fc 81            	ret
1615  03fd               L775:
1616                     ; 548 	return;  // debug_winson
1619  03fd 84            	pop	a
1620  03fe 81            	ret
1647                     ; 564 void BldcRun(void)
1647                     ; 565 {	
1648                     	switch	.text
1649  03ff               _BldcRun:
1653                     ; 566 	if(T_DlyTest != 0) 
1655  03ff be0c          	ldw	x,_tBC_Param+11
1656  0401 2701          	jreq	L116
1657                     ; 567 		return ;
1660  0403 81            	ret
1661  0404               L116:
1662                     ; 569 	if(T_Dly60C > 15000)		
1664  0404 be05          	ldw	x,_tBC_Param+4
1665  0406 a33a99        	cpw	x,#15001
1666  0409 2508          	jrult	L316
1667                     ; 571 		T_Dly60C = 0 ;
1669  040b 5f            	clrw	x
1670  040c bf05          	ldw	_tBC_Param+4,x
1671                     ; 572 		Error_code.bit.ErRun = 1 ;	
1673  040e 72120000      	bset	_Error_code,#1
1674                     ; 573 		return ;
1677  0412 81            	ret
1678  0413               L316:
1679                     ; 576 	if(TstAndSwit())
1681  0413 cd02bd        	call	_TstAndSwit
1683  0416 4d            	tnz	a
1684  0417 273b          	jreq	L516
1685                     ; 579 		T_Dly30C = T_Dly60C ;
1687  0419 be05          	ldw	x,_tBC_Param+4
1688  041b bf07          	ldw	_tBC_Param+6,x
1689                     ; 585 		T_Dly30C -= 1 ; //减去滤波的时间
1691  041d be07          	ldw	x,_tBC_Param+6
1692  041f 1d0001        	subw	x,#1
1693  0422 bf07          	ldw	_tBC_Param+6,x
1694                     ; 587 		if(T_ReRun != 0)
1696  0424 3d0b          	tnz	_tBC_Param+10
1697  0426 270f          	jreq	L716
1698                     ; 589 			T_ReRun -- ;			
1700  0428 3a0b          	dec	_tBC_Param+10
1701                     ; 590 			bldc_run_onestep(BldcStep);	
1703  042a b60a          	ld	a,_tBC_Param+9
1704  042c ad48          	call	_bldc_run_onestep
1706                     ; 591 			T_DlyTest =  T_Dly30C>>1 ;	
1708  042e be07          	ldw	x,_tBC_Param+6
1709  0430 54            	srlw	x
1710  0431 bf0c          	ldw	_tBC_Param+11,x
1711                     ; 592 			T_Dly60C = 0 ;	
1713  0433 5f            	clrw	x
1714  0434 bf05          	ldw	_tBC_Param+4,x
1715                     ; 593 			return ;
1718  0436 81            	ret
1719  0437               L716:
1720                     ; 596 		BldcStatus = STATUS_DLY3C;
1722  0437 350b0009      	mov	_tBC_Param+8,#11
1723                     ; 598 		T_DlyTest = (T_Dly30C >> 1);
1725  043b be07          	ldw	x,_tBC_Param+6
1726  043d 54            	srlw	x
1727  043e bf0c          	ldw	_tBC_Param+11,x
1728                     ; 600 		if(R_CurPwm > 800)
1730  0440 be03          	ldw	x,_tBC_Param+2
1731  0442 a30321        	cpw	x,#801
1732  0445 250d          	jrult	L516
1733                     ; 602 			T_DlyTest += (T_Dly30C / 6) ;//20	
1735  0447 be07          	ldw	x,_tBC_Param+6
1736  0449 90ae0006      	ldw	y,#6
1737  044d 65            	divw	x,y
1738  044e 72bb000c      	addw	x,_tBC_Param+11
1739  0452 bf0c          	ldw	_tBC_Param+11,x
1740  0454               L516:
1741                     ; 605 }
1744  0454 81            	ret
1769                     ; 611 void  AutoRunOne(void)
1769                     ; 612 {
1770                     	switch	.text
1771  0455               _AutoRunOne:
1775                     ; 613 	if (Direction == FAN)
1777  0455 b614          	ld	a,_tBC_Param+19
1778  0457 a101          	cp	a,#1
1779  0459 260e          	jrne	L336
1780                     ; 615 		if(++BldcStep == 7)
1782  045b 3c0a          	inc	_tBC_Param+9
1783  045d b60a          	ld	a,_tBC_Param+9
1784  045f a107          	cp	a,#7
1785  0461 260e          	jrne	L736
1786                     ; 616 			BldcStep = 1 ;		
1788  0463 3501000a      	mov	_tBC_Param+9,#1
1789  0467 2008          	jra	L736
1790  0469               L336:
1791                     ; 620 		if(--BldcStep == 0)
1793  0469 3a0a          	dec	_tBC_Param+9
1794  046b 2604          	jrne	L736
1795                     ; 621 			BldcStep = 6 ;		
1797  046d 3506000a      	mov	_tBC_Param+9,#6
1798  0471               L736:
1799                     ; 624 	bldc_run_onestep(BldcStep);
1801  0471 b60a          	ld	a,_tBC_Param+9
1802  0473 ad01          	call	_bldc_run_onestep
1804                     ; 625 }
1807  0475 81            	ret
1842                     ; 634 void bldc_run_onestep(uint8 STEP)
1842                     ; 635 {
1843                     	switch	.text
1844  0476               _bldc_run_onestep:
1846  0476 88            	push	a
1847       00000000      OFST:	set	0
1850                     ; 636 	TIM1->CNTRH = 0 ;  //计数器清0
1852  0477 725f525e      	clr	21086
1853                     ; 637 	TIM1->CNTRL = 0 ;
1855  047b 725f525f      	clr	21087
1856                     ; 639 	if ( g_direction == 0 )
1858  047f 3d00          	tnz	_g_direction
1859  0481 2703          	jreq	L201
1860  0483 cc05f1        	jp	L517
1861  0486               L201:
1862                     ; 641 		switch(STEP)
1865                     ; 737 			default : 	
1865                     ; 738 				break ;
1866  0486 4a            	dec	a
1867  0487 271f          	jreq	L346
1868  0489 4a            	dec	a
1869  048a 2758          	jreq	L546
1870  048c 4a            	dec	a
1871  048d 2603cc0514    	jreq	L746
1872  0492 4a            	dec	a
1873  0493 2603          	jrne	L401
1874  0495 cc0550        	jp	L156
1875  0498               L401:
1876  0498 4a            	dec	a
1877  0499 2603          	jrne	L601
1878  049b cc0584        	jp	L356
1879  049e               L601:
1880  049e 4a            	dec	a
1881  049f 2603          	jrne	L011
1882  04a1 cc05bf        	jp	L556
1883  04a4               L011:
1884  04a4 ac480648      	jpf	L327
1885  04a8               L346:
1886                     ; 643 			case 1 : // AB
1886                     ; 644 				TIM1->CCMR1 =0x6c; 
1888  04a8 356c5258      	mov	21080,#108
1889                     ; 645 				TIM1->CCMR2 =0; 
1891  04ac 725f5259      	clr	21081
1892                     ; 646 				TIM1->CCMR3 =0; 
1894  04b0 725f525a      	clr	21082
1895                     ; 647 				PWM_AH_OUT_EN();
1897  04b4 7210525c      	bset	21084,#0
1898                     ; 648 				PWM_AL_OUT_EN();
1900  04b8 c6525c        	ld	a,21084
1901  04bb aa0c          	or	a,#12
1902  04bd c7525c        	ld	21084,a
1903                     ; 650 				PWM_BH_OUT_DIS();
1905  04c0 7219525c      	bres	21084,#4
1906                     ; 651 				PWM_BL_OUT_DIS();	
1908  04c4 721d525c      	bres	21084,#6
1909                     ; 652 				CNT_BH_OUT_DIS();
1911  04c8 7215500a      	bres	20490,#2
1912                     ; 653 				CNT_BL_OUT_EN();
1914  04cc 72125005      	bset	20485,#1
1915                     ; 655 				PWM_CH_OUT_DIS();
1917  04d0 7211525d      	bres	21085,#0
1918                     ; 656 				PWM_CL_OUT_DIS();
1920  04d4 7215525d      	bres	21085,#2
1921                     ; 657 				CNT_CH_OUT_DIS();
1923  04d8 7217500a      	bres	20490,#3
1924                     ; 658 				CNT_CL_OUT_DIS();
1926  04dc 72155005      	bres	20485,#2
1927                     ; 659 				break ;
1929  04e0 ac480648      	jpf	L327
1930  04e4               L546:
1931                     ; 660 			case 2 :	//AC
1931                     ; 661 				PWM_AH_OUT_EN();
1933  04e4 7210525c      	bset	21084,#0
1934                     ; 662 				PWM_AL_OUT_EN();
1936  04e8 c6525c        	ld	a,21084
1937  04eb aa0c          	or	a,#12
1938  04ed c7525c        	ld	21084,a
1939                     ; 664 				PWM_BH_OUT_DIS();
1941  04f0 7219525c      	bres	21084,#4
1942                     ; 665 				PWM_BL_OUT_DIS();
1944  04f4 721d525c      	bres	21084,#6
1945                     ; 666 				CNT_BH_OUT_DIS();
1947  04f8 7215500a      	bres	20490,#2
1948                     ; 667 				CNT_BL_OUT_DIS();
1950  04fc 72135005      	bres	20485,#1
1951                     ; 669 				PWM_CH_OUT_DIS();
1953  0500 7211525d      	bres	21085,#0
1954                     ; 670 				PWM_CL_OUT_DIS();	
1956  0504 7215525d      	bres	21085,#2
1957                     ; 671 				CNT_CH_OUT_DIS();
1959  0508 7217500a      	bres	20490,#3
1960                     ; 672 				CNT_CL_OUT_EN();
1962  050c 72145005      	bset	20485,#2
1963                     ; 673 				break ;
1965  0510 ac480648      	jpf	L327
1966  0514               L746:
1967                     ; 674 			case 3 : //BC
1967                     ; 675 				TIM1->CCMR1 =0; 
1969  0514 725f5258      	clr	21080
1970                     ; 676 				TIM1->CCMR2 =0x6c; 
1972  0518 356c5259      	mov	21081,#108
1973                     ; 677 				TIM1->CCMR3 =0; 
1975  051c 725f525a      	clr	21082
1976                     ; 678 				PWM_AH_OUT_DIS();
1978  0520 7211525c      	bres	21084,#0
1979                     ; 679 				PWM_AL_OUT_DIS();
1981  0524 7215525c      	bres	21084,#2
1982                     ; 680 				CNT_AH_OUT_DIS();
1984  0528 7213500a      	bres	20490,#1
1985                     ; 681 				CNT_AL_OUT_DIS();
1987  052c 72115005      	bres	20485,#0
1988                     ; 683 				PWM_BH_OUT_EN();
1990  0530 7218525c      	bset	21084,#4
1991                     ; 684 				PWM_BL_OUT_EN();
1993  0534 c6525c        	ld	a,21084
1994  0537 aac0          	or	a,#192
1995  0539 c7525c        	ld	21084,a
1996                     ; 686 				PWM_CH_OUT_DIS();
1998  053c 7211525d      	bres	21085,#0
1999                     ; 687 				PWM_CL_OUT_DIS();				
2001  0540 7215525d      	bres	21085,#2
2002                     ; 688 				CNT_CH_OUT_DIS();
2004  0544 7217500a      	bres	20490,#3
2005                     ; 689 				CNT_CL_OUT_EN();
2007  0548 72145005      	bset	20485,#2
2008                     ; 690 				break ;
2010  054c ac480648      	jpf	L327
2011  0550               L156:
2012                     ; 691 			case 4 ://BA
2012                     ; 692 				PWM_AH_OUT_DIS();
2014  0550 7211525c      	bres	21084,#0
2015                     ; 693 				PWM_AL_OUT_DIS();		
2017  0554 7215525c      	bres	21084,#2
2018                     ; 694 				CNT_AH_OUT_DIS();		
2020  0558 7213500a      	bres	20490,#1
2021                     ; 695 				CNT_AL_OUT_EN();		
2023  055c 72105005      	bset	20485,#0
2024                     ; 697 				PWM_BH_OUT_EN();
2026  0560 7218525c      	bset	21084,#4
2027                     ; 698 				PWM_BL_OUT_EN();
2029  0564 c6525c        	ld	a,21084
2030  0567 aac0          	or	a,#192
2031  0569 c7525c        	ld	21084,a
2032                     ; 700 				PWM_CH_OUT_EN();
2034  056c 7210525d      	bset	21085,#0
2035                     ; 701 				PWM_CL_OUT_EN();		
2037  0570 c6525d        	ld	a,21085
2038  0573 aa0c          	or	a,#12
2039  0575 c7525d        	ld	21085,a
2040                     ; 702 				CNT_CH_OUT_DIS();
2042  0578 7217500a      	bres	20490,#3
2043                     ; 703 				CNT_CL_OUT_DIS();
2045  057c 72155005      	bres	20485,#2
2046                     ; 704 				break ;
2048  0580 ac480648      	jpf	L327
2049  0584               L356:
2050                     ; 705 			case 5 ://CA
2050                     ; 706 				TIM1->CCMR1 =0; 
2052  0584 725f5258      	clr	21080
2053                     ; 707 				TIM1->CCMR2 =0; 
2055  0588 725f5259      	clr	21081
2056                     ; 708 				TIM1->CCMR3 =0x6c; 
2058  058c 356c525a      	mov	21082,#108
2059                     ; 710 				PWM_AH_OUT_DIS();
2061  0590 7211525c      	bres	21084,#0
2062                     ; 711 				PWM_AL_OUT_DIS();
2064  0594 7215525c      	bres	21084,#2
2065                     ; 712 				CNT_AH_OUT_DIS();		
2067  0598 7213500a      	bres	20490,#1
2068                     ; 713 				CNT_AL_OUT_EN();		
2070  059c 72105005      	bset	20485,#0
2071                     ; 715 				PWM_BH_OUT_DIS();
2073  05a0 7219525c      	bres	21084,#4
2074                     ; 716 				PWM_BL_OUT_DIS();
2076  05a4 721d525c      	bres	21084,#6
2077                     ; 717 				CNT_BH_OUT_DIS();
2079  05a8 7215500a      	bres	20490,#2
2080                     ; 718 				CNT_BL_OUT_DIS();
2082  05ac 72135005      	bres	20485,#1
2083                     ; 720 				PWM_CH_OUT_EN();
2085  05b0 7210525d      	bset	21085,#0
2086                     ; 721 				PWM_CL_OUT_EN();
2088  05b4 c6525d        	ld	a,21085
2089  05b7 aa0c          	or	a,#12
2090  05b9 c7525d        	ld	21085,a
2091                     ; 722 				break ;
2093  05bc cc0648        	jra	L327
2094  05bf               L556:
2095                     ; 723 			case 6 :	//CB
2095                     ; 724 				PWM_AH_OUT_DIS();
2097  05bf 7211525c      	bres	21084,#0
2098                     ; 725 				PWM_AL_OUT_DIS();
2100  05c3 7215525c      	bres	21084,#2
2101                     ; 726 				CNT_AH_OUT_DIS();		
2103  05c7 7213500a      	bres	20490,#1
2104                     ; 727 				CNT_AL_OUT_DIS();		
2106  05cb 72115005      	bres	20485,#0
2107                     ; 729 				PWM_BH_OUT_DIS();
2109  05cf 7219525c      	bres	21084,#4
2110                     ; 730 				PWM_BL_OUT_DIS();
2112  05d3 721d525c      	bres	21084,#6
2113                     ; 731 				CNT_BH_OUT_DIS();
2115  05d7 7215500a      	bres	20490,#2
2116                     ; 732 				CNT_BL_OUT_EN();
2118  05db 72125005      	bset	20485,#1
2119                     ; 734 				PWM_CH_OUT_EN();
2121  05df 7210525d      	bset	21085,#0
2122                     ; 735 				PWM_CL_OUT_EN();
2124  05e3 c6525d        	ld	a,21085
2125  05e6 aa0c          	or	a,#12
2126  05e8 c7525d        	ld	21085,a
2127                     ; 736 				break ;		
2129  05eb 205b          	jra	L327
2130  05ed               L756:
2131                     ; 737 			default : 	
2131                     ; 738 				break ;
2133  05ed 2059          	jra	L327
2134  05ef               L127:
2136  05ef 2057          	jra	L327
2137  05f1               L517:
2138                     ; 743 		switch(STEP)
2140  05f1 7b01          	ld	a,(OFST+1,sp)
2142                     ; 841 			default : 	
2142                     ; 842 				break ;
2143  05f3 4a            	dec	a
2144  05f4 271a          	jreq	L166
2145  05f6 4a            	dec	a
2146  05f7 2751          	jreq	L366
2147  05f9 4a            	dec	a
2148  05fa 277c          	jreq	L566
2149  05fc 4a            	dec	a
2150  05fd 2603          	jrne	L211
2151  05ff cc06b2        	jp	L766
2152  0602               L211:
2153  0602 4a            	dec	a
2154  0603 2603          	jrne	L411
2155  0605 cc06e1        	jp	L176
2156  0608               L411:
2157  0608 4a            	dec	a
2158  0609 2603          	jrne	L611
2159  060b cc071d        	jp	L376
2160  060e               L611:
2161  060e 2038          	jra	L327
2162  0610               L166:
2163                     ; 745 			case 1 : // AB
2163                     ; 746 				TIM1->CCMR1 =0x6c; 
2165  0610 356c5258      	mov	21080,#108
2166                     ; 747 				TIM1->CCMR2 =0; 
2168  0614 725f5259      	clr	21081
2169                     ; 748 				TIM1->CCMR3 =0; 
2171  0618 725f525a      	clr	21082
2172                     ; 749 				PWM_AH_OUT_EN();
2174  061c 7210525c      	bset	21084,#0
2175                     ; 750 				PWM_AL_OUT_EN();
2177  0620 c6525c        	ld	a,21084
2178  0623 aa0c          	or	a,#12
2179  0625 c7525c        	ld	21084,a
2180                     ; 752 				PWM_BH_OUT_DIS();
2182  0628 7219525c      	bres	21084,#4
2183                     ; 753 				PWM_BL_OUT_DIS();
2185  062c 721d525c      	bres	21084,#6
2186                     ; 754 				CNT_BH_OUT_DIS();
2188  0630 7215500a      	bres	20490,#2
2189                     ; 755 				CNT_BL_OUT_EN();
2191  0634 72125005      	bset	20485,#1
2192                     ; 757 				PWM_CH_OUT_DIS();
2194  0638 7211525d      	bres	21085,#0
2195                     ; 758 				PWM_CL_OUT_DIS();
2197  063c 7215525d      	bres	21085,#2
2198                     ; 759 				CNT_CH_OUT_DIS();
2200  0640 7217500a      	bres	20490,#3
2201                     ; 760 				CNT_CL_OUT_DIS();
2203  0644 72155005      	bres	20485,#2
2204                     ; 761 				break ;
2205  0648               L327:
2206                     ; 845 }
2209  0648 84            	pop	a
2210  0649 81            	ret
2211  064a               L366:
2212                     ; 762 			case 2 :	//AC
2212                     ; 763 				PWM_AH_OUT_EN();
2214  064a 7210525c      	bset	21084,#0
2215                     ; 764 				PWM_AL_OUT_EN();
2217  064e c6525c        	ld	a,21084
2218  0651 aa0c          	or	a,#12
2219  0653 c7525c        	ld	21084,a
2220                     ; 766 				PWM_BH_OUT_DIS();
2222  0656 7219525c      	bres	21084,#4
2223                     ; 767 				PWM_BL_OUT_DIS();
2225  065a 721d525c      	bres	21084,#6
2226                     ; 768 				CNT_BH_OUT_DIS();
2228  065e 7215500a      	bres	20490,#2
2229                     ; 769 				CNT_BL_OUT_DIS();
2231  0662 72135005      	bres	20485,#1
2232                     ; 771 				PWM_CH_OUT_DIS();
2234  0666 7211525d      	bres	21085,#0
2235                     ; 772 				PWM_CL_OUT_DIS();
2237  066a 7215525d      	bres	21085,#2
2238                     ; 773 				CNT_CH_OUT_DIS();
2240  066e 7217500a      	bres	20490,#3
2241                     ; 774 				CNT_CL_OUT_EN();
2243  0672 72145005      	bset	20485,#2
2244                     ; 775 				break ;
2246  0676 20d0          	jra	L327
2247  0678               L566:
2248                     ; 776 			case 3 : //BC
2248                     ; 777 				TIM1->CCMR1 =0; 
2250  0678 725f5258      	clr	21080
2251                     ; 778 				TIM1->CCMR2 =0; 
2253  067c 725f5259      	clr	21081
2254                     ; 779 				TIM1->CCMR3 =0x6c; 
2256  0680 356c525a      	mov	21082,#108
2257                     ; 780 				PWM_AH_OUT_DIS();
2259  0684 7211525c      	bres	21084,#0
2260                     ; 781 				PWM_AL_OUT_DIS();
2262  0688 7215525c      	bres	21084,#2
2263                     ; 782 				CNT_AH_OUT_DIS();
2265  068c 7213500a      	bres	20490,#1
2266                     ; 783 				CNT_AL_OUT_EN();
2268  0690 72105005      	bset	20485,#0
2269                     ; 785 				PWM_BH_OUT_DIS();
2271  0694 7219525c      	bres	21084,#4
2272                     ; 786 				PWM_BL_OUT_DIS();
2274  0698 721d525c      	bres	21084,#6
2275                     ; 787 				CNT_BH_OUT_DIS();
2277  069c 7215500a      	bres	20490,#2
2278                     ; 788 				CNT_BL_OUT_DIS();
2280  06a0 72135005      	bres	20485,#1
2281                     ; 790 				PWM_CH_OUT_EN();
2283  06a4 7210525d      	bset	21085,#0
2284                     ; 791 				PWM_CL_OUT_EN();
2286  06a8 c6525d        	ld	a,21085
2287  06ab aa0c          	or	a,#12
2288  06ad c7525d        	ld	21085,a
2289                     ; 792 				break ;
2291  06b0 2096          	jra	L327
2292  06b2               L766:
2293                     ; 793 			case 4 ://BA
2293                     ; 794 				PWM_AH_OUT_DIS();
2295  06b2 7211525c      	bres	21084,#0
2296                     ; 795 				PWM_AL_OUT_DIS();
2298  06b6 7215525c      	bres	21084,#2
2299                     ; 796 				CNT_AH_OUT_DIS();
2301  06ba 7213500a      	bres	20490,#1
2302                     ; 797 				CNT_AL_OUT_DIS();
2304  06be 72115005      	bres	20485,#0
2305                     ; 799 				PWM_BH_OUT_DIS();
2307  06c2 7219525c      	bres	21084,#4
2308                     ; 800 				PWM_BL_OUT_DIS();
2310  06c6 721d525c      	bres	21084,#6
2311                     ; 801 				CNT_BH_OUT_DIS();
2313  06ca 7215500a      	bres	20490,#2
2314                     ; 802 				CNT_BL_OUT_EN();
2316  06ce 72125005      	bset	20485,#1
2317                     ; 804 				PWM_CH_OUT_EN();
2319  06d2 7210525d      	bset	21085,#0
2320                     ; 805 				PWM_CL_OUT_EN();
2322  06d6 c6525d        	ld	a,21085
2323  06d9 aa0c          	or	a,#12
2324  06db c7525d        	ld	21085,a
2325                     ; 806 				break ;
2327  06de cc0648        	jra	L327
2328  06e1               L176:
2329                     ; 807 			case 5 ://CA
2329                     ; 808 				TIM1->CCMR1 =0; 
2331  06e1 725f5258      	clr	21080
2332                     ; 809 				TIM1->CCMR2 =0x6c; 
2334  06e5 356c5259      	mov	21081,#108
2335                     ; 810 				TIM1->CCMR3 =0; 
2337  06e9 725f525a      	clr	21082
2338                     ; 812 				PWM_AH_OUT_DIS();
2340  06ed 7211525c      	bres	21084,#0
2341                     ; 813 				PWM_AL_OUT_DIS();
2343  06f1 7215525c      	bres	21084,#2
2344                     ; 814 				CNT_AH_OUT_DIS();
2346  06f5 7213500a      	bres	20490,#1
2347                     ; 815 				CNT_AL_OUT_DIS();
2349  06f9 72115005      	bres	20485,#0
2350                     ; 817 				PWM_BH_OUT_EN();
2352  06fd 7218525c      	bset	21084,#4
2353                     ; 818 				PWM_BL_OUT_EN();
2355  0701 c6525c        	ld	a,21084
2356  0704 aac0          	or	a,#192
2357  0706 c7525c        	ld	21084,a
2358                     ; 820 				PWM_CH_OUT_DIS();
2360  0709 7211525d      	bres	21085,#0
2361                     ; 821 				PWM_CL_OUT_DIS();
2363  070d 7215525d      	bres	21085,#2
2364                     ; 822 				CNT_CH_OUT_DIS();
2366  0711 7217500a      	bres	20490,#3
2367                     ; 823 				CNT_CL_OUT_EN();
2369  0715 72145005      	bset	20485,#2
2370                     ; 824 				break ;
2372  0719 ac480648      	jpf	L327
2373  071d               L376:
2374                     ; 825 			case 6 :	//CB
2374                     ; 826 				PWM_AH_OUT_DIS();
2376  071d 7211525c      	bres	21084,#0
2377                     ; 827 				PWM_AL_OUT_DIS();
2379  0721 7215525c      	bres	21084,#2
2380                     ; 828 				CNT_AH_OUT_DIS();
2382  0725 7213500a      	bres	20490,#1
2383                     ; 829 				CNT_AL_OUT_EN();
2385  0729 72105005      	bset	20485,#0
2386                     ; 831 				PWM_BH_OUT_EN();
2388  072d 7218525c      	bset	21084,#4
2389                     ; 832 				PWM_BL_OUT_EN();
2391  0731 c6525c        	ld	a,21084
2392  0734 aac0          	or	a,#192
2393  0736 c7525c        	ld	21084,a
2394                     ; 833 				CNT_BH_OUT_DIS();
2396  0739 7215500a      	bres	20490,#2
2397                     ; 834 				CNT_BL_OUT_EN();
2399  073d 72125005      	bset	20485,#1
2400                     ; 836 				PWM_CH_OUT_DIS();
2402  0741 7211525d      	bres	21085,#0
2403                     ; 837 				PWM_CL_OUT_DIS();
2405  0745 7215525d      	bres	21085,#2
2406                     ; 838 				CNT_CH_OUT_DIS();
2408  0749 7217500a      	bres	20490,#3
2409                     ; 839 				CNT_CL_OUT_DIS();
2411  074d 72155005      	bres	20485,#2
2412                     ; 840 				break ;		
2414  0751 ac480648      	jpf	L327
2415  0755               L576:
2416                     ; 841 			default : 	
2416                     ; 842 				break ;
2418  0755 ac480648      	jpf	L327
2419  0759               L727:
2420  0759 ac480648      	jpf	L327
2842                     	xdef	_TstAndSwit
2843                     	xdef	_Nop
2844                     	xdef	_DISP_TAB
2845                     	xdef	_Tab_StepZen
2846                     	xdef	_Tab_StepFan
2847                     	xdef	_KSTBL
2848                     	xdef	_KSTB
2849                     	xdef	_KLST
2850                     	xdef	_g_direction
2851                     	xdef	_bldc_run_onestep
2852                     	xdef	_AutoRunOne
2853                     	xdef	_BldcRun
2854                     	xdef	_BldcLik
2855                     	xdef	_Check_BEMF_Voltage
2856                     	xdef	_SpeedRefAccDec
2857                     	xdef	_CmdPwmSlow
2858                     	xdef	_DISP_Display
2859                     	xdef	_BldcBak
2860                     	xdef	_Key_Check
2861                     	xdef	_Run_Ctl
2862                     	xdef	_Led_Light
2863                     	xdef	_Timer1_PWM_Value
2864                     	xdef	_Timer1_CCR4_Value
2865                     	xdef	_AdcSwitch
2866                     	xdef	_OffSixPin
2867                     	switch	.ubsct
2868  0000               _Error_code:
2869  0000 00            	ds.b	1
2870                     	xdef	_Error_code
2871  0001               _tBC_Param:
2872  0001 000000000000  	ds.b	46
2873                     	xdef	_tBC_Param
2874                     	xref	_SPI_GetFlagStatus
2875                     	xref	_SPI_SendData
2876                     	xref	_GPIO_WriteLow
2877                     	xref	_GPIO_WriteHigh
2897                     	end
