   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 109                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 54 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 59 }
 131  0007 81            	ret
 372                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 372                     ; 72 {
 373                     	switch	.text
 374  0008               _GPIO_Init:
 376  0008 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 382  0009 0d06          	tnz	(OFST+6,sp)
 383  000b 2742          	jreq	L21
 384  000d 7b06          	ld	a,(OFST+6,sp)
 385  000f a140          	cp	a,#64
 386  0011 273c          	jreq	L21
 387  0013 7b06          	ld	a,(OFST+6,sp)
 388  0015 a120          	cp	a,#32
 389  0017 2736          	jreq	L21
 390  0019 7b06          	ld	a,(OFST+6,sp)
 391  001b a160          	cp	a,#96
 392  001d 2730          	jreq	L21
 393  001f 7b06          	ld	a,(OFST+6,sp)
 394  0021 a1a0          	cp	a,#160
 395  0023 272a          	jreq	L21
 396  0025 7b06          	ld	a,(OFST+6,sp)
 397  0027 a1e0          	cp	a,#224
 398  0029 2724          	jreq	L21
 399  002b 7b06          	ld	a,(OFST+6,sp)
 400  002d a180          	cp	a,#128
 401  002f 271e          	jreq	L21
 402  0031 7b06          	ld	a,(OFST+6,sp)
 403  0033 a1c0          	cp	a,#192
 404  0035 2718          	jreq	L21
 405  0037 7b06          	ld	a,(OFST+6,sp)
 406  0039 a1b0          	cp	a,#176
 407  003b 2712          	jreq	L21
 408  003d 7b06          	ld	a,(OFST+6,sp)
 409  003f a1f0          	cp	a,#240
 410  0041 270c          	jreq	L21
 411  0043 7b06          	ld	a,(OFST+6,sp)
 412  0045 a190          	cp	a,#144
 413  0047 2706          	jreq	L21
 414  0049 7b06          	ld	a,(OFST+6,sp)
 415  004b a1d0          	cp	a,#208
 416  004d 2603          	jrne	L01
 417  004f               L21:
 418  004f 4f            	clr	a
 419  0050 2010          	jra	L41
 420  0052               L01:
 421  0052 ae004d        	ldw	x,#77
 422  0055 89            	pushw	x
 423  0056 ae0000        	ldw	x,#0
 424  0059 89            	pushw	x
 425  005a ae0000        	ldw	x,#L771
 426  005d cd0000        	call	_assert_failed
 428  0060 5b04          	addw	sp,#4
 429  0062               L41:
 430                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 432  0062 0d05          	tnz	(OFST+5,sp)
 433  0064 2703          	jreq	L61
 434  0066 4f            	clr	a
 435  0067 2010          	jra	L02
 436  0069               L61:
 437  0069 ae004e        	ldw	x,#78
 438  006c 89            	pushw	x
 439  006d ae0000        	ldw	x,#0
 440  0070 89            	pushw	x
 441  0071 ae0000        	ldw	x,#L771
 442  0074 cd0000        	call	_assert_failed
 444  0077 5b04          	addw	sp,#4
 445  0079               L02:
 446                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 448  0079 1e01          	ldw	x,(OFST+1,sp)
 449  007b 7b05          	ld	a,(OFST+5,sp)
 450  007d 43            	cpl	a
 451  007e e404          	and	a,(4,x)
 452  0080 e704          	ld	(4,x),a
 453                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 455  0082 7b06          	ld	a,(OFST+6,sp)
 456  0084 a580          	bcp	a,#128
 457  0086 271f          	jreq	L102
 458                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 460  0088 7b06          	ld	a,(OFST+6,sp)
 461  008a a510          	bcp	a,#16
 462  008c 2708          	jreq	L302
 463                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 465  008e 1e01          	ldw	x,(OFST+1,sp)
 466  0090 f6            	ld	a,(x)
 467  0091 1a05          	or	a,(OFST+5,sp)
 468  0093 f7            	ld	(x),a
 470  0094 2007          	jra	L502
 471  0096               L302:
 472                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 474  0096 1e01          	ldw	x,(OFST+1,sp)
 475  0098 7b05          	ld	a,(OFST+5,sp)
 476  009a 43            	cpl	a
 477  009b f4            	and	a,(x)
 478  009c f7            	ld	(x),a
 479  009d               L502:
 480                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 482  009d 1e01          	ldw	x,(OFST+1,sp)
 483  009f e602          	ld	a,(2,x)
 484  00a1 1a05          	or	a,(OFST+5,sp)
 485  00a3 e702          	ld	(2,x),a
 487  00a5 2009          	jra	L702
 488  00a7               L102:
 489                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 491  00a7 1e01          	ldw	x,(OFST+1,sp)
 492  00a9 7b05          	ld	a,(OFST+5,sp)
 493  00ab 43            	cpl	a
 494  00ac e402          	and	a,(2,x)
 495  00ae e702          	ld	(2,x),a
 496  00b0               L702:
 497                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 499  00b0 7b06          	ld	a,(OFST+6,sp)
 500  00b2 a540          	bcp	a,#64
 501  00b4 270a          	jreq	L112
 502                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 504  00b6 1e01          	ldw	x,(OFST+1,sp)
 505  00b8 e603          	ld	a,(3,x)
 506  00ba 1a05          	or	a,(OFST+5,sp)
 507  00bc e703          	ld	(3,x),a
 509  00be 2009          	jra	L312
 510  00c0               L112:
 511                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 513  00c0 1e01          	ldw	x,(OFST+1,sp)
 514  00c2 7b05          	ld	a,(OFST+5,sp)
 515  00c4 43            	cpl	a
 516  00c5 e403          	and	a,(3,x)
 517  00c7 e703          	ld	(3,x),a
 518  00c9               L312:
 519                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 521  00c9 7b06          	ld	a,(OFST+6,sp)
 522  00cb a520          	bcp	a,#32
 523  00cd 270a          	jreq	L512
 524                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 526  00cf 1e01          	ldw	x,(OFST+1,sp)
 527  00d1 e604          	ld	a,(4,x)
 528  00d3 1a05          	or	a,(OFST+5,sp)
 529  00d5 e704          	ld	(4,x),a
 531  00d7 2009          	jra	L712
 532  00d9               L512:
 533                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 535  00d9 1e01          	ldw	x,(OFST+1,sp)
 536  00db 7b05          	ld	a,(OFST+5,sp)
 537  00dd 43            	cpl	a
 538  00de e404          	and	a,(4,x)
 539  00e0 e704          	ld	(4,x),a
 540  00e2               L712:
 541                     ; 131 }
 544  00e2 85            	popw	x
 545  00e3 81            	ret
 591                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 591                     ; 142 {
 592                     	switch	.text
 593  00e4               _GPIO_Write:
 595  00e4 89            	pushw	x
 596       00000000      OFST:	set	0
 599                     ; 143   GPIOx->ODR = PortVal;
 601  00e5 7b05          	ld	a,(OFST+5,sp)
 602  00e7 1e01          	ldw	x,(OFST+1,sp)
 603  00e9 f7            	ld	(x),a
 604                     ; 144 }
 607  00ea 85            	popw	x
 608  00eb 81            	ret
 655                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 655                     ; 155 {
 656                     	switch	.text
 657  00ec               _GPIO_WriteHigh:
 659  00ec 89            	pushw	x
 660       00000000      OFST:	set	0
 663                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 665  00ed f6            	ld	a,(x)
 666  00ee 1a05          	or	a,(OFST+5,sp)
 667  00f0 f7            	ld	(x),a
 668                     ; 157 }
 671  00f1 85            	popw	x
 672  00f2 81            	ret
 719                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 719                     ; 168 {
 720                     	switch	.text
 721  00f3               _GPIO_WriteLow:
 723  00f3 89            	pushw	x
 724       00000000      OFST:	set	0
 727                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 729  00f4 7b05          	ld	a,(OFST+5,sp)
 730  00f6 43            	cpl	a
 731  00f7 f4            	and	a,(x)
 732  00f8 f7            	ld	(x),a
 733                     ; 170 }
 736  00f9 85            	popw	x
 737  00fa 81            	ret
 784                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 784                     ; 181 {
 785                     	switch	.text
 786  00fb               _GPIO_WriteReverse:
 788  00fb 89            	pushw	x
 789       00000000      OFST:	set	0
 792                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 794  00fc f6            	ld	a,(x)
 795  00fd 1805          	xor	a,	(OFST+5,sp)
 796  00ff f7            	ld	(x),a
 797                     ; 183 }
 800  0100 85            	popw	x
 801  0101 81            	ret
 839                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 839                     ; 192 {
 840                     	switch	.text
 841  0102               _GPIO_ReadOutputData:
 845                     ; 193   return ((uint8_t)GPIOx->ODR);
 847  0102 f6            	ld	a,(x)
 850  0103 81            	ret
 887                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 887                     ; 203 {
 888                     	switch	.text
 889  0104               _GPIO_ReadInputData:
 893                     ; 204   return ((uint8_t)GPIOx->IDR);
 895  0104 e601          	ld	a,(1,x)
 898  0106 81            	ret
 966                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 966                     ; 214 {
 967                     	switch	.text
 968  0107               _GPIO_ReadInputPin:
 970  0107 89            	pushw	x
 971       00000000      OFST:	set	0
 974                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 976  0108 e601          	ld	a,(1,x)
 977  010a 1405          	and	a,(OFST+5,sp)
 980  010c 85            	popw	x
 981  010d 81            	ret
1060                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1060                     ; 226 {
1061                     	switch	.text
1062  010e               _GPIO_ExternalPullUpConfig:
1064  010e 89            	pushw	x
1065       00000000      OFST:	set	0
1068                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1070  010f 0d05          	tnz	(OFST+5,sp)
1071  0111 2703          	jreq	L24
1072  0113 4f            	clr	a
1073  0114 2010          	jra	L44
1074  0116               L24:
1075  0116 ae00e4        	ldw	x,#228
1076  0119 89            	pushw	x
1077  011a ae0000        	ldw	x,#0
1078  011d 89            	pushw	x
1079  011e ae0000        	ldw	x,#L771
1080  0121 cd0000        	call	_assert_failed
1082  0124 5b04          	addw	sp,#4
1083  0126               L44:
1084                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1086  0126 0d06          	tnz	(OFST+6,sp)
1087  0128 2706          	jreq	L05
1088  012a 7b06          	ld	a,(OFST+6,sp)
1089  012c a101          	cp	a,#1
1090  012e 2603          	jrne	L64
1091  0130               L05:
1092  0130 4f            	clr	a
1093  0131 2010          	jra	L25
1094  0133               L64:
1095  0133 ae00e5        	ldw	x,#229
1096  0136 89            	pushw	x
1097  0137 ae0000        	ldw	x,#0
1098  013a 89            	pushw	x
1099  013b ae0000        	ldw	x,#L771
1100  013e cd0000        	call	_assert_failed
1102  0141 5b04          	addw	sp,#4
1103  0143               L25:
1104                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1106  0143 0d06          	tnz	(OFST+6,sp)
1107  0145 270a          	jreq	L574
1108                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1110  0147 1e01          	ldw	x,(OFST+1,sp)
1111  0149 e603          	ld	a,(3,x)
1112  014b 1a05          	or	a,(OFST+5,sp)
1113  014d e703          	ld	(3,x),a
1115  014f 2009          	jra	L774
1116  0151               L574:
1117                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1119  0151 1e01          	ldw	x,(OFST+1,sp)
1120  0153 7b05          	ld	a,(OFST+5,sp)
1121  0155 43            	cpl	a
1122  0156 e403          	and	a,(3,x)
1123  0158 e703          	ld	(3,x),a
1124  015a               L774:
1125                     ; 238 }
1128  015a 85            	popw	x
1129  015b 81            	ret
1142                     	xdef	_GPIO_ExternalPullUpConfig
1143                     	xdef	_GPIO_ReadInputPin
1144                     	xdef	_GPIO_ReadOutputData
1145                     	xdef	_GPIO_ReadInputData
1146                     	xdef	_GPIO_WriteReverse
1147                     	xdef	_GPIO_WriteLow
1148                     	xdef	_GPIO_WriteHigh
1149                     	xdef	_GPIO_Write
1150                     	xdef	_GPIO_Init
1151                     	xdef	_GPIO_DeInit
1152                     	xref	_assert_failed
1153                     .const:	section	.text
1154  0000               L771:
1155  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1156  0012 697665725c73  	dc.b	"iver\src\stm8s_gpi"
1157  0024 6f2e6300      	dc.b	"o.c",0
1177                     	end
