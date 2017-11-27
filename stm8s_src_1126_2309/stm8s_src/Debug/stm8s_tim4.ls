   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 49 void TIM4_DeInit(void)
  43                     ; 50 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  52  0000 725f5340      	clr	21312
  53                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  55  0004 725f5341      	clr	21313
  56                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  58  0008 725f5344      	clr	21316
  59                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  61  000c 725f5345      	clr	21317
  62                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  64  0010 35ff5346      	mov	21318,#255
  65                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  67  0014 725f5342      	clr	21314
  68                     ; 57 }
  71  0018 81            	ret
 178                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 178                     ; 66 {
 179                     	switch	.text
 180  0019               _TIM4_TimeBaseInit:
 182  0019 89            	pushw	x
 183       00000000      OFST:	set	0
 186                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 188  001a 9e            	ld	a,xh
 189  001b 4d            	tnz	a
 190  001c 2723          	jreq	L21
 191  001e 9e            	ld	a,xh
 192  001f a101          	cp	a,#1
 193  0021 271e          	jreq	L21
 194  0023 9e            	ld	a,xh
 195  0024 a102          	cp	a,#2
 196  0026 2719          	jreq	L21
 197  0028 9e            	ld	a,xh
 198  0029 a103          	cp	a,#3
 199  002b 2714          	jreq	L21
 200  002d 9e            	ld	a,xh
 201  002e a104          	cp	a,#4
 202  0030 270f          	jreq	L21
 203  0032 9e            	ld	a,xh
 204  0033 a105          	cp	a,#5
 205  0035 270a          	jreq	L21
 206  0037 9e            	ld	a,xh
 207  0038 a106          	cp	a,#6
 208  003a 2705          	jreq	L21
 209  003c 9e            	ld	a,xh
 210  003d a107          	cp	a,#7
 211  003f 2603          	jrne	L01
 212  0041               L21:
 213  0041 4f            	clr	a
 214  0042 2010          	jra	L41
 215  0044               L01:
 216  0044 ae0044        	ldw	x,#68
 217  0047 89            	pushw	x
 218  0048 ae0000        	ldw	x,#0
 219  004b 89            	pushw	x
 220  004c ae0000        	ldw	x,#L76
 221  004f cd0000        	call	_assert_failed
 223  0052 5b04          	addw	sp,#4
 224  0054               L41:
 225                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 227  0054 7b01          	ld	a,(OFST+1,sp)
 228  0056 c75345        	ld	21317,a
 229                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 231  0059 7b02          	ld	a,(OFST+2,sp)
 232  005b c75346        	ld	21318,a
 233                     ; 73 }
 236  005e 85            	popw	x
 237  005f 81            	ret
 293                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 293                     ; 82 {
 294                     	switch	.text
 295  0060               _TIM4_Cmd:
 297  0060 88            	push	a
 298       00000000      OFST:	set	0
 301                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 303  0061 4d            	tnz	a
 304  0062 2704          	jreq	L22
 305  0064 a101          	cp	a,#1
 306  0066 2603          	jrne	L02
 307  0068               L22:
 308  0068 4f            	clr	a
 309  0069 2010          	jra	L42
 310  006b               L02:
 311  006b ae0054        	ldw	x,#84
 312  006e 89            	pushw	x
 313  006f ae0000        	ldw	x,#0
 314  0072 89            	pushw	x
 315  0073 ae0000        	ldw	x,#L76
 316  0076 cd0000        	call	_assert_failed
 318  0079 5b04          	addw	sp,#4
 319  007b               L42:
 320                     ; 87   if (NewState != DISABLE)
 322  007b 0d01          	tnz	(OFST+1,sp)
 323  007d 2706          	jreq	L711
 324                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 326  007f 72105340      	bset	21312,#0
 328  0083 2004          	jra	L121
 329  0085               L711:
 330                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 332  0085 72115340      	bres	21312,#0
 333  0089               L121:
 334                     ; 95 }
 337  0089 84            	pop	a
 338  008a 81            	ret
 397                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 397                     ; 108 {
 398                     	switch	.text
 399  008b               _TIM4_ITConfig:
 401  008b 89            	pushw	x
 402       00000000      OFST:	set	0
 405                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 407  008c 9e            	ld	a,xh
 408  008d a101          	cp	a,#1
 409  008f 2603          	jrne	L03
 410  0091 4f            	clr	a
 411  0092 2010          	jra	L23
 412  0094               L03:
 413  0094 ae006e        	ldw	x,#110
 414  0097 89            	pushw	x
 415  0098 ae0000        	ldw	x,#0
 416  009b 89            	pushw	x
 417  009c ae0000        	ldw	x,#L76
 418  009f cd0000        	call	_assert_failed
 420  00a2 5b04          	addw	sp,#4
 421  00a4               L23:
 422                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 424  00a4 0d02          	tnz	(OFST+2,sp)
 425  00a6 2706          	jreq	L63
 426  00a8 7b02          	ld	a,(OFST+2,sp)
 427  00aa a101          	cp	a,#1
 428  00ac 2603          	jrne	L43
 429  00ae               L63:
 430  00ae 4f            	clr	a
 431  00af 2010          	jra	L04
 432  00b1               L43:
 433  00b1 ae006f        	ldw	x,#111
 434  00b4 89            	pushw	x
 435  00b5 ae0000        	ldw	x,#0
 436  00b8 89            	pushw	x
 437  00b9 ae0000        	ldw	x,#L76
 438  00bc cd0000        	call	_assert_failed
 440  00bf 5b04          	addw	sp,#4
 441  00c1               L04:
 442                     ; 113   if (NewState != DISABLE)
 444  00c1 0d02          	tnz	(OFST+2,sp)
 445  00c3 270a          	jreq	L351
 446                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 448  00c5 c65341        	ld	a,21313
 449  00c8 1a01          	or	a,(OFST+1,sp)
 450  00ca c75341        	ld	21313,a
 452  00cd 2009          	jra	L551
 453  00cf               L351:
 454                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 456  00cf 7b01          	ld	a,(OFST+1,sp)
 457  00d1 43            	cpl	a
 458  00d2 c45341        	and	a,21313
 459  00d5 c75341        	ld	21313,a
 460  00d8               L551:
 461                     ; 123 }
 464  00d8 85            	popw	x
 465  00d9 81            	ret
 502                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 502                     ; 132 {
 503                     	switch	.text
 504  00da               _TIM4_UpdateDisableConfig:
 506  00da 88            	push	a
 507       00000000      OFST:	set	0
 510                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 512  00db 4d            	tnz	a
 513  00dc 2704          	jreq	L64
 514  00de a101          	cp	a,#1
 515  00e0 2603          	jrne	L44
 516  00e2               L64:
 517  00e2 4f            	clr	a
 518  00e3 2010          	jra	L05
 519  00e5               L44:
 520  00e5 ae0086        	ldw	x,#134
 521  00e8 89            	pushw	x
 522  00e9 ae0000        	ldw	x,#0
 523  00ec 89            	pushw	x
 524  00ed ae0000        	ldw	x,#L76
 525  00f0 cd0000        	call	_assert_failed
 527  00f3 5b04          	addw	sp,#4
 528  00f5               L05:
 529                     ; 137   if (NewState != DISABLE)
 531  00f5 0d01          	tnz	(OFST+1,sp)
 532  00f7 2706          	jreq	L571
 533                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 535  00f9 72125340      	bset	21312,#1
 537  00fd 2004          	jra	L771
 538  00ff               L571:
 539                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 541  00ff 72135340      	bres	21312,#1
 542  0103               L771:
 543                     ; 145 }
 546  0103 84            	pop	a
 547  0104 81            	ret
 606                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 606                     ; 156 {
 607                     	switch	.text
 608  0105               _TIM4_UpdateRequestConfig:
 610  0105 88            	push	a
 611       00000000      OFST:	set	0
 614                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 616  0106 4d            	tnz	a
 617  0107 2704          	jreq	L65
 618  0109 a101          	cp	a,#1
 619  010b 2603          	jrne	L45
 620  010d               L65:
 621  010d 4f            	clr	a
 622  010e 2010          	jra	L06
 623  0110               L45:
 624  0110 ae009e        	ldw	x,#158
 625  0113 89            	pushw	x
 626  0114 ae0000        	ldw	x,#0
 627  0117 89            	pushw	x
 628  0118 ae0000        	ldw	x,#L76
 629  011b cd0000        	call	_assert_failed
 631  011e 5b04          	addw	sp,#4
 632  0120               L06:
 633                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 635  0120 0d01          	tnz	(OFST+1,sp)
 636  0122 2706          	jreq	L722
 637                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 639  0124 72145340      	bset	21312,#2
 641  0128 2004          	jra	L132
 642  012a               L722:
 643                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 645  012a 72155340      	bres	21312,#2
 646  012e               L132:
 647                     ; 169 }
 650  012e 84            	pop	a
 651  012f 81            	ret
 709                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 709                     ; 180 {
 710                     	switch	.text
 711  0130               _TIM4_SelectOnePulseMode:
 713  0130 88            	push	a
 714       00000000      OFST:	set	0
 717                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 719  0131 a101          	cp	a,#1
 720  0133 2703          	jreq	L66
 721  0135 4d            	tnz	a
 722  0136 2603          	jrne	L46
 723  0138               L66:
 724  0138 4f            	clr	a
 725  0139 2010          	jra	L07
 726  013b               L46:
 727  013b ae00b6        	ldw	x,#182
 728  013e 89            	pushw	x
 729  013f ae0000        	ldw	x,#0
 730  0142 89            	pushw	x
 731  0143 ae0000        	ldw	x,#L76
 732  0146 cd0000        	call	_assert_failed
 734  0149 5b04          	addw	sp,#4
 735  014b               L07:
 736                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 738  014b 0d01          	tnz	(OFST+1,sp)
 739  014d 2706          	jreq	L162
 740                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 742  014f 72165340      	bset	21312,#3
 744  0153 2004          	jra	L362
 745  0155               L162:
 746                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 748  0155 72175340      	bres	21312,#3
 749  0159               L362:
 750                     ; 193 }
 753  0159 84            	pop	a
 754  015a 81            	ret
 823                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 823                     ; 216 {
 824                     	switch	.text
 825  015b               _TIM4_PrescalerConfig:
 827  015b 89            	pushw	x
 828       00000000      OFST:	set	0
 831                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 833  015c 9f            	ld	a,xl
 834  015d 4d            	tnz	a
 835  015e 2705          	jreq	L67
 836  0160 9f            	ld	a,xl
 837  0161 a101          	cp	a,#1
 838  0163 2603          	jrne	L47
 839  0165               L67:
 840  0165 4f            	clr	a
 841  0166 2010          	jra	L001
 842  0168               L47:
 843  0168 ae00da        	ldw	x,#218
 844  016b 89            	pushw	x
 845  016c ae0000        	ldw	x,#0
 846  016f 89            	pushw	x
 847  0170 ae0000        	ldw	x,#L76
 848  0173 cd0000        	call	_assert_failed
 850  0176 5b04          	addw	sp,#4
 851  0178               L001:
 852                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 854  0178 0d01          	tnz	(OFST+1,sp)
 855  017a 272a          	jreq	L401
 856  017c 7b01          	ld	a,(OFST+1,sp)
 857  017e a101          	cp	a,#1
 858  0180 2724          	jreq	L401
 859  0182 7b01          	ld	a,(OFST+1,sp)
 860  0184 a102          	cp	a,#2
 861  0186 271e          	jreq	L401
 862  0188 7b01          	ld	a,(OFST+1,sp)
 863  018a a103          	cp	a,#3
 864  018c 2718          	jreq	L401
 865  018e 7b01          	ld	a,(OFST+1,sp)
 866  0190 a104          	cp	a,#4
 867  0192 2712          	jreq	L401
 868  0194 7b01          	ld	a,(OFST+1,sp)
 869  0196 a105          	cp	a,#5
 870  0198 270c          	jreq	L401
 871  019a 7b01          	ld	a,(OFST+1,sp)
 872  019c a106          	cp	a,#6
 873  019e 2706          	jreq	L401
 874  01a0 7b01          	ld	a,(OFST+1,sp)
 875  01a2 a107          	cp	a,#7
 876  01a4 2603          	jrne	L201
 877  01a6               L401:
 878  01a6 4f            	clr	a
 879  01a7 2010          	jra	L601
 880  01a9               L201:
 881  01a9 ae00db        	ldw	x,#219
 882  01ac 89            	pushw	x
 883  01ad ae0000        	ldw	x,#0
 884  01b0 89            	pushw	x
 885  01b1 ae0000        	ldw	x,#L76
 886  01b4 cd0000        	call	_assert_failed
 888  01b7 5b04          	addw	sp,#4
 889  01b9               L601:
 890                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 892  01b9 7b01          	ld	a,(OFST+1,sp)
 893  01bb c75345        	ld	21317,a
 894                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 896  01be 7b02          	ld	a,(OFST+2,sp)
 897  01c0 c75343        	ld	21315,a
 898                     ; 226 }
 901  01c3 85            	popw	x
 902  01c4 81            	ret
 939                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 939                     ; 235 {
 940                     	switch	.text
 941  01c5               _TIM4_ARRPreloadConfig:
 943  01c5 88            	push	a
 944       00000000      OFST:	set	0
 947                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 949  01c6 4d            	tnz	a
 950  01c7 2704          	jreq	L411
 951  01c9 a101          	cp	a,#1
 952  01cb 2603          	jrne	L211
 953  01cd               L411:
 954  01cd 4f            	clr	a
 955  01ce 2010          	jra	L611
 956  01d0               L211:
 957  01d0 ae00ed        	ldw	x,#237
 958  01d3 89            	pushw	x
 959  01d4 ae0000        	ldw	x,#0
 960  01d7 89            	pushw	x
 961  01d8 ae0000        	ldw	x,#L76
 962  01db cd0000        	call	_assert_failed
 964  01de 5b04          	addw	sp,#4
 965  01e0               L611:
 966                     ; 240   if (NewState != DISABLE)
 968  01e0 0d01          	tnz	(OFST+1,sp)
 969  01e2 2706          	jreq	L533
 970                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 972  01e4 721e5340      	bset	21312,#7
 974  01e8 2004          	jra	L733
 975  01ea               L533:
 976                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 978  01ea 721f5340      	bres	21312,#7
 979  01ee               L733:
 980                     ; 248 }
 983  01ee 84            	pop	a
 984  01ef 81            	ret
