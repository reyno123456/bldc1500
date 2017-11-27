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
 602                     ; 334 	TIM2->SR1 = 0x00;  // 清除更新标志
 604  0082 725f5302      	clr	21250
 605                     ; 345  }
 608  0086 80            	iret
 631                     ; 352  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 631                     ; 353  {
 632                     	switch	.text
 633  0087               f_TIM2_CAP_COM_IRQHandler:
 637                     ; 357  }
 640  0087 80            	iret
 663                     ; 367  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 663                     ; 368  {
 664                     	switch	.text
 665  0088               f_TIM3_UPD_OVF_BRK_IRQHandler:
 669                     ; 372  }
 672  0088 80            	iret
 695                     ; 379  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 695                     ; 380  {
 696                     	switch	.text
 697  0089               f_TIM3_CAP_COM_IRQHandler:
 701                     ; 384  }
 704  0089 80            	iret
 727                     ; 394  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 727                     ; 395  {
 728                     	switch	.text
 729  008a               f_UART1_TX_IRQHandler:
 733                     ; 399  }
 736  008a 80            	iret
 759                     ; 406  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 759                     ; 407  {
 760                     	switch	.text
 761  008b               f_UART1_RX_IRQHandler:
 765                     ; 411  }
 768  008b 80            	iret
 790                     ; 445 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 790                     ; 446 {
 791                     	switch	.text
 792  008c               f_I2C_IRQHandler:
 796                     ; 450 }
 799  008c 80            	iret
 822                     ; 484  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 822                     ; 485  {
 823                     	switch	.text
 824  008d               f_UART3_TX_IRQHandler:
 828                     ; 489  }
 831  008d 80            	iret
 854                     ; 496  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 854                     ; 497  {
 855                     	switch	.text
 856  008e               f_UART3_RX_IRQHandler:
 860                     ; 501  }
 863  008e 80            	iret
 885                     ; 510  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 885                     ; 511  {
 886                     	switch	.text
 887  008f               f_ADC2_IRQHandler:
 891                     ; 515  }
 894  008f 80            	iret
 896                     	bsct
 897  0003               L333_usCnt:
 898  0003 0000          	dc.w	0
 899  0005               L533_IT_NT1:
 900  0005 0000          	dc.w	0
 901  0007               L733_usPwmValue:
 902  0007 0001          	dc.w	1
 970                     ; 550 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 970                     ; 551 {
 971                     	switch	.text
 972  0090               f_TIM4_UPD_OVF_IRQHandler:
 974       00000002      OFST:	set	2
 975  0090 3b0002        	push	c_x+2
 976  0093 be00          	ldw	x,c_x
 977  0095 89            	pushw	x
 978  0096 3b0002        	push	c_y+2
 979  0099 be00          	ldw	x,c_y
 980  009b 89            	pushw	x
 981  009c 89            	pushw	x
 984                     ; 558 	TIM4->SR1 = 0x00;  // 清除更新标志
 986  009d 725f5342      	clr	21314
 987                     ; 569 	usCnt++;
 989  00a1 be03          	ldw	x,L333_usCnt
 990  00a3 1c0001        	addw	x,#1
 991  00a6 bf03          	ldw	L333_usCnt,x
 992                     ; 570 	if(usCnt >= 5)    // 20us * 50 = 1ms
 994  00a8 be03          	ldw	x,L333_usCnt
 995  00aa a30005        	cpw	x,#5
 996  00ad 250a          	jrult	L373
 997                     ; 572 		usCnt = 0 ;
 999  00af 5f            	clrw	x
1000  00b0 bf03          	ldw	L333_usCnt,x
1001                     ; 573 		tBC_Param.usTick1ms++;
1003  00b2 be17          	ldw	x,_tBC_Param+23
1004  00b4 1c0001        	addw	x,#1
1005  00b7 bf17          	ldw	_tBC_Param+23,x
1006  00b9               L373:
1007                     ; 577 	if(BldcStatus == STATUS_STOP)
1009  00b9 3d08          	tnz	_tBC_Param+8
1010  00bb 2609          	jrne	L573
1011                     ; 579 		usPwmValue = 1;
1013  00bd ae0001        	ldw	x,#1
1014  00c0 bf07          	ldw	L733_usPwmValue,x
1015                     ; 580 		return ;
1017  00c2 acb001b0      	jpf	L47
1018  00c6               L573:
1019                     ; 583 	T_Dly60C++;
1021  00c6 be04          	ldw	x,_tBC_Param+4
1022  00c8 1c0001        	addw	x,#1
1023  00cb bf04          	ldw	_tBC_Param+4,x
1024                     ; 585 	if ( BldcStatus == STATUS_START)   // 启动中	
1026  00cd b608          	ld	a,_tBC_Param+8
1027  00cf a101          	cp	a,#1
1028  00d1 2674          	jrne	L773
1029                     ; 587 		if (tBC_Param.StartStep == 0 )	//运行第一步
1031  00d3 be11          	ldw	x,_tBC_Param+17
1032  00d5 2615          	jrne	L104
1033                     ; 589 			T_Dly60C = 0 ;
1035  00d7 5f            	clrw	x
1036  00d8 bf04          	ldw	_tBC_Param+4,x
1037                     ; 590 			tBC_Param.StartStep ++ ;
1039  00da be11          	ldw	x,_tBC_Param+17
1040  00dc 1c0001        	addw	x,#1
1041  00df bf11          	ldw	_tBC_Param+17,x
1042                     ; 591 			Timer1_PWM_Value(R_CurPwm);
1044  00e1 be02          	ldw	x,_tBC_Param+2
1045  00e3 cd0000        	call	_Timer1_PWM_Value
1047                     ; 592 			AutoRunOne() ;
1049  00e6 cd0000        	call	_AutoRunOne
1051                     ; 593 			IT_NT1 = 0;
1053  00e9 5f            	clrw	x
1054  00ea bf05          	ldw	L533_IT_NT1,x
1055  00ec               L104:
1056                     ; 596 		if (tBC_Param.StartStep >= 20)
1058  00ec be11          	ldw	x,_tBC_Param+17
1059  00ee a30014        	cpw	x,#20
1060  00f1 2504          	jrult	L304
1061                     ; 598 			TIM1_CMP4_IEN_ENB();
1063  00f3 72185254      	bset	21076,#4
1064  00f7               L304:
1065                     ; 601 		IT_NT1++;
1067  00f7 be05          	ldw	x,L533_IT_NT1
1068  00f9 1c0001        	addw	x,#1
1069  00fc bf05          	ldw	L533_IT_NT1,x
1070                     ; 602 		if (IT_NT1 >= START_ORIEN_PERIOD)
1072  00fe be05          	ldw	x,L533_IT_NT1
1073  0100 a307d0        	cpw	x,#2000
1074  0103 2516          	jrult	L504
1075                     ; 604 			IT_NT1  = 0 ;
1077  0105 5f            	clrw	x
1078  0106 bf05          	ldw	L533_IT_NT1,x
1079                     ; 605 			if(R_CurPwm <= V_PWMRUN_MIN)
1081  0108 be02          	ldw	x,_tBC_Param+2
1082  010a a30015        	cpw	x,#21
1083  010d 240c          	jruge	L504
1084                     ; 607 				R_CurPwm ++ ;
1086  010f be02          	ldw	x,_tBC_Param+2
1087  0111 1c0001        	addw	x,#1
1088  0114 bf02          	ldw	_tBC_Param+2,x
1089                     ; 608 				Timer1_PWM_Value(R_CurPwm);
1091  0116 be02          	ldw	x,_tBC_Param+2
1092  0118 cd0000        	call	_Timer1_PWM_Value
1094  011b               L504:
1095                     ; 612 		if (T_Dly60C >= START_INIT_PERIOD)
1097  011b be04          	ldw	x,_tBC_Param+4
1098  011d a303e8        	cpw	x,#1000
1099  0120 2404          	jruge	L67
1100  0122 acb001b0      	jpf	L714
1101  0126               L67:
1102                     ; 614 			T_Dly60C = 0;
1104  0126 5f            	clrw	x
1105  0127 bf04          	ldw	_tBC_Param+4,x
1106                     ; 616 			tBC_Param.StartStep++;
1108  0129 be11          	ldw	x,_tBC_Param+17
1109  012b 1c0001        	addw	x,#1
1110  012e bf11          	ldw	_tBC_Param+17,x
1111                     ; 617 			if (tBC_Param.StartStep > 2000)
1113  0130 be11          	ldw	x,_tBC_Param+17
1114  0132 a307d1        	cpw	x,#2001
1115  0135 2506          	jrult	L314
1116                     ; 619 				Error_code.bit.ErStart = 1 ;
1118  0137 72100000      	bset	_Error_code,#0
1120  013b 2073          	jra	L714
1121  013d               L314:
1122                     ; 623 				AutoRunOne();
1124  013d cd0000        	call	_AutoRunOne
1126                     ; 624 				T_DlyTest = DEMAGNETIZE;
1128  0140 ae0010        	ldw	x,#16
1129  0143 bf0b          	ldw	_tBC_Param+11,x
1130  0145 2069          	jra	L714
1131  0147               L773:
1132                     ; 628 	else if(BldcStatus == STATUS_RUN )   // 运行中
1134  0147 b608          	ld	a,_tBC_Param+8
1135  0149 a10a          	cp	a,#10
1136  014b 2644          	jrne	L124
1137                     ; 630 		IT_NT1++ ;
1139  014d be05          	ldw	x,L533_IT_NT1
1140  014f 1c0001        	addw	x,#1
1141  0152 bf05          	ldw	L533_IT_NT1,x
1142                     ; 631 		if( IT_NT1 >= 4000)
1144  0154 be05          	ldw	x,L533_IT_NT1
1145  0156 a30fa0        	cpw	x,#4000
1146  0159 2506          	jrult	L324
1147                     ; 633 			IT_NT1  = 0 ;
1149  015b 5f            	clrw	x
1150  015c bf05          	ldw	L533_IT_NT1,x
1151                     ; 634 			CmdPwmSlow() ;
1153  015e cd0000        	call	_CmdPwmSlow
1155  0161               L324:
1156                     ; 638 		if(T_DlyTest != 0)
1158  0161 be0b          	ldw	x,_tBC_Param+11
1159  0163 2709          	jreq	L524
1160                     ; 640 			T_DlyTest-- ;
1162  0165 be0b          	ldw	x,_tBC_Param+11
1163  0167 1d0001        	subw	x,#1
1164  016a bf0b          	ldw	_tBC_Param+11,x
1166  016c 2042          	jra	L714
1167  016e               L524:
1168                     ; 644 			usValue = ((uint16)TIM1->CNTRH<<8)+TIM1->CNTRL;
1170  016e c6525e        	ld	a,21086
1171  0171 5f            	clrw	x
1172  0172 97            	ld	xl,a
1173  0173 4f            	clr	a
1174  0174 02            	rlwa	x,a
1175  0175 01            	rrwa	x,a
1176  0176 cb525f        	add	a,21087
1177  0179 2401          	jrnc	L27
1178  017b 5c            	incw	x
1179  017c               L27:
1180  017c 02            	rlwa	x,a
1181  017d 1f01          	ldw	(OFST-1,sp),x
1182  017f 01            	rrwa	x,a
1183                     ; 645 			if (usValue < (R_CurPwm-10))
1185  0180 be02          	ldw	x,_tBC_Param+2
1186  0182 1d000a        	subw	x,#10
1187  0185 1301          	cpw	x,(OFST-1,sp)
1188  0187 2327          	jrule	L714
1189                     ; 647 				Check_BEMF_Voltage();
1191  0189 cd0000        	call	_Check_BEMF_Voltage
1193                     ; 648 				BldcRun();
1195  018c cd0000        	call	_BldcRun
1197  018f 201f          	jra	L714
1198  0191               L124:
1199                     ; 652 	else if( BldcStatus == STATUS_DLY3C)// 延时30C中
1201  0191 b608          	ld	a,_tBC_Param+8
1202  0193 a10b          	cp	a,#11
1203  0195 2619          	jrne	L714
1204                     ; 654 		T_Dly30C -- ;
1206  0197 be06          	ldw	x,_tBC_Param+6
1207  0199 1d0001        	subw	x,#1
1208  019c bf06          	ldw	_tBC_Param+6,x
1209                     ; 655 		if(T_Dly30C == 0)
1211  019e be06          	ldw	x,_tBC_Param+6
1212  01a0 260e          	jrne	L714
1213                     ; 657 			BLDC_RUN_ONESTEP(BldcStep);	
1215  01a2 b609          	ld	a,_tBC_Param+9
1216  01a4 cd0000        	call	_BLDC_RUN_ONESTEP
1218                     ; 658 			BldcStatus = STATUS_RUN ;
1220  01a7 350a0008      	mov	_tBC_Param+8,#10
1221                     ; 659 			tBC_Param.ucZeroCrossFlag = 0 ;
1223  01ab 3f2a          	clr	_tBC_Param+42
1224                     ; 662 			T_Dly60C = 0 ;	
1226  01ad 5f            	clrw	x
1227  01ae bf04          	ldw	_tBC_Param+4,x
1228  01b0               L714:
1229                     ; 666 }
1230  01b0               L47:
1233  01b0 5b02          	addw	sp,#2
1234  01b2 85            	popw	x
1235  01b3 bf00          	ldw	c_y,x
1236  01b5 320002        	pop	c_y+2
1237  01b8 85            	popw	x
1238  01b9 bf00          	ldw	c_x,x
1239  01bb 320002        	pop	c_x+2
1240  01be 80            	iret
1263                     ; 675 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1263                     ; 676 {
1264                     	switch	.text
1265  01bf               f_EEPROM_EEC_IRQHandler:
1269                     ; 680 }
1272  01bf 80            	iret
1284                     	xref	_BLDC_RUN_ONESTEP
1285                     	xref	_AutoRunOne
1286                     	xref	_BldcRun
1287                     	xref	_BldcLik
1288                     	xref	_Check_BEMF_Voltage
1289                     	xref	_CmdPwmSlow
1290                     	xref	_Timer1_PWM_Value
1291                     	xref	_AdcSwitch
1292                     	xref.b	_Error_code
1293                     	xref.b	_tBC_Param
1294                     	xdef	f_EEPROM_EEC_IRQHandler
1295                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1296                     	xdef	f_ADC2_IRQHandler
1297                     	xdef	f_UART3_TX_IRQHandler
1298                     	xdef	f_UART3_RX_IRQHandler
1299                     	xdef	f_I2C_IRQHandler
1300                     	xdef	f_UART1_RX_IRQHandler
1301                     	xdef	f_UART1_TX_IRQHandler
1302                     	xdef	f_TIM3_CAP_COM_IRQHandler
1303                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1304                     	xdef	f_TIM2_CAP_COM_IRQHandler
1305                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1306                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1307                     	xdef	f_TIM1_CAP_COM_IRQHandler
1308                     	xdef	f_SPI_IRQHandler
1309                     	xdef	f_EXTI_PORTE_IRQHandler
1310                     	xdef	f_EXTI_PORTD_IRQHandler
1311                     	xdef	f_EXTI_PORTC_IRQHandler
1312                     	xdef	f_EXTI_PORTB_IRQHandler
1313                     	xdef	f_EXTI_PORTA_IRQHandler
1314                     	xdef	f_CLK_IRQHandler
1315                     	xdef	f_AWU_IRQHandler
1316                     	xdef	f_TLI_IRQHandler
1317                     	xdef	f_TRAP_IRQHandler
1318                     	xdef	f_NonHandledInterrupt
1319                     	xref.b	c_x
1320                     	xref.b	c_y
1339                     	end
