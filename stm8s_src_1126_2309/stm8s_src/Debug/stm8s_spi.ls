   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 50 void SPI_DeInit(void)
  43                     ; 51 {
  45                     	switch	.text
  46  0000               _SPI_DeInit:
  50                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  52  0000 725f5200      	clr	20992
  53                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  55  0004 725f5201      	clr	20993
  56                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  58  0008 725f5202      	clr	20994
  59                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  61  000c 35025203      	mov	20995,#2
  62                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  64  0010 35075205      	mov	20997,#7
  65                     ; 57 }
  68  0014 81            	ret
 385                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 385                     ; 79 {
 386                     	switch	.text
 387  0015               _SPI_Init:
 389  0015 89            	pushw	x
 390  0016 88            	push	a
 391       00000001      OFST:	set	1
 394                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 396  0017 9e            	ld	a,xh
 397  0018 4d            	tnz	a
 398  0019 2705          	jreq	L21
 399  001b 9e            	ld	a,xh
 400  001c a180          	cp	a,#128
 401  001e 2603          	jrne	L01
 402  0020               L21:
 403  0020 4f            	clr	a
 404  0021 2010          	jra	L41
 405  0023               L01:
 406  0023 ae0051        	ldw	x,#81
 407  0026 89            	pushw	x
 408  0027 ae0000        	ldw	x,#0
 409  002a 89            	pushw	x
 410  002b ae0000        	ldw	x,#L302
 411  002e cd0000        	call	_assert_failed
 413  0031 5b04          	addw	sp,#4
 414  0033               L41:
 415                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 417  0033 0d03          	tnz	(OFST+2,sp)
 418  0035 272a          	jreq	L02
 419  0037 7b03          	ld	a,(OFST+2,sp)
 420  0039 a108          	cp	a,#8
 421  003b 2724          	jreq	L02
 422  003d 7b03          	ld	a,(OFST+2,sp)
 423  003f a110          	cp	a,#16
 424  0041 271e          	jreq	L02
 425  0043 7b03          	ld	a,(OFST+2,sp)
 426  0045 a118          	cp	a,#24
 427  0047 2718          	jreq	L02
 428  0049 7b03          	ld	a,(OFST+2,sp)
 429  004b a120          	cp	a,#32
 430  004d 2712          	jreq	L02
 431  004f 7b03          	ld	a,(OFST+2,sp)
 432  0051 a128          	cp	a,#40
 433  0053 270c          	jreq	L02
 434  0055 7b03          	ld	a,(OFST+2,sp)
 435  0057 a130          	cp	a,#48
 436  0059 2706          	jreq	L02
 437  005b 7b03          	ld	a,(OFST+2,sp)
 438  005d a138          	cp	a,#56
 439  005f 2603          	jrne	L61
 440  0061               L02:
 441  0061 4f            	clr	a
 442  0062 2010          	jra	L22
 443  0064               L61:
 444  0064 ae0052        	ldw	x,#82
 445  0067 89            	pushw	x
 446  0068 ae0000        	ldw	x,#0
 447  006b 89            	pushw	x
 448  006c ae0000        	ldw	x,#L302
 449  006f cd0000        	call	_assert_failed
 451  0072 5b04          	addw	sp,#4
 452  0074               L22:
 453                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 455  0074 7b06          	ld	a,(OFST+5,sp)
 456  0076 a104          	cp	a,#4
 457  0078 2704          	jreq	L62
 458  007a 0d06          	tnz	(OFST+5,sp)
 459  007c 2603          	jrne	L42
 460  007e               L62:
 461  007e 4f            	clr	a
 462  007f 2010          	jra	L03
 463  0081               L42:
 464  0081 ae0053        	ldw	x,#83
 465  0084 89            	pushw	x
 466  0085 ae0000        	ldw	x,#0
 467  0088 89            	pushw	x
 468  0089 ae0000        	ldw	x,#L302
 469  008c cd0000        	call	_assert_failed
 471  008f 5b04          	addw	sp,#4
 472  0091               L03:
 473                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 475  0091 0d07          	tnz	(OFST+6,sp)
 476  0093 2706          	jreq	L43
 477  0095 7b07          	ld	a,(OFST+6,sp)
 478  0097 a102          	cp	a,#2
 479  0099 2603          	jrne	L23
 480  009b               L43:
 481  009b 4f            	clr	a
 482  009c 2010          	jra	L63
 483  009e               L23:
 484  009e ae0054        	ldw	x,#84
 485  00a1 89            	pushw	x
 486  00a2 ae0000        	ldw	x,#0
 487  00a5 89            	pushw	x
 488  00a6 ae0000        	ldw	x,#L302
 489  00a9 cd0000        	call	_assert_failed
 491  00ac 5b04          	addw	sp,#4
 492  00ae               L63:
 493                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 495  00ae 0d08          	tnz	(OFST+7,sp)
 496  00b0 2706          	jreq	L24
 497  00b2 7b08          	ld	a,(OFST+7,sp)
 498  00b4 a101          	cp	a,#1
 499  00b6 2603          	jrne	L04
 500  00b8               L24:
 501  00b8 4f            	clr	a
 502  00b9 2010          	jra	L44
 503  00bb               L04:
 504  00bb ae0055        	ldw	x,#85
 505  00be 89            	pushw	x
 506  00bf ae0000        	ldw	x,#0
 507  00c2 89            	pushw	x
 508  00c3 ae0000        	ldw	x,#L302
 509  00c6 cd0000        	call	_assert_failed
 511  00c9 5b04          	addw	sp,#4
 512  00cb               L44:
 513                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 515  00cb 0d09          	tnz	(OFST+8,sp)
 516  00cd 2712          	jreq	L05
 517  00cf 7b09          	ld	a,(OFST+8,sp)
 518  00d1 a104          	cp	a,#4
 519  00d3 270c          	jreq	L05
 520  00d5 7b09          	ld	a,(OFST+8,sp)
 521  00d7 a180          	cp	a,#128
 522  00d9 2706          	jreq	L05
 523  00db 7b09          	ld	a,(OFST+8,sp)
 524  00dd a1c0          	cp	a,#192
 525  00df 2603          	jrne	L64
 526  00e1               L05:
 527  00e1 4f            	clr	a
 528  00e2 2010          	jra	L25
 529  00e4               L64:
 530  00e4 ae0056        	ldw	x,#86
 531  00e7 89            	pushw	x
 532  00e8 ae0000        	ldw	x,#0
 533  00eb 89            	pushw	x
 534  00ec ae0000        	ldw	x,#L302
 535  00ef cd0000        	call	_assert_failed
 537  00f2 5b04          	addw	sp,#4
 538  00f4               L25:
 539                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 541  00f4 7b0a          	ld	a,(OFST+9,sp)
 542  00f6 a102          	cp	a,#2
 543  00f8 2704          	jreq	L65
 544  00fa 0d0a          	tnz	(OFST+9,sp)
 545  00fc 2603          	jrne	L45
 546  00fe               L65:
 547  00fe 4f            	clr	a
 548  00ff 2010          	jra	L06
 549  0101               L45:
 550  0101 ae0057        	ldw	x,#87
 551  0104 89            	pushw	x
 552  0105 ae0000        	ldw	x,#0
 553  0108 89            	pushw	x
 554  0109 ae0000        	ldw	x,#L302
 555  010c cd0000        	call	_assert_failed
 557  010f 5b04          	addw	sp,#4
 558  0111               L06:
 559                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 561  0111 0d0b          	tnz	(OFST+10,sp)
 562  0113 2703          	jreq	L26
 563  0115 4f            	clr	a
 564  0116 2010          	jra	L46
 565  0118               L26:
 566  0118 ae0058        	ldw	x,#88
 567  011b 89            	pushw	x
 568  011c ae0000        	ldw	x,#0
 569  011f 89            	pushw	x
 570  0120 ae0000        	ldw	x,#L302
 571  0123 cd0000        	call	_assert_failed
 573  0126 5b04          	addw	sp,#4
 574  0128               L46:
 575                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 575                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 577  0128 7b07          	ld	a,(OFST+6,sp)
 578  012a 1a08          	or	a,(OFST+7,sp)
 579  012c 6b01          	ld	(OFST+0,sp),a
 580  012e 7b02          	ld	a,(OFST+1,sp)
 581  0130 1a03          	or	a,(OFST+2,sp)
 582  0132 1a01          	or	a,(OFST+0,sp)
 583  0134 c75200        	ld	20992,a
 584                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 586  0137 7b09          	ld	a,(OFST+8,sp)
 587  0139 1a0a          	or	a,(OFST+9,sp)
 588  013b c75201        	ld	20993,a
 589                     ; 97   if (Mode == SPI_MODE_MASTER)
 591  013e 7b06          	ld	a,(OFST+5,sp)
 592  0140 a104          	cp	a,#4
 593  0142 2606          	jrne	L502
 594                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 596  0144 72105201      	bset	20993,#0
 598  0148 2004          	jra	L702
 599  014a               L502:
 600                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 602  014a 72115201      	bres	20993,#0
 603  014e               L702:
 604                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 606  014e c65200        	ld	a,20992
 607  0151 1a06          	or	a,(OFST+5,sp)
 608  0153 c75200        	ld	20992,a
 609                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 611  0156 7b0b          	ld	a,(OFST+10,sp)
 612  0158 c75205        	ld	20997,a
 613                     ; 111 }
 616  015b 5b03          	addw	sp,#3
 617  015d 81            	ret
 673                     ; 119 void SPI_Cmd(FunctionalState NewState)
 673                     ; 120 {
 674                     	switch	.text
 675  015e               _SPI_Cmd:
 677  015e 88            	push	a
 678       00000000      OFST:	set	0
 681                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 683  015f 4d            	tnz	a
 684  0160 2704          	jreq	L27
 685  0162 a101          	cp	a,#1
 686  0164 2603          	jrne	L07
 687  0166               L27:
 688  0166 4f            	clr	a
 689  0167 2010          	jra	L47
 690  0169               L07:
 691  0169 ae007a        	ldw	x,#122
 692  016c 89            	pushw	x
 693  016d ae0000        	ldw	x,#0
 694  0170 89            	pushw	x
 695  0171 ae0000        	ldw	x,#L302
 696  0174 cd0000        	call	_assert_failed
 698  0177 5b04          	addw	sp,#4
 699  0179               L47:
 700                     ; 124   if (NewState != DISABLE)
 702  0179 0d01          	tnz	(OFST+1,sp)
 703  017b 2706          	jreq	L732
 704                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 706  017d 721c5200      	bset	20992,#6
 708  0181 2004          	jra	L142
 709  0183               L732:
 710                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 712  0183 721d5200      	bres	20992,#6
 713  0187               L142:
 714                     ; 132 }
 717  0187 84            	pop	a
 718  0188 81            	ret
 828                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 828                     ; 142 {
 829                     	switch	.text
 830  0189               _SPI_ITConfig:
 832  0189 89            	pushw	x
 833  018a 88            	push	a
 834       00000001      OFST:	set	1
 837                     ; 143   uint8_t itpos = 0;
 839                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 841  018b 9e            	ld	a,xh
 842  018c a117          	cp	a,#23
 843  018e 270f          	jreq	L201
 844  0190 9e            	ld	a,xh
 845  0191 a106          	cp	a,#6
 846  0193 270a          	jreq	L201
 847  0195 9e            	ld	a,xh
 848  0196 a105          	cp	a,#5
 849  0198 2705          	jreq	L201
 850  019a 9e            	ld	a,xh
 851  019b a134          	cp	a,#52
 852  019d 2603          	jrne	L001
 853  019f               L201:
 854  019f 4f            	clr	a
 855  01a0 2010          	jra	L401
 856  01a2               L001:
 857  01a2 ae0091        	ldw	x,#145
 858  01a5 89            	pushw	x
 859  01a6 ae0000        	ldw	x,#0
 860  01a9 89            	pushw	x
 861  01aa ae0000        	ldw	x,#L302
 862  01ad cd0000        	call	_assert_failed
 864  01b0 5b04          	addw	sp,#4
 865  01b2               L401:
 866                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 868  01b2 0d03          	tnz	(OFST+2,sp)
 869  01b4 2706          	jreq	L011
 870  01b6 7b03          	ld	a,(OFST+2,sp)
 871  01b8 a101          	cp	a,#1
 872  01ba 2603          	jrne	L601
 873  01bc               L011:
 874  01bc 4f            	clr	a
 875  01bd 2010          	jra	L211
 876  01bf               L601:
 877  01bf ae0092        	ldw	x,#146
 878  01c2 89            	pushw	x
 879  01c3 ae0000        	ldw	x,#0
 880  01c6 89            	pushw	x
 881  01c7 ae0000        	ldw	x,#L302
 882  01ca cd0000        	call	_assert_failed
 884  01cd 5b04          	addw	sp,#4
 885  01cf               L211:
 886                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 888  01cf 7b02          	ld	a,(OFST+1,sp)
 889  01d1 a40f          	and	a,#15
 890  01d3 5f            	clrw	x
 891  01d4 97            	ld	xl,a
 892  01d5 a601          	ld	a,#1
 893  01d7 5d            	tnzw	x
 894  01d8 2704          	jreq	L411
 895  01da               L611:
 896  01da 48            	sll	a
 897  01db 5a            	decw	x
 898  01dc 26fc          	jrne	L611
 899  01de               L411:
 900  01de 6b01          	ld	(OFST+0,sp),a
 901                     ; 151   if (NewState != DISABLE)
 903  01e0 0d03          	tnz	(OFST+2,sp)
 904  01e2 270a          	jreq	L313
 905                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 907  01e4 c65202        	ld	a,20994
 908  01e7 1a01          	or	a,(OFST+0,sp)
 909  01e9 c75202        	ld	20994,a
 911  01ec 2009          	jra	L513
 912  01ee               L313:
 913                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 915  01ee 7b01          	ld	a,(OFST+0,sp)
 916  01f0 43            	cpl	a
 917  01f1 c45202        	and	a,20994
 918  01f4 c75202        	ld	20994,a
 919  01f7               L513:
 920                     ; 159 }
 923  01f7 5b03          	addw	sp,#3
 924  01f9 81            	ret
 958                     ; 166 void SPI_SendData(uint8_t Data)
 958                     ; 167 {
 959                     	switch	.text
 960  01fa               _SPI_SendData:
 964                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 966  01fa c75204        	ld	20996,a
 967                     ; 169 }
 970  01fd 81            	ret
 993                     ; 176 uint8_t SPI_ReceiveData(void)
 993                     ; 177 {
 994                     	switch	.text
 995  01fe               _SPI_ReceiveData:
 999                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
1001  01fe c65204        	ld	a,20996
1004  0201 81            	ret
1041                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
1041                     ; 188 {
1042                     	switch	.text
1043  0202               _SPI_NSSInternalSoftwareCmd:
1045  0202 88            	push	a
1046       00000000      OFST:	set	0
1049                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1051  0203 4d            	tnz	a
1052  0204 2704          	jreq	L031
1053  0206 a101          	cp	a,#1
1054  0208 2603          	jrne	L621
1055  020a               L031:
1056  020a 4f            	clr	a
1057  020b 2010          	jra	L231
1058  020d               L621:
1059  020d ae00be        	ldw	x,#190
1060  0210 89            	pushw	x
1061  0211 ae0000        	ldw	x,#0
1062  0214 89            	pushw	x
1063  0215 ae0000        	ldw	x,#L302
1064  0218 cd0000        	call	_assert_failed
1066  021b 5b04          	addw	sp,#4
1067  021d               L231:
1068                     ; 192   if (NewState != DISABLE)
1070  021d 0d01          	tnz	(OFST+1,sp)
1071  021f 2706          	jreq	L363
1072                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1074  0221 72105201      	bset	20993,#0
1076  0225 2004          	jra	L563
1077  0227               L363:
1078                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1080  0227 72115201      	bres	20993,#0
1081  022b               L563:
1082                     ; 200 }
1085  022b 84            	pop	a
1086  022c 81            	ret
1109                     ; 207 void SPI_TransmitCRC(void)
1109                     ; 208 {
1110                     	switch	.text
1111  022d               _SPI_TransmitCRC:
1115                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1117  022d 72185201      	bset	20993,#4
1118                     ; 210 }
1121  0231 81            	ret
1158                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
1158                     ; 219 {
1159                     	switch	.text
1160  0232               _SPI_CalculateCRCCmd:
1162  0232 88            	push	a
1163       00000000      OFST:	set	0
1166                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1168  0233 4d            	tnz	a
1169  0234 2704          	jreq	L241
1170  0236 a101          	cp	a,#1
1171  0238 2603          	jrne	L041
1172  023a               L241:
1173  023a 4f            	clr	a
1174  023b 2010          	jra	L441
1175  023d               L041:
1176  023d ae00dd        	ldw	x,#221
1177  0240 89            	pushw	x
1178  0241 ae0000        	ldw	x,#0
1179  0244 89            	pushw	x
1180  0245 ae0000        	ldw	x,#L302
1181  0248 cd0000        	call	_assert_failed
1183  024b 5b04          	addw	sp,#4
1184  024d               L441:
1185                     ; 223   if (NewState != DISABLE)
1187  024d 0d01          	tnz	(OFST+1,sp)
1188  024f 2706          	jreq	L514
1189                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1191  0251 721a5201      	bset	20993,#5
1193  0255 2004          	jra	L714
1194  0257               L514:
1195                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1197  0257 721b5201      	bres	20993,#5
1198  025b               L714:
1199                     ; 231 }
1202  025b 84            	pop	a
1203  025c 81            	ret
1268                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1268                     ; 239 {
1269                     	switch	.text
1270  025d               _SPI_GetCRC:
1272  025d 88            	push	a
1273  025e 88            	push	a
1274       00000001      OFST:	set	1
1277                     ; 240   uint8_t crcreg = 0;
1279                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1281  025f a101          	cp	a,#1
1282  0261 2703          	jreq	L251
1283  0263 4d            	tnz	a
1284  0264 2603          	jrne	L051
1285  0266               L251:
1286  0266 4f            	clr	a
1287  0267 2010          	jra	L451
1288  0269               L051:
1289  0269 ae00f3        	ldw	x,#243
1290  026c 89            	pushw	x
1291  026d ae0000        	ldw	x,#0
1292  0270 89            	pushw	x
1293  0271 ae0000        	ldw	x,#L302
1294  0274 cd0000        	call	_assert_failed
1296  0277 5b04          	addw	sp,#4
1297  0279               L451:
1298                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1300  0279 0d02          	tnz	(OFST+1,sp)
1301  027b 2707          	jreq	L354
1302                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1304  027d c65207        	ld	a,20999
1305  0280 6b01          	ld	(OFST+0,sp),a
1307  0282 2005          	jra	L554
1308  0284               L354:
1309                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1311  0284 c65206        	ld	a,20998
1312  0287 6b01          	ld	(OFST+0,sp),a
1313  0289               L554:
1314                     ; 255   return crcreg;
1316  0289 7b01          	ld	a,(OFST+0,sp)
1319  028b 85            	popw	x
1320  028c 81            	ret
1345                     ; 263 void SPI_ResetCRC(void)
1345                     ; 264 {
1346                     	switch	.text
1347  028d               _SPI_ResetCRC:
1351                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1353  028d a601          	ld	a,#1
1354  028f ada1          	call	_SPI_CalculateCRCCmd
1356                     ; 270   SPI_Cmd(ENABLE);
1358  0291 a601          	ld	a,#1
1359  0293 cd015e        	call	_SPI_Cmd
1361                     ; 271 }
1364  0296 81            	ret
1388                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1388                     ; 279 {
1389                     	switch	.text
1390  0297               _SPI_GetCRCPolynomial:
1394                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1396  0297 c65205        	ld	a,20997
1399  029a 81            	ret
1456                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1456                     ; 289 {
1457                     	switch	.text
1458  029b               _SPI_BiDirectionalLineConfig:
1460  029b 88            	push	a
1461       00000000      OFST:	set	0
1464                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1466  029c 4d            	tnz	a
1467  029d 2704          	jreq	L661
1468  029f a101          	cp	a,#1
1469  02a1 2603          	jrne	L461
1470  02a3               L661:
1471  02a3 4f            	clr	a
1472  02a4 2010          	jra	L071
1473  02a6               L461:
1474  02a6 ae0123        	ldw	x,#291
1475  02a9 89            	pushw	x
1476  02aa ae0000        	ldw	x,#0
1477  02ad 89            	pushw	x
1478  02ae ae0000        	ldw	x,#L302
1479  02b1 cd0000        	call	_assert_failed
1481  02b4 5b04          	addw	sp,#4
1482  02b6               L071:
1483                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1485  02b6 0d01          	tnz	(OFST+1,sp)
1486  02b8 2706          	jreq	L525
1487                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1489  02ba 721c5201      	bset	20993,#6
1491  02be 2004          	jra	L725
1492  02c0               L525:
1493                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1495  02c0 721d5201      	bres	20993,#6
1496  02c4               L725:
1497                     ; 301 }
1500  02c4 84            	pop	a
1501  02c5 81            	ret
1623                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1623                     ; 312 {
1624                     	switch	.text
1625  02c6               _SPI_GetFlagStatus:
1627  02c6 88            	push	a
1628  02c7 88            	push	a
1629       00000001      OFST:	set	1
1632                     ; 313   FlagStatus status = RESET;
1634                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1636  02c8 a140          	cp	a,#64
1637  02ca 2718          	jreq	L671
1638  02cc a120          	cp	a,#32
1639  02ce 2714          	jreq	L671
1640  02d0 a110          	cp	a,#16
1641  02d2 2710          	jreq	L671
1642  02d4 a108          	cp	a,#8
1643  02d6 270c          	jreq	L671
1644  02d8 a102          	cp	a,#2
1645  02da 2708          	jreq	L671
1646  02dc a101          	cp	a,#1
1647  02de 2704          	jreq	L671
1648  02e0 a180          	cp	a,#128
1649  02e2 2603          	jrne	L471
1650  02e4               L671:
1651  02e4 4f            	clr	a
1652  02e5 2010          	jra	L002
1653  02e7               L471:
1654  02e7 ae013b        	ldw	x,#315
1655  02ea 89            	pushw	x
1656  02eb ae0000        	ldw	x,#0
1657  02ee 89            	pushw	x
1658  02ef ae0000        	ldw	x,#L302
1659  02f2 cd0000        	call	_assert_failed
1661  02f5 5b04          	addw	sp,#4
1662  02f7               L002:
1663                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1665  02f7 c65203        	ld	a,20995
1666  02fa 1502          	bcp	a,(OFST+1,sp)
1667  02fc 2706          	jreq	L506
1668                     ; 320     status = SET; /* SPI_FLAG is set */
1670  02fe a601          	ld	a,#1
1671  0300 6b01          	ld	(OFST+0,sp),a
1673  0302 2002          	jra	L706
1674  0304               L506:
1675                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1677  0304 0f01          	clr	(OFST+0,sp)
1678  0306               L706:
1679                     ; 328   return status;
1681  0306 7b01          	ld	a,(OFST+0,sp)
1684  0308 85            	popw	x
1685  0309 81            	ret
1721                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1721                     ; 347 {
1722                     	switch	.text
1723  030a               _SPI_ClearFlag:
1725  030a 88            	push	a
1726       00000000      OFST:	set	0
1729                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1731  030b a110          	cp	a,#16
1732  030d 2704          	jreq	L602
1733  030f a108          	cp	a,#8
1734  0311 2603          	jrne	L402
1735  0313               L602:
1736  0313 4f            	clr	a
1737  0314 2010          	jra	L012
1738  0316               L402:
1739  0316 ae015c        	ldw	x,#348
1740  0319 89            	pushw	x
1741  031a ae0000        	ldw	x,#0
1742  031d 89            	pushw	x
1743  031e ae0000        	ldw	x,#L302
1744  0321 cd0000        	call	_assert_failed
1746  0324 5b04          	addw	sp,#4
1747  0326               L012:
1748                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1750  0326 7b01          	ld	a,(OFST+1,sp)
1751  0328 43            	cpl	a
1752  0329 c75203        	ld	20995,a
1753                     ; 351 }
1756  032c 84            	pop	a
1757  032d 81            	ret
1840                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1840                     ; 367 {
1841                     	switch	.text
1842  032e               _SPI_GetITStatus:
1844  032e 88            	push	a
1845  032f 89            	pushw	x
1846       00000002      OFST:	set	2
1849                     ; 368   ITStatus pendingbitstatus = RESET;
1851                     ; 369   uint8_t itpos = 0;
1853                     ; 370   uint8_t itmask1 = 0;
1855                     ; 371   uint8_t itmask2 = 0;
1857                     ; 372   uint8_t enablestatus = 0;
1859                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1861  0330 a165          	cp	a,#101
1862  0332 2714          	jreq	L612
1863  0334 a155          	cp	a,#85
1864  0336 2710          	jreq	L612
1865  0338 a145          	cp	a,#69
1866  033a 270c          	jreq	L612
1867  033c a134          	cp	a,#52
1868  033e 2708          	jreq	L612
1869  0340 a117          	cp	a,#23
1870  0342 2704          	jreq	L612
1871  0344 a106          	cp	a,#6
1872  0346 2603          	jrne	L412
1873  0348               L612:
1874  0348 4f            	clr	a
1875  0349 2010          	jra	L022
1876  034b               L412:
1877  034b ae0175        	ldw	x,#373
1878  034e 89            	pushw	x
1879  034f ae0000        	ldw	x,#0
1880  0352 89            	pushw	x
1881  0353 ae0000        	ldw	x,#L302
1882  0356 cd0000        	call	_assert_failed
1884  0359 5b04          	addw	sp,#4
1885  035b               L022:
1886                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1888  035b 7b03          	ld	a,(OFST+1,sp)
1889  035d a40f          	and	a,#15
1890  035f 5f            	clrw	x
1891  0360 97            	ld	xl,a
1892  0361 a601          	ld	a,#1
1893  0363 5d            	tnzw	x
1894  0364 2704          	jreq	L222
1895  0366               L422:
1896  0366 48            	sll	a
1897  0367 5a            	decw	x
1898  0368 26fc          	jrne	L422
1899  036a               L222:
1900  036a 6b01          	ld	(OFST-1,sp),a
1901                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1903  036c 7b03          	ld	a,(OFST+1,sp)
1904  036e 4e            	swap	a
1905  036f a40f          	and	a,#15
1906  0371 6b02          	ld	(OFST+0,sp),a
1907                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1909  0373 7b02          	ld	a,(OFST+0,sp)
1910  0375 5f            	clrw	x
1911  0376 97            	ld	xl,a
1912  0377 a601          	ld	a,#1
1913  0379 5d            	tnzw	x
1914  037a 2704          	jreq	L622
1915  037c               L032:
1916  037c 48            	sll	a
1917  037d 5a            	decw	x
1918  037e 26fc          	jrne	L032
1919  0380               L622:
1920  0380 6b02          	ld	(OFST+0,sp),a
1921                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1923  0382 c65203        	ld	a,20995
1924  0385 1402          	and	a,(OFST+0,sp)
1925  0387 6b02          	ld	(OFST+0,sp),a
1926                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1928  0389 c65202        	ld	a,20994
1929  038c 1501          	bcp	a,(OFST-1,sp)
1930  038e 270a          	jreq	L176
1932  0390 0d02          	tnz	(OFST+0,sp)
1933  0392 2706          	jreq	L176
1934                     ; 387     pendingbitstatus = SET;
1936  0394 a601          	ld	a,#1
1937  0396 6b02          	ld	(OFST+0,sp),a
1939  0398 2002          	jra	L376
1940  039a               L176:
1941                     ; 392     pendingbitstatus = RESET;
1943  039a 0f02          	clr	(OFST+0,sp)
1944  039c               L376:
1945                     ; 395   return  pendingbitstatus;
1947  039c 7b02          	ld	a,(OFST+0,sp)
1950  039e 5b03          	addw	sp,#3
1951  03a0 81            	ret
1997                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1997                     ; 413 {
1998                     	switch	.text
1999  03a1               _SPI_ClearITPendingBit:
2001  03a1 88            	push	a
2002  03a2 88            	push	a
2003       00000001      OFST:	set	1
2006                     ; 414   uint8_t itpos = 0;
2008                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
2010  03a3 a145          	cp	a,#69
2011  03a5 2704          	jreq	L632
2012  03a7 a134          	cp	a,#52
2013  03a9 2603          	jrne	L432
2014  03ab               L632:
2015  03ab 4f            	clr	a
2016  03ac 2010          	jra	L042
2017  03ae               L432:
2018  03ae ae019f        	ldw	x,#415
2019  03b1 89            	pushw	x
2020  03b2 ae0000        	ldw	x,#0
2021  03b5 89            	pushw	x
2022  03b6 ae0000        	ldw	x,#L302
2023  03b9 cd0000        	call	_assert_failed
2025  03bc 5b04          	addw	sp,#4
2026  03be               L042:
2027                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2029  03be 7b02          	ld	a,(OFST+1,sp)
2030  03c0 a4f0          	and	a,#240
2031  03c2 4e            	swap	a
2032  03c3 a40f          	and	a,#15
2033  03c5 5f            	clrw	x
2034  03c6 97            	ld	xl,a
2035  03c7 a601          	ld	a,#1
2036  03c9 5d            	tnzw	x
2037  03ca 2704          	jreq	L242
2038  03cc               L442:
2039  03cc 48            	sll	a
2040  03cd 5a            	decw	x
2041  03ce 26fc          	jrne	L442
2042  03d0               L242:
2043  03d0 6b01          	ld	(OFST+0,sp),a
2044                     ; 422   SPI->SR = (uint8_t)(~itpos);
2046  03d2 7b01          	ld	a,(OFST+0,sp)
2047  03d4 43            	cpl	a
2048  03d5 c75203        	ld	20995,a
2049                     ; 424 }
2052  03d8 85            	popw	x
2053  03d9 81            	ret
2066                     	xdef	_SPI_ClearITPendingBit
2067                     	xdef	_SPI_GetITStatus
2068                     	xdef	_SPI_ClearFlag
2069                     	xdef	_SPI_GetFlagStatus
2070                     	xdef	_SPI_BiDirectionalLineConfig
2071                     	xdef	_SPI_GetCRCPolynomial
2072                     	xdef	_SPI_ResetCRC
2073                     	xdef	_SPI_GetCRC
2074                     	xdef	_SPI_CalculateCRCCmd
2075                     	xdef	_SPI_TransmitCRC
2076                     	xdef	_SPI_NSSInternalSoftwareCmd
2077                     	xdef	_SPI_ReceiveData
2078                     	xdef	_SPI_SendData
2079                     	xdef	_SPI_ITConfig
2080                     	xdef	_SPI_Cmd
2081                     	xdef	_SPI_Init
2082                     	xdef	_SPI_DeInit
2083                     	xref	_assert_failed
2084                     .const:	section	.text
2085  0000               L302:
2086  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2087  0012 697665725c73  	dc.b	"iver\src\stm8s_spi"
2088  0024 2e6300        	dc.b	".c",0
2108                     	end