1034                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1034                     ; 258 {
1035                     	switch	.text
1036  01f0               _TIM4_GenerateEvent:
1038  01f0 88            	push	a
1039       00000000      OFST:	set	0
1042                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1044  01f1 a101          	cp	a,#1
1045  01f3 2603          	jrne	L221
1046  01f5 4f            	clr	a
1047  01f6 2010          	jra	L421
1048  01f8               L221:
1049  01f8 ae0104        	ldw	x,#260
1050  01fb 89            	pushw	x
1051  01fc ae0000        	ldw	x,#0
1052  01ff 89            	pushw	x
1053  0200 ae0000        	ldw	x,#L76
1054  0203 cd0000        	call	_assert_failed
1056  0206 5b04          	addw	sp,#4
1057  0208               L421:
1058                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1060  0208 7b01          	ld	a,(OFST+1,sp)
1061  020a c75343        	ld	21315,a
1062                     ; 264 }
1065  020d 84            	pop	a
1066  020e 81            	ret
1100                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1100                     ; 273 {
1101                     	switch	.text
1102  020f               _TIM4_SetCounter:
1106                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1108  020f c75344        	ld	21316,a
1109                     ; 276 }
1112  0212 81            	ret
1146                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1146                     ; 285 {
1147                     	switch	.text
1148  0213               _TIM4_SetAutoreload:
1152                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1154  0213 c75346        	ld	21318,a
1155                     ; 288 }
1158  0216 81            	ret
1181                     ; 295 uint8_t TIM4_GetCounter(void)
1181                     ; 296 {
1182                     	switch	.text
1183  0217               _TIM4_GetCounter:
1187                     ; 298   return (uint8_t)(TIM4->CNTR);
1189  0217 c65344        	ld	a,21316
1192  021a 81            	ret
1216                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1216                     ; 307 {
1217                     	switch	.text
1218  021b               _TIM4_GetPrescaler:
1222                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1224  021b c65345        	ld	a,21317
1227  021e 81            	ret
1307                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1307                     ; 320 {
1308                     	switch	.text
1309  021f               _TIM4_GetFlagStatus:
1311  021f 88            	push	a
1312  0220 88            	push	a
1313       00000001      OFST:	set	1
1316                     ; 321   FlagStatus bitstatus = RESET;
1318                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1320  0221 a101          	cp	a,#1
1321  0223 2603          	jrne	L041
1322  0225 4f            	clr	a
1323  0226 2010          	jra	L241
1324  0228               L041:
1325  0228 ae0144        	ldw	x,#324
1326  022b 89            	pushw	x
1327  022c ae0000        	ldw	x,#0
1328  022f 89            	pushw	x
1329  0230 ae0000        	ldw	x,#L76
1330  0233 cd0000        	call	_assert_failed
1332  0236 5b04          	addw	sp,#4
1333  0238               L241:
1334                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1336  0238 c65342        	ld	a,21314
1337  023b 1502          	bcp	a,(OFST+1,sp)
1338  023d 2706          	jreq	L105
1339                     ; 328     bitstatus = SET;
1341  023f a601          	ld	a,#1
1342  0241 6b01          	ld	(OFST+0,sp),a
1344  0243 2002          	jra	L305
1345  0245               L105:
1346                     ; 332     bitstatus = RESET;
1348  0245 0f01          	clr	(OFST+0,sp)
1349  0247               L305:
1350                     ; 334   return ((FlagStatus)bitstatus);
1352  0247 7b01          	ld	a,(OFST+0,sp)
1355  0249 85            	popw	x
1356  024a 81            	ret
1392                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1392                     ; 345 {
1393                     	switch	.text
1394  024b               _TIM4_ClearFlag:
1396  024b 88            	push	a
1397       00000000      OFST:	set	0
1400                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1402  024c a101          	cp	a,#1
1403  024e 2603          	jrne	L641
1404  0250 4f            	clr	a
1405  0251 2010          	jra	L051
1406  0253               L641:
1407  0253 ae015b        	ldw	x,#347
1408  0256 89            	pushw	x
1409  0257 ae0000        	ldw	x,#0
1410  025a 89            	pushw	x
1411  025b ae0000        	ldw	x,#L76
1412  025e cd0000        	call	_assert_failed
1414  0261 5b04          	addw	sp,#4
1415  0263               L051:
1416                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1418  0263 7b01          	ld	a,(OFST+1,sp)
1419  0265 43            	cpl	a
1420  0266 c75342        	ld	21314,a
1421                     ; 351 }
1424  0269 84            	pop	a
1425  026a 81            	ret
1490                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1490                     ; 361 {
1491                     	switch	.text
1492  026b               _TIM4_GetITStatus:
1494  026b 88            	push	a
1495  026c 89            	pushw	x
1496       00000002      OFST:	set	2
1499                     ; 362   ITStatus bitstatus = RESET;
1501                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1505                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1507  026d a101          	cp	a,#1
1508  026f 2603          	jrne	L451
1509  0271 4f            	clr	a
1510  0272 2010          	jra	L651
1511  0274               L451:
1512  0274 ae016f        	ldw	x,#367
1513  0277 89            	pushw	x
1514  0278 ae0000        	ldw	x,#0
1515  027b 89            	pushw	x
1516  027c ae0000        	ldw	x,#L76
1517  027f cd0000        	call	_assert_failed
1519  0282 5b04          	addw	sp,#4
1520  0284               L651:
1521                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1523  0284 c65342        	ld	a,21314
1524  0287 1403          	and	a,(OFST+1,sp)
1525  0289 6b01          	ld	(OFST-1,sp),a
1526                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1528  028b c65341        	ld	a,21313
1529  028e 1403          	and	a,(OFST+1,sp)
1530  0290 6b02          	ld	(OFST+0,sp),a
1531                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1533  0292 0d01          	tnz	(OFST-1,sp)
1534  0294 270a          	jreq	L555
1536  0296 0d02          	tnz	(OFST+0,sp)
1537  0298 2706          	jreq	L555
1538                     ; 375     bitstatus = (ITStatus)SET;
1540  029a a601          	ld	a,#1
1541  029c 6b02          	ld	(OFST+0,sp),a
1543  029e 2002          	jra	L755
1544  02a0               L555:
1545                     ; 379     bitstatus = (ITStatus)RESET;
1547  02a0 0f02          	clr	(OFST+0,sp)
1548  02a2               L755:
1549                     ; 381   return ((ITStatus)bitstatus);
1551  02a2 7b02          	ld	a,(OFST+0,sp)
1554  02a4 5b03          	addw	sp,#3
1555  02a6 81            	ret
1592                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1592                     ; 392 {
1593                     	switch	.text
1594  02a7               _TIM4_ClearITPendingBit:
1596  02a7 88            	push	a
1597       00000000      OFST:	set	0
1600                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1602  02a8 a101          	cp	a,#1
1603  02aa 2603          	jrne	L261
1604  02ac 4f            	clr	a
1605  02ad 2010          	jra	L461
1606  02af               L261:
1607  02af ae018a        	ldw	x,#394
1608  02b2 89            	pushw	x
1609  02b3 ae0000        	ldw	x,#0
1610  02b6 89            	pushw	x
1611  02b7 ae0000        	ldw	x,#L76
1612  02ba cd0000        	call	_assert_failed
1614  02bd 5b04          	addw	sp,#4
1615  02bf               L461:
1616                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1618  02bf 7b01          	ld	a,(OFST+1,sp)
1619  02c1 43            	cpl	a
1620  02c2 c75342        	ld	21314,a
1621                     ; 398 }
1624  02c5 84            	pop	a
1625  02c6 81            	ret
1638                     	xdef	_TIM4_ClearITPendingBit
1639                     	xdef	_TIM4_GetITStatus
1640                     	xdef	_TIM4_ClearFlag
1641                     	xdef	_TIM4_GetFlagStatus
1642                     	xdef	_TIM4_GetPrescaler
1643                     	xdef	_TIM4_GetCounter
1644                     	xdef	_TIM4_SetAutoreload
1645                     	xdef	_TIM4_SetCounter
1646                     	xdef	_TIM4_GenerateEvent
1647                     	xdef	_TIM4_ARRPreloadConfig
1648                     	xdef	_TIM4_PrescalerConfig
1649                     	xdef	_TIM4_SelectOnePulseMode
1650                     	xdef	_TIM4_UpdateRequestConfig
1651                     	xdef	_TIM4_UpdateDisableConfig
1652                     	xdef	_TIM4_ITConfig
1653                     	xdef	_TIM4_Cmd
1654                     	xdef	_TIM4_TimeBaseInit
1655                     	xdef	_TIM4_DeInit
1656                     	xref	_assert_failed
1657                     .const:	section	.text
1658  0000               L76:
1659  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1660  0012 697665725c73  	dc.b	"iver\src\stm8s_tim"
1661  0024 342e6300      	dc.b	"4.c",0
1681                     	end
