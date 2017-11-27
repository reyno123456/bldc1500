   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 72 void CLK_DeInit(void)
  58                     ; 73 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 88 }
 111  0037 81            	ret
 168                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 100 {
 169                     	switch	.text
 170  0038               _CLK_FastHaltWakeUpCmd:
 172  0038 88            	push	a
 173       00000000      OFST:	set	0
 176                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178  0039 4d            	tnz	a
 179  003a 2704          	jreq	L21
 180  003c a101          	cp	a,#1
 181  003e 2603          	jrne	L01
 182  0040               L21:
 183  0040 4f            	clr	a
 184  0041 2010          	jra	L41
 185  0043               L01:
 186  0043 ae0066        	ldw	x,#102
 187  0046 89            	pushw	x
 188  0047 ae0000        	ldw	x,#0
 189  004a 89            	pushw	x
 190  004b ae000c        	ldw	x,#L75
 191  004e cd0000        	call	_assert_failed
 193  0051 5b04          	addw	sp,#4
 194  0053               L41:
 195                     ; 104   if (NewState != DISABLE)
 197  0053 0d01          	tnz	(OFST+1,sp)
 198  0055 2706          	jreq	L16
 199                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 201  0057 721450c0      	bset	20672,#2
 203  005b 2004          	jra	L36
 204  005d               L16:
 205                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 207  005d 721550c0      	bres	20672,#2
 208  0061               L36:
 209                     ; 114 }
 212  0061 84            	pop	a
 213  0062 81            	ret
 249                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 249                     ; 122 {
 250                     	switch	.text
 251  0063               _CLK_HSECmd:
 253  0063 88            	push	a
 254       00000000      OFST:	set	0
 257                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 259  0064 4d            	tnz	a
 260  0065 2704          	jreq	L22
 261  0067 a101          	cp	a,#1
 262  0069 2603          	jrne	L02
 263  006b               L22:
 264  006b 4f            	clr	a
 265  006c 2010          	jra	L42
 266  006e               L02:
 267  006e ae007c        	ldw	x,#124
 268  0071 89            	pushw	x
 269  0072 ae0000        	ldw	x,#0
 270  0075 89            	pushw	x
 271  0076 ae000c        	ldw	x,#L75
 272  0079 cd0000        	call	_assert_failed
 274  007c 5b04          	addw	sp,#4
 275  007e               L42:
 276                     ; 126   if (NewState != DISABLE)
 278  007e 0d01          	tnz	(OFST+1,sp)
 279  0080 2706          	jreq	L301
 280                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 282  0082 721050c1      	bset	20673,#0
 284  0086 2004          	jra	L501
 285  0088               L301:
 286                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 288  0088 721150c1      	bres	20673,#0
 289  008c               L501:
 290                     ; 136 }
 293  008c 84            	pop	a
 294  008d 81            	ret
 330                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 330                     ; 144 {
 331                     	switch	.text
 332  008e               _CLK_HSICmd:
 334  008e 88            	push	a
 335       00000000      OFST:	set	0
 338                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 340  008f 4d            	tnz	a
 341  0090 2704          	jreq	L23
 342  0092 a101          	cp	a,#1
 343  0094 2603          	jrne	L03
 344  0096               L23:
 345  0096 4f            	clr	a
 346  0097 2010          	jra	L43
 347  0099               L03:
 348  0099 ae0092        	ldw	x,#146
 349  009c 89            	pushw	x
 350  009d ae0000        	ldw	x,#0
 351  00a0 89            	pushw	x
 352  00a1 ae000c        	ldw	x,#L75
 353  00a4 cd0000        	call	_assert_failed
 355  00a7 5b04          	addw	sp,#4
 356  00a9               L43:
 357                     ; 148   if (NewState != DISABLE)
 359  00a9 0d01          	tnz	(OFST+1,sp)
 360  00ab 2706          	jreq	L521
 361                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 363  00ad 721050c0      	bset	20672,#0
 365  00b1 2004          	jra	L721
 366  00b3               L521:
 367                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 369  00b3 721150c0      	bres	20672,#0
 370  00b7               L721:
 371                     ; 158 }
 374  00b7 84            	pop	a
 375  00b8 81            	ret
 411                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 411                     ; 167 {
 412                     	switch	.text
 413  00b9               _CLK_LSICmd:
 415  00b9 88            	push	a
 416       00000000      OFST:	set	0
 419                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 421  00ba 4d            	tnz	a
 422  00bb 2704          	jreq	L24
 423  00bd a101          	cp	a,#1
 424  00bf 2603          	jrne	L04
 425  00c1               L24:
 426  00c1 4f            	clr	a
 427  00c2 2010          	jra	L44
 428  00c4               L04:
 429  00c4 ae00a9        	ldw	x,#169
 430  00c7 89            	pushw	x
 431  00c8 ae0000        	ldw	x,#0
 432  00cb 89            	pushw	x
 433  00cc ae000c        	ldw	x,#L75
 434  00cf cd0000        	call	_assert_failed
 436  00d2 5b04          	addw	sp,#4
 437  00d4               L44:
 438                     ; 171   if (NewState != DISABLE)
 440  00d4 0d01          	tnz	(OFST+1,sp)
 441  00d6 2706          	jreq	L741
 442                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 444  00d8 721650c0      	bset	20672,#3
 446  00dc 2004          	jra	L151
 447  00de               L741:
 448                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 450  00de 721750c0      	bres	20672,#3
 451  00e2               L151:
 452                     ; 181 }
 455  00e2 84            	pop	a
 456  00e3 81            	ret
 492                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 492                     ; 190 {
 493                     	switch	.text
 494  00e4               _CLK_CCOCmd:
 496  00e4 88            	push	a
 497       00000000      OFST:	set	0
 500                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 502  00e5 4d            	tnz	a
 503  00e6 2704          	jreq	L25
 504  00e8 a101          	cp	a,#1
 505  00ea 2603          	jrne	L05
 506  00ec               L25:
 507  00ec 4f            	clr	a
 508  00ed 2010          	jra	L45
 509  00ef               L05:
 510  00ef ae00c0        	ldw	x,#192
 511  00f2 89            	pushw	x
 512  00f3 ae0000        	ldw	x,#0
 513  00f6 89            	pushw	x
 514  00f7 ae000c        	ldw	x,#L75
 515  00fa cd0000        	call	_assert_failed
 517  00fd 5b04          	addw	sp,#4
 518  00ff               L45:
 519                     ; 194   if (NewState != DISABLE)
 521  00ff 0d01          	tnz	(OFST+1,sp)
 522  0101 2706          	jreq	L171
 523                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 525  0103 721050c9      	bset	20681,#0
 527  0107 2004          	jra	L371
 528  0109               L171:
 529                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 531  0109 721150c9      	bres	20681,#0
 532  010d               L371:
 533                     ; 204 }
 536  010d 84            	pop	a
 537  010e 81            	ret
 573                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 573                     ; 214 {
 574                     	switch	.text
 575  010f               _CLK_ClockSwitchCmd:
 577  010f 88            	push	a
 578       00000000      OFST:	set	0
 581                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 583  0110 4d            	tnz	a
 584  0111 2704          	jreq	L26
 585  0113 a101          	cp	a,#1
 586  0115 2603          	jrne	L06
 587  0117               L26:
 588  0117 4f            	clr	a
 589  0118 2010          	jra	L46
 590  011a               L06:
 591  011a ae00d8        	ldw	x,#216
 592  011d 89            	pushw	x
 593  011e ae0000        	ldw	x,#0
 594  0121 89            	pushw	x
 595  0122 ae000c        	ldw	x,#L75
 596  0125 cd0000        	call	_assert_failed
 598  0128 5b04          	addw	sp,#4
 599  012a               L46:
 600                     ; 218   if (NewState != DISABLE )
 602  012a 0d01          	tnz	(OFST+1,sp)
 603  012c 2706          	jreq	L312
 604                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 606  012e 721250c5      	bset	20677,#1
 608  0132 2004          	jra	L512
 609  0134               L312:
 610                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 612  0134 721350c5      	bres	20677,#1
 613  0138               L512:
 614                     ; 228 }
 617  0138 84            	pop	a
 618  0139 81            	ret
 655                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 655                     ; 239 {
 656                     	switch	.text
 657  013a               _CLK_SlowActiveHaltWakeUpCmd:
 659  013a 88            	push	a
 660       00000000      OFST:	set	0
 663                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 665  013b 4d            	tnz	a
 666  013c 2704          	jreq	L27
 667  013e a101          	cp	a,#1
 668  0140 2603          	jrne	L07
 669  0142               L27:
 670  0142 4f            	clr	a
 671  0143 2010          	jra	L47
 672  0145               L07:
 673  0145 ae00f1        	ldw	x,#241
 674  0148 89            	pushw	x
 675  0149 ae0000        	ldw	x,#0
 676  014c 89            	pushw	x
 677  014d ae000c        	ldw	x,#L75
 678  0150 cd0000        	call	_assert_failed
 680  0153 5b04          	addw	sp,#4
 681  0155               L47:
 682                     ; 243   if (NewState != DISABLE)
 684  0155 0d01          	tnz	(OFST+1,sp)
 685  0157 2706          	jreq	L532
 686                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 688  0159 721a50c0      	bset	20672,#5
 690  015d 2004          	jra	L732
 691  015f               L532:
 692                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 694  015f 721b50c0      	bres	20672,#5
 695  0163               L732:
 696                     ; 253 }
 699  0163 84            	pop	a
 700  0164 81            	ret
 860                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 860                     ; 264 {
 861                     	switch	.text
 862  0165               _CLK_PeripheralClockConfig:
 864  0165 89            	pushw	x
 865       00000000      OFST:	set	0
 868                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 870  0166 9f            	ld	a,xl
 871  0167 4d            	tnz	a
 872  0168 2705          	jreq	L201
 873  016a 9f            	ld	a,xl
 874  016b a101          	cp	a,#1
 875  016d 2603          	jrne	L001
 876  016f               L201:
 877  016f 4f            	clr	a
 878  0170 2010          	jra	L401
 879  0172               L001:
 880  0172 ae010a        	ldw	x,#266
 881  0175 89            	pushw	x
 882  0176 ae0000        	ldw	x,#0
 883  0179 89            	pushw	x
 884  017a ae000c        	ldw	x,#L75
 885  017d cd0000        	call	_assert_failed
 887  0180 5b04          	addw	sp,#4
 888  0182               L401:
 889                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 891  0182 0d01          	tnz	(OFST+1,sp)
 892  0184 274e          	jreq	L011
 893  0186 7b01          	ld	a,(OFST+1,sp)
 894  0188 a101          	cp	a,#1
 895  018a 2748          	jreq	L011
 896  018c 7b01          	ld	a,(OFST+1,sp)
 897  018e a103          	cp	a,#3
 898  0190 2742          	jreq	L011
 899  0192 7b01          	ld	a,(OFST+1,sp)
 900  0194 a103          	cp	a,#3
 901  0196 273c          	jreq	L011
 902  0198 7b01          	ld	a,(OFST+1,sp)
 903  019a a102          	cp	a,#2
 904  019c 2736          	jreq	L011
 905  019e 7b01          	ld	a,(OFST+1,sp)
 906  01a0 a104          	cp	a,#4
 907  01a2 2730          	jreq	L011
 908  01a4 7b01          	ld	a,(OFST+1,sp)
 909  01a6 a105          	cp	a,#5
 910  01a8 272a          	jreq	L011
 911  01aa 7b01          	ld	a,(OFST+1,sp)
 912  01ac a105          	cp	a,#5
 913  01ae 2724          	jreq	L011
 914  01b0 7b01          	ld	a,(OFST+1,sp)
 915  01b2 a104          	cp	a,#4
 916  01b4 271e          	jreq	L011
 917  01b6 7b01          	ld	a,(OFST+1,sp)
 918  01b8 a106          	cp	a,#6
 919  01ba 2718          	jreq	L011
 920  01bc 7b01          	ld	a,(OFST+1,sp)
 921  01be a107          	cp	a,#7
 922  01c0 2712          	jreq	L011
 923  01c2 7b01          	ld	a,(OFST+1,sp)
 924  01c4 a117          	cp	a,#23
 925  01c6 270c          	jreq	L011
 926  01c8 7b01          	ld	a,(OFST+1,sp)
 927  01ca a113          	cp	a,#19
 928  01cc 2706          	jreq	L011
 929  01ce 7b01          	ld	a,(OFST+1,sp)
 930  01d0 a112          	cp	a,#18
 931  01d2 2603          	jrne	L601
 932  01d4               L011:
 933  01d4 4f            	clr	a
 934  01d5 2010          	jra	L211
 935  01d7               L601:
 936  01d7 ae010b        	ldw	x,#267
 937  01da 89            	pushw	x
 938  01db ae0000        	ldw	x,#0
 939  01de 89            	pushw	x
 940  01df ae000c        	ldw	x,#L75
 941  01e2 cd0000        	call	_assert_failed
 943  01e5 5b04          	addw	sp,#4
 944  01e7               L211:
 945                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 947  01e7 7b01          	ld	a,(OFST+1,sp)
 948  01e9 a510          	bcp	a,#16
 949  01eb 2633          	jrne	L323
 950                     ; 271     if (NewState != DISABLE)
 952  01ed 0d02          	tnz	(OFST+2,sp)
 953  01ef 2717          	jreq	L523
 954                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 956  01f1 7b01          	ld	a,(OFST+1,sp)
 957  01f3 a40f          	and	a,#15
 958  01f5 5f            	clrw	x
 959  01f6 97            	ld	xl,a
 960  01f7 a601          	ld	a,#1
 961  01f9 5d            	tnzw	x
 962  01fa 2704          	jreq	L411
 963  01fc               L611:
 964  01fc 48            	sll	a
 965  01fd 5a            	decw	x
 966  01fe 26fc          	jrne	L611
 967  0200               L411:
 968  0200 ca50c7        	or	a,20679
 969  0203 c750c7        	ld	20679,a
 971  0206 2049          	jra	L133
 972  0208               L523:
 973                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 975  0208 7b01          	ld	a,(OFST+1,sp)
 976  020a a40f          	and	a,#15
 977  020c 5f            	clrw	x
 978  020d 97            	ld	xl,a
 979  020e a601          	ld	a,#1
 980  0210 5d            	tnzw	x
 981  0211 2704          	jreq	L021
 982  0213               L221:
 983  0213 48            	sll	a
 984  0214 5a            	decw	x
 985  0215 26fc          	jrne	L221
 986  0217               L021:
 987  0217 43            	cpl	a
 988  0218 c450c7        	and	a,20679
 989  021b c750c7        	ld	20679,a
 990  021e 2031          	jra	L133
 991  0220               L323:
 992                     ; 284     if (NewState != DISABLE)
 994  0220 0d02          	tnz	(OFST+2,sp)
 995  0222 2717          	jreq	L333
 996                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 998  0224 7b01          	ld	a,(OFST+1,sp)
 999  0226 a40f          	and	a,#15
1000  0228 5f            	clrw	x
1001  0229 97            	ld	xl,a
1002  022a a601          	ld	a,#1
1003  022c 5d            	tnzw	x
1004  022d 2704          	jreq	L421
1005  022f               L621:
1006  022f 48            	sll	a
1007  0230 5a            	decw	x
1008  0231 26fc          	jrne	L621
1009  0233               L421:
1010  0233 ca50ca        	or	a,20682
1011  0236 c750ca        	ld	20682,a
1013  0239 2016          	jra	L133
1014  023b               L333:
1015                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1017  023b 7b01          	ld	a,(OFST+1,sp)
1018  023d a40f          	and	a,#15
1019  023f 5f            	clrw	x
1020  0240 97            	ld	xl,a
1021  0241 a601          	ld	a,#1
1022  0243 5d            	tnzw	x
1023  0244 2704          	jreq	L031
1024  0246               L231:
1025  0246 48            	sll	a
1026  0247 5a            	decw	x
1027  0248 26fc          	jrne	L231
1028  024a               L031:
1029  024a 43            	cpl	a
1030  024b c450ca        	and	a,20682
1031  024e c750ca        	ld	20682,a
1032  0251               L133:
1033                     ; 295 }
1036  0251 85            	popw	x
1037  0252 81            	ret
1226                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1226                     ; 310 {
1227                     	switch	.text
1228  0253               _CLK_ClockSwitchConfig:
1230  0253 89            	pushw	x
1231  0254 5204          	subw	sp,#4
1232       00000004      OFST:	set	4
1235                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1237  0256 aeffff        	ldw	x,#65535
1238  0259 1f03          	ldw	(OFST-1,sp),x
1239                     ; 313   ErrorStatus Swif = ERROR;
1241                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1243  025b 7b06          	ld	a,(OFST+2,sp)
1244  025d a1e1          	cp	a,#225
1245  025f 270c          	jreq	L041
1246  0261 7b06          	ld	a,(OFST+2,sp)
1247  0263 a1d2          	cp	a,#210
1248  0265 2706          	jreq	L041
1249  0267 7b06          	ld	a,(OFST+2,sp)
1250  0269 a1b4          	cp	a,#180
1251  026b 2603          	jrne	L631
1252  026d               L041:
1253  026d 4f            	clr	a
1254  026e 2010          	jra	L241
1255  0270               L631:
1256  0270 ae013c        	ldw	x,#316
1257  0273 89            	pushw	x
1258  0274 ae0000        	ldw	x,#0
1259  0277 89            	pushw	x
1260  0278 ae000c        	ldw	x,#L75
1261  027b cd0000        	call	_assert_failed
1263  027e 5b04          	addw	sp,#4
1264  0280               L241:
1265                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1267  0280 0d05          	tnz	(OFST+1,sp)
1268  0282 2706          	jreq	L641
1269  0284 7b05          	ld	a,(OFST+1,sp)
1270  0286 a101          	cp	a,#1
1271  0288 2603          	jrne	L441
1272  028a               L641:
1273  028a 4f            	clr	a
1274  028b 2010          	jra	L051
1275  028d               L441:
1276  028d ae013d        	ldw	x,#317
1277  0290 89            	pushw	x
1278  0291 ae0000        	ldw	x,#0
1279  0294 89            	pushw	x
1280  0295 ae000c        	ldw	x,#L75
1281  0298 cd0000        	call	_assert_failed
1283  029b 5b04          	addw	sp,#4
1284  029d               L051:
1285                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1287  029d 0d09          	tnz	(OFST+5,sp)
1288  029f 2706          	jreq	L451
1289  02a1 7b09          	ld	a,(OFST+5,sp)
1290  02a3 a101          	cp	a,#1
1291  02a5 2603          	jrne	L251
1292  02a7               L451:
1293  02a7 4f            	clr	a
1294  02a8 2010          	jra	L651
1295  02aa               L251:
1296  02aa ae013e        	ldw	x,#318
1297  02ad 89            	pushw	x
1298  02ae ae0000        	ldw	x,#0
1299  02b1 89            	pushw	x
1300  02b2 ae000c        	ldw	x,#L75
1301  02b5 cd0000        	call	_assert_failed
1303  02b8 5b04          	addw	sp,#4
1304  02ba               L651:
1305                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1307  02ba 0d0a          	tnz	(OFST+6,sp)
1308  02bc 2706          	jreq	L261
1309  02be 7b0a          	ld	a,(OFST+6,sp)
1310  02c0 a101          	cp	a,#1
1311  02c2 2603          	jrne	L061
1312  02c4               L261:
1313  02c4 4f            	clr	a
1314  02c5 2010          	jra	L461
1315  02c7               L061:
1316  02c7 ae013f        	ldw	x,#319
1317  02ca 89            	pushw	x
1318  02cb ae0000        	ldw	x,#0
1319  02ce 89            	pushw	x
1320  02cf ae000c        	ldw	x,#L75
1321  02d2 cd0000        	call	_assert_failed
1323  02d5 5b04          	addw	sp,#4
1324  02d7               L461:
1325                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1327  02d7 c650c3        	ld	a,20675
1328  02da 6b01          	ld	(OFST-3,sp),a
1329                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1331  02dc 7b05          	ld	a,(OFST+1,sp)
1332  02de a101          	cp	a,#1
1333  02e0 264b          	jrne	L744
1334                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1336  02e2 721250c5      	bset	20677,#1
1337                     ; 331     if (ITState != DISABLE)
1339  02e6 0d09          	tnz	(OFST+5,sp)
1340  02e8 2706          	jreq	L154
1341                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1343  02ea 721450c5      	bset	20677,#2
1345  02ee 2004          	jra	L354
1346  02f0               L154:
1347                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1349  02f0 721550c5      	bres	20677,#2
1350  02f4               L354:
1351                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1353  02f4 7b06          	ld	a,(OFST+2,sp)
1354  02f6 c750c4        	ld	20676,a
1356  02f9 2007          	jra	L164
1357  02fb               L554:
1358                     ; 346       DownCounter--;
1360  02fb 1e03          	ldw	x,(OFST-1,sp)
1361  02fd 1d0001        	subw	x,#1
1362  0300 1f03          	ldw	(OFST-1,sp),x
1363  0302               L164:
1364                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1366  0302 c650c5        	ld	a,20677
1367  0305 a501          	bcp	a,#1
1368  0307 2704          	jreq	L564
1370  0309 1e03          	ldw	x,(OFST-1,sp)
1371  030b 26ee          	jrne	L554
1372  030d               L564:
1373                     ; 349     if(DownCounter != 0)
1375  030d 1e03          	ldw	x,(OFST-1,sp)
1376  030f 2706          	jreq	L764
1377                     ; 351       Swif = SUCCESS;
1379  0311 a601          	ld	a,#1
1380  0313 6b02          	ld	(OFST-2,sp),a
1382  0315 2002          	jra	L374
1383  0317               L764:
1384                     ; 355       Swif = ERROR;
1386  0317 0f02          	clr	(OFST-2,sp)
1387  0319               L374:
1388                     ; 390   if(Swif != ERROR)
1390  0319 0d02          	tnz	(OFST-2,sp)
1391  031b 2767          	jreq	L715
1392                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1394  031d 0d0a          	tnz	(OFST+6,sp)
1395  031f 2645          	jrne	L125
1397  0321 7b01          	ld	a,(OFST-3,sp)
1398  0323 a1e1          	cp	a,#225
1399  0325 263f          	jrne	L125
1400                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1402  0327 721150c0      	bres	20672,#0
1404  032b 2057          	jra	L715
1405  032d               L744:
1406                     ; 361     if (ITState != DISABLE)
1408  032d 0d09          	tnz	(OFST+5,sp)
1409  032f 2706          	jreq	L574
1410                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1412  0331 721450c5      	bset	20677,#2
1414  0335 2004          	jra	L774
1415  0337               L574:
1416                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1418  0337 721550c5      	bres	20677,#2
1419  033b               L774:
1420                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1422  033b 7b06          	ld	a,(OFST+2,sp)
1423  033d c750c4        	ld	20676,a
1425  0340 2007          	jra	L505
1426  0342               L105:
1427                     ; 376       DownCounter--;
1429  0342 1e03          	ldw	x,(OFST-1,sp)
1430  0344 1d0001        	subw	x,#1
1431  0347 1f03          	ldw	(OFST-1,sp),x
1432  0349               L505:
1433                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1435  0349 c650c5        	ld	a,20677
1436  034c a508          	bcp	a,#8
1437  034e 2704          	jreq	L115
1439  0350 1e03          	ldw	x,(OFST-1,sp)
1440  0352 26ee          	jrne	L105
1441  0354               L115:
1442                     ; 379     if(DownCounter != 0)
1444  0354 1e03          	ldw	x,(OFST-1,sp)
1445  0356 270a          	jreq	L315
1446                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1448  0358 721250c5      	bset	20677,#1
1449                     ; 383       Swif = SUCCESS;
1451  035c a601          	ld	a,#1
1452  035e 6b02          	ld	(OFST-2,sp),a
1454  0360 20b7          	jra	L374
1455  0362               L315:
1456                     ; 387       Swif = ERROR;
1458  0362 0f02          	clr	(OFST-2,sp)
1459  0364 20b3          	jra	L374
1460  0366               L125:
1461                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1463  0366 0d0a          	tnz	(OFST+6,sp)
1464  0368 260c          	jrne	L525
1466  036a 7b01          	ld	a,(OFST-3,sp)
1467  036c a1d2          	cp	a,#210
1468  036e 2606          	jrne	L525
1469                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1471  0370 721750c0      	bres	20672,#3
1473  0374 200e          	jra	L715
1474  0376               L525:
1475                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1477  0376 0d0a          	tnz	(OFST+6,sp)
1478  0378 260a          	jrne	L715
1480  037a 7b01          	ld	a,(OFST-3,sp)
1481  037c a1b4          	cp	a,#180
1482  037e 2604          	jrne	L715
1483                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1485  0380 721150c1      	bres	20673,#0
1486  0384               L715:
1487                     ; 406   return(Swif);
1489  0384 7b02          	ld	a,(OFST-2,sp)
1492  0386 5b06          	addw	sp,#6
1493  0388 81            	ret
1632                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1632                     ; 416 {
1633                     	switch	.text
1634  0389               _CLK_HSIPrescalerConfig:
1636  0389 88            	push	a
1637       00000000      OFST:	set	0
1640                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1642  038a 4d            	tnz	a
1643  038b 270c          	jreq	L271
1644  038d a108          	cp	a,#8
1645  038f 2708          	jreq	L271
1646  0391 a110          	cp	a,#16
1647  0393 2704          	jreq	L271
1648  0395 a118          	cp	a,#24
1649  0397 2603          	jrne	L071
1650  0399               L271:
1651  0399 4f            	clr	a
1652  039a 2010          	jra	L471
1653  039c               L071:
1654  039c ae01a2        	ldw	x,#418
1655  039f 89            	pushw	x
1656  03a0 ae0000        	ldw	x,#0
1657  03a3 89            	pushw	x
1658  03a4 ae000c        	ldw	x,#L75
1659  03a7 cd0000        	call	_assert_failed
1661  03aa 5b04          	addw	sp,#4
1662  03ac               L471:
1663                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1665  03ac c650c6        	ld	a,20678
1666  03af a4e7          	and	a,#231
1667  03b1 c750c6        	ld	20678,a
1668                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1670  03b4 c650c6        	ld	a,20678
1671  03b7 1a01          	or	a,(OFST+1,sp)
1672  03b9 c750c6        	ld	20678,a
1673                     ; 425 }
1676  03bc 84            	pop	a
1677  03bd 81            	ret
1813                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1813                     ; 437 {
1814                     	switch	.text
1815  03be               _CLK_CCOConfig:
1817  03be 88            	push	a
1818       00000000      OFST:	set	0
1821                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1823  03bf 4d            	tnz	a
1824  03c0 2730          	jreq	L202
1825  03c2 a104          	cp	a,#4
1826  03c4 272c          	jreq	L202
1827  03c6 a102          	cp	a,#2
1828  03c8 2728          	jreq	L202
1829  03ca a108          	cp	a,#8
1830  03cc 2724          	jreq	L202
1831  03ce a10a          	cp	a,#10
1832  03d0 2720          	jreq	L202
1833  03d2 a10c          	cp	a,#12
1834  03d4 271c          	jreq	L202
1835  03d6 a10e          	cp	a,#14
1836  03d8 2718          	jreq	L202
1837  03da a110          	cp	a,#16
1838  03dc 2714          	jreq	L202
1839  03de a112          	cp	a,#18
1840  03e0 2710          	jreq	L202
1841  03e2 a114          	cp	a,#20
1842  03e4 270c          	jreq	L202
1843  03e6 a116          	cp	a,#22
1844  03e8 2708          	jreq	L202
1845  03ea a118          	cp	a,#24
1846  03ec 2704          	jreq	L202
1847  03ee a11a          	cp	a,#26
1848  03f0 2603          	jrne	L002
1849  03f2               L202:
1850  03f2 4f            	clr	a
1851  03f3 2010          	jra	L402
1852  03f5               L002:
1853  03f5 ae01b7        	ldw	x,#439
1854  03f8 89            	pushw	x
1855  03f9 ae0000        	ldw	x,#0
1856  03fc 89            	pushw	x
1857  03fd ae000c        	ldw	x,#L75
1858  0400 cd0000        	call	_assert_failed
1860  0403 5b04          	addw	sp,#4
1861  0405               L402:
1862                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1864  0405 c650c9        	ld	a,20681
1865  0408 a4e1          	and	a,#225
1866  040a c750c9        	ld	20681,a
1867                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1869  040d c650c9        	ld	a,20681
1870  0410 1a01          	or	a,(OFST+1,sp)
1871  0412 c750c9        	ld	20681,a
1872                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1874  0415 721050c9      	bset	20681,#0
1875                     ; 449 }
1878  0419 84            	pop	a
1879  041a 81            	ret
1945                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1945                     ; 460 {
1946                     	switch	.text
1947  041b               _CLK_ITConfig:
1949  041b 89            	pushw	x
1950       00000000      OFST:	set	0
1953                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1955  041c 9f            	ld	a,xl
1956  041d 4d            	tnz	a
1957  041e 2705          	jreq	L212
1958  0420 9f            	ld	a,xl
1959  0421 a101          	cp	a,#1
1960  0423 2603          	jrne	L012
1961  0425               L212:
1962  0425 4f            	clr	a
1963  0426 2010          	jra	L412
1964  0428               L012:
1965  0428 ae01ce        	ldw	x,#462
1966  042b 89            	pushw	x
1967  042c ae0000        	ldw	x,#0
1968  042f 89            	pushw	x
1969  0430 ae000c        	ldw	x,#L75
1970  0433 cd0000        	call	_assert_failed
1972  0436 5b04          	addw	sp,#4
1973  0438               L412:
1974                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1976  0438 7b01          	ld	a,(OFST+1,sp)
1977  043a a10c          	cp	a,#12
1978  043c 2706          	jreq	L022
1979  043e 7b01          	ld	a,(OFST+1,sp)
1980  0440 a11c          	cp	a,#28
1981  0442 2603          	jrne	L612
1982  0444               L022:
1983  0444 4f            	clr	a
1984  0445 2010          	jra	L222
1985  0447               L612:
1986  0447 ae01cf        	ldw	x,#463
1987  044a 89            	pushw	x
1988  044b ae0000        	ldw	x,#0
1989  044e 89            	pushw	x
1990  044f ae000c        	ldw	x,#L75
1991  0452 cd0000        	call	_assert_failed
1993  0455 5b04          	addw	sp,#4
1994  0457               L222:
1995                     ; 465   if (NewState != DISABLE)
1997  0457 0d02          	tnz	(OFST+2,sp)
1998  0459 271a          	jreq	L727
1999                     ; 467     switch (CLK_IT)
2001  045b 7b01          	ld	a,(OFST+1,sp)
2003                     ; 475     default:
2003                     ; 476       break;
2004  045d a00c          	sub	a,#12
2005  045f 270a          	jreq	L366
2006  0461 a010          	sub	a,#16
2007  0463 2624          	jrne	L537
2008                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
2008                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
2010  0465 721450c5      	bset	20677,#2
2011                     ; 471       break;
2013  0469 201e          	jra	L537
2014  046b               L366:
2015                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2015                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2017  046b 721450c8      	bset	20680,#2
2018                     ; 474       break;
2020  046f 2018          	jra	L537
2021  0471               L566:
2022                     ; 475     default:
2022                     ; 476       break;
2024  0471 2016          	jra	L537
2025  0473               L337:
2027  0473 2014          	jra	L537
2028  0475               L727:
2029                     ; 481     switch (CLK_IT)
2031  0475 7b01          	ld	a,(OFST+1,sp)
2033                     ; 489     default:
2033                     ; 490       break;
2034  0477 a00c          	sub	a,#12
2035  0479 270a          	jreq	L176
2036  047b a010          	sub	a,#16
2037  047d 260a          	jrne	L537
2038                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2038                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2040  047f 721550c5      	bres	20677,#2
2041                     ; 485       break;
2043  0483 2004          	jra	L537
2044  0485               L176:
2045                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2045                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2047  0485 721550c8      	bres	20680,#2
2048                     ; 488       break;
2049  0489               L537:
2050                     ; 493 }
2053  0489 85            	popw	x
2054  048a 81            	ret
2055  048b               L376:
2056                     ; 489     default:
2056                     ; 490       break;
2058  048b 20fc          	jra	L537
2059  048d               L147:
2060  048d 20fa          	jra	L537
2096                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2096                     ; 501 {
2097                     	switch	.text
2098  048f               _CLK_SYSCLKConfig:
2100  048f 88            	push	a
2101       00000000      OFST:	set	0
2104                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2106  0490 4d            	tnz	a
2107  0491 272c          	jreq	L032
2108  0493 a108          	cp	a,#8
2109  0495 2728          	jreq	L032
2110  0497 a110          	cp	a,#16
2111  0499 2724          	jreq	L032
2112  049b a118          	cp	a,#24
2113  049d 2720          	jreq	L032
2114  049f a180          	cp	a,#128
2115  04a1 271c          	jreq	L032
2116  04a3 a181          	cp	a,#129
2117  04a5 2718          	jreq	L032
2118  04a7 a182          	cp	a,#130
2119  04a9 2714          	jreq	L032
2120  04ab a183          	cp	a,#131
2121  04ad 2710          	jreq	L032
2122  04af a184          	cp	a,#132
2123  04b1 270c          	jreq	L032
2124  04b3 a185          	cp	a,#133
2125  04b5 2708          	jreq	L032
2126  04b7 a186          	cp	a,#134
2127  04b9 2704          	jreq	L032
2128  04bb a187          	cp	a,#135
2129  04bd 2603          	jrne	L622
2130  04bf               L032:
2131  04bf 4f            	clr	a
2132  04c0 2010          	jra	L232
2133  04c2               L622:
2134  04c2 ae01f7        	ldw	x,#503
2135  04c5 89            	pushw	x
2136  04c6 ae0000        	ldw	x,#0
2137  04c9 89            	pushw	x
2138  04ca ae000c        	ldw	x,#L75
2139  04cd cd0000        	call	_assert_failed
2141  04d0 5b04          	addw	sp,#4
2142  04d2               L232:
2143                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2145  04d2 7b01          	ld	a,(OFST+1,sp)
2146  04d4 a580          	bcp	a,#128
2147  04d6 2614          	jrne	L167
2148                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2150  04d8 c650c6        	ld	a,20678
2151  04db a4e7          	and	a,#231
2152  04dd c750c6        	ld	20678,a
2153                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2155  04e0 7b01          	ld	a,(OFST+1,sp)
2156  04e2 a418          	and	a,#24
2157  04e4 ca50c6        	or	a,20678
2158  04e7 c750c6        	ld	20678,a
2160  04ea 2012          	jra	L367
2161  04ec               L167:
2162                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2164  04ec c650c6        	ld	a,20678
2165  04ef a4f8          	and	a,#248
2166  04f1 c750c6        	ld	20678,a
2167                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2169  04f4 7b01          	ld	a,(OFST+1,sp)
2170  04f6 a407          	and	a,#7
2171  04f8 ca50c6        	or	a,20678
2172  04fb c750c6        	ld	20678,a
2173  04fe               L367:
2174                     ; 515 }
2177  04fe 84            	pop	a
2178  04ff 81            	ret
2235                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2235                     ; 524 {
2236                     	switch	.text
2237  0500               _CLK_SWIMConfig:
2239  0500 88            	push	a
2240       00000000      OFST:	set	0
2243                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2245  0501 4d            	tnz	a
2246  0502 2704          	jreq	L042
2247  0504 a101          	cp	a,#1
2248  0506 2603          	jrne	L632
2249  0508               L042:
2250  0508 4f            	clr	a
2251  0509 2010          	jra	L242
2252  050b               L632:
2253  050b ae020e        	ldw	x,#526
2254  050e 89            	pushw	x
2255  050f ae0000        	ldw	x,#0
2256  0512 89            	pushw	x
2257  0513 ae000c        	ldw	x,#L75
2258  0516 cd0000        	call	_assert_failed
2260  0519 5b04          	addw	sp,#4
2261  051b               L242:
2262                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2264  051b 0d01          	tnz	(OFST+1,sp)
2265  051d 2706          	jreq	L3101
2266                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2268  051f 721050cd      	bset	20685,#0
2270  0523 2004          	jra	L5101
2271  0525               L3101:
2272                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2274  0525 721150cd      	bres	20685,#0
2275  0529               L5101:
2276                     ; 538 }
2279  0529 84            	pop	a
2280  052a 81            	ret
2304                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2304                     ; 548 {
2305                     	switch	.text
2306  052b               _CLK_ClockSecuritySystemEnable:
2310                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2312  052b 721050c8      	bset	20680,#0
2313                     ; 551 }
2316  052f 81            	ret
2341                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2341                     ; 560 {
2342                     	switch	.text
2343  0530               _CLK_GetSYSCLKSource:
2347                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2349  0530 c650c3        	ld	a,20675
2352  0533 81            	ret
2415                     ; 569 uint32_t CLK_GetClockFreq(void)
2415                     ; 570 {
2416                     	switch	.text
2417  0534               _CLK_GetClockFreq:
2419  0534 5209          	subw	sp,#9
2420       00000009      OFST:	set	9
2423                     ; 571   uint32_t clockfrequency = 0;
2425                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2427                     ; 573   uint8_t tmp = 0, presc = 0;
2431                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2433  0536 c650c3        	ld	a,20675
2434  0539 6b09          	ld	(OFST+0,sp),a
2435                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2437  053b 7b09          	ld	a,(OFST+0,sp)
2438  053d a1e1          	cp	a,#225
2439  053f 2641          	jrne	L1701
2440                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2442  0541 c650c6        	ld	a,20678
2443  0544 a418          	and	a,#24
2444  0546 6b09          	ld	(OFST+0,sp),a
2445                     ; 581     tmp = (uint8_t)(tmp >> 3);
2447  0548 0409          	srl	(OFST+0,sp)
2448  054a 0409          	srl	(OFST+0,sp)
2449  054c 0409          	srl	(OFST+0,sp)
2450                     ; 582     presc = HSIDivFactor[tmp];
2452  054e 7b09          	ld	a,(OFST+0,sp)
2453  0550 5f            	clrw	x
2454  0551 97            	ld	xl,a
2455  0552 d60000        	ld	a,(_HSIDivFactor,x)
2456  0555 6b09          	ld	(OFST+0,sp),a
2457                     ; 583     clockfrequency = HSI_VALUE / presc;
2459  0557 7b09          	ld	a,(OFST+0,sp)
2460  0559 b703          	ld	c_lreg+3,a
2461  055b 3f02          	clr	c_lreg+2
2462  055d 3f01          	clr	c_lreg+1
2463  055f 3f00          	clr	c_lreg
2464  0561 96            	ldw	x,sp
2465  0562 1c0001        	addw	x,#OFST-8
2466  0565 cd0000        	call	c_rtol
2468  0568 ae2400        	ldw	x,#9216
2469  056b bf02          	ldw	c_lreg+2,x
2470  056d ae00f4        	ldw	x,#244
2471  0570 bf00          	ldw	c_lreg,x
2472  0572 96            	ldw	x,sp
2473  0573 1c0001        	addw	x,#OFST-8
2474  0576 cd0000        	call	c_ludv
2476  0579 96            	ldw	x,sp
2477  057a 1c0005        	addw	x,#OFST-4
2478  057d cd0000        	call	c_rtol
2481  0580 201c          	jra	L3701
2482  0582               L1701:
2483                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2485  0582 7b09          	ld	a,(OFST+0,sp)
2486  0584 a1d2          	cp	a,#210
2487  0586 260c          	jrne	L5701
2488                     ; 587     clockfrequency = LSI_VALUE;
2490  0588 aef400        	ldw	x,#62464
2491  058b 1f07          	ldw	(OFST-2,sp),x
2492  058d ae0001        	ldw	x,#1
2493  0590 1f05          	ldw	(OFST-4,sp),x
2495  0592 200a          	jra	L3701
2496  0594               L5701:
2497                     ; 591     clockfrequency = HSE_VALUE;
2499  0594 ae3600        	ldw	x,#13824
2500  0597 1f07          	ldw	(OFST-2,sp),x
2501  0599 ae016e        	ldw	x,#366
2502  059c 1f05          	ldw	(OFST-4,sp),x
2503  059e               L3701:
2504                     ; 594   return((uint32_t)clockfrequency);
2506  059e 96            	ldw	x,sp
2507  059f 1c0005        	addw	x,#OFST-4
2508  05a2 cd0000        	call	c_ltor
2512  05a5 5b09          	addw	sp,#9
2513  05a7 81            	ret
2613                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2613                     ; 605 {
2614                     	switch	.text
2615  05a8               _CLK_AdjustHSICalibrationValue:
2617  05a8 88            	push	a
2618       00000000      OFST:	set	0
2621                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2623  05a9 4d            	tnz	a
2624  05aa 271c          	jreq	L652
2625  05ac a101          	cp	a,#1
2626  05ae 2718          	jreq	L652
2627  05b0 a102          	cp	a,#2
2628  05b2 2714          	jreq	L652
2629  05b4 a103          	cp	a,#3
2630  05b6 2710          	jreq	L652
2631  05b8 a104          	cp	a,#4
2632  05ba 270c          	jreq	L652
2633  05bc a105          	cp	a,#5
2634  05be 2708          	jreq	L652
2635  05c0 a106          	cp	a,#6
2636  05c2 2704          	jreq	L652
2637  05c4 a107          	cp	a,#7
2638  05c6 2603          	jrne	L452
2639  05c8               L652:
2640  05c8 4f            	clr	a
2641  05c9 2010          	jra	L062
2642  05cb               L452:
2643  05cb ae025f        	ldw	x,#607
2644  05ce 89            	pushw	x
2645  05cf ae0000        	ldw	x,#0
2646  05d2 89            	pushw	x
2647  05d3 ae000c        	ldw	x,#L75
2648  05d6 cd0000        	call	_assert_failed
2650  05d9 5b04          	addw	sp,#4
2651  05db               L062:
2652                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2654  05db c650cc        	ld	a,20684
2655  05de a4f8          	and	a,#248
2656  05e0 1a01          	or	a,(OFST+1,sp)
2657  05e2 c750cc        	ld	20684,a
2658                     ; 611 }
2661  05e5 84            	pop	a
2662  05e6 81            	ret
2686                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2686                     ; 623 {
2687                     	switch	.text
2688  05e7               _CLK_SYSCLKEmergencyClear:
2692                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2694  05e7 721150c5      	bres	20677,#0
2695                     ; 625 }
2698  05eb 81            	ret
2852                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2852                     ; 635 {
2853                     	switch	.text
2854  05ec               _CLK_GetFlagStatus:
2856  05ec 89            	pushw	x
2857  05ed 5203          	subw	sp,#3
2858       00000003      OFST:	set	3
2861                     ; 636   uint16_t statusreg = 0;
2863                     ; 637   uint8_t tmpreg = 0;
2865                     ; 638   FlagStatus bitstatus = RESET;
2867                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2869  05ef a30110        	cpw	x,#272
2870  05f2 2728          	jreq	L072
2871  05f4 a30102        	cpw	x,#258
2872  05f7 2723          	jreq	L072
2873  05f9 a30202        	cpw	x,#514
2874  05fc 271e          	jreq	L072
2875  05fe a30308        	cpw	x,#776
2876  0601 2719          	jreq	L072
2877  0603 a30301        	cpw	x,#769
2878  0606 2714          	jreq	L072
2879  0608 a30408        	cpw	x,#1032
2880  060b 270f          	jreq	L072
2881  060d a30402        	cpw	x,#1026
2882  0610 270a          	jreq	L072
2883  0612 a30504        	cpw	x,#1284
2884  0615 2705          	jreq	L072
2885  0617 a30502        	cpw	x,#1282
2886  061a 2603          	jrne	L662
2887  061c               L072:
2888  061c 4f            	clr	a
2889  061d 2010          	jra	L272
2890  061f               L662:
2891  061f ae0281        	ldw	x,#641
2892  0622 89            	pushw	x
2893  0623 ae0000        	ldw	x,#0
2894  0626 89            	pushw	x
2895  0627 ae000c        	ldw	x,#L75
2896  062a cd0000        	call	_assert_failed
2898  062d 5b04          	addw	sp,#4
2899  062f               L272:
2900                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2902  062f 7b04          	ld	a,(OFST+1,sp)
2903  0631 97            	ld	xl,a
2904  0632 7b05          	ld	a,(OFST+2,sp)
2905  0634 9f            	ld	a,xl
2906  0635 a4ff          	and	a,#255
2907  0637 97            	ld	xl,a
2908  0638 4f            	clr	a
2909  0639 02            	rlwa	x,a
2910  063a 1f01          	ldw	(OFST-2,sp),x
2911  063c 01            	rrwa	x,a
2912                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2914  063d 1e01          	ldw	x,(OFST-2,sp)
2915  063f a30100        	cpw	x,#256
2916  0642 2607          	jrne	L3421
2917                     ; 649     tmpreg = CLK->ICKR;
2919  0644 c650c0        	ld	a,20672
2920  0647 6b03          	ld	(OFST+0,sp),a
2922  0649 202f          	jra	L5421
2923  064b               L3421:
2924                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2926  064b 1e01          	ldw	x,(OFST-2,sp)
2927  064d a30200        	cpw	x,#512
2928  0650 2607          	jrne	L7421
2929                     ; 653     tmpreg = CLK->ECKR;
2931  0652 c650c1        	ld	a,20673
2932  0655 6b03          	ld	(OFST+0,sp),a
2934  0657 2021          	jra	L5421
2935  0659               L7421:
2936                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2938  0659 1e01          	ldw	x,(OFST-2,sp)
2939  065b a30300        	cpw	x,#768
2940  065e 2607          	jrne	L3521
2941                     ; 657     tmpreg = CLK->SWCR;
2943  0660 c650c5        	ld	a,20677
2944  0663 6b03          	ld	(OFST+0,sp),a
2946  0665 2013          	jra	L5421
2947  0667               L3521:
2948                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2950  0667 1e01          	ldw	x,(OFST-2,sp)
2951  0669 a30400        	cpw	x,#1024
2952  066c 2607          	jrne	L7521
2953                     ; 661     tmpreg = CLK->CSSR;
2955  066e c650c8        	ld	a,20680
2956  0671 6b03          	ld	(OFST+0,sp),a
2958  0673 2005          	jra	L5421
2959  0675               L7521:
2960                     ; 665     tmpreg = CLK->CCOR;
2962  0675 c650c9        	ld	a,20681
2963  0678 6b03          	ld	(OFST+0,sp),a
2964  067a               L5421:
2965                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2967  067a 7b05          	ld	a,(OFST+2,sp)
2968  067c 1503          	bcp	a,(OFST+0,sp)
2969  067e 2706          	jreq	L3621
2970                     ; 670     bitstatus = SET;
2972  0680 a601          	ld	a,#1
2973  0682 6b03          	ld	(OFST+0,sp),a
2975  0684 2002          	jra	L5621
2976  0686               L3621:
2977                     ; 674     bitstatus = RESET;
2979  0686 0f03          	clr	(OFST+0,sp)
2980  0688               L5621:
2981                     ; 678   return((FlagStatus)bitstatus);
2983  0688 7b03          	ld	a,(OFST+0,sp)
2986  068a 5b05          	addw	sp,#5
2987  068c 81            	ret
3034                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3034                     ; 688 {
3035                     	switch	.text
3036  068d               _CLK_GetITStatus:
3038  068d 88            	push	a
3039  068e 88            	push	a
3040       00000001      OFST:	set	1
3043                     ; 689   ITStatus bitstatus = RESET;
3045                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3047  068f a10c          	cp	a,#12
3048  0691 2704          	jreq	L003
3049  0693 a11c          	cp	a,#28
3050  0695 2603          	jrne	L672
3051  0697               L003:
3052  0697 4f            	clr	a
3053  0698 2010          	jra	L203
3054  069a               L672:
3055  069a ae02b4        	ldw	x,#692
3056  069d 89            	pushw	x
3057  069e ae0000        	ldw	x,#0
3058  06a1 89            	pushw	x
3059  06a2 ae000c        	ldw	x,#L75
3060  06a5 cd0000        	call	_assert_failed
3062  06a8 5b04          	addw	sp,#4
3063  06aa               L203:
3064                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3066  06aa 7b02          	ld	a,(OFST+1,sp)
3067  06ac a11c          	cp	a,#28
3068  06ae 2613          	jrne	L1131
3069                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3071  06b0 c650c5        	ld	a,20677
3072  06b3 1402          	and	a,(OFST+1,sp)
3073  06b5 a10c          	cp	a,#12
3074  06b7 2606          	jrne	L3131
3075                     ; 699       bitstatus = SET;
3077  06b9 a601          	ld	a,#1
3078  06bb 6b01          	ld	(OFST+0,sp),a
3080  06bd 2015          	jra	L7131
3081  06bf               L3131:
3082                     ; 703       bitstatus = RESET;
3084  06bf 0f01          	clr	(OFST+0,sp)
3085  06c1 2011          	jra	L7131
3086  06c3               L1131:
3087                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3089  06c3 c650c8        	ld	a,20680
3090  06c6 1402          	and	a,(OFST+1,sp)
3091  06c8 a10c          	cp	a,#12
3092  06ca 2606          	jrne	L1231
3093                     ; 711       bitstatus = SET;
3095  06cc a601          	ld	a,#1
3096  06ce 6b01          	ld	(OFST+0,sp),a
3098  06d0 2002          	jra	L7131
3099  06d2               L1231:
3100                     ; 715       bitstatus = RESET;
3102  06d2 0f01          	clr	(OFST+0,sp)
3103  06d4               L7131:
3104                     ; 720   return bitstatus;
3106  06d4 7b01          	ld	a,(OFST+0,sp)
3109  06d6 85            	popw	x
3110  06d7 81            	ret
3147                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3147                     ; 730 {
3148                     	switch	.text
3149  06d8               _CLK_ClearITPendingBit:
3151  06d8 88            	push	a
3152       00000000      OFST:	set	0
3155                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3157  06d9 a10c          	cp	a,#12
3158  06db 2704          	jreq	L013
3159  06dd a11c          	cp	a,#28
3160  06df 2603          	jrne	L603
3161  06e1               L013:
3162  06e1 4f            	clr	a
3163  06e2 2010          	jra	L213
3164  06e4               L603:
3165  06e4 ae02dc        	ldw	x,#732
3166  06e7 89            	pushw	x
3167  06e8 ae0000        	ldw	x,#0
3168  06eb 89            	pushw	x
3169  06ec ae000c        	ldw	x,#L75
3170  06ef cd0000        	call	_assert_failed
3172  06f2 5b04          	addw	sp,#4
3173  06f4               L213:
3174                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3176  06f4 7b01          	ld	a,(OFST+1,sp)
3177  06f6 a10c          	cp	a,#12
3178  06f8 2606          	jrne	L3431
3179                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3181  06fa 721750c8      	bres	20680,#3
3183  06fe 2004          	jra	L5431
3184  0700               L3431:
3185                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3187  0700 721750c5      	bres	20677,#3
3188  0704               L5431:
3189                     ; 745 }
3192  0704 84            	pop	a
3193  0705 81            	ret
3228                     	xdef	_CLKPrescTable
3229                     	xdef	_HSIDivFactor
3230                     	xdef	_CLK_ClearITPendingBit
3231                     	xdef	_CLK_GetITStatus
3232                     	xdef	_CLK_GetFlagStatus
3233                     	xdef	_CLK_GetSYSCLKSource
3234                     	xdef	_CLK_GetClockFreq
3235                     	xdef	_CLK_AdjustHSICalibrationValue
3236                     	xdef	_CLK_SYSCLKEmergencyClear
3237                     	xdef	_CLK_ClockSecuritySystemEnable
3238                     	xdef	_CLK_SWIMConfig
3239                     	xdef	_CLK_SYSCLKConfig
3240                     	xdef	_CLK_ITConfig
3241                     	xdef	_CLK_CCOConfig
3242                     	xdef	_CLK_HSIPrescalerConfig
3243                     	xdef	_CLK_ClockSwitchConfig
3244                     	xdef	_CLK_PeripheralClockConfig
3245                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3246                     	xdef	_CLK_FastHaltWakeUpCmd
3247                     	xdef	_CLK_ClockSwitchCmd
3248                     	xdef	_CLK_CCOCmd
3249                     	xdef	_CLK_LSICmd
3250                     	xdef	_CLK_HSICmd
3251                     	xdef	_CLK_HSECmd
3252                     	xdef	_CLK_DeInit
3253                     	xref	_assert_failed
3254                     	switch	.const
3255  000c               L75:
3256  000c 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3257  001e 697665725c73  	dc.b	"iver\src\stm8s_clk"
3258  0030 2e6300        	dc.b	".c",0
3259                     	xref.b	c_lreg
3260                     	xref.b	c_x
3280                     	xref	c_ltor
3281                     	xref	c_ludv
3282                     	xref	c_rtol
3283                     	end
