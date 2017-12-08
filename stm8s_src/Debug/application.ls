   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _g_app_state:
  17  0000 00            	dc.b	0
  66                     ; 9 void delay_us(unsigned int us)
  66                     ; 10 {
  68                     	switch	.text
  69  0000               _delay_us:
  71  0000 89            	pushw	x
  72  0001 89            	pushw	x
  73       00000002      OFST:	set	2
  76                     ; 12 	for (i = 0; i < us; i++)
  78  0002 5f            	clrw	x
  79  0003 1f01          	ldw	(OFST-1,sp),x
  81  0005 2007          	jra	L14
  82  0007               L53:
  85  0007 1e01          	ldw	x,(OFST-1,sp)
  86  0009 1c0001        	addw	x,#1
  87  000c 1f01          	ldw	(OFST-1,sp),x
  88  000e               L14:
  91  000e 1e01          	ldw	x,(OFST-1,sp)
  92  0010 1303          	cpw	x,(OFST+1,sp)
  93  0012 25f3          	jrult	L53
  94                     ; 16 }
  97  0014 5b04          	addw	sp,#4
  98  0016 81            	ret
 150                     ; 18 void delay_ms(unsigned int ms)
 150                     ; 19 {
 151                     	switch	.text
 152  0017               _delay_ms:
 154  0017 89            	pushw	x
 155  0018 5204          	subw	sp,#4
 156       00000004      OFST:	set	4
 159                     ; 21 	for (j = 0; j < ms; j++)
 161  001a 5f            	clrw	x
 162  001b 1f01          	ldw	(OFST-3,sp),x
 164  001d 2018          	jra	L77
 165  001f               L37:
 166                     ; 23 		for (i = 0; i < 1000; i++)
 168  001f 5f            	clrw	x
 169  0020 1f03          	ldw	(OFST-1,sp),x
 170  0022               L301:
 173  0022 1e03          	ldw	x,(OFST-1,sp)
 174  0024 1c0001        	addw	x,#1
 175  0027 1f03          	ldw	(OFST-1,sp),x
 178  0029 1e03          	ldw	x,(OFST-1,sp)
 179  002b a303e8        	cpw	x,#1000
 180  002e 25f2          	jrult	L301
 181                     ; 21 	for (j = 0; j < ms; j++)
 183  0030 1e01          	ldw	x,(OFST-3,sp)
 184  0032 1c0001        	addw	x,#1
 185  0035 1f01          	ldw	(OFST-3,sp),x
 186  0037               L77:
 189  0037 1e01          	ldw	x,(OFST-3,sp)
 190  0039 1305          	cpw	x,(OFST+1,sp)
 191  003b 25e2          	jrult	L37
 192                     ; 28 }
 195  003d 5b06          	addw	sp,#6
 196  003f 81            	ret
 221                     ; 30 static void AppStopToAlignment(void)
 221                     ; 31 {
 222                     	switch	.text
 223  0040               L111_AppStopToAlignment:
 227                     ; 32 	Timer1_PWM_Value(400);
 229  0040 ae0190        	ldw	x,#400
 230  0043 cd0000        	call	_Timer1_PWM_Value
 232                     ; 33 	PWM_AH_OUT_DIS();
 234  0046 7211525c      	bres	21084,#0
 235                     ; 34 	PWM_BH_OUT_DIS();
 237  004a 7219525c      	bres	21084,#4
 238                     ; 35 	PWM_CH_OUT_EN();
 240  004e 7210525d      	bset	21085,#0
 241                     ; 36 	CNT_AL_OUT_EN();
 243  0052 72105005      	bset	20485,#0
 244                     ; 37 	CNT_BL_OUT_EN();
 246  0056 72125005      	bset	20485,#1
 247                     ; 38 	CNT_CL_OUT_DIS();
 249  005a 72155005      	bres	20485,#2
 250                     ; 40 	delay_ms(100);
 252  005e ae0064        	ldw	x,#100
 253  0061 adb4          	call	_delay_ms
 255                     ; 42 	Timer1_PWM_Value(50);
 257  0063 ae0032        	ldw	x,#50
 258  0066 cd0000        	call	_Timer1_PWM_Value
 260                     ; 43 	PWM_AH_OUT_DIS();
 262  0069 7211525c      	bres	21084,#0
 263                     ; 44 	PWM_BH_OUT_DIS();
 265  006d 7219525c      	bres	21084,#4
 266                     ; 45 	PWM_CH_OUT_DIS();
 268  0071 7211525d      	bres	21085,#0
 269                     ; 46 	CNT_AL_OUT_DIS();
 271  0075 72115005      	bres	20485,#0
 272                     ; 47 	CNT_BL_OUT_DIS();
 274  0079 72135005      	bres	20485,#1
 275                     ; 48 	CNT_CL_OUT_DIS();	
 277  007d 72155005      	bres	20485,#2
 278                     ; 49 }
 281  0081 81            	ret
 336                     ; 51 static void bldc_one_loop(unsigned short duty, unsigned int ms)
 336                     ; 52 {
 337                     	switch	.text
 338  0082               L3_bldc_one_loop:
 340  0082 89            	pushw	x
 341  0083 88            	push	a
 342       00000001      OFST:	set	1
 345                     ; 54 	Timer1_PWM_Value(duty);
 347  0084 cd0000        	call	_Timer1_PWM_Value
 349                     ; 56 	for (flag = 1; flag <= 6; flag++)
 351  0087 a601          	ld	a,#1
 352  0089 6b01          	ld	(OFST+0,sp),a
 353  008b               L151:
 354                     ; 58 		bldc_run_onestep(flag);
 356  008b 7b01          	ld	a,(OFST+0,sp)
 357  008d cd0000        	call	_bldc_run_onestep
 359                     ; 59 		delay_ms(ms);
 361  0090 1e06          	ldw	x,(OFST+5,sp)
 362  0092 ad83          	call	_delay_ms
 364                     ; 56 	for (flag = 1; flag <= 6; flag++)
 366  0094 0c01          	inc	(OFST+0,sp)
 369  0096 7b01          	ld	a,(OFST+0,sp)
 370  0098 a107          	cp	a,#7
 371  009a 25ef          	jrult	L151
 372                     ; 61 }
 375  009c 5b03          	addw	sp,#3
 376  009e 81            	ret
 379                     	bsct
 380  0001               L161_step:
 381  0001 01            	dc.b	1
 382  0002               L361_adc_value:
 383  0002 0000          	dc.w	0
 443                     ; 63 static void bldc_open_loop(void)
 443                     ; 64 {
 444                     	switch	.text
 445  009f               L751_bldc_open_loop:
 447  009f 5204          	subw	sp,#4
 448       00000004      OFST:	set	4
 451                     ; 66 	unsigned int ms = 121;
 453  00a1 ae0079        	ldw	x,#121
 454  00a4 1f01          	ldw	(OFST-3,sp),x
 455                     ; 78 	bldc_one_loop(10, 100);
 457  00a6 ae0064        	ldw	x,#100
 458  00a9 89            	pushw	x
 459  00aa ae000a        	ldw	x,#10
 460  00ad add3          	call	L3_bldc_one_loop
 462  00af 85            	popw	x
 463                     ; 79 	bldc_one_loop(20, 80);
 465  00b0 ae0050        	ldw	x,#80
 466  00b3 89            	pushw	x
 467  00b4 ae0014        	ldw	x,#20
 468  00b7 adc9          	call	L3_bldc_one_loop
 470  00b9 85            	popw	x
 471                     ; 80 	bldc_one_loop(30, 60);
 473  00ba ae003c        	ldw	x,#60
 474  00bd 89            	pushw	x
 475  00be ae001e        	ldw	x,#30
 476  00c1 adbf          	call	L3_bldc_one_loop
 478  00c3 85            	popw	x
 479                     ; 81 	bldc_one_loop(40, 50);
 481  00c4 ae0032        	ldw	x,#50
 482  00c7 89            	pushw	x
 483  00c8 ae0028        	ldw	x,#40
 484  00cb adb5          	call	L3_bldc_one_loop
 486  00cd 85            	popw	x
 487                     ; 82 	bldc_one_loop(50, 40);
 489  00ce ae0028        	ldw	x,#40
 490  00d1 89            	pushw	x
 491  00d2 ae0032        	ldw	x,#50
 492  00d5 adab          	call	L3_bldc_one_loop
 494  00d7 85            	popw	x
 495                     ; 83 	bldc_one_loop(60, 30);
 497  00d8 ae001e        	ldw	x,#30
 498  00db 89            	pushw	x
 499  00dc ae003c        	ldw	x,#60
 500  00df ada1          	call	L3_bldc_one_loop
 502  00e1 85            	popw	x
 503                     ; 84 	bldc_one_loop(70, 20);
 505  00e2 ae0014        	ldw	x,#20
 506  00e5 89            	pushw	x
 507  00e6 ae0046        	ldw	x,#70
 508  00e9 ad97          	call	L3_bldc_one_loop
 510  00eb 85            	popw	x
 511  00ec               L712:
 512                     ; 88 	for (i = 0; i < 10; i++)
 514  00ec 5f            	clrw	x
 515  00ed 1f03          	ldw	(OFST-1,sp),x
 516  00ef               L322:
 517                     ; 90 		bldc_one_loop(70, 20);
 519  00ef ae0014        	ldw	x,#20
 520  00f2 89            	pushw	x
 521  00f3 ae0046        	ldw	x,#70
 522  00f6 ad8a          	call	L3_bldc_one_loop
 524  00f8 85            	popw	x
 525                     ; 88 	for (i = 0; i < 10; i++)
 527  00f9 1e03          	ldw	x,(OFST-1,sp)
 528  00fb 1c0001        	addw	x,#1
 529  00fe 1f03          	ldw	(OFST-1,sp),x
 532  0100 1e03          	ldw	x,(OFST-1,sp)
 533  0102 a3000a        	cpw	x,#10
 534  0105 25e8          	jrult	L322
 536  0107 20e3          	jra	L712
 539                     .const:	section	.text
 540  0000               _AppStateMachine:
 542  0000 0109          	dc.w	_AppInit
 544  0002 010e          	dc.w	_AppCalib
 546  0004 0116          	dc.w	_AppAlignment
 548  0006 011b          	dc.w	_AppStart
 550  0008 0122          	dc.w	_AppRun
 552  000a 0123          	dc.w	_AppStop
 554  000c 0124          	dc.w	_AppFault
 576                     ; 205 void AppInit(void)
 576                     ; 206 {
 577                     	switch	.text
 578  0109               _AppInit:
 582                     ; 207 	g_app_state = APP_CALIB;
 584  0109 35010000      	mov	_g_app_state,#1
 585                     ; 208 }
 588  010d 81            	ret
 613                     ; 210 void AppCalib(void)
 613                     ; 211 {
 614                     	switch	.text
 615  010e               _AppCalib:
 619                     ; 212 	AppStopToAlignment();
 621  010e cd0040        	call	L111_AppStopToAlignment
 623                     ; 214 	g_app_state = APP_ALIGNMENT;
 625  0111 35020000      	mov	_g_app_state,#2
 626                     ; 215 }
 629  0115 81            	ret
 653                     ; 217 void AppAlignment(void)
 653                     ; 218 {
 654                     	switch	.text
 655  0116               _AppAlignment:
 659                     ; 219 	g_app_state = APP_START;
 661  0116 35030000      	mov	_g_app_state,#3
 662                     ; 220 }
 665  011a 81            	ret
 690                     ; 222 void AppStart(void)
 690                     ; 223 {
 691                     	switch	.text
 692  011b               _AppStart:
 696                     ; 224 	bldc_open_loop();
 698  011b ad82          	call	L751_bldc_open_loop
 700                     ; 225 	g_app_state = APP_RUN;
 702  011d 35040000      	mov	_g_app_state,#4
 703                     ; 226 }
 706  0121 81            	ret
 729                     ; 228 void AppRun(void)
 729                     ; 229 {
 730                     	switch	.text
 731  0122               _AppRun:
 735                     ; 231 }
 738  0122 81            	ret
 761                     ; 233 void AppStop(void)
 761                     ; 234 {
 762                     	switch	.text
 763  0123               _AppStop:
 767                     ; 236 }
 770  0123 81            	ret
 793                     ; 238 void AppFault(void)
 793                     ; 239 {
 794                     	switch	.text
 795  0124               _AppFault:
 799                     ; 241 }
 802  0124 81            	ret
 805                     	bsct
 806  0004               L123_flag:
 807  0004 0000          	dc.w	0
 840                     ; 243 void function_test(void)
 840                     ; 244 {
 841                     	switch	.text
 842  0125               _function_test:
 846  0125               L143:
 847                     ; 248 		if (flag == 0){
 849  0125 be04          	ldw	x,L123_flag
 850  0127 2611          	jrne	L543
 851                     ; 249 			LED_RUN_ON();
 853  0129 7217500f      	bres	20495,#3
 854                     ; 250 			delay_ms(1000);
 856  012d ae03e8        	ldw	x,#1000
 857  0130 cd0017        	call	_delay_ms
 859                     ; 251 			flag = 1;
 861  0133 ae0001        	ldw	x,#1
 862  0136 bf04          	ldw	L123_flag,x
 864  0138 20eb          	jra	L143
 865  013a               L543:
 866                     ; 253 			LED_RUN_OFF();
 868  013a 7216500f      	bset	20495,#3
 869                     ; 254 			delay_ms(1000);
 871  013e ae03e8        	ldw	x,#1000
 872  0141 cd0017        	call	_delay_ms
 874                     ; 255 			flag = 0;
 876  0144 5f            	clrw	x
 877  0145 bf04          	ldw	L123_flag,x
 878  0147 20dc          	jra	L143
 914                     	xref	_bldc_run_onestep
 915                     	xref	_Timer1_PWM_Value
 916                     	xdef	_AppStateMachine
 917                     	xdef	_g_app_state
 918                     	xdef	_function_test
 919                     	xdef	_AppFault
 920                     	xdef	_AppStop
 921                     	xdef	_AppRun
 922                     	xdef	_AppStart
 923                     	xdef	_AppAlignment
 924                     	xdef	_AppCalib
 925                     	xdef	_AppInit
 926                     	xdef	_delay_ms
 927                     	xdef	_delay_us
 946                     	end
