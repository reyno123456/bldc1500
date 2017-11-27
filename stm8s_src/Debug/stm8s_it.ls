   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 55 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 56 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 60 }
  53  0000 80            	iret
  75                     ; 68 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 69 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 73 }
  84  0001 80            	iret
 106                     ; 80 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 81 
 106                     ; 82 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 86 }
 115  0002 80            	iret
 137                     ; 93 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 94 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 98 }
 146  0003 80            	iret
 168                     ; 105 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 106 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 110 }
 177  0004 80            	iret
 200                     ; 117 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 118 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 122 }
 209  0005 80            	iret
 232                     ; 129 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 130 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 134 }
 241  0006 80            	iret
 264                     ; 141 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 142 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 146 }
 273  0007 80            	iret
 296                     ; 153 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 154 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 158 }
 305  0008 80            	iret
 328                     ; 165 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 166 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 170 }
 337  0009 80            	iret
 359                     ; 217 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 218 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 222 }
 368  000a 80            	iret
 392                     ; 229 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 392                     ; 230 {
 393                     	switch	.text
 394  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 234 	TIM1->SR1 &= (u8)(~BIT7);
 400  000b 721f5255      	bres	21077,#7
 401                     ; 235 	Error_code.bit.OverCurrent = 1 ;
 403  000f 72140000      	bset	_Error_code,#2
 404                     ; 236 }
 407  0013 80            	iret
 409                     	bsct
 410  0000               L151_It:
 411  0000 0000          	dc.w	0
 412  0002               L351_ucFlag:
 413  0002 00            	dc.b	0
 469                     ; 243 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 469                     ; 244 {
 470                     	switch	.text
 471  0014               f_TIM1_CAP_COM_IRQHandler:
 473       00000002      OFST:	set	2
 474  0014 3b0002        	push	c_x+2
 475  0017 be00          	ldw	x,c_x
 476  0019 89            	pushw	x
 477  001a 3b0002        	push	c_y+2
 478  001d be00          	ldw	x,c_y
 479  001f 89            	pushw	x
 480  0020 89            	pushw	x
 483                     ; 249 	volatile uint16 Value = 0 ;
 485  0021 5f            	clrw	x
 486  0022 1f01          	ldw	(OFST-1,sp),x
 487                     ; 252 	TIM1->SR1 &= 0xEF ;	//clr interrupt flag	
 489  0024 72195255      	bres	21077,#4
 490                     ; 254 	if (BldcStatus == STATUS_STOP)
 492  0028 3d08          	tnz	_tBC_Param+8
 493  002a 2747          	jreq	L24
 494                     ; 256 		return ;
 496                     ; 259 	Check_BEMF_Voltage();
 498  002c cd0000        	call	_Check_BEMF_Voltage
 500                     ; 261 	AdcSwitch(PHASE_REF_ADC_CHAN);
 502  002f a607          	ld	a,#7
 503  0031 cd0000        	call	_AdcSwitch
 505                     ; 262 	tBC_Param.R_VRAD = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
 507  0034 c65404        	ld	a,21508
 508  0037 5f            	clrw	x
 509  0038 97            	ld	xl,a
 510  0039 58            	sllw	x
 511  003a 58            	sllw	x
 512  003b 01            	rrwa	x,a
 513  003c cb5405        	add	a,21509
 514  003f 2401          	jrnc	L63
 515  0041 5c            	incw	x
 516  0042               L63:
 517  0042 b722          	ld	_tBC_Param+34,a
 518  0044 9f            	ld	a,xl
 519  0045 b721          	ld	_tBC_Param+33,a
 520                     ; 263 	AdcSwitch(PHASE_FED_ADC_CHAN);
 522  0047 a606          	ld	a,#6
 523  0049 cd0000        	call	_AdcSwitch
 525                     ; 264 	tBC_Param.PresFedAD = ((uint16)ADC2->DRH<<2) + ADC2->DRL;
 527  004c c65404        	ld	a,21508
 528  004f 5f            	clrw	x
 529  0050 97            	ld	xl,a
 530  0051 58            	sllw	x
 531  0052 58            	sllw	x
 532  0053 01            	rrwa	x,a
 533  0054 cb5405        	add	a,21509
 534  0057 2401          	jrnc	L04
 535  0059 5c            	incw	x
 536  005a               L04:
 537  005a b724          	ld	_tBC_Param+36,a
 538  005c 9f            	ld	a,xl
 539  005d b723          	ld	_tBC_Param+35,a
 540                     ; 286 	if (BldcStatus == STATUS_RUN)	
 542  005f b608          	ld	a,_tBC_Param+8
 543  0061 a10a          	cp	a,#10
 544  0063 2605          	jrne	L502
 545                     ; 288 		BldcRun() ;
 547  0065 cd0000        	call	_BldcRun
 550  0068 2009          	jra	L702
 551  006a               L502:
 552                     ; 290 	else if (BldcStatus == STATUS_START)	
 554  006a b608          	ld	a,_tBC_Param+8
 555  006c a101          	cp	a,#1
 556  006e 2603          	jrne	L702
 557                     ; 292 		BldcLik() ;	
 559  0070 cd0000        	call	_BldcLik
 561  0073               L702:
 562                     ; 294 }
 563  0073               L24:
 566  0073 5b02          	addw	sp,#2
 567  0075 85            	popw	x
 568  0076 bf00          	ldw	c_y,x
 569  0078 320002        	pop	c_y+2
 570  007b 85            	popw	x
 571  007c bf00          	ldw	c_x,x
 572  007e 320002        	pop	c_x+2
 573  0081 80            	iret
 596                     ; 327  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 596                     ; 328  {
 597                     	switch	.text
 598  0082               f_TIM2_UPD_OVF_BRK_IRQHandler:
 602                     ; 332  }
 605  0082 80            	iret
 628                     ; 339  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 628                     ; 340  {
 629                     	switch	.text
 630  0083               f_TIM2_CAP_COM_IRQHandler:
 634                     ; 344  }
 637  0083 80            	iret
 660                     ; 354  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 660                     ; 355  {
 661                     	switch	.text
 662  0084               f_TIM3_UPD_OVF_BRK_IRQHandler:
 666                     ; 359  }
 669  0084 80            	iret
 692                     ; 366  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 692                     ; 367  {
 693                     	switch	.text
 694  0085               f_TIM3_CAP_COM_IRQHandler:
 698                     ; 371  }
 701  0085 80            	iret
 724                     ; 381  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 724                     ; 382  {
 725                     	switch	.text
 726  0086               f_UART1_TX_IRQHandler:
 730                     ; 386  }
 733  0086 80            	iret
 756                     ; 393  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 756                     ; 394  {
 757                     	switch	.text
 758  0087               f_UART1_RX_IRQHandler:
 762                     ; 398  }
 765  0087 80            	iret
 787                     ; 432 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 787                     ; 433 {
 788                     	switch	.text
 789  0088               f_I2C_IRQHandler:
 793                     ; 437 }
 796  0088 80            	iret
 819                     ; 471  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 819                     ; 472  {
 820                     	switch	.text
 821  0089               f_UART3_TX_IRQHandler:
 825                     ; 476  }
 828  0089 80            	iret
 851                     ; 483  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 851                     ; 484  {
 852                     	switch	.text
 853  008a               f_UART3_RX_IRQHandler:
 857                     ; 488  }
 860  008a 80            	iret
 882                     ; 497  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 882                     ; 498  {
 883                     	switch	.text
 884  008b               f_ADC2_IRQHandler:
 888                     ; 502  }
 891  008b 80            	iret
 893                     	bsct
 894  0003               L333_usCnt:
 895  0003 0000          	dc.w	0
 896  0005               L533_IT_NT1:
 897  0005 0000          	dc.w	0
 898  0007               L733_usPwmValue:
 899  0007 0001          	dc.w	1
 967                     ; 537 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 967                     ; 538 {
 968                     	switch	.text
 969  008c               f_TIM4_UPD_OVF_IRQHandler:
 971       00000002      OFST:	set	2
 972  008c 3b0002        	push	c_x+2
 973  008f be00          	ldw	x,c_x
 974  0091 89            	pushw	x
 975  0092 3b0002        	push	c_y+2
 976  0095 be00          	ldw	x,c_y
 977  0097 89            	pushw	x
 978  0098 89            	pushw	x
 981                     ; 544 	TIM4->SR1 = 0x00;  // 清除更新标志
 983  0099 725f5342      	clr	21314
 984                     ; 546 	usCnt++;
 986  009d be03          	ldw	x,L333_usCnt
 987  009f 1c0001        	addw	x,#1
 988  00a2 bf03          	ldw	L333_usCnt,x
 989                     ; 547 	if(usCnt >= 50)    // 20us * 50 = 1ms
 991  00a4 be03          	ldw	x,L333_usCnt
 992  00a6 a30032        	cpw	x,#50
 993  00a9 250a          	jrult	L373
 994                     ; 549 		usCnt = 0 ;
 996  00ab 5f            	clrw	x
 997  00ac bf03          	ldw	L333_usCnt,x
 998                     ; 550 		tBC_Param.usTick1ms++;
1000  00ae be17          	ldw	x,_tBC_Param+23
1001  00b0 1c0001        	addw	x,#1
1002  00b3 bf17          	ldw	_tBC_Param+23,x
1003  00b5               L373:
1004                     ; 554 	if(BldcStatus == STATUS_STOP)
1006  00b5 3d08          	tnz	_tBC_Param+8
1007  00b7 2609          	jrne	L573
1008                     ; 556 		usPwmValue = 1;
1010  00b9 ae0001        	ldw	x,#1
1011  00bc bf07          	ldw	L733_usPwmValue,x
1012                     ; 557 		return ;
1014  00be acac01ac      	jpf	L47
1015  00c2               L573:
1016                     ; 560 	T_Dly60C++;
1018  00c2 be04          	ldw	x,_tBC_Param+4
1019  00c4 1c0001        	addw	x,#1
1020  00c7 bf04          	ldw	_tBC_Param+4,x
1021                     ; 562 	if ( BldcStatus == STATUS_START)   // 启动中	
1023  00c9 b608          	ld	a,_tBC_Param+8
1024  00cb a101          	cp	a,#1
1025  00cd 2674          	jrne	L773
1026                     ; 564 		if (tBC_Param.StartStep == 0 )	//运行第一步
1028  00cf be11          	ldw	x,_tBC_Param+17
1029  00d1 2615          	jrne	L104
1030                     ; 566 			T_Dly60C = 0 ;
1032  00d3 5f            	clrw	x
1033  00d4 bf04          	ldw	_tBC_Param+4,x
1034                     ; 567 			tBC_Param.StartStep ++ ;
1036  00d6 be11          	ldw	x,_tBC_Param+17
1037  00d8 1c0001        	addw	x,#1
1038  00db bf11          	ldw	_tBC_Param+17,x
1039                     ; 568 			Timer1_PWM_Value(R_CurPwm);
1041  00dd be02          	ldw	x,_tBC_Param+2
1042  00df cd0000        	call	_Timer1_PWM_Value
1044                     ; 569 			AutoRunOne() ;
1046  00e2 cd0000        	call	_AutoRunOne
1048                     ; 570 			IT_NT1 = 0;
1050  00e5 5f            	clrw	x
1051  00e6 bf05          	ldw	L533_IT_NT1,x
1052  00e8               L104:
1053                     ; 573 		if (tBC_Param.StartStep >= 20)
1055  00e8 be11          	ldw	x,_tBC_Param+17
1056  00ea a30014        	cpw	x,#20
1057  00ed 2504          	jrult	L304
1058                     ; 575 			TIM1_CMP4_IEN_ENB();
1060  00ef 72185254      	bset	21076,#4
1061  00f3               L304:
1062                     ; 578 		IT_NT1++;
1064  00f3 be05          	ldw	x,L533_IT_NT1
1065  00f5 1c0001        	addw	x,#1
1066  00f8 bf05          	ldw	L533_IT_NT1,x
1067                     ; 579 		if (IT_NT1 >= START_ORIEN_PERIOD)
1069  00fa be05          	ldw	x,L533_IT_NT1
1070  00fc a307d0        	cpw	x,#2000
1071  00ff 2516          	jrult	L504
1072                     ; 581 			IT_NT1  = 0 ;
1074  0101 5f            	clrw	x
1075  0102 bf05          	ldw	L533_IT_NT1,x
1076                     ; 582 			if(R_CurPwm <= V_PWMRUN_MIN)
1078  0104 be02          	ldw	x,_tBC_Param+2
1079  0106 a30015        	cpw	x,#21
1080  0109 240c          	jruge	L504
1081                     ; 584 				R_CurPwm ++ ;
1083  010b be02          	ldw	x,_tBC_Param+2
1084  010d 1c0001        	addw	x,#1
1085  0110 bf02          	ldw	_tBC_Param+2,x
1086                     ; 585 				Timer1_PWM_Value(R_CurPwm);
1088  0112 be02          	ldw	x,_tBC_Param+2
1089  0114 cd0000        	call	_Timer1_PWM_Value
1091  0117               L504:
1092                     ; 589 		if (T_Dly60C >= START_INIT_PERIOD)
1094  0117 be04          	ldw	x,_tBC_Param+4
1095  0119 a303e8        	cpw	x,#1000
1096  011c 2404          	jruge	L67
1097  011e acac01ac      	jpf	L714
1098  0122               L67:
1099                     ; 591 			T_Dly60C = 0;
1101  0122 5f            	clrw	x
1102  0123 bf04          	ldw	_tBC_Param+4,x
1103                     ; 593 			tBC_Param.StartStep++;
1105  0125 be11          	ldw	x,_tBC_Param+17
1106  0127 1c0001        	addw	x,#1
1107  012a bf11          	ldw	_tBC_Param+17,x
1108                     ; 594 			if (tBC_Param.StartStep > 2000)
1110  012c be11          	ldw	x,_tBC_Param+17
1111  012e a307d1        	cpw	x,#2001
1112  0131 2506          	jrult	L314
1113                     ; 596 				Error_code.bit.ErStart = 1 ;
1115  0133 72100000      	bset	_Error_code,#0
1117  0137 2073          	jra	L714
1118  0139               L314:
1119                     ; 600 				AutoRunOne();
1121  0139 cd0000        	call	_AutoRunOne
1123                     ; 601 				T_DlyTest = DEMAGNETIZE;
1125  013c ae0010        	ldw	x,#16
1126  013f bf0b          	ldw	_tBC_Param+11,x
1127  0141 2069          	jra	L714
1128  0143               L773:
1129                     ; 605 	else if(BldcStatus == STATUS_RUN )   // 运行中
1131  0143 b608          	ld	a,_tBC_Param+8
1132  0145 a10a          	cp	a,#10
1133  0147 2644          	jrne	L124
1134                     ; 607 		IT_NT1++ ;
1136  0149 be05          	ldw	x,L533_IT_NT1
1137  014b 1c0001        	addw	x,#1
1138  014e bf05          	ldw	L533_IT_NT1,x
1139                     ; 608 		if( IT_NT1 >= 4000)
1141  0150 be05          	ldw	x,L533_IT_NT1
1142  0152 a30fa0        	cpw	x,#4000
1143  0155 2506          	jrult	L324
1144                     ; 610 			IT_NT1  = 0 ;
1146  0157 5f            	clrw	x
1147  0158 bf05          	ldw	L533_IT_NT1,x
1148                     ; 611 			CmdPwmSlow() ;
1150  015a cd0000        	call	_CmdPwmSlow
1152  015d               L324:
1153                     ; 615 		if(T_DlyTest != 0)
1155  015d be0b          	ldw	x,_tBC_Param+11
1156  015f 2709          	jreq	L524
1157                     ; 617 			T_DlyTest-- ;
1159  0161 be0b          	ldw	x,_tBC_Param+11
1160  0163 1d0001        	subw	x,#1
1161  0166 bf0b          	ldw	_tBC_Param+11,x
1163  0168 2042          	jra	L714
1164  016a               L524:
1165                     ; 621 			usValue = ((uint16)TIM1->CNTRH<<8)+TIM1->CNTRL;
1167  016a c6525e        	ld	a,21086
1168  016d 5f            	clrw	x
1169  016e 97            	ld	xl,a
1170  016f 4f            	clr	a
1171  0170 02            	rlwa	x,a
1172  0171 01            	rrwa	x,a
1173  0172 cb525f        	add	a,21087
1174  0175 2401          	jrnc	L27
1175  0177 5c            	incw	x
1176  0178               L27:
1177  0178 02            	rlwa	x,a
1178  0179 1f01          	ldw	(OFST-1,sp),x
1179  017b 01            	rrwa	x,a
1180                     ; 622 			if (usValue < (R_CurPwm-10))
1182  017c be02          	ldw	x,_tBC_Param+2
1183  017e 1d000a        	subw	x,#10
1184  0181 1301          	cpw	x,(OFST-1,sp)
1185  0183 2327          	jrule	L714
1186                     ; 624 				Check_BEMF_Voltage();
1188  0185 cd0000        	call	_Check_BEMF_Voltage
1190                     ; 625 				BldcRun();
1192  0188 cd0000        	call	_BldcRun
1194  018b 201f          	jra	L714
1195  018d               L124:
1196                     ; 629 	else if( BldcStatus == STATUS_DLY3C)// 延时30C中
1198  018d b608          	ld	a,_tBC_Param+8
1199  018f a10b          	cp	a,#11
1200  0191 2619          	jrne	L714
1201                     ; 631 		T_Dly30C -- ;
1203  0193 be06          	ldw	x,_tBC_Param+6
1204  0195 1d0001        	subw	x,#1
1205  0198 bf06          	ldw	_tBC_Param+6,x
1206                     ; 632 		if(T_Dly30C == 0)
1208  019a be06          	ldw	x,_tBC_Param+6
1209  019c 260e          	jrne	L714
1210                     ; 634 			BLDC_RUN_ONESTEP(BldcStep);	
1212  019e b609          	ld	a,_tBC_Param+9
1213  01a0 cd0000        	call	_BLDC_RUN_ONESTEP
1215                     ; 635 			BldcStatus = STATUS_RUN ;
1217  01a3 350a0008      	mov	_tBC_Param+8,#10
1218                     ; 636 			tBC_Param.ucZeroCrossFlag = 0 ;
1220  01a7 3f2a          	clr	_tBC_Param+42
1221                     ; 639 			T_Dly60C = 0 ;	
1223  01a9 5f            	clrw	x
1224  01aa bf04          	ldw	_tBC_Param+4,x
1225  01ac               L714:
1226                     ; 643 }
1227  01ac               L47:
1230  01ac 5b02          	addw	sp,#2
1231  01ae 85            	popw	x
1232  01af bf00          	ldw	c_y,x
1233  01b1 320002        	pop	c_y+2
1234  01b4 85            	popw	x
1235  01b5 bf00          	ldw	c_x,x
1236  01b7 320002        	pop	c_x+2
1237  01ba 80            	iret
1260                     ; 652 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1260                     ; 653 {
1261                     	switch	.text
1262  01bb               f_EEPROM_EEC_IRQHandler:
1266                     ; 657 }
1269  01bb 80            	iret
1281                     	xref	_BLDC_RUN_ONESTEP
1282                     	xref	_AutoRunOne
1283                     	xref	_BldcRun
1284                     	xref	_BldcLik
1285                     	xref	_Check_BEMF_Voltage
1286                     	xref	_CmdPwmSlow
1287                     	xref	_Timer1_PWM_Value
1288                     	xref	_AdcSwitch
1289                     	xref.b	_Error_code
1290                     	xref.b	_tBC_Param
1291                     	xdef	f_EEPROM_EEC_IRQHandler
1292                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1293                     	xdef	f_ADC2_IRQHandler
1294                     	xdef	f_UART3_TX_IRQHandler
1295                     	xdef	f_UART3_RX_IRQHandler
1296                     	xdef	f_I2C_IRQHandler
1297                     	xdef	f_UART1_RX_IRQHandler
1298                     	xdef	f_UART1_TX_IRQHandler
1299                     	xdef	f_TIM3_CAP_COM_IRQHandler
1300                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1301                     	xdef	f_TIM2_CAP_COM_IRQHandler
1302                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1303                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1304                     	xdef	f_TIM1_CAP_COM_IRQHandler
1305                     	xdef	f_SPI_IRQHandler
1306                     	xdef	f_EXTI_PORTE_IRQHandler
1307                     	xdef	f_EXTI_PORTD_IRQHandler
1308                     	xdef	f_EXTI_PORTC_IRQHandler
1309                     	xdef	f_EXTI_PORTB_IRQHandler
1310                     	xdef	f_EXTI_PORTA_IRQHandler
1311                     	xdef	f_CLK_IRQHandler
1312                     	xdef	f_AWU_IRQHandler
1313                     	xdef	f_TLI_IRQHandler
1314                     	xdef	f_TRAP_IRQHandler
1315                     	xdef	f_NonHandledInterrupt
1316                     	xref.b	c_x
1317                     	xref.b	c_y
1336                     	end
