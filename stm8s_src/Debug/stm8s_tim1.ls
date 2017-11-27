   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 58 void TIM1_DeInit(void)
  43                     ; 59 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  70  0018 725f525c      	clr	21084
  71                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  73  001c 725f525d      	clr	21085
  74                     ; 70   TIM1->CCMR1 = 0x01;
  76  0020 35015258      	mov	21080,#1
  77                     ; 71   TIM1->CCMR2 = 0x01;
  79  0024 35015259      	mov	21081,#1
  80                     ; 72   TIM1->CCMR3 = 0x01;
  82  0028 3501525a      	mov	21082,#1
  83                     ; 73   TIM1->CCMR4 = 0x01;
  85  002c 3501525b      	mov	21083,#1
  86                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  94  0038 725f5258      	clr	21080
  95                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  97  003c 725f5259      	clr	21081
  98                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 100  0040 725f525a      	clr	21082
 101                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 103  0044 725f525b      	clr	21083
 104                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 106  0048 725f525e      	clr	21086
 107                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 109  004c 725f525f      	clr	21087
 110                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 112  0050 725f5260      	clr	21088
 113                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 115  0054 725f5261      	clr	21089
 116                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 118  0058 35ff5262      	mov	21090,#255
 119                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 121  005c 35ff5263      	mov	21091,#255
 122                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 124  0060 725f5265      	clr	21093
 125                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 127  0064 725f5266      	clr	21094
 128                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 130  0068 725f5267      	clr	21095
 131                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 133  006c 725f5268      	clr	21096
 134                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 136  0070 725f5269      	clr	21097
 137                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 139  0074 725f526a      	clr	21098
 140                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 142  0078 725f526b      	clr	21099
 143                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 145  007c 725f526c      	clr	21100
 146                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 148  0080 725f526f      	clr	21103
 149                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 151  0084 35015257      	mov	21079,#1
 152                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 154  0088 725f526e      	clr	21102
 155                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 157  008c 725f526d      	clr	21101
 158                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 160  0090 725f5264      	clr	21092
 161                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 163  0094 725f5255      	clr	21077
 164                     ; 101 }
 167  0098 81            	ret
 277                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 113                        uint16_t TIM1_Period,
 277                     ; 114                        uint8_t TIM1_RepetitionCounter)
 277                     ; 115 {
 278                     	switch	.text
 279  0099               _TIM1_TimeBaseInit:
 281  0099 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 287  009a 0d05          	tnz	(OFST+5,sp)
 288  009c 2718          	jreq	L21
 289  009e 7b05          	ld	a,(OFST+5,sp)
 290  00a0 a110          	cp	a,#16
 291  00a2 2712          	jreq	L21
 292  00a4 7b05          	ld	a,(OFST+5,sp)
 293  00a6 a120          	cp	a,#32
 294  00a8 270c          	jreq	L21
 295  00aa 7b05          	ld	a,(OFST+5,sp)
 296  00ac a140          	cp	a,#64
 297  00ae 2706          	jreq	L21
 298  00b0 7b05          	ld	a,(OFST+5,sp)
 299  00b2 a160          	cp	a,#96
 300  00b4 2603          	jrne	L01
 301  00b6               L21:
 302  00b6 4f            	clr	a
 303  00b7 2010          	jra	L41
 304  00b9               L01:
 305  00b9 ae0075        	ldw	x,#117
 306  00bc 89            	pushw	x
 307  00bd ae0000        	ldw	x,#0
 308  00c0 89            	pushw	x
 309  00c1 ae0000        	ldw	x,#L101
 310  00c4 cd0000        	call	_assert_failed
 312  00c7 5b04          	addw	sp,#4
 313  00c9               L41:
 314                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 316  00c9 7b06          	ld	a,(OFST+6,sp)
 317  00cb c75262        	ld	21090,a
 318                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 320  00ce 7b07          	ld	a,(OFST+7,sp)
 321  00d0 c75263        	ld	21091,a
 322                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 324  00d3 7b01          	ld	a,(OFST+1,sp)
 325  00d5 c75260        	ld	21088,a
 326                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 328  00d8 7b02          	ld	a,(OFST+2,sp)
 329  00da c75261        	ld	21089,a
 330                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 330                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 332  00dd c65250        	ld	a,21072
 333  00e0 a48f          	and	a,#143
 334  00e2 1a05          	or	a,(OFST+5,sp)
 335  00e4 c75250        	ld	21072,a
 336                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 338  00e7 7b08          	ld	a,(OFST+8,sp)
 339  00e9 c75264        	ld	21092,a
 340                     ; 133 }
 343  00ec 85            	popw	x
 344  00ed 81            	ret
 630                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 630                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 630                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 630                     ; 157                   uint16_t TIM1_Pulse,
 630                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 630                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 630                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 630                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 630                     ; 162 {
 631                     	switch	.text
 632  00ee               _TIM1_OC1Init:
 634  00ee 89            	pushw	x
 635  00ef 5203          	subw	sp,#3
 636       00000003      OFST:	set	3
 639                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 641  00f1 9e            	ld	a,xh
 642  00f2 4d            	tnz	a
 643  00f3 2719          	jreq	L22
 644  00f5 9e            	ld	a,xh
 645  00f6 a110          	cp	a,#16
 646  00f8 2714          	jreq	L22
 647  00fa 9e            	ld	a,xh
 648  00fb a120          	cp	a,#32
 649  00fd 270f          	jreq	L22
 650  00ff 9e            	ld	a,xh
 651  0100 a130          	cp	a,#48
 652  0102 270a          	jreq	L22
 653  0104 9e            	ld	a,xh
 654  0105 a160          	cp	a,#96
 655  0107 2705          	jreq	L22
 656  0109 9e            	ld	a,xh
 657  010a a170          	cp	a,#112
 658  010c 2603          	jrne	L02
 659  010e               L22:
 660  010e 4f            	clr	a
 661  010f 2010          	jra	L42
 662  0111               L02:
 663  0111 ae00a4        	ldw	x,#164
 664  0114 89            	pushw	x
 665  0115 ae0000        	ldw	x,#0
 666  0118 89            	pushw	x
 667  0119 ae0000        	ldw	x,#L101
 668  011c cd0000        	call	_assert_failed
 670  011f 5b04          	addw	sp,#4
 671  0121               L42:
 672                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 674  0121 0d05          	tnz	(OFST+2,sp)
 675  0123 2706          	jreq	L03
 676  0125 7b05          	ld	a,(OFST+2,sp)
 677  0127 a111          	cp	a,#17
 678  0129 2603          	jrne	L62
 679  012b               L03:
 680  012b 4f            	clr	a
 681  012c 2010          	jra	L23
 682  012e               L62:
 683  012e ae00a5        	ldw	x,#165
 684  0131 89            	pushw	x
 685  0132 ae0000        	ldw	x,#0
 686  0135 89            	pushw	x
 687  0136 ae0000        	ldw	x,#L101
 688  0139 cd0000        	call	_assert_failed
 690  013c 5b04          	addw	sp,#4
 691  013e               L23:
 692                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 694  013e 0d08          	tnz	(OFST+5,sp)
 695  0140 2706          	jreq	L63
 696  0142 7b08          	ld	a,(OFST+5,sp)
 697  0144 a144          	cp	a,#68
 698  0146 2603          	jrne	L43
 699  0148               L63:
 700  0148 4f            	clr	a
 701  0149 2010          	jra	L04
 702  014b               L43:
 703  014b ae00a6        	ldw	x,#166
 704  014e 89            	pushw	x
 705  014f ae0000        	ldw	x,#0
 706  0152 89            	pushw	x
 707  0153 ae0000        	ldw	x,#L101
 708  0156 cd0000        	call	_assert_failed
 710  0159 5b04          	addw	sp,#4
 711  015b               L04:
 712                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 714  015b 0d0b          	tnz	(OFST+8,sp)
 715  015d 2706          	jreq	L44
 716  015f 7b0b          	ld	a,(OFST+8,sp)
 717  0161 a122          	cp	a,#34
 718  0163 2603          	jrne	L24
 719  0165               L44:
 720  0165 4f            	clr	a
 721  0166 2010          	jra	L64
 722  0168               L24:
 723  0168 ae00a7        	ldw	x,#167
 724  016b 89            	pushw	x
 725  016c ae0000        	ldw	x,#0
 726  016f 89            	pushw	x
 727  0170 ae0000        	ldw	x,#L101
 728  0173 cd0000        	call	_assert_failed
 730  0176 5b04          	addw	sp,#4
 731  0178               L64:
 732                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 734  0178 0d0c          	tnz	(OFST+9,sp)
 735  017a 2706          	jreq	L25
 736  017c 7b0c          	ld	a,(OFST+9,sp)
 737  017e a188          	cp	a,#136
 738  0180 2603          	jrne	L05
 739  0182               L25:
 740  0182 4f            	clr	a
 741  0183 2010          	jra	L45
 742  0185               L05:
 743  0185 ae00a8        	ldw	x,#168
 744  0188 89            	pushw	x
 745  0189 ae0000        	ldw	x,#0
 746  018c 89            	pushw	x
 747  018d ae0000        	ldw	x,#L101
 748  0190 cd0000        	call	_assert_failed
 750  0193 5b04          	addw	sp,#4
 751  0195               L45:
 752                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 754  0195 7b0d          	ld	a,(OFST+10,sp)
 755  0197 a155          	cp	a,#85
 756  0199 2704          	jreq	L06
 757  019b 0d0d          	tnz	(OFST+10,sp)
 758  019d 2603          	jrne	L65
 759  019f               L06:
 760  019f 4f            	clr	a
 761  01a0 2010          	jra	L26
 762  01a2               L65:
 763  01a2 ae00a9        	ldw	x,#169
 764  01a5 89            	pushw	x
 765  01a6 ae0000        	ldw	x,#0
 766  01a9 89            	pushw	x
 767  01aa ae0000        	ldw	x,#L101
 768  01ad cd0000        	call	_assert_failed
 770  01b0 5b04          	addw	sp,#4
 771  01b2               L26:
 772                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 774  01b2 7b0e          	ld	a,(OFST+11,sp)
 775  01b4 a12a          	cp	a,#42
 776  01b6 2704          	jreq	L66
 777  01b8 0d0e          	tnz	(OFST+11,sp)
 778  01ba 2603          	jrne	L46
 779  01bc               L66:
 780  01bc 4f            	clr	a
 781  01bd 2010          	jra	L07
 782  01bf               L46:
 783  01bf ae00aa        	ldw	x,#170
 784  01c2 89            	pushw	x
 785  01c3 ae0000        	ldw	x,#0
 786  01c6 89            	pushw	x
 787  01c7 ae0000        	ldw	x,#L101
 788  01ca cd0000        	call	_assert_failed
 790  01cd 5b04          	addw	sp,#4
 791  01cf               L07:
 792                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 792                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 794  01cf c6525c        	ld	a,21084
 795  01d2 a4f0          	and	a,#240
 796  01d4 c7525c        	ld	21084,a
 797                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 797                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 797                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 797                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 799  01d7 7b0c          	ld	a,(OFST+9,sp)
 800  01d9 a408          	and	a,#8
 801  01db 6b03          	ld	(OFST+0,sp),a
 802  01dd 7b0b          	ld	a,(OFST+8,sp)
 803  01df a402          	and	a,#2
 804  01e1 1a03          	or	a,(OFST+0,sp)
 805  01e3 6b02          	ld	(OFST-1,sp),a
 806  01e5 7b08          	ld	a,(OFST+5,sp)
 807  01e7 a404          	and	a,#4
 808  01e9 6b01          	ld	(OFST-2,sp),a
 809  01eb 7b05          	ld	a,(OFST+2,sp)
 810  01ed a401          	and	a,#1
 811  01ef 1a01          	or	a,(OFST-2,sp)
 812  01f1 1a02          	or	a,(OFST-1,sp)
 813  01f3 ca525c        	or	a,21084
 814  01f6 c7525c        	ld	21084,a
 815                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 815                     ; 185                           (uint8_t)TIM1_OCMode);
 817  01f9 c65258        	ld	a,21080
 818  01fc a48f          	and	a,#143
 819  01fe 1a04          	or	a,(OFST+1,sp)
 820  0200 c75258        	ld	21080,a
 821                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 823  0203 c6526f        	ld	a,21103
 824  0206 a4fc          	and	a,#252
 825  0208 c7526f        	ld	21103,a
 826                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 826                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 828  020b 7b0e          	ld	a,(OFST+11,sp)
 829  020d a402          	and	a,#2
 830  020f 6b03          	ld	(OFST+0,sp),a
 831  0211 7b0d          	ld	a,(OFST+10,sp)
 832  0213 a401          	and	a,#1
 833  0215 1a03          	or	a,(OFST+0,sp)
 834  0217 ca526f        	or	a,21103
 835  021a c7526f        	ld	21103,a
 836                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 838  021d 7b09          	ld	a,(OFST+6,sp)
 839  021f c75265        	ld	21093,a
 840                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 842  0222 7b0a          	ld	a,(OFST+7,sp)
 843  0224 c75266        	ld	21094,a
 844                     ; 196 }
 847  0227 5b05          	addw	sp,#5
 848  0229 81            	ret
 953                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 953                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 953                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 953                     ; 220                   uint16_t TIM1_Pulse,
 953                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 953                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 953                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 953                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 953                     ; 225 {
 954                     	switch	.text
 955  022a               _TIM1_OC2Init:
 957  022a 89            	pushw	x
 958  022b 5203          	subw	sp,#3
 959       00000003      OFST:	set	3
 962                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 964  022d 9e            	ld	a,xh
 965  022e 4d            	tnz	a
 966  022f 2719          	jreq	L67
 967  0231 9e            	ld	a,xh
 968  0232 a110          	cp	a,#16
 969  0234 2714          	jreq	L67
 970  0236 9e            	ld	a,xh
 971  0237 a120          	cp	a,#32
 972  0239 270f          	jreq	L67
 973  023b 9e            	ld	a,xh
 974  023c a130          	cp	a,#48
 975  023e 270a          	jreq	L67
 976  0240 9e            	ld	a,xh
 977  0241 a160          	cp	a,#96
 978  0243 2705          	jreq	L67
 979  0245 9e            	ld	a,xh
 980  0246 a170          	cp	a,#112
 981  0248 2603          	jrne	L47
 982  024a               L67:
 983  024a 4f            	clr	a
 984  024b 2010          	jra	L001
 985  024d               L47:
 986  024d ae00e3        	ldw	x,#227
 987  0250 89            	pushw	x
 988  0251 ae0000        	ldw	x,#0
 989  0254 89            	pushw	x
 990  0255 ae0000        	ldw	x,#L101
 991  0258 cd0000        	call	_assert_failed
 993  025b 5b04          	addw	sp,#4
 994  025d               L001:
 995                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 997  025d 0d05          	tnz	(OFST+2,sp)
 998  025f 2706          	jreq	L401
 999  0261 7b05          	ld	a,(OFST+2,sp)
1000  0263 a111          	cp	a,#17
1001  0265 2603          	jrne	L201
1002  0267               L401:
1003  0267 4f            	clr	a
1004  0268 2010          	jra	L601
1005  026a               L201:
1006  026a ae00e4        	ldw	x,#228
1007  026d 89            	pushw	x
1008  026e ae0000        	ldw	x,#0
1009  0271 89            	pushw	x
1010  0272 ae0000        	ldw	x,#L101
1011  0275 cd0000        	call	_assert_failed
1013  0278 5b04          	addw	sp,#4
1014  027a               L601:
1015                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1017  027a 0d08          	tnz	(OFST+5,sp)
1018  027c 2706          	jreq	L211
1019  027e 7b08          	ld	a,(OFST+5,sp)
1020  0280 a144          	cp	a,#68
1021  0282 2603          	jrne	L011
1022  0284               L211:
1023  0284 4f            	clr	a
1024  0285 2010          	jra	L411
1025  0287               L011:
1026  0287 ae00e5        	ldw	x,#229
1027  028a 89            	pushw	x
1028  028b ae0000        	ldw	x,#0
1029  028e 89            	pushw	x
1030  028f ae0000        	ldw	x,#L101
1031  0292 cd0000        	call	_assert_failed
1033  0295 5b04          	addw	sp,#4
1034  0297               L411:
1035                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1037  0297 0d0b          	tnz	(OFST+8,sp)
1038  0299 2706          	jreq	L021
1039  029b 7b0b          	ld	a,(OFST+8,sp)
1040  029d a122          	cp	a,#34
1041  029f 2603          	jrne	L611
1042  02a1               L021:
1043  02a1 4f            	clr	a
1044  02a2 2010          	jra	L221
1045  02a4               L611:
1046  02a4 ae00e6        	ldw	x,#230
1047  02a7 89            	pushw	x
1048  02a8 ae0000        	ldw	x,#0
1049  02ab 89            	pushw	x
1050  02ac ae0000        	ldw	x,#L101
1051  02af cd0000        	call	_assert_failed
1053  02b2 5b04          	addw	sp,#4
1054  02b4               L221:
1055                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1057  02b4 0d0c          	tnz	(OFST+9,sp)
1058  02b6 2706          	jreq	L621
1059  02b8 7b0c          	ld	a,(OFST+9,sp)
1060  02ba a188          	cp	a,#136
1061  02bc 2603          	jrne	L421
1062  02be               L621:
1063  02be 4f            	clr	a
1064  02bf 2010          	jra	L031
1065  02c1               L421:
1066  02c1 ae00e7        	ldw	x,#231
1067  02c4 89            	pushw	x
1068  02c5 ae0000        	ldw	x,#0
1069  02c8 89            	pushw	x
1070  02c9 ae0000        	ldw	x,#L101
1071  02cc cd0000        	call	_assert_failed
1073  02cf 5b04          	addw	sp,#4
1074  02d1               L031:
1075                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1077  02d1 7b0d          	ld	a,(OFST+10,sp)
1078  02d3 a155          	cp	a,#85
1079  02d5 2704          	jreq	L431
1080  02d7 0d0d          	tnz	(OFST+10,sp)
1081  02d9 2603          	jrne	L231
1082  02db               L431:
1083  02db 4f            	clr	a
1084  02dc 2010          	jra	L631
1085  02de               L231:
1086  02de ae00e8        	ldw	x,#232
1087  02e1 89            	pushw	x
1088  02e2 ae0000        	ldw	x,#0
1089  02e5 89            	pushw	x
1090  02e6 ae0000        	ldw	x,#L101
1091  02e9 cd0000        	call	_assert_failed
1093  02ec 5b04          	addw	sp,#4
1094  02ee               L631:
1095                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1097  02ee 7b0e          	ld	a,(OFST+11,sp)
1098  02f0 a12a          	cp	a,#42
1099  02f2 2704          	jreq	L241
1100  02f4 0d0e          	tnz	(OFST+11,sp)
1101  02f6 2603          	jrne	L041
1102  02f8               L241:
1103  02f8 4f            	clr	a
1104  02f9 2010          	jra	L441
1105  02fb               L041:
1106  02fb ae00e9        	ldw	x,#233
1107  02fe 89            	pushw	x
1108  02ff ae0000        	ldw	x,#0
1109  0302 89            	pushw	x
1110  0303 ae0000        	ldw	x,#L101
1111  0306 cd0000        	call	_assert_failed
1113  0309 5b04          	addw	sp,#4
1114  030b               L441:
1115                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1115                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1117  030b c6525c        	ld	a,21084
1118  030e a40f          	and	a,#15
1119  0310 c7525c        	ld	21084,a
1120                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1120                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1120                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1120                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1122  0313 7b0c          	ld	a,(OFST+9,sp)
1123  0315 a480          	and	a,#128
1124  0317 6b03          	ld	(OFST+0,sp),a
1125  0319 7b0b          	ld	a,(OFST+8,sp)
1126  031b a420          	and	a,#32
1127  031d 1a03          	or	a,(OFST+0,sp)
1128  031f 6b02          	ld	(OFST-1,sp),a
1129  0321 7b08          	ld	a,(OFST+5,sp)
1130  0323 a440          	and	a,#64
1131  0325 6b01          	ld	(OFST-2,sp),a
1132  0327 7b05          	ld	a,(OFST+2,sp)
1133  0329 a410          	and	a,#16
1134  032b 1a01          	or	a,(OFST-2,sp)
1135  032d 1a02          	or	a,(OFST-1,sp)
1136  032f ca525c        	or	a,21084
1137  0332 c7525c        	ld	21084,a
1138                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1138                     ; 249                           (uint8_t)TIM1_OCMode);
1140  0335 c65259        	ld	a,21081
1141  0338 a48f          	and	a,#143
1142  033a 1a04          	or	a,(OFST+1,sp)
1143  033c c75259        	ld	21081,a
1144                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1146  033f c6526f        	ld	a,21103
1147  0342 a4f3          	and	a,#243
1148  0344 c7526f        	ld	21103,a
1149                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1149                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1151  0347 7b0e          	ld	a,(OFST+11,sp)
1152  0349 a408          	and	a,#8
1153  034b 6b03          	ld	(OFST+0,sp),a
1154  034d 7b0d          	ld	a,(OFST+10,sp)
1155  034f a404          	and	a,#4
1156  0351 1a03          	or	a,(OFST+0,sp)
1157  0353 ca526f        	or	a,21103
1158  0356 c7526f        	ld	21103,a
1159                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1161  0359 7b09          	ld	a,(OFST+6,sp)
1162  035b c75267        	ld	21095,a
1163                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1165  035e 7b0a          	ld	a,(OFST+7,sp)
1166  0360 c75268        	ld	21096,a
1167                     ; 260 }
1170  0363 5b05          	addw	sp,#5
1171  0365 81            	ret
1276                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1276                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1276                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1276                     ; 284                   uint16_t TIM1_Pulse,
1276                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1276                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1276                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1276                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1276                     ; 289 {
1277                     	switch	.text
1278  0366               _TIM1_OC3Init:
1280  0366 89            	pushw	x
1281  0367 5203          	subw	sp,#3
1282       00000003      OFST:	set	3
1285                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1287  0369 9e            	ld	a,xh
1288  036a 4d            	tnz	a
1289  036b 2719          	jreq	L251
1290  036d 9e            	ld	a,xh
1291  036e a110          	cp	a,#16
1292  0370 2714          	jreq	L251
1293  0372 9e            	ld	a,xh
1294  0373 a120          	cp	a,#32
1295  0375 270f          	jreq	L251
1296  0377 9e            	ld	a,xh
1297  0378 a130          	cp	a,#48
1298  037a 270a          	jreq	L251
1299  037c 9e            	ld	a,xh
1300  037d a160          	cp	a,#96
1301  037f 2705          	jreq	L251
1302  0381 9e            	ld	a,xh
1303  0382 a170          	cp	a,#112
1304  0384 2603          	jrne	L051
1305  0386               L251:
1306  0386 4f            	clr	a
1307  0387 2010          	jra	L451
1308  0389               L051:
1309  0389 ae0123        	ldw	x,#291
1310  038c 89            	pushw	x
1311  038d ae0000        	ldw	x,#0
1312  0390 89            	pushw	x
1313  0391 ae0000        	ldw	x,#L101
1314  0394 cd0000        	call	_assert_failed
1316  0397 5b04          	addw	sp,#4
1317  0399               L451:
1318                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1320  0399 0d05          	tnz	(OFST+2,sp)
1321  039b 2706          	jreq	L061
1322  039d 7b05          	ld	a,(OFST+2,sp)
1323  039f a111          	cp	a,#17
1324  03a1 2603          	jrne	L651
1325  03a3               L061:
1326  03a3 4f            	clr	a
1327  03a4 2010          	jra	L261
1328  03a6               L651:
1329  03a6 ae0124        	ldw	x,#292
1330  03a9 89            	pushw	x
1331  03aa ae0000        	ldw	x,#0
1332  03ad 89            	pushw	x
1333  03ae ae0000        	ldw	x,#L101
1334  03b1 cd0000        	call	_assert_failed
1336  03b4 5b04          	addw	sp,#4
1337  03b6               L261:
1338                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1340  03b6 0d08          	tnz	(OFST+5,sp)
1341  03b8 2706          	jreq	L661
1342  03ba 7b08          	ld	a,(OFST+5,sp)
1343  03bc a144          	cp	a,#68
1344  03be 2603          	jrne	L461
1345  03c0               L661:
1346  03c0 4f            	clr	a
1347  03c1 2010          	jra	L071
1348  03c3               L461:
1349  03c3 ae0125        	ldw	x,#293
1350  03c6 89            	pushw	x
1351  03c7 ae0000        	ldw	x,#0
1352  03ca 89            	pushw	x
1353  03cb ae0000        	ldw	x,#L101
1354  03ce cd0000        	call	_assert_failed
1356  03d1 5b04          	addw	sp,#4
1357  03d3               L071:
1358                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1360  03d3 0d0b          	tnz	(OFST+8,sp)
1361  03d5 2706          	jreq	L471
1362  03d7 7b0b          	ld	a,(OFST+8,sp)
1363  03d9 a122          	cp	a,#34
1364  03db 2603          	jrne	L271
1365  03dd               L471:
1366  03dd 4f            	clr	a
1367  03de 2010          	jra	L671
1368  03e0               L271:
1369  03e0 ae0126        	ldw	x,#294
1370  03e3 89            	pushw	x
1371  03e4 ae0000        	ldw	x,#0
1372  03e7 89            	pushw	x
1373  03e8 ae0000        	ldw	x,#L101
1374  03eb cd0000        	call	_assert_failed
1376  03ee 5b04          	addw	sp,#4
1377  03f0               L671:
1378                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1380  03f0 0d0c          	tnz	(OFST+9,sp)
1381  03f2 2706          	jreq	L202
1382  03f4 7b0c          	ld	a,(OFST+9,sp)
1383  03f6 a188          	cp	a,#136
1384  03f8 2603          	jrne	L002
1385  03fa               L202:
1386  03fa 4f            	clr	a
1387  03fb 2010          	jra	L402
1388  03fd               L002:
1389  03fd ae0127        	ldw	x,#295
1390  0400 89            	pushw	x
1391  0401 ae0000        	ldw	x,#0
1392  0404 89            	pushw	x
1393  0405 ae0000        	ldw	x,#L101
1394  0408 cd0000        	call	_assert_failed
1396  040b 5b04          	addw	sp,#4
1397  040d               L402:
1398                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1400  040d 7b0d          	ld	a,(OFST+10,sp)
1401  040f a155          	cp	a,#85
1402  0411 2704          	jreq	L012
1403  0413 0d0d          	tnz	(OFST+10,sp)
1404  0415 2603          	jrne	L602
1405  0417               L012:
1406  0417 4f            	clr	a
1407  0418 2010          	jra	L212
1408  041a               L602:
1409  041a ae0128        	ldw	x,#296
1410  041d 89            	pushw	x
1411  041e ae0000        	ldw	x,#0
1412  0421 89            	pushw	x
1413  0422 ae0000        	ldw	x,#L101
1414  0425 cd0000        	call	_assert_failed
1416  0428 5b04          	addw	sp,#4
1417  042a               L212:
1418                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1420  042a 7b0e          	ld	a,(OFST+11,sp)
1421  042c a12a          	cp	a,#42
1422  042e 2704          	jreq	L612
1423  0430 0d0e          	tnz	(OFST+11,sp)
1424  0432 2603          	jrne	L412
1425  0434               L612:
1426  0434 4f            	clr	a
1427  0435 2010          	jra	L022
1428  0437               L412:
1429  0437 ae0129        	ldw	x,#297
1430  043a 89            	pushw	x
1431  043b ae0000        	ldw	x,#0
1432  043e 89            	pushw	x
1433  043f ae0000        	ldw	x,#L101
1434  0442 cd0000        	call	_assert_failed
1436  0445 5b04          	addw	sp,#4
1437  0447               L022:
1438                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1438                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1440  0447 c6525d        	ld	a,21085
1441  044a a4f0          	and	a,#240
1442  044c c7525d        	ld	21085,a
1443                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1443                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1443                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1443                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1445  044f 7b0c          	ld	a,(OFST+9,sp)
1446  0451 a408          	and	a,#8
1447  0453 6b03          	ld	(OFST+0,sp),a
1448  0455 7b0b          	ld	a,(OFST+8,sp)
1449  0457 a402          	and	a,#2
1450  0459 1a03          	or	a,(OFST+0,sp)
1451  045b 6b02          	ld	(OFST-1,sp),a
1452  045d 7b08          	ld	a,(OFST+5,sp)
1453  045f a404          	and	a,#4
1454  0461 6b01          	ld	(OFST-2,sp),a
1455  0463 7b05          	ld	a,(OFST+2,sp)
1456  0465 a401          	and	a,#1
1457  0467 1a01          	or	a,(OFST-2,sp)
1458  0469 1a02          	or	a,(OFST-1,sp)
1459  046b ca525d        	or	a,21085
1460  046e c7525d        	ld	21085,a
1461                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1461                     ; 312                           (uint8_t)TIM1_OCMode);
1463  0471 c6525a        	ld	a,21082
1464  0474 a48f          	and	a,#143
1465  0476 1a04          	or	a,(OFST+1,sp)
1466  0478 c7525a        	ld	21082,a
1467                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1469  047b c6526f        	ld	a,21103
1470  047e a4cf          	and	a,#207
1471  0480 c7526f        	ld	21103,a
1472                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1472                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1474  0483 7b0e          	ld	a,(OFST+11,sp)
1475  0485 a420          	and	a,#32
1476  0487 6b03          	ld	(OFST+0,sp),a
1477  0489 7b0d          	ld	a,(OFST+10,sp)
1478  048b a410          	and	a,#16
1479  048d 1a03          	or	a,(OFST+0,sp)
1480  048f ca526f        	or	a,21103
1481  0492 c7526f        	ld	21103,a
1482                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1484  0495 7b09          	ld	a,(OFST+6,sp)
1485  0497 c75269        	ld	21097,a
1486                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1488  049a 7b0a          	ld	a,(OFST+7,sp)
1489  049c c7526a        	ld	21098,a
1490                     ; 323 }
1493  049f 5b05          	addw	sp,#5
1494  04a1 81            	ret
1569                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1569                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1569                     ; 340                   uint16_t TIM1_Pulse,
1569                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1569                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1569                     ; 343 {
1570                     	switch	.text
1571  04a2               _TIM1_OC4Init:
1573  04a2 89            	pushw	x
1574  04a3 88            	push	a
1575       00000001      OFST:	set	1
1578                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1580  04a4 9e            	ld	a,xh
1581  04a5 4d            	tnz	a
1582  04a6 2719          	jreq	L622
1583  04a8 9e            	ld	a,xh
1584  04a9 a110          	cp	a,#16
1585  04ab 2714          	jreq	L622
1586  04ad 9e            	ld	a,xh
1587  04ae a120          	cp	a,#32
1588  04b0 270f          	jreq	L622
1589  04b2 9e            	ld	a,xh
1590  04b3 a130          	cp	a,#48
1591  04b5 270a          	jreq	L622
1592  04b7 9e            	ld	a,xh
1593  04b8 a160          	cp	a,#96
1594  04ba 2705          	jreq	L622
1595  04bc 9e            	ld	a,xh
1596  04bd a170          	cp	a,#112
1597  04bf 2603          	jrne	L422
1598  04c1               L622:
1599  04c1 4f            	clr	a
1600  04c2 2010          	jra	L032
1601  04c4               L422:
1602  04c4 ae0159        	ldw	x,#345
1603  04c7 89            	pushw	x
1604  04c8 ae0000        	ldw	x,#0
1605  04cb 89            	pushw	x
1606  04cc ae0000        	ldw	x,#L101
1607  04cf cd0000        	call	_assert_failed
1609  04d2 5b04          	addw	sp,#4
1610  04d4               L032:
1611                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1613  04d4 0d03          	tnz	(OFST+2,sp)
1614  04d6 2706          	jreq	L432
1615  04d8 7b03          	ld	a,(OFST+2,sp)
1616  04da a111          	cp	a,#17
1617  04dc 2603          	jrne	L232
1618  04de               L432:
1619  04de 4f            	clr	a
1620  04df 2010          	jra	L632
1621  04e1               L232:
1622  04e1 ae015a        	ldw	x,#346
1623  04e4 89            	pushw	x
1624  04e5 ae0000        	ldw	x,#0
1625  04e8 89            	pushw	x
1626  04e9 ae0000        	ldw	x,#L101
1627  04ec cd0000        	call	_assert_failed
1629  04ef 5b04          	addw	sp,#4
1630  04f1               L632:
1631                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1633  04f1 0d08          	tnz	(OFST+7,sp)
1634  04f3 2706          	jreq	L242
1635  04f5 7b08          	ld	a,(OFST+7,sp)
1636  04f7 a122          	cp	a,#34
1637  04f9 2603          	jrne	L042
1638  04fb               L242:
1639  04fb 4f            	clr	a
1640  04fc 2010          	jra	L442
1641  04fe               L042:
1642  04fe ae015b        	ldw	x,#347
1643  0501 89            	pushw	x
1644  0502 ae0000        	ldw	x,#0
1645  0505 89            	pushw	x
1646  0506 ae0000        	ldw	x,#L101
1647  0509 cd0000        	call	_assert_failed
1649  050c 5b04          	addw	sp,#4
1650  050e               L442:
1651                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1653  050e 7b09          	ld	a,(OFST+8,sp)
1654  0510 a155          	cp	a,#85
1655  0512 2704          	jreq	L052
1656  0514 0d09          	tnz	(OFST+8,sp)
1657  0516 2603          	jrne	L642
1658  0518               L052:
1659  0518 4f            	clr	a
1660  0519 2010          	jra	L252
1661  051b               L642:
1662  051b ae015c        	ldw	x,#348
1663  051e 89            	pushw	x
1664  051f ae0000        	ldw	x,#0
1665  0522 89            	pushw	x
1666  0523 ae0000        	ldw	x,#L101
1667  0526 cd0000        	call	_assert_failed
1669  0529 5b04          	addw	sp,#4
1670  052b               L252:
1671                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1673  052b c6525d        	ld	a,21085
1674  052e a4cf          	and	a,#207
1675  0530 c7525d        	ld	21085,a
1676                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1676                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1678  0533 7b08          	ld	a,(OFST+7,sp)
1679  0535 a420          	and	a,#32
1680  0537 6b01          	ld	(OFST+0,sp),a
1681  0539 7b03          	ld	a,(OFST+2,sp)
1682  053b a410          	and	a,#16
1683  053d 1a01          	or	a,(OFST+0,sp)
1684  053f ca525d        	or	a,21085
1685  0542 c7525d        	ld	21085,a
1686                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1686                     ; 358                           TIM1_OCMode);
1688  0545 c6525b        	ld	a,21083
1689  0548 a48f          	and	a,#143
1690  054a 1a02          	or	a,(OFST+1,sp)
1691  054c c7525b        	ld	21083,a
1692                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1694  054f 0d09          	tnz	(OFST+8,sp)
1695  0551 270a          	jreq	L734
1696                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1698  0553 c6526f        	ld	a,21103
1699  0556 aadf          	or	a,#223
1700  0558 c7526f        	ld	21103,a
1702  055b 2004          	jra	L144
1703  055d               L734:
1704                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1706  055d 721d526f      	bres	21103,#6
1707  0561               L144:
1708                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1710  0561 7b06          	ld	a,(OFST+5,sp)
1711  0563 c7526b        	ld	21099,a
1712                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1714  0566 7b07          	ld	a,(OFST+6,sp)
1715  0568 c7526c        	ld	21100,a
1716                     ; 373 }
1719  056b 5b03          	addw	sp,#3
1720  056d 81            	ret
1926                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1926                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1926                     ; 390                      uint8_t TIM1_DeadTime,
1926                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1926                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1926                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1926                     ; 394 {
1927                     	switch	.text
1928  056e               _TIM1_BDTRConfig:
1930  056e 89            	pushw	x
1931  056f 88            	push	a
1932       00000001      OFST:	set	1
1935                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1937  0570 9e            	ld	a,xh
1938  0571 a104          	cp	a,#4
1939  0573 2704          	jreq	L062
1940  0575 9e            	ld	a,xh
1941  0576 4d            	tnz	a
1942  0577 2603          	jrne	L652
1943  0579               L062:
1944  0579 4f            	clr	a
1945  057a 2010          	jra	L262
1946  057c               L652:
1947  057c ae018c        	ldw	x,#396
1948  057f 89            	pushw	x
1949  0580 ae0000        	ldw	x,#0
1950  0583 89            	pushw	x
1951  0584 ae0000        	ldw	x,#L101
1952  0587 cd0000        	call	_assert_failed
1954  058a 5b04          	addw	sp,#4
1955  058c               L262:
1956                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1958  058c 0d03          	tnz	(OFST+2,sp)
1959  058e 2712          	jreq	L662
1960  0590 7b03          	ld	a,(OFST+2,sp)
1961  0592 a101          	cp	a,#1
1962  0594 270c          	jreq	L662
1963  0596 7b03          	ld	a,(OFST+2,sp)
1964  0598 a102          	cp	a,#2
1965  059a 2706          	jreq	L662
1966  059c 7b03          	ld	a,(OFST+2,sp)
1967  059e a103          	cp	a,#3
1968  05a0 2603          	jrne	L462
1969  05a2               L662:
1970  05a2 4f            	clr	a
1971  05a3 2010          	jra	L072
1972  05a5               L462:
1973  05a5 ae018d        	ldw	x,#397
1974  05a8 89            	pushw	x
1975  05a9 ae0000        	ldw	x,#0
1976  05ac 89            	pushw	x
1977  05ad ae0000        	ldw	x,#L101
1978  05b0 cd0000        	call	_assert_failed
1980  05b3 5b04          	addw	sp,#4
1981  05b5               L072:
1982                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1984  05b5 7b07          	ld	a,(OFST+6,sp)
1985  05b7 a110          	cp	a,#16
1986  05b9 2704          	jreq	L472
1987  05bb 0d07          	tnz	(OFST+6,sp)
1988  05bd 2603          	jrne	L272
1989  05bf               L472:
1990  05bf 4f            	clr	a
1991  05c0 2010          	jra	L672
1992  05c2               L272:
1993  05c2 ae018e        	ldw	x,#398
1994  05c5 89            	pushw	x
1995  05c6 ae0000        	ldw	x,#0
1996  05c9 89            	pushw	x
1997  05ca ae0000        	ldw	x,#L101
1998  05cd cd0000        	call	_assert_failed
2000  05d0 5b04          	addw	sp,#4
2001  05d2               L672:
2002                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
2004  05d2 0d08          	tnz	(OFST+7,sp)
2005  05d4 2706          	jreq	L203
2006  05d6 7b08          	ld	a,(OFST+7,sp)
2007  05d8 a120          	cp	a,#32
2008  05da 2603          	jrne	L003
2009  05dc               L203:
2010  05dc 4f            	clr	a
2011  05dd 2010          	jra	L403
2012  05df               L003:
2013  05df ae018f        	ldw	x,#399
2014  05e2 89            	pushw	x
2015  05e3 ae0000        	ldw	x,#0
2016  05e6 89            	pushw	x
2017  05e7 ae0000        	ldw	x,#L101
2018  05ea cd0000        	call	_assert_failed
2020  05ed 5b04          	addw	sp,#4
2021  05ef               L403:
2022                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2024  05ef 7b09          	ld	a,(OFST+8,sp)
2025  05f1 a140          	cp	a,#64
2026  05f3 2704          	jreq	L013
2027  05f5 0d09          	tnz	(OFST+8,sp)
2028  05f7 2603          	jrne	L603
2029  05f9               L013:
2030  05f9 4f            	clr	a
2031  05fa 2010          	jra	L213
2032  05fc               L603:
2033  05fc ae0190        	ldw	x,#400
2034  05ff 89            	pushw	x
2035  0600 ae0000        	ldw	x,#0
2036  0603 89            	pushw	x
2037  0604 ae0000        	ldw	x,#L101
2038  0607 cd0000        	call	_assert_failed
2040  060a 5b04          	addw	sp,#4
2041  060c               L213:
2042                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2044  060c 7b06          	ld	a,(OFST+5,sp)
2045  060e c7526e        	ld	21102,a
2046                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2046                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2046                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
2048  0611 7b07          	ld	a,(OFST+6,sp)
2049  0613 1a08          	or	a,(OFST+7,sp)
2050  0615 1a09          	or	a,(OFST+8,sp)
2051  0617 6b01          	ld	(OFST+0,sp),a
2052  0619 7b02          	ld	a,(OFST+1,sp)
2053  061b 1a03          	or	a,(OFST+2,sp)
2054  061d 1a01          	or	a,(OFST+0,sp)
2055  061f c7526d        	ld	21101,a
2056                     ; 409 }
2059  0622 5b03          	addw	sp,#3
2060  0624 81            	ret
2263                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2263                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2263                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2263                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2263                     ; 427                  uint8_t TIM1_ICFilter)
2263                     ; 428 {
2264                     	switch	.text
2265  0625               _TIM1_ICInit:
2267  0625 89            	pushw	x
2268       00000000      OFST:	set	0
2271                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2273  0626 9e            	ld	a,xh
2274  0627 4d            	tnz	a
2275  0628 270f          	jreq	L023
2276  062a 9e            	ld	a,xh
2277  062b a101          	cp	a,#1
2278  062d 270a          	jreq	L023
2279  062f 9e            	ld	a,xh
2280  0630 a102          	cp	a,#2
2281  0632 2705          	jreq	L023
2282  0634 9e            	ld	a,xh
2283  0635 a103          	cp	a,#3
2284  0637 2603          	jrne	L613
2285  0639               L023:
2286  0639 4f            	clr	a
2287  063a 2010          	jra	L223
2288  063c               L613:
2289  063c ae01ae        	ldw	x,#430
2290  063f 89            	pushw	x
2291  0640 ae0000        	ldw	x,#0
2292  0643 89            	pushw	x
2293  0644 ae0000        	ldw	x,#L101
2294  0647 cd0000        	call	_assert_failed
2296  064a 5b04          	addw	sp,#4
2297  064c               L223:
2298                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2300  064c 0d02          	tnz	(OFST+2,sp)
2301  064e 2706          	jreq	L623
2302  0650 7b02          	ld	a,(OFST+2,sp)
2303  0652 a101          	cp	a,#1
2304  0654 2603          	jrne	L423
2305  0656               L623:
2306  0656 4f            	clr	a
2307  0657 2010          	jra	L033
2308  0659               L423:
2309  0659 ae01af        	ldw	x,#431
2310  065c 89            	pushw	x
2311  065d ae0000        	ldw	x,#0
2312  0660 89            	pushw	x
2313  0661 ae0000        	ldw	x,#L101
2314  0664 cd0000        	call	_assert_failed
2316  0667 5b04          	addw	sp,#4
2317  0669               L033:
2318                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2320  0669 7b05          	ld	a,(OFST+5,sp)
2321  066b a101          	cp	a,#1
2322  066d 270c          	jreq	L433
2323  066f 7b05          	ld	a,(OFST+5,sp)
2324  0671 a102          	cp	a,#2
2325  0673 2706          	jreq	L433
2326  0675 7b05          	ld	a,(OFST+5,sp)
2327  0677 a103          	cp	a,#3
2328  0679 2603          	jrne	L233
2329  067b               L433:
2330  067b 4f            	clr	a
2331  067c 2010          	jra	L633
2332  067e               L233:
2333  067e ae01b0        	ldw	x,#432
2334  0681 89            	pushw	x
2335  0682 ae0000        	ldw	x,#0
2336  0685 89            	pushw	x
2337  0686 ae0000        	ldw	x,#L101
2338  0689 cd0000        	call	_assert_failed
2340  068c 5b04          	addw	sp,#4
2341  068e               L633:
2342                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2344  068e 0d06          	tnz	(OFST+6,sp)
2345  0690 2712          	jreq	L243
2346  0692 7b06          	ld	a,(OFST+6,sp)
2347  0694 a104          	cp	a,#4
2348  0696 270c          	jreq	L243
2349  0698 7b06          	ld	a,(OFST+6,sp)
2350  069a a108          	cp	a,#8
2351  069c 2706          	jreq	L243
2352  069e 7b06          	ld	a,(OFST+6,sp)
2353  06a0 a10c          	cp	a,#12
2354  06a2 2603          	jrne	L043
2355  06a4               L243:
2356  06a4 4f            	clr	a
2357  06a5 2010          	jra	L443
2358  06a7               L043:
2359  06a7 ae01b1        	ldw	x,#433
2360  06aa 89            	pushw	x
2361  06ab ae0000        	ldw	x,#0
2362  06ae 89            	pushw	x
2363  06af ae0000        	ldw	x,#L101
2364  06b2 cd0000        	call	_assert_failed
2366  06b5 5b04          	addw	sp,#4
2367  06b7               L443:
2368                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2370  06b7 7b07          	ld	a,(OFST+7,sp)
2371  06b9 a110          	cp	a,#16
2372  06bb 2403          	jruge	L643
2373  06bd 4f            	clr	a
2374  06be 2010          	jra	L053
2375  06c0               L643:
2376  06c0 ae01b2        	ldw	x,#434
2377  06c3 89            	pushw	x
2378  06c4 ae0000        	ldw	x,#0
2379  06c7 89            	pushw	x
2380  06c8 ae0000        	ldw	x,#L101
2381  06cb cd0000        	call	_assert_failed
2383  06ce 5b04          	addw	sp,#4
2384  06d0               L053:
2385                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2387  06d0 0d01          	tnz	(OFST+1,sp)
2388  06d2 2614          	jrne	L176
2389                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2389                     ; 440                (uint8_t)TIM1_ICSelection,
2389                     ; 441                (uint8_t)TIM1_ICFilter);
2391  06d4 7b07          	ld	a,(OFST+7,sp)
2392  06d6 88            	push	a
2393  06d7 7b06          	ld	a,(OFST+6,sp)
2394  06d9 97            	ld	xl,a
2395  06da 7b03          	ld	a,(OFST+3,sp)
2396  06dc 95            	ld	xh,a
2397  06dd cd150c        	call	L3_TI1_Config
2399  06e0 84            	pop	a
2400                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2402  06e1 7b06          	ld	a,(OFST+6,sp)
2403  06e3 cd126b        	call	_TIM1_SetIC1Prescaler
2406  06e6 2046          	jra	L376
2407  06e8               L176:
2408                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2410  06e8 7b01          	ld	a,(OFST+1,sp)
2411  06ea a101          	cp	a,#1
2412  06ec 2614          	jrne	L576
2413                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2413                     ; 449                (uint8_t)TIM1_ICSelection,
2413                     ; 450                (uint8_t)TIM1_ICFilter);
2415  06ee 7b07          	ld	a,(OFST+7,sp)
2416  06f0 88            	push	a
2417  06f1 7b06          	ld	a,(OFST+6,sp)
2418  06f3 97            	ld	xl,a
2419  06f4 7b03          	ld	a,(OFST+3,sp)
2420  06f6 95            	ld	xh,a
2421  06f7 cd153c        	call	L5_TI2_Config
2423  06fa 84            	pop	a
2424                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2426  06fb 7b06          	ld	a,(OFST+6,sp)
2427  06fd cd129a        	call	_TIM1_SetIC2Prescaler
2430  0700 202c          	jra	L376
2431  0702               L576:
2432                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2434  0702 7b01          	ld	a,(OFST+1,sp)
2435  0704 a102          	cp	a,#2
2436  0706 2614          	jrne	L107
2437                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2437                     ; 458                (uint8_t)TIM1_ICSelection,
2437                     ; 459                (uint8_t)TIM1_ICFilter);
2439  0708 7b07          	ld	a,(OFST+7,sp)
2440  070a 88            	push	a
2441  070b 7b06          	ld	a,(OFST+6,sp)
2442  070d 97            	ld	xl,a
2443  070e 7b03          	ld	a,(OFST+3,sp)
2444  0710 95            	ld	xh,a
2445  0711 cd156c        	call	L7_TI3_Config
2447  0714 84            	pop	a
2448                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2450  0715 7b06          	ld	a,(OFST+6,sp)
2451  0717 cd12c9        	call	_TIM1_SetIC3Prescaler
2454  071a 2012          	jra	L376
2455  071c               L107:
2456                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2456                     ; 467                (uint8_t)TIM1_ICSelection,
2456                     ; 468                (uint8_t)TIM1_ICFilter);
2458  071c 7b07          	ld	a,(OFST+7,sp)
2459  071e 88            	push	a
2460  071f 7b06          	ld	a,(OFST+6,sp)
2461  0721 97            	ld	xl,a
2462  0722 7b03          	ld	a,(OFST+3,sp)
2463  0724 95            	ld	xh,a
2464  0725 cd159c        	call	L11_TI4_Config
2466  0728 84            	pop	a
2467                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2469  0729 7b06          	ld	a,(OFST+6,sp)
2470  072b cd12f8        	call	_TIM1_SetIC4Prescaler
2472  072e               L376:
2473                     ; 472 }
2476  072e 85            	popw	x
2477  072f 81            	ret
2574                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2574                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2574                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2574                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2574                     ; 492                      uint8_t TIM1_ICFilter)
2574                     ; 493 {
2575                     	switch	.text
2576  0730               _TIM1_PWMIConfig:
2578  0730 89            	pushw	x
2579  0731 89            	pushw	x
2580       00000002      OFST:	set	2
2583                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2585                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2587                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2589  0732 9e            	ld	a,xh
2590  0733 4d            	tnz	a
2591  0734 2705          	jreq	L653
2592  0736 9e            	ld	a,xh
2593  0737 a101          	cp	a,#1
2594  0739 2603          	jrne	L453
2595  073b               L653:
2596  073b 4f            	clr	a
2597  073c 2010          	jra	L063
2598  073e               L453:
2599  073e ae01f2        	ldw	x,#498
2600  0741 89            	pushw	x
2601  0742 ae0000        	ldw	x,#0
2602  0745 89            	pushw	x
2603  0746 ae0000        	ldw	x,#L101
2604  0749 cd0000        	call	_assert_failed
2606  074c 5b04          	addw	sp,#4
2607  074e               L063:
2608                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2610  074e 0d04          	tnz	(OFST+2,sp)
2611  0750 2706          	jreq	L463
2612  0752 7b04          	ld	a,(OFST+2,sp)
2613  0754 a101          	cp	a,#1
2614  0756 2603          	jrne	L263
2615  0758               L463:
2616  0758 4f            	clr	a
2617  0759 2010          	jra	L663
2618  075b               L263:
2619  075b ae01f3        	ldw	x,#499
2620  075e 89            	pushw	x
2621  075f ae0000        	ldw	x,#0
2622  0762 89            	pushw	x
2623  0763 ae0000        	ldw	x,#L101
2624  0766 cd0000        	call	_assert_failed
2626  0769 5b04          	addw	sp,#4
2627  076b               L663:
2628                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2630  076b 7b07          	ld	a,(OFST+5,sp)
2631  076d a101          	cp	a,#1
2632  076f 270c          	jreq	L273
2633  0771 7b07          	ld	a,(OFST+5,sp)
2634  0773 a102          	cp	a,#2
2635  0775 2706          	jreq	L273
2636  0777 7b07          	ld	a,(OFST+5,sp)
2637  0779 a103          	cp	a,#3
2638  077b 2603          	jrne	L073
2639  077d               L273:
2640  077d 4f            	clr	a
2641  077e 2010          	jra	L473
2642  0780               L073:
2643  0780 ae01f4        	ldw	x,#500
2644  0783 89            	pushw	x
2645  0784 ae0000        	ldw	x,#0
2646  0787 89            	pushw	x
2647  0788 ae0000        	ldw	x,#L101
2648  078b cd0000        	call	_assert_failed
2650  078e 5b04          	addw	sp,#4
2651  0790               L473:
2652                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2654  0790 0d08          	tnz	(OFST+6,sp)
2655  0792 2712          	jreq	L004
2656  0794 7b08          	ld	a,(OFST+6,sp)
2657  0796 a104          	cp	a,#4
2658  0798 270c          	jreq	L004
2659  079a 7b08          	ld	a,(OFST+6,sp)
2660  079c a108          	cp	a,#8
2661  079e 2706          	jreq	L004
2662  07a0 7b08          	ld	a,(OFST+6,sp)
2663  07a2 a10c          	cp	a,#12
2664  07a4 2603          	jrne	L673
2665  07a6               L004:
2666  07a6 4f            	clr	a
2667  07a7 2010          	jra	L204
2668  07a9               L673:
2669  07a9 ae01f5        	ldw	x,#501
2670  07ac 89            	pushw	x
2671  07ad ae0000        	ldw	x,#0
2672  07b0 89            	pushw	x
2673  07b1 ae0000        	ldw	x,#L101
2674  07b4 cd0000        	call	_assert_failed
2676  07b7 5b04          	addw	sp,#4
2677  07b9               L204:
2678                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2680  07b9 7b04          	ld	a,(OFST+2,sp)
2681  07bb a101          	cp	a,#1
2682  07bd 2706          	jreq	L357
2683                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2685  07bf a601          	ld	a,#1
2686  07c1 6b01          	ld	(OFST-1,sp),a
2688  07c3 2002          	jra	L557
2689  07c5               L357:
2690                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2692  07c5 0f01          	clr	(OFST-1,sp)
2693  07c7               L557:
2694                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2696  07c7 7b07          	ld	a,(OFST+5,sp)
2697  07c9 a101          	cp	a,#1
2698  07cb 2606          	jrne	L757
2699                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2701  07cd a602          	ld	a,#2
2702  07cf 6b02          	ld	(OFST+0,sp),a
2704  07d1 2004          	jra	L167
2705  07d3               L757:
2706                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2708  07d3 a601          	ld	a,#1
2709  07d5 6b02          	ld	(OFST+0,sp),a
2710  07d7               L167:
2711                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2713  07d7 0d03          	tnz	(OFST+1,sp)
2714  07d9 2626          	jrne	L367
2715                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2715                     ; 527                (uint8_t)TIM1_ICFilter);
2717  07db 7b09          	ld	a,(OFST+7,sp)
2718  07dd 88            	push	a
2719  07de 7b08          	ld	a,(OFST+6,sp)
2720  07e0 97            	ld	xl,a
2721  07e1 7b05          	ld	a,(OFST+3,sp)
2722  07e3 95            	ld	xh,a
2723  07e4 cd150c        	call	L3_TI1_Config
2725  07e7 84            	pop	a
2726                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2728  07e8 7b08          	ld	a,(OFST+6,sp)
2729  07ea cd126b        	call	_TIM1_SetIC1Prescaler
2731                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2733  07ed 7b09          	ld	a,(OFST+7,sp)
2734  07ef 88            	push	a
2735  07f0 7b03          	ld	a,(OFST+1,sp)
2736  07f2 97            	ld	xl,a
2737  07f3 7b02          	ld	a,(OFST+0,sp)
2738  07f5 95            	ld	xh,a
2739  07f6 cd153c        	call	L5_TI2_Config
2741  07f9 84            	pop	a
2742                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2744  07fa 7b08          	ld	a,(OFST+6,sp)
2745  07fc cd129a        	call	_TIM1_SetIC2Prescaler
2748  07ff 2024          	jra	L567
2749  0801               L367:
2750                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2750                     ; 542                (uint8_t)TIM1_ICFilter);
2752  0801 7b09          	ld	a,(OFST+7,sp)
2753  0803 88            	push	a
2754  0804 7b08          	ld	a,(OFST+6,sp)
2755  0806 97            	ld	xl,a
2756  0807 7b05          	ld	a,(OFST+3,sp)
2757  0809 95            	ld	xh,a
2758  080a cd153c        	call	L5_TI2_Config
2760  080d 84            	pop	a
2761                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2763  080e 7b08          	ld	a,(OFST+6,sp)
2764  0810 cd129a        	call	_TIM1_SetIC2Prescaler
2766                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2768  0813 7b09          	ld	a,(OFST+7,sp)
2769  0815 88            	push	a
2770  0816 7b03          	ld	a,(OFST+1,sp)
2771  0818 97            	ld	xl,a
2772  0819 7b02          	ld	a,(OFST+0,sp)
2773  081b 95            	ld	xh,a
2774  081c cd150c        	call	L3_TI1_Config
2776  081f 84            	pop	a
2777                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2779  0820 7b08          	ld	a,(OFST+6,sp)
2780  0822 cd126b        	call	_TIM1_SetIC1Prescaler
2782  0825               L567:
2783                     ; 553 }
2786  0825 5b04          	addw	sp,#4
2787  0827 81            	ret
2843                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2843                     ; 562 {
2844                     	switch	.text
2845  0828               _TIM1_Cmd:
2847  0828 88            	push	a
2848       00000000      OFST:	set	0
2851                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2853  0829 4d            	tnz	a
2854  082a 2704          	jreq	L014
2855  082c a101          	cp	a,#1
2856  082e 2603          	jrne	L604
2857  0830               L014:
2858  0830 4f            	clr	a
2859  0831 2010          	jra	L214
2860  0833               L604:
2861  0833 ae0234        	ldw	x,#564
2862  0836 89            	pushw	x
2863  0837 ae0000        	ldw	x,#0
2864  083a 89            	pushw	x
2865  083b ae0000        	ldw	x,#L101
2866  083e cd0000        	call	_assert_failed
2868  0841 5b04          	addw	sp,#4
2869  0843               L214:
2870                     ; 567   if (NewState != DISABLE)
2872  0843 0d01          	tnz	(OFST+1,sp)
2873  0845 2706          	jreq	L5101
2874                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2876  0847 72105250      	bset	21072,#0
2878  084b 2004          	jra	L7101
2879  084d               L5101:
2880                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2882  084d 72115250      	bres	21072,#0
2883  0851               L7101:
2884                     ; 575 }
2887  0851 84            	pop	a
2888  0852 81            	ret
2925                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2925                     ; 584 {
2926                     	switch	.text
2927  0853               _TIM1_CtrlPWMOutputs:
2929  0853 88            	push	a
2930       00000000      OFST:	set	0
2933                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2935  0854 4d            	tnz	a
2936  0855 2704          	jreq	L024
2937  0857 a101          	cp	a,#1
2938  0859 2603          	jrne	L614
2939  085b               L024:
2940  085b 4f            	clr	a
2941  085c 2010          	jra	L224
2942  085e               L614:
2943  085e ae024a        	ldw	x,#586
2944  0861 89            	pushw	x
2945  0862 ae0000        	ldw	x,#0
2946  0865 89            	pushw	x
2947  0866 ae0000        	ldw	x,#L101
2948  0869 cd0000        	call	_assert_failed
2950  086c 5b04          	addw	sp,#4
2951  086e               L224:
2952                     ; 590   if (NewState != DISABLE)
2954  086e 0d01          	tnz	(OFST+1,sp)
2955  0870 2706          	jreq	L7301
2956                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2958  0872 721e526d      	bset	21101,#7
2960  0876 2004          	jra	L1401
2961  0878               L7301:
2962                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2964  0878 721f526d      	bres	21101,#7
2965  087c               L1401:
2966                     ; 598 }
2969  087c 84            	pop	a
2970  087d 81            	ret
3078                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3078                     ; 618 {
3079                     	switch	.text
3080  087e               _TIM1_ITConfig:
3082  087e 89            	pushw	x
3083       00000000      OFST:	set	0
3086                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3088  087f 9e            	ld	a,xh
3089  0880 4d            	tnz	a
3090  0881 2703          	jreq	L624
3091  0883 4f            	clr	a
3092  0884 2010          	jra	L034
3093  0886               L624:
3094  0886 ae026c        	ldw	x,#620
3095  0889 89            	pushw	x
3096  088a ae0000        	ldw	x,#0
3097  088d 89            	pushw	x
3098  088e ae0000        	ldw	x,#L101
3099  0891 cd0000        	call	_assert_failed
3101  0894 5b04          	addw	sp,#4
3102  0896               L034:
3103                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3105  0896 0d02          	tnz	(OFST+2,sp)
3106  0898 2706          	jreq	L434
3107  089a 7b02          	ld	a,(OFST+2,sp)
3108  089c a101          	cp	a,#1
3109  089e 2603          	jrne	L234
3110  08a0               L434:
3111  08a0 4f            	clr	a
3112  08a1 2010          	jra	L634
3113  08a3               L234:
3114  08a3 ae026d        	ldw	x,#621
3115  08a6 89            	pushw	x
3116  08a7 ae0000        	ldw	x,#0
3117  08aa 89            	pushw	x
3118  08ab ae0000        	ldw	x,#L101
3119  08ae cd0000        	call	_assert_failed
3121  08b1 5b04          	addw	sp,#4
3122  08b3               L634:
3123                     ; 623   if (NewState != DISABLE)
3125  08b3 0d02          	tnz	(OFST+2,sp)
3126  08b5 270a          	jreq	L1111
3127                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
3129  08b7 c65254        	ld	a,21076
3130  08ba 1a01          	or	a,(OFST+1,sp)
3131  08bc c75254        	ld	21076,a
3133  08bf 2009          	jra	L3111
3134  08c1               L1111:
3135                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3137  08c1 7b01          	ld	a,(OFST+1,sp)
3138  08c3 43            	cpl	a
3139  08c4 c45254        	and	a,21076
3140  08c7 c75254        	ld	21076,a
3141  08ca               L3111:
3142                     ; 633 }
3145  08ca 85            	popw	x
3146  08cb 81            	ret
3170                     ; 640 void TIM1_InternalClockConfig(void)
3170                     ; 641 {
3171                     	switch	.text
3172  08cc               _TIM1_InternalClockConfig:
3176                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3178  08cc c65252        	ld	a,21074
3179  08cf a4f8          	and	a,#248
3180  08d1 c75252        	ld	21074,a
3181                     ; 644 }
3184  08d4 81            	ret
3302                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3302                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3302                     ; 664                               uint8_t ExtTRGFilter)
3302                     ; 665 {
3303                     	switch	.text
3304  08d5               _TIM1_ETRClockMode1Config:
3306  08d5 89            	pushw	x
3307       00000000      OFST:	set	0
3310                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3312  08d6 9e            	ld	a,xh
3313  08d7 4d            	tnz	a
3314  08d8 270f          	jreq	L644
3315  08da 9e            	ld	a,xh
3316  08db a110          	cp	a,#16
3317  08dd 270a          	jreq	L644
3318  08df 9e            	ld	a,xh
3319  08e0 a120          	cp	a,#32
3320  08e2 2705          	jreq	L644
3321  08e4 9e            	ld	a,xh
3322  08e5 a130          	cp	a,#48
3323  08e7 2603          	jrne	L444
3324  08e9               L644:
3325  08e9 4f            	clr	a
3326  08ea 2010          	jra	L054
3327  08ec               L444:
3328  08ec ae029b        	ldw	x,#667
3329  08ef 89            	pushw	x
3330  08f0 ae0000        	ldw	x,#0
3331  08f3 89            	pushw	x
3332  08f4 ae0000        	ldw	x,#L101
3333  08f7 cd0000        	call	_assert_failed
3335  08fa 5b04          	addw	sp,#4
3336  08fc               L054:
3337                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3339  08fc 7b02          	ld	a,(OFST+2,sp)
3340  08fe a180          	cp	a,#128
3341  0900 2704          	jreq	L454
3342  0902 0d02          	tnz	(OFST+2,sp)
3343  0904 2603          	jrne	L254
3344  0906               L454:
3345  0906 4f            	clr	a
3346  0907 2010          	jra	L654
3347  0909               L254:
3348  0909 ae029c        	ldw	x,#668
3349  090c 89            	pushw	x
3350  090d ae0000        	ldw	x,#0
3351  0910 89            	pushw	x
3352  0911 ae0000        	ldw	x,#L101
3353  0914 cd0000        	call	_assert_failed
3355  0917 5b04          	addw	sp,#4
3356  0919               L654:
3357                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3359  0919 7b05          	ld	a,(OFST+5,sp)
3360  091b 88            	push	a
3361  091c 7b03          	ld	a,(OFST+3,sp)
3362  091e 97            	ld	xl,a
3363  091f 7b02          	ld	a,(OFST+2,sp)
3364  0921 95            	ld	xh,a
3365  0922 ad63          	call	_TIM1_ETRConfig
3367  0924 84            	pop	a
3368                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3368                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3370  0925 c65252        	ld	a,21074
3371  0928 a488          	and	a,#136
3372  092a aa77          	or	a,#119
3373  092c c75252        	ld	21074,a
3374                     ; 676 }
3377  092f 85            	popw	x
3378  0930 81            	ret
3437                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3437                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3437                     ; 696                               uint8_t ExtTRGFilter)
3437                     ; 697 {
3438                     	switch	.text
3439  0931               _TIM1_ETRClockMode2Config:
3441  0931 89            	pushw	x
3442       00000000      OFST:	set	0
3445                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3447  0932 9e            	ld	a,xh
3448  0933 4d            	tnz	a
3449  0934 270f          	jreq	L464
3450  0936 9e            	ld	a,xh
3451  0937 a110          	cp	a,#16
3452  0939 270a          	jreq	L464
3453  093b 9e            	ld	a,xh
3454  093c a120          	cp	a,#32
3455  093e 2705          	jreq	L464
3456  0940 9e            	ld	a,xh
3457  0941 a130          	cp	a,#48
3458  0943 2603          	jrne	L264
3459  0945               L464:
3460  0945 4f            	clr	a
3461  0946 2010          	jra	L664
3462  0948               L264:
3463  0948 ae02bb        	ldw	x,#699
3464  094b 89            	pushw	x
3465  094c ae0000        	ldw	x,#0
3466  094f 89            	pushw	x
3467  0950 ae0000        	ldw	x,#L101
3468  0953 cd0000        	call	_assert_failed
3470  0956 5b04          	addw	sp,#4
3471  0958               L664:
3472                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3474  0958 7b02          	ld	a,(OFST+2,sp)
3475  095a a180          	cp	a,#128
3476  095c 2704          	jreq	L274
3477  095e 0d02          	tnz	(OFST+2,sp)
3478  0960 2603          	jrne	L074
3479  0962               L274:
3480  0962 4f            	clr	a
3481  0963 2010          	jra	L474
3482  0965               L074:
3483  0965 ae02bc        	ldw	x,#700
3484  0968 89            	pushw	x
3485  0969 ae0000        	ldw	x,#0
3486  096c 89            	pushw	x
3487  096d ae0000        	ldw	x,#L101
3488  0970 cd0000        	call	_assert_failed
3490  0973 5b04          	addw	sp,#4
3491  0975               L474:
3492                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3494  0975 7b05          	ld	a,(OFST+5,sp)
3495  0977 88            	push	a
3496  0978 7b03          	ld	a,(OFST+3,sp)
3497  097a 97            	ld	xl,a
3498  097b 7b02          	ld	a,(OFST+2,sp)
3499  097d 95            	ld	xh,a
3500  097e ad07          	call	_TIM1_ETRConfig
3502  0980 84            	pop	a
3503                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3505  0981 721c5253      	bset	21075,#6
3506                     ; 707 }
3509  0985 85            	popw	x
3510  0986 81            	ret
3567                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3567                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3567                     ; 727                     uint8_t ExtTRGFilter)
3567                     ; 728 {
3568                     	switch	.text
3569  0987               _TIM1_ETRConfig:
3571  0987 89            	pushw	x
3572       00000000      OFST:	set	0
3575                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3577  0988 7b05          	ld	a,(OFST+5,sp)
3578  098a a110          	cp	a,#16
3579  098c 2403          	jruge	L005
3580  098e 4f            	clr	a
3581  098f 2010          	jra	L205
3582  0991               L005:
3583  0991 ae02da        	ldw	x,#730
3584  0994 89            	pushw	x
3585  0995 ae0000        	ldw	x,#0
3586  0998 89            	pushw	x
3587  0999 ae0000        	ldw	x,#L101
3588  099c cd0000        	call	_assert_failed
3590  099f 5b04          	addw	sp,#4
3591  09a1               L205:
3592                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3592                     ; 733                          (uint8_t)ExtTRGFilter );
3594  09a1 7b01          	ld	a,(OFST+1,sp)
3595  09a3 1a02          	or	a,(OFST+2,sp)
3596  09a5 1a05          	or	a,(OFST+5,sp)
3597  09a7 ca5253        	or	a,21075
3598  09aa c75253        	ld	21075,a
3599                     ; 734 }
3602  09ad 85            	popw	x
3603  09ae 81            	ret
3693                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3693                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3693                     ; 753                                  uint8_t ICFilter)
3693                     ; 754 {
3694                     	switch	.text
3695  09af               _TIM1_TIxExternalClockConfig:
3697  09af 89            	pushw	x
3698       00000000      OFST:	set	0
3701                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3703  09b0 9e            	ld	a,xh
3704  09b1 a140          	cp	a,#64
3705  09b3 270a          	jreq	L015
3706  09b5 9e            	ld	a,xh
3707  09b6 a160          	cp	a,#96
3708  09b8 2705          	jreq	L015
3709  09ba 9e            	ld	a,xh
3710  09bb a150          	cp	a,#80
3711  09bd 2603          	jrne	L605
3712  09bf               L015:
3713  09bf 4f            	clr	a
3714  09c0 2010          	jra	L215
3715  09c2               L605:
3716  09c2 ae02f4        	ldw	x,#756
3717  09c5 89            	pushw	x
3718  09c6 ae0000        	ldw	x,#0
3719  09c9 89            	pushw	x
3720  09ca ae0000        	ldw	x,#L101
3721  09cd cd0000        	call	_assert_failed
3723  09d0 5b04          	addw	sp,#4
3724  09d2               L215:
3725                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3727  09d2 0d02          	tnz	(OFST+2,sp)
3728  09d4 2706          	jreq	L615
3729  09d6 7b02          	ld	a,(OFST+2,sp)
3730  09d8 a101          	cp	a,#1
3731  09da 2603          	jrne	L415
3732  09dc               L615:
3733  09dc 4f            	clr	a
3734  09dd 2010          	jra	L025
3735  09df               L415:
3736  09df ae02f5        	ldw	x,#757
3737  09e2 89            	pushw	x
3738  09e3 ae0000        	ldw	x,#0
3739  09e6 89            	pushw	x
3740  09e7 ae0000        	ldw	x,#L101
3741  09ea cd0000        	call	_assert_failed
3743  09ed 5b04          	addw	sp,#4
3744  09ef               L025:
3745                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3747  09ef 7b05          	ld	a,(OFST+5,sp)
3748  09f1 a110          	cp	a,#16
3749  09f3 2403          	jruge	L225
3750  09f5 4f            	clr	a
3751  09f6 2010          	jra	L425
3752  09f8               L225:
3753  09f8 ae02f6        	ldw	x,#758
3754  09fb 89            	pushw	x
3755  09fc ae0000        	ldw	x,#0
3756  09ff 89            	pushw	x
3757  0a00 ae0000        	ldw	x,#L101
3758  0a03 cd0000        	call	_assert_failed
3760  0a06 5b04          	addw	sp,#4
3761  0a08               L425:
3762                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3764  0a08 7b01          	ld	a,(OFST+1,sp)
3765  0a0a a160          	cp	a,#96
3766  0a0c 260f          	jrne	L3131
3767                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3769  0a0e 7b05          	ld	a,(OFST+5,sp)
3770  0a10 88            	push	a
3771  0a11 ae0001        	ldw	x,#1
3772  0a14 7b03          	ld	a,(OFST+3,sp)
3773  0a16 95            	ld	xh,a
3774  0a17 cd153c        	call	L5_TI2_Config
3776  0a1a 84            	pop	a
3778  0a1b 200d          	jra	L5131
3779  0a1d               L3131:
3780                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3782  0a1d 7b05          	ld	a,(OFST+5,sp)
3783  0a1f 88            	push	a
3784  0a20 ae0001        	ldw	x,#1
3785  0a23 7b03          	ld	a,(OFST+3,sp)
3786  0a25 95            	ld	xh,a
3787  0a26 cd150c        	call	L3_TI1_Config
3789  0a29 84            	pop	a
3790  0a2a               L5131:
3791                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3793  0a2a 7b01          	ld	a,(OFST+1,sp)
3794  0a2c ad0a          	call	_TIM1_SelectInputTrigger
3796                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3798  0a2e c65252        	ld	a,21074
3799  0a31 aa07          	or	a,#7
3800  0a33 c75252        	ld	21074,a
3801                     ; 775 }
3804  0a36 85            	popw	x
3805  0a37 81            	ret
3891                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3891                     ; 788 {
3892                     	switch	.text
3893  0a38               _TIM1_SelectInputTrigger:
3895  0a38 88            	push	a
3896       00000000      OFST:	set	0
3899                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3901  0a39 a140          	cp	a,#64
3902  0a3b 2713          	jreq	L235
3903  0a3d a150          	cp	a,#80
3904  0a3f 270f          	jreq	L235
3905  0a41 a160          	cp	a,#96
3906  0a43 270b          	jreq	L235
3907  0a45 a170          	cp	a,#112
3908  0a47 2707          	jreq	L235
3909  0a49 a130          	cp	a,#48
3910  0a4b 2703          	jreq	L235
3911  0a4d 4d            	tnz	a
3912  0a4e 2603          	jrne	L035
3913  0a50               L235:
3914  0a50 4f            	clr	a
3915  0a51 2010          	jra	L435
3916  0a53               L035:
3917  0a53 ae0316        	ldw	x,#790
3918  0a56 89            	pushw	x
3919  0a57 ae0000        	ldw	x,#0
3920  0a5a 89            	pushw	x
3921  0a5b ae0000        	ldw	x,#L101
3922  0a5e cd0000        	call	_assert_failed
3924  0a61 5b04          	addw	sp,#4
3925  0a63               L435:
3926                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3928  0a63 c65252        	ld	a,21074
3929  0a66 a48f          	and	a,#143
3930  0a68 1a01          	or	a,(OFST+1,sp)
3931  0a6a c75252        	ld	21074,a
3932                     ; 794 }
3935  0a6d 84            	pop	a
3936  0a6e 81            	ret
3973                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3973                     ; 804 {
3974                     	switch	.text
3975  0a6f               _TIM1_UpdateDisableConfig:
3977  0a6f 88            	push	a
3978       00000000      OFST:	set	0
3981                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3983  0a70 4d            	tnz	a
3984  0a71 2704          	jreq	L245
3985  0a73 a101          	cp	a,#1
3986  0a75 2603          	jrne	L045
3987  0a77               L245:
3988  0a77 4f            	clr	a
3989  0a78 2010          	jra	L445
3990  0a7a               L045:
3991  0a7a ae0326        	ldw	x,#806
3992  0a7d 89            	pushw	x
3993  0a7e ae0000        	ldw	x,#0
3994  0a81 89            	pushw	x
3995  0a82 ae0000        	ldw	x,#L101
3996  0a85 cd0000        	call	_assert_failed
3998  0a88 5b04          	addw	sp,#4
3999  0a8a               L445:
4000                     ; 809   if (NewState != DISABLE)
4002  0a8a 0d01          	tnz	(OFST+1,sp)
4003  0a8c 2706          	jreq	L3731
4004                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
4006  0a8e 72125250      	bset	21072,#1
4008  0a92 2004          	jra	L5731
4009  0a94               L3731:
4010                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
4012  0a94 72135250      	bres	21072,#1
4013  0a98               L5731:
4014                     ; 817 }
4017  0a98 84            	pop	a
4018  0a99 81            	ret
4077                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4077                     ; 828 {
4078                     	switch	.text
4079  0a9a               _TIM1_UpdateRequestConfig:
4081  0a9a 88            	push	a
4082       00000000      OFST:	set	0
4085                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4087  0a9b 4d            	tnz	a
4088  0a9c 2704          	jreq	L255
4089  0a9e a101          	cp	a,#1
4090  0aa0 2603          	jrne	L055
4091  0aa2               L255:
4092  0aa2 4f            	clr	a
4093  0aa3 2010          	jra	L455
4094  0aa5               L055:
4095  0aa5 ae033e        	ldw	x,#830
4096  0aa8 89            	pushw	x
4097  0aa9 ae0000        	ldw	x,#0
4098  0aac 89            	pushw	x
4099  0aad ae0000        	ldw	x,#L101
4100  0ab0 cd0000        	call	_assert_failed
4102  0ab3 5b04          	addw	sp,#4
4103  0ab5               L455:
4104                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4106  0ab5 0d01          	tnz	(OFST+1,sp)
4107  0ab7 2706          	jreq	L5241
4108                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
4110  0ab9 72145250      	bset	21072,#2
4112  0abd 2004          	jra	L7241
4113  0abf               L5241:
4114                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4116  0abf 72155250      	bres	21072,#2
4117  0ac3               L7241:
4118                     ; 841 }
4121  0ac3 84            	pop	a
4122  0ac4 81            	ret
4159                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
4159                     ; 850 {
4160                     	switch	.text
4161  0ac5               _TIM1_SelectHallSensor:
4163  0ac5 88            	push	a
4164       00000000      OFST:	set	0
4167                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4169  0ac6 4d            	tnz	a
4170  0ac7 2704          	jreq	L265
4171  0ac9 a101          	cp	a,#1
4172  0acb 2603          	jrne	L065
4173  0acd               L265:
4174  0acd 4f            	clr	a
4175  0ace 2010          	jra	L465
4176  0ad0               L065:
4177  0ad0 ae0354        	ldw	x,#852
4178  0ad3 89            	pushw	x
4179  0ad4 ae0000        	ldw	x,#0
4180  0ad7 89            	pushw	x
4181  0ad8 ae0000        	ldw	x,#L101
4182  0adb cd0000        	call	_assert_failed
4184  0ade 5b04          	addw	sp,#4
4185  0ae0               L465:
4186                     ; 855   if (NewState != DISABLE)
4188  0ae0 0d01          	tnz	(OFST+1,sp)
4189  0ae2 2706          	jreq	L7441
4190                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
4192  0ae4 721e5251      	bset	21073,#7
4194  0ae8 2004          	jra	L1541
4195  0aea               L7441:
4196                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4198  0aea 721f5251      	bres	21073,#7
4199  0aee               L1541:
4200                     ; 863 }
4203  0aee 84            	pop	a
4204  0aef 81            	ret
4262                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4262                     ; 874 {
4263                     	switch	.text
4264  0af0               _TIM1_SelectOnePulseMode:
4266  0af0 88            	push	a
4267       00000000      OFST:	set	0
4270                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4272  0af1 a101          	cp	a,#1
4273  0af3 2703          	jreq	L275
4274  0af5 4d            	tnz	a
4275  0af6 2603          	jrne	L075
4276  0af8               L275:
4277  0af8 4f            	clr	a
4278  0af9 2010          	jra	L475
4279  0afb               L075:
4280  0afb ae036c        	ldw	x,#876
4281  0afe 89            	pushw	x
4282  0aff ae0000        	ldw	x,#0
4283  0b02 89            	pushw	x
4284  0b03 ae0000        	ldw	x,#L101
4285  0b06 cd0000        	call	_assert_failed
4287  0b09 5b04          	addw	sp,#4
4288  0b0b               L475:
4289                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4291  0b0b 0d01          	tnz	(OFST+1,sp)
4292  0b0d 2706          	jreq	L1051
4293                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4295  0b0f 72165250      	bset	21072,#3
4297  0b13 2004          	jra	L3051
4298  0b15               L1051:
4299                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4301  0b15 72175250      	bres	21072,#3
4302  0b19               L3051:
4303                     ; 888 }
4306  0b19 84            	pop	a
4307  0b1a 81            	ret
4406                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4406                     ; 904 {
4407                     	switch	.text
4408  0b1b               _TIM1_SelectOutputTrigger:
4410  0b1b 88            	push	a
4411       00000000      OFST:	set	0
4414                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4416  0b1c 4d            	tnz	a
4417  0b1d 2718          	jreq	L206
4418  0b1f a110          	cp	a,#16
4419  0b21 2714          	jreq	L206
4420  0b23 a120          	cp	a,#32
4421  0b25 2710          	jreq	L206
4422  0b27 a130          	cp	a,#48
4423  0b29 270c          	jreq	L206
4424  0b2b a140          	cp	a,#64
4425  0b2d 2708          	jreq	L206
4426  0b2f a150          	cp	a,#80
4427  0b31 2704          	jreq	L206
4428  0b33 a160          	cp	a,#96
4429  0b35 2603          	jrne	L006
4430  0b37               L206:
4431  0b37 4f            	clr	a
4432  0b38 2010          	jra	L406
4433  0b3a               L006:
4434  0b3a ae038a        	ldw	x,#906
4435  0b3d 89            	pushw	x
4436  0b3e ae0000        	ldw	x,#0
4437  0b41 89            	pushw	x
4438  0b42 ae0000        	ldw	x,#L101
4439  0b45 cd0000        	call	_assert_failed
4441  0b48 5b04          	addw	sp,#4
4442  0b4a               L406:
4443                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4443                     ; 910                         (uint8_t) TIM1_TRGOSource);
4445  0b4a c65251        	ld	a,21073
4446  0b4d a48f          	and	a,#143
4447  0b4f 1a01          	or	a,(OFST+1,sp)
4448  0b51 c75251        	ld	21073,a
4449                     ; 911 }
4452  0b54 84            	pop	a
4453  0b55 81            	ret
4528                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4528                     ; 924 {
4529                     	switch	.text
4530  0b56               _TIM1_SelectSlaveMode:
4532  0b56 88            	push	a
4533       00000000      OFST:	set	0
4536                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4538  0b57 a104          	cp	a,#4
4539  0b59 270c          	jreq	L216
4540  0b5b a105          	cp	a,#5
4541  0b5d 2708          	jreq	L216
4542  0b5f a106          	cp	a,#6
4543  0b61 2704          	jreq	L216
4544  0b63 a107          	cp	a,#7
4545  0b65 2603          	jrne	L016
4546  0b67               L216:
4547  0b67 4f            	clr	a
4548  0b68 2010          	jra	L416
4549  0b6a               L016:
4550  0b6a ae039e        	ldw	x,#926
4551  0b6d 89            	pushw	x
4552  0b6e ae0000        	ldw	x,#0
4553  0b71 89            	pushw	x
4554  0b72 ae0000        	ldw	x,#L101
4555  0b75 cd0000        	call	_assert_failed
4557  0b78 5b04          	addw	sp,#4
4558  0b7a               L416:
4559                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4559                     ; 930                          (uint8_t)TIM1_SlaveMode);
4561  0b7a c65252        	ld	a,21074
4562  0b7d a4f8          	and	a,#248
4563  0b7f 1a01          	or	a,(OFST+1,sp)
4564  0b81 c75252        	ld	21074,a
4565                     ; 931 }
4568  0b84 84            	pop	a
4569  0b85 81            	ret
4606                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4606                     ; 940 {
4607                     	switch	.text
4608  0b86               _TIM1_SelectMasterSlaveMode:
4610  0b86 88            	push	a
4611       00000000      OFST:	set	0
4614                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4616  0b87 4d            	tnz	a
4617  0b88 2704          	jreq	L226
4618  0b8a a101          	cp	a,#1
4619  0b8c 2603          	jrne	L026
4620  0b8e               L226:
4621  0b8e 4f            	clr	a
4622  0b8f 2010          	jra	L426
4623  0b91               L026:
4624  0b91 ae03ae        	ldw	x,#942
4625  0b94 89            	pushw	x
4626  0b95 ae0000        	ldw	x,#0
4627  0b98 89            	pushw	x
4628  0b99 ae0000        	ldw	x,#L101
4629  0b9c cd0000        	call	_assert_failed
4631  0b9f 5b04          	addw	sp,#4
4632  0ba1               L426:
4633                     ; 945   if (NewState != DISABLE)
4635  0ba1 0d01          	tnz	(OFST+1,sp)
4636  0ba3 2706          	jreq	L5161
4637                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4639  0ba5 721e5252      	bset	21074,#7
4641  0ba9 2004          	jra	L7161
4642  0bab               L5161:
4643                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4645  0bab 721f5252      	bres	21074,#7
4646  0baf               L7161:
4647                     ; 953 }
4650  0baf 84            	pop	a
4651  0bb0 81            	ret
4738                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4738                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4738                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4738                     ; 978 {
4739                     	switch	.text
4740  0bb1               _TIM1_EncoderInterfaceConfig:
4742  0bb1 89            	pushw	x
4743       00000000      OFST:	set	0
4746                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4748  0bb2 9e            	ld	a,xh
4749  0bb3 a101          	cp	a,#1
4750  0bb5 270a          	jreq	L236
4751  0bb7 9e            	ld	a,xh
4752  0bb8 a102          	cp	a,#2
4753  0bba 2705          	jreq	L236
4754  0bbc 9e            	ld	a,xh
4755  0bbd a103          	cp	a,#3
4756  0bbf 2603          	jrne	L036
4757  0bc1               L236:
4758  0bc1 4f            	clr	a
4759  0bc2 2010          	jra	L436
4760  0bc4               L036:
4761  0bc4 ae03d4        	ldw	x,#980
4762  0bc7 89            	pushw	x
4763  0bc8 ae0000        	ldw	x,#0
4764  0bcb 89            	pushw	x
4765  0bcc ae0000        	ldw	x,#L101
4766  0bcf cd0000        	call	_assert_failed
4768  0bd2 5b04          	addw	sp,#4
4769  0bd4               L436:
4770                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4772  0bd4 0d02          	tnz	(OFST+2,sp)
4773  0bd6 2706          	jreq	L046
4774  0bd8 7b02          	ld	a,(OFST+2,sp)
4775  0bda a101          	cp	a,#1
4776  0bdc 2603          	jrne	L636
4777  0bde               L046:
4778  0bde 4f            	clr	a
4779  0bdf 2010          	jra	L246
4780  0be1               L636:
4781  0be1 ae03d5        	ldw	x,#981
4782  0be4 89            	pushw	x
4783  0be5 ae0000        	ldw	x,#0
4784  0be8 89            	pushw	x
4785  0be9 ae0000        	ldw	x,#L101
4786  0bec cd0000        	call	_assert_failed
4788  0bef 5b04          	addw	sp,#4
4789  0bf1               L246:
4790                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4792  0bf1 0d05          	tnz	(OFST+5,sp)
4793  0bf3 2706          	jreq	L646
4794  0bf5 7b05          	ld	a,(OFST+5,sp)
4795  0bf7 a101          	cp	a,#1
4796  0bf9 2603          	jrne	L446
4797  0bfb               L646:
4798  0bfb 4f            	clr	a
4799  0bfc 2010          	jra	L056
4800  0bfe               L446:
4801  0bfe ae03d6        	ldw	x,#982
4802  0c01 89            	pushw	x
4803  0c02 ae0000        	ldw	x,#0
4804  0c05 89            	pushw	x
4805  0c06 ae0000        	ldw	x,#L101
4806  0c09 cd0000        	call	_assert_failed
4808  0c0c 5b04          	addw	sp,#4
4809  0c0e               L056:
4810                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4812  0c0e 0d02          	tnz	(OFST+2,sp)
4813  0c10 2706          	jreq	L1661
4814                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4816  0c12 7212525c      	bset	21084,#1
4818  0c16 2004          	jra	L3661
4819  0c18               L1661:
4820                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4822  0c18 7213525c      	bres	21084,#1
4823  0c1c               L3661:
4824                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4826  0c1c 0d05          	tnz	(OFST+5,sp)
4827  0c1e 2706          	jreq	L5661
4828                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4830  0c20 721a525c      	bset	21084,#5
4832  0c24 2004          	jra	L7661
4833  0c26               L5661:
4834                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4836  0c26 721b525c      	bres	21084,#5
4837  0c2a               L7661:
4838                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4838                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4840  0c2a c65252        	ld	a,21074
4841  0c2d a4f0          	and	a,#240
4842  0c2f 1a01          	or	a,(OFST+1,sp)
4843  0c31 c75252        	ld	21074,a
4844                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4844                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4846  0c34 c65258        	ld	a,21080
4847  0c37 a4fc          	and	a,#252
4848  0c39 aa01          	or	a,#1
4849  0c3b c75258        	ld	21080,a
4850                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4850                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4852  0c3e c65259        	ld	a,21081
4853  0c41 a4fc          	and	a,#252
4854  0c43 aa01          	or	a,#1
4855  0c45 c75259        	ld	21081,a
4856                     ; 1011 }
4859  0c48 85            	popw	x
4860  0c49 81            	ret
4928                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4928                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4928                     ; 1025 {
4929                     	switch	.text
4930  0c4a               _TIM1_PrescalerConfig:
4932  0c4a 89            	pushw	x
4933       00000000      OFST:	set	0
4936                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4938  0c4b 0d05          	tnz	(OFST+5,sp)
4939  0c4d 2706          	jreq	L656
4940  0c4f 7b05          	ld	a,(OFST+5,sp)
4941  0c51 a101          	cp	a,#1
4942  0c53 2603          	jrne	L456
4943  0c55               L656:
4944  0c55 4f            	clr	a
4945  0c56 2010          	jra	L066
4946  0c58               L456:
4947  0c58 ae0403        	ldw	x,#1027
4948  0c5b 89            	pushw	x
4949  0c5c ae0000        	ldw	x,#0
4950  0c5f 89            	pushw	x
4951  0c60 ae0000        	ldw	x,#L101
4952  0c63 cd0000        	call	_assert_failed
4954  0c66 5b04          	addw	sp,#4
4955  0c68               L066:
4956                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4958  0c68 7b01          	ld	a,(OFST+1,sp)
4959  0c6a c75260        	ld	21088,a
4960                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4962  0c6d 7b02          	ld	a,(OFST+2,sp)
4963  0c6f c75261        	ld	21089,a
4964                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4966  0c72 7b05          	ld	a,(OFST+5,sp)
4967  0c74 c75257        	ld	21079,a
4968                     ; 1035 }
4971  0c77 85            	popw	x
4972  0c78 81            	ret
5009                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
5009                     ; 1049 {
5010                     	switch	.text
5011  0c79               _TIM1_CounterModeConfig:
5013  0c79 88            	push	a
5014       00000000      OFST:	set	0
5017                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
5019  0c7a 4d            	tnz	a
5020  0c7b 2710          	jreq	L666
5021  0c7d a110          	cp	a,#16
5022  0c7f 270c          	jreq	L666
5023  0c81 a120          	cp	a,#32
5024  0c83 2708          	jreq	L666
5025  0c85 a140          	cp	a,#64
5026  0c87 2704          	jreq	L666
5027  0c89 a160          	cp	a,#96
5028  0c8b 2603          	jrne	L466
5029  0c8d               L666:
5030  0c8d 4f            	clr	a
5031  0c8e 2010          	jra	L076
5032  0c90               L466:
5033  0c90 ae041b        	ldw	x,#1051
5034  0c93 89            	pushw	x
5035  0c94 ae0000        	ldw	x,#0
5036  0c97 89            	pushw	x
5037  0c98 ae0000        	ldw	x,#L101
5038  0c9b cd0000        	call	_assert_failed
5040  0c9e 5b04          	addw	sp,#4
5041  0ca0               L076:
5042                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5042                     ; 1056                         | (uint8_t)TIM1_CounterMode);
5044  0ca0 c65250        	ld	a,21072
5045  0ca3 a48f          	and	a,#143
5046  0ca5 1a01          	or	a,(OFST+1,sp)
5047  0ca7 c75250        	ld	21072,a
5048                     ; 1057 }
5051  0caa 84            	pop	a
5052  0cab 81            	ret
5111                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5111                     ; 1068 {
5112                     	switch	.text
5113  0cac               _TIM1_ForcedOC1Config:
5115  0cac 88            	push	a
5116       00000000      OFST:	set	0
5119                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5121  0cad a150          	cp	a,#80
5122  0caf 2704          	jreq	L676
5123  0cb1 a140          	cp	a,#64
5124  0cb3 2603          	jrne	L476
5125  0cb5               L676:
5126  0cb5 4f            	clr	a
5127  0cb6 2010          	jra	L007
5128  0cb8               L476:
5129  0cb8 ae042e        	ldw	x,#1070
5130  0cbb 89            	pushw	x
5131  0cbc ae0000        	ldw	x,#0
5132  0cbf 89            	pushw	x
5133  0cc0 ae0000        	ldw	x,#L101
5134  0cc3 cd0000        	call	_assert_failed
5136  0cc6 5b04          	addw	sp,#4
5137  0cc8               L007:
5138                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5138                     ; 1074                            (uint8_t)TIM1_ForcedAction);
5140  0cc8 c65258        	ld	a,21080
5141  0ccb a48f          	and	a,#143
5142  0ccd 1a01          	or	a,(OFST+1,sp)
5143  0ccf c75258        	ld	21080,a
5144                     ; 1075 }
5147  0cd2 84            	pop	a
5148  0cd3 81            	ret
5185                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5185                     ; 1086 {
5186                     	switch	.text
5187  0cd4               _TIM1_ForcedOC2Config:
5189  0cd4 88            	push	a
5190       00000000      OFST:	set	0
5193                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5195  0cd5 a150          	cp	a,#80
5196  0cd7 2704          	jreq	L607
5197  0cd9 a140          	cp	a,#64
5198  0cdb 2603          	jrne	L407
5199  0cdd               L607:
5200  0cdd 4f            	clr	a
5201  0cde 2010          	jra	L017
5202  0ce0               L407:
5203  0ce0 ae0440        	ldw	x,#1088
5204  0ce3 89            	pushw	x
5205  0ce4 ae0000        	ldw	x,#0
5206  0ce7 89            	pushw	x
5207  0ce8 ae0000        	ldw	x,#L101
5208  0ceb cd0000        	call	_assert_failed
5210  0cee 5b04          	addw	sp,#4
5211  0cf0               L017:
5212                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5212                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
5214  0cf0 c65259        	ld	a,21081
5215  0cf3 a48f          	and	a,#143
5216  0cf5 1a01          	or	a,(OFST+1,sp)
5217  0cf7 c75259        	ld	21081,a
5218                     ; 1093 }
5221  0cfa 84            	pop	a
5222  0cfb 81            	ret
5259                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5259                     ; 1105 {
5260                     	switch	.text
5261  0cfc               _TIM1_ForcedOC3Config:
5263  0cfc 88            	push	a
5264       00000000      OFST:	set	0
5267                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5269  0cfd a150          	cp	a,#80
5270  0cff 2704          	jreq	L617
5271  0d01 a140          	cp	a,#64
5272  0d03 2603          	jrne	L417
5273  0d05               L617:
5274  0d05 4f            	clr	a
5275  0d06 2010          	jra	L027
5276  0d08               L417:
5277  0d08 ae0453        	ldw	x,#1107
5278  0d0b 89            	pushw	x
5279  0d0c ae0000        	ldw	x,#0
5280  0d0f 89            	pushw	x
5281  0d10 ae0000        	ldw	x,#L101
5282  0d13 cd0000        	call	_assert_failed
5284  0d16 5b04          	addw	sp,#4
5285  0d18               L027:
5286                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5286                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
5288  0d18 c6525a        	ld	a,21082
5289  0d1b a48f          	and	a,#143
5290  0d1d 1a01          	or	a,(OFST+1,sp)
5291  0d1f c7525a        	ld	21082,a
5292                     ; 1112 }
5295  0d22 84            	pop	a
5296  0d23 81            	ret
5333                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5333                     ; 1124 {
5334                     	switch	.text
5335  0d24               _TIM1_ForcedOC4Config:
5337  0d24 88            	push	a
5338       00000000      OFST:	set	0
5341                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5343  0d25 a150          	cp	a,#80
5344  0d27 2704          	jreq	L627
5345  0d29 a140          	cp	a,#64
5346  0d2b 2603          	jrne	L427
5347  0d2d               L627:
5348  0d2d 4f            	clr	a
5349  0d2e 2010          	jra	L037
5350  0d30               L427:
5351  0d30 ae0466        	ldw	x,#1126
5352  0d33 89            	pushw	x
5353  0d34 ae0000        	ldw	x,#0
5354  0d37 89            	pushw	x
5355  0d38 ae0000        	ldw	x,#L101
5356  0d3b cd0000        	call	_assert_failed
5358  0d3e 5b04          	addw	sp,#4
5359  0d40               L037:
5360                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5360                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5362  0d40 c6525b        	ld	a,21083
5363  0d43 a48f          	and	a,#143
5364  0d45 1a01          	or	a,(OFST+1,sp)
5365  0d47 c7525b        	ld	21083,a
5366                     ; 1131 }
5369  0d4a 84            	pop	a
5370  0d4b 81            	ret
5407                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5407                     ; 1140 {
5408                     	switch	.text
5409  0d4c               _TIM1_ARRPreloadConfig:
5411  0d4c 88            	push	a
5412       00000000      OFST:	set	0
5415                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5417  0d4d 4d            	tnz	a
5418  0d4e 2704          	jreq	L637
5419  0d50 a101          	cp	a,#1
5420  0d52 2603          	jrne	L437
5421  0d54               L637:
5422  0d54 4f            	clr	a
5423  0d55 2010          	jra	L047
5424  0d57               L437:
5425  0d57 ae0476        	ldw	x,#1142
5426  0d5a 89            	pushw	x
5427  0d5b ae0000        	ldw	x,#0
5428  0d5e 89            	pushw	x
5429  0d5f ae0000        	ldw	x,#L101
5430  0d62 cd0000        	call	_assert_failed
5432  0d65 5b04          	addw	sp,#4
5433  0d67               L047:
5434                     ; 1145   if (NewState != DISABLE)
5436  0d67 0d01          	tnz	(OFST+1,sp)
5437  0d69 2706          	jreq	L7502
5438                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5440  0d6b 721e5250      	bset	21072,#7
5442  0d6f 2004          	jra	L1602
5443  0d71               L7502:
5444                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5446  0d71 721f5250      	bres	21072,#7
5447  0d75               L1602:
5448                     ; 1153 }
5451  0d75 84            	pop	a
5452  0d76 81            	ret
5488                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5488                     ; 1162 {
5489                     	switch	.text
5490  0d77               _TIM1_SelectCOM:
5492  0d77 88            	push	a
5493       00000000      OFST:	set	0
5496                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5498  0d78 4d            	tnz	a
5499  0d79 2704          	jreq	L647
5500  0d7b a101          	cp	a,#1
5501  0d7d 2603          	jrne	L447
5502  0d7f               L647:
5503  0d7f 4f            	clr	a
5504  0d80 2010          	jra	L057
5505  0d82               L447:
5506  0d82 ae048c        	ldw	x,#1164
5507  0d85 89            	pushw	x
5508  0d86 ae0000        	ldw	x,#0
5509  0d89 89            	pushw	x
5510  0d8a ae0000        	ldw	x,#L101
5511  0d8d cd0000        	call	_assert_failed
5513  0d90 5b04          	addw	sp,#4
5514  0d92               L057:
5515                     ; 1167   if (NewState != DISABLE)
5517  0d92 0d01          	tnz	(OFST+1,sp)
5518  0d94 2706          	jreq	L1012
5519                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5521  0d96 72145251      	bset	21073,#2
5523  0d9a 2004          	jra	L3012
5524  0d9c               L1012:
5525                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5527  0d9c 72155251      	bres	21073,#2
5528  0da0               L3012:
5529                     ; 1175 }
5532  0da0 84            	pop	a
5533  0da1 81            	ret
5570                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5570                     ; 1184 {
5571                     	switch	.text
5572  0da2               _TIM1_CCPreloadControl:
5574  0da2 88            	push	a
5575       00000000      OFST:	set	0
5578                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5580  0da3 4d            	tnz	a
5581  0da4 2704          	jreq	L657
5582  0da6 a101          	cp	a,#1
5583  0da8 2603          	jrne	L457
5584  0daa               L657:
5585  0daa 4f            	clr	a
5586  0dab 2010          	jra	L067
5587  0dad               L457:
5588  0dad ae04a2        	ldw	x,#1186
5589  0db0 89            	pushw	x
5590  0db1 ae0000        	ldw	x,#0
5591  0db4 89            	pushw	x
5592  0db5 ae0000        	ldw	x,#L101
5593  0db8 cd0000        	call	_assert_failed
5595  0dbb 5b04          	addw	sp,#4
5596  0dbd               L067:
5597                     ; 1189   if (NewState != DISABLE)
5599  0dbd 0d01          	tnz	(OFST+1,sp)
5600  0dbf 2706          	jreq	L3212
5601                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5603  0dc1 72105251      	bset	21073,#0
5605  0dc5 2004          	jra	L5212
5606  0dc7               L3212:
5607                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5609  0dc7 72115251      	bres	21073,#0
5610  0dcb               L5212:
5611                     ; 1197 }
5614  0dcb 84            	pop	a
5615  0dcc 81            	ret
5652                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5652                     ; 1206 {
5653                     	switch	.text
5654  0dcd               _TIM1_OC1PreloadConfig:
5656  0dcd 88            	push	a
5657       00000000      OFST:	set	0
5660                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5662  0dce 4d            	tnz	a
5663  0dcf 2704          	jreq	L667
5664  0dd1 a101          	cp	a,#1
5665  0dd3 2603          	jrne	L467
5666  0dd5               L667:
5667  0dd5 4f            	clr	a
5668  0dd6 2010          	jra	L077
5669  0dd8               L467:
5670  0dd8 ae04b8        	ldw	x,#1208
5671  0ddb 89            	pushw	x
5672  0ddc ae0000        	ldw	x,#0
5673  0ddf 89            	pushw	x
5674  0de0 ae0000        	ldw	x,#L101
5675  0de3 cd0000        	call	_assert_failed
5677  0de6 5b04          	addw	sp,#4
5678  0de8               L077:
5679                     ; 1211   if (NewState != DISABLE)
5681  0de8 0d01          	tnz	(OFST+1,sp)
5682  0dea 2706          	jreq	L5412
5683                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5685  0dec 72165258      	bset	21080,#3
5687  0df0 2004          	jra	L7412
5688  0df2               L5412:
5689                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5691  0df2 72175258      	bres	21080,#3
5692  0df6               L7412:
5693                     ; 1219 }
5696  0df6 84            	pop	a
5697  0df7 81            	ret
5734                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5734                     ; 1228 {
5735                     	switch	.text
5736  0df8               _TIM1_OC2PreloadConfig:
5738  0df8 88            	push	a
5739       00000000      OFST:	set	0
5742                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5744  0df9 4d            	tnz	a
5745  0dfa 2704          	jreq	L677
5746  0dfc a101          	cp	a,#1
5747  0dfe 2603          	jrne	L477
5748  0e00               L677:
5749  0e00 4f            	clr	a
5750  0e01 2010          	jra	L0001
5751  0e03               L477:
5752  0e03 ae04ce        	ldw	x,#1230
5753  0e06 89            	pushw	x
5754  0e07 ae0000        	ldw	x,#0
5755  0e0a 89            	pushw	x
5756  0e0b ae0000        	ldw	x,#L101
5757  0e0e cd0000        	call	_assert_failed
5759  0e11 5b04          	addw	sp,#4
5760  0e13               L0001:
5761                     ; 1233   if (NewState != DISABLE)
5763  0e13 0d01          	tnz	(OFST+1,sp)
5764  0e15 2706          	jreq	L7612
5765                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5767  0e17 72165259      	bset	21081,#3
5769  0e1b 2004          	jra	L1712
5770  0e1d               L7612:
5771                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5773  0e1d 72175259      	bres	21081,#3
5774  0e21               L1712:
5775                     ; 1241 }
5778  0e21 84            	pop	a
5779  0e22 81            	ret
5816                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5816                     ; 1250 {
5817                     	switch	.text
5818  0e23               _TIM1_OC3PreloadConfig:
5820  0e23 88            	push	a
5821       00000000      OFST:	set	0
5824                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5826  0e24 4d            	tnz	a
5827  0e25 2704          	jreq	L6001
5828  0e27 a101          	cp	a,#1
5829  0e29 2603          	jrne	L4001
5830  0e2b               L6001:
5831  0e2b 4f            	clr	a
5832  0e2c 2010          	jra	L0101
5833  0e2e               L4001:
5834  0e2e ae04e4        	ldw	x,#1252
5835  0e31 89            	pushw	x
5836  0e32 ae0000        	ldw	x,#0
5837  0e35 89            	pushw	x
5838  0e36 ae0000        	ldw	x,#L101
5839  0e39 cd0000        	call	_assert_failed
5841  0e3c 5b04          	addw	sp,#4
5842  0e3e               L0101:
5843                     ; 1255   if (NewState != DISABLE)
5845  0e3e 0d01          	tnz	(OFST+1,sp)
5846  0e40 2706          	jreq	L1122
5847                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5849  0e42 7216525a      	bset	21082,#3
5851  0e46 2004          	jra	L3122
5852  0e48               L1122:
5853                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5855  0e48 7217525a      	bres	21082,#3
5856  0e4c               L3122:
5857                     ; 1263 }
5860  0e4c 84            	pop	a
5861  0e4d 81            	ret
5898                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5898                     ; 1272 {
5899                     	switch	.text
5900  0e4e               _TIM1_OC4PreloadConfig:
5902  0e4e 88            	push	a
5903       00000000      OFST:	set	0
5906                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5908  0e4f 4d            	tnz	a
5909  0e50 2704          	jreq	L6101
5910  0e52 a101          	cp	a,#1
5911  0e54 2603          	jrne	L4101
5912  0e56               L6101:
5913  0e56 4f            	clr	a
5914  0e57 2010          	jra	L0201
5915  0e59               L4101:
5916  0e59 ae04fa        	ldw	x,#1274
5917  0e5c 89            	pushw	x
5918  0e5d ae0000        	ldw	x,#0
5919  0e60 89            	pushw	x
5920  0e61 ae0000        	ldw	x,#L101
5921  0e64 cd0000        	call	_assert_failed
5923  0e67 5b04          	addw	sp,#4
5924  0e69               L0201:
5925                     ; 1277   if (NewState != DISABLE)
5927  0e69 0d01          	tnz	(OFST+1,sp)
5928  0e6b 2706          	jreq	L3322
5929                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5931  0e6d 7216525b      	bset	21083,#3
5933  0e71 2004          	jra	L5322
5934  0e73               L3322:
5935                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5937  0e73 7217525b      	bres	21083,#3
5938  0e77               L5322:
5939                     ; 1285 }
5942  0e77 84            	pop	a
5943  0e78 81            	ret
5979                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5979                     ; 1294 {
5980                     	switch	.text
5981  0e79               _TIM1_OC1FastConfig:
5983  0e79 88            	push	a
5984       00000000      OFST:	set	0
5987                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5989  0e7a 4d            	tnz	a
5990  0e7b 2704          	jreq	L6201
5991  0e7d a101          	cp	a,#1
5992  0e7f 2603          	jrne	L4201
5993  0e81               L6201:
5994  0e81 4f            	clr	a
5995  0e82 2010          	jra	L0301
5996  0e84               L4201:
5997  0e84 ae0510        	ldw	x,#1296
5998  0e87 89            	pushw	x
5999  0e88 ae0000        	ldw	x,#0
6000  0e8b 89            	pushw	x
6001  0e8c ae0000        	ldw	x,#L101
6002  0e8f cd0000        	call	_assert_failed
6004  0e92 5b04          	addw	sp,#4
6005  0e94               L0301:
6006                     ; 1299   if (NewState != DISABLE)
6008  0e94 0d01          	tnz	(OFST+1,sp)
6009  0e96 2706          	jreq	L5522
6010                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
6012  0e98 72145258      	bset	21080,#2
6014  0e9c 2004          	jra	L7522
6015  0e9e               L5522:
6016                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6018  0e9e 72155258      	bres	21080,#2
6019  0ea2               L7522:
6020                     ; 1307 }
6023  0ea2 84            	pop	a
6024  0ea3 81            	ret
6060                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
6060                     ; 1316 {
6061                     	switch	.text
6062  0ea4               _TIM1_OC2FastConfig:
6064  0ea4 88            	push	a
6065       00000000      OFST:	set	0
6068                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6070  0ea5 4d            	tnz	a
6071  0ea6 2704          	jreq	L6301
6072  0ea8 a101          	cp	a,#1
6073  0eaa 2603          	jrne	L4301
6074  0eac               L6301:
6075  0eac 4f            	clr	a
6076  0ead 2010          	jra	L0401
6077  0eaf               L4301:
6078  0eaf ae0526        	ldw	x,#1318
6079  0eb2 89            	pushw	x
6080  0eb3 ae0000        	ldw	x,#0
6081  0eb6 89            	pushw	x
6082  0eb7 ae0000        	ldw	x,#L101
6083  0eba cd0000        	call	_assert_failed
6085  0ebd 5b04          	addw	sp,#4
6086  0ebf               L0401:
6087                     ; 1321   if (NewState != DISABLE)
6089  0ebf 0d01          	tnz	(OFST+1,sp)
6090  0ec1 2706          	jreq	L7722
6091                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6093  0ec3 72145259      	bset	21081,#2
6095  0ec7 2004          	jra	L1032
6096  0ec9               L7722:
6097                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6099  0ec9 72155259      	bres	21081,#2
6100  0ecd               L1032:
6101                     ; 1329 }
6104  0ecd 84            	pop	a
6105  0ece 81            	ret
6141                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
6141                     ; 1338 {
6142                     	switch	.text
6143  0ecf               _TIM1_OC3FastConfig:
6145  0ecf 88            	push	a
6146       00000000      OFST:	set	0
6149                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6151  0ed0 4d            	tnz	a
6152  0ed1 2704          	jreq	L6401
6153  0ed3 a101          	cp	a,#1
6154  0ed5 2603          	jrne	L4401
6155  0ed7               L6401:
6156  0ed7 4f            	clr	a
6157  0ed8 2010          	jra	L0501
6158  0eda               L4401:
6159  0eda ae053c        	ldw	x,#1340
6160  0edd 89            	pushw	x
6161  0ede ae0000        	ldw	x,#0
6162  0ee1 89            	pushw	x
6163  0ee2 ae0000        	ldw	x,#L101
6164  0ee5 cd0000        	call	_assert_failed
6166  0ee8 5b04          	addw	sp,#4
6167  0eea               L0501:
6168                     ; 1343   if (NewState != DISABLE)
6170  0eea 0d01          	tnz	(OFST+1,sp)
6171  0eec 2706          	jreq	L1232
6172                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6174  0eee 7214525a      	bset	21082,#2
6176  0ef2 2004          	jra	L3232
6177  0ef4               L1232:
6178                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6180  0ef4 7215525a      	bres	21082,#2
6181  0ef8               L3232:
6182                     ; 1351 }
6185  0ef8 84            	pop	a
6186  0ef9 81            	ret
6222                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
6222                     ; 1360 {
6223                     	switch	.text
6224  0efa               _TIM1_OC4FastConfig:
6226  0efa 88            	push	a
6227       00000000      OFST:	set	0
6230                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6232  0efb 4d            	tnz	a
6233  0efc 2704          	jreq	L6501
6234  0efe a101          	cp	a,#1
6235  0f00 2603          	jrne	L4501
6236  0f02               L6501:
6237  0f02 4f            	clr	a
6238  0f03 2010          	jra	L0601
6239  0f05               L4501:
6240  0f05 ae0552        	ldw	x,#1362
6241  0f08 89            	pushw	x
6242  0f09 ae0000        	ldw	x,#0
6243  0f0c 89            	pushw	x
6244  0f0d ae0000        	ldw	x,#L101
6245  0f10 cd0000        	call	_assert_failed
6247  0f13 5b04          	addw	sp,#4
6248  0f15               L0601:
6249                     ; 1365   if (NewState != DISABLE)
6251  0f15 0d01          	tnz	(OFST+1,sp)
6252  0f17 2706          	jreq	L3432
6253                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6255  0f19 7214525b      	bset	21083,#2
6257  0f1d 2004          	jra	L5432
6258  0f1f               L3432:
6259                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6261  0f1f 7215525b      	bres	21083,#2
6262  0f23               L5432:
6263                     ; 1373 }
6266  0f23 84            	pop	a
6267  0f24 81            	ret
6373                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6373                     ; 1390 {
6374                     	switch	.text
6375  0f25               _TIM1_GenerateEvent:
6377  0f25 88            	push	a
6378       00000000      OFST:	set	0
6381                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6383  0f26 4d            	tnz	a
6384  0f27 2703          	jreq	L4601
6385  0f29 4f            	clr	a
6386  0f2a 2010          	jra	L6601
6387  0f2c               L4601:
6388  0f2c ae0570        	ldw	x,#1392
6389  0f2f 89            	pushw	x
6390  0f30 ae0000        	ldw	x,#0
6391  0f33 89            	pushw	x
6392  0f34 ae0000        	ldw	x,#L101
6393  0f37 cd0000        	call	_assert_failed
6395  0f3a 5b04          	addw	sp,#4
6396  0f3c               L6601:
6397                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6399  0f3c 7b01          	ld	a,(OFST+1,sp)
6400  0f3e c75257        	ld	21079,a
6401                     ; 1396 }
6404  0f41 84            	pop	a
6405  0f42 81            	ret
6442                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6442                     ; 1407 {
6443                     	switch	.text
6444  0f43               _TIM1_OC1PolarityConfig:
6446  0f43 88            	push	a
6447       00000000      OFST:	set	0
6450                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6452  0f44 4d            	tnz	a
6453  0f45 2704          	jreq	L4701
6454  0f47 a122          	cp	a,#34
6455  0f49 2603          	jrne	L2701
6456  0f4b               L4701:
6457  0f4b 4f            	clr	a
6458  0f4c 2010          	jra	L6701
6459  0f4e               L2701:
6460  0f4e ae0581        	ldw	x,#1409
6461  0f51 89            	pushw	x
6462  0f52 ae0000        	ldw	x,#0
6463  0f55 89            	pushw	x
6464  0f56 ae0000        	ldw	x,#L101
6465  0f59 cd0000        	call	_assert_failed
6467  0f5c 5b04          	addw	sp,#4
6468  0f5e               L6701:
6469                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6471  0f5e 0d01          	tnz	(OFST+1,sp)
6472  0f60 2706          	jreq	L7242
6473                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6475  0f62 7212525c      	bset	21084,#1
6477  0f66 2004          	jra	L1342
6478  0f68               L7242:
6479                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6481  0f68 7213525c      	bres	21084,#1
6482  0f6c               L1342:
6483                     ; 1420 }
6486  0f6c 84            	pop	a
6487  0f6d 81            	ret
6524                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6524                     ; 1431 {
6525                     	switch	.text
6526  0f6e               _TIM1_OC1NPolarityConfig:
6528  0f6e 88            	push	a
6529       00000000      OFST:	set	0
6532                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6534  0f6f 4d            	tnz	a
6535  0f70 2704          	jreq	L4011
6536  0f72 a188          	cp	a,#136
6537  0f74 2603          	jrne	L2011
6538  0f76               L4011:
6539  0f76 4f            	clr	a
6540  0f77 2010          	jra	L6011
6541  0f79               L2011:
6542  0f79 ae0599        	ldw	x,#1433
6543  0f7c 89            	pushw	x
6544  0f7d ae0000        	ldw	x,#0
6545  0f80 89            	pushw	x
6546  0f81 ae0000        	ldw	x,#L101
6547  0f84 cd0000        	call	_assert_failed
6549  0f87 5b04          	addw	sp,#4
6550  0f89               L6011:
6551                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6553  0f89 0d01          	tnz	(OFST+1,sp)
6554  0f8b 2706          	jreq	L1542
6555                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6557  0f8d 7216525c      	bset	21084,#3
6559  0f91 2004          	jra	L3542
6560  0f93               L1542:
6561                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6563  0f93 7217525c      	bres	21084,#3
6564  0f97               L3542:
6565                     ; 1444 }
6568  0f97 84            	pop	a
6569  0f98 81            	ret
6606                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6606                     ; 1455 {
6607                     	switch	.text
6608  0f99               _TIM1_OC2PolarityConfig:
6610  0f99 88            	push	a
6611       00000000      OFST:	set	0
6614                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6616  0f9a 4d            	tnz	a
6617  0f9b 2704          	jreq	L4111
6618  0f9d a122          	cp	a,#34
6619  0f9f 2603          	jrne	L2111
6620  0fa1               L4111:
6621  0fa1 4f            	clr	a
6622  0fa2 2010          	jra	L6111
6623  0fa4               L2111:
6624  0fa4 ae05b1        	ldw	x,#1457
6625  0fa7 89            	pushw	x
6626  0fa8 ae0000        	ldw	x,#0
6627  0fab 89            	pushw	x
6628  0fac ae0000        	ldw	x,#L101
6629  0faf cd0000        	call	_assert_failed
6631  0fb2 5b04          	addw	sp,#4
6632  0fb4               L6111:
6633                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6635  0fb4 0d01          	tnz	(OFST+1,sp)
6636  0fb6 2706          	jreq	L3742
6637                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6639  0fb8 721a525c      	bset	21084,#5
6641  0fbc 2004          	jra	L5742
6642  0fbe               L3742:
6643                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6645  0fbe 721b525c      	bres	21084,#5
6646  0fc2               L5742:
6647                     ; 1468 }
6650  0fc2 84            	pop	a
6651  0fc3 81            	ret
6688                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6688                     ; 1479 {
6689                     	switch	.text
6690  0fc4               _TIM1_OC2NPolarityConfig:
6692  0fc4 88            	push	a
6693       00000000      OFST:	set	0
6696                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6698  0fc5 4d            	tnz	a
6699  0fc6 2704          	jreq	L4211
6700  0fc8 a188          	cp	a,#136
6701  0fca 2603          	jrne	L2211
6702  0fcc               L4211:
6703  0fcc 4f            	clr	a
6704  0fcd 2010          	jra	L6211
6705  0fcf               L2211:
6706  0fcf ae05c9        	ldw	x,#1481
6707  0fd2 89            	pushw	x
6708  0fd3 ae0000        	ldw	x,#0
6709  0fd6 89            	pushw	x
6710  0fd7 ae0000        	ldw	x,#L101
6711  0fda cd0000        	call	_assert_failed
6713  0fdd 5b04          	addw	sp,#4
6714  0fdf               L6211:
6715                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6717  0fdf 0d01          	tnz	(OFST+1,sp)
6718  0fe1 2706          	jreq	L5152
6719                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6721  0fe3 721e525c      	bset	21084,#7
6723  0fe7 2004          	jra	L7152
6724  0fe9               L5152:
6725                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6727  0fe9 721f525c      	bres	21084,#7
6728  0fed               L7152:
6729                     ; 1492 }
6732  0fed 84            	pop	a
6733  0fee 81            	ret
6770                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6770                     ; 1503 {
6771                     	switch	.text
6772  0fef               _TIM1_OC3PolarityConfig:
6774  0fef 88            	push	a
6775       00000000      OFST:	set	0
6778                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6780  0ff0 4d            	tnz	a
6781  0ff1 2704          	jreq	L4311
6782  0ff3 a122          	cp	a,#34
6783  0ff5 2603          	jrne	L2311
6784  0ff7               L4311:
6785  0ff7 4f            	clr	a
6786  0ff8 2010          	jra	L6311
6787  0ffa               L2311:
6788  0ffa ae05e1        	ldw	x,#1505
6789  0ffd 89            	pushw	x
6790  0ffe ae0000        	ldw	x,#0
6791  1001 89            	pushw	x
6792  1002 ae0000        	ldw	x,#L101
6793  1005 cd0000        	call	_assert_failed
6795  1008 5b04          	addw	sp,#4
6796  100a               L6311:
6797                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6799  100a 0d01          	tnz	(OFST+1,sp)
6800  100c 2706          	jreq	L7352
6801                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6803  100e 7212525d      	bset	21085,#1
6805  1012 2004          	jra	L1452
6806  1014               L7352:
6807                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6809  1014 7213525d      	bres	21085,#1
6810  1018               L1452:
6811                     ; 1516 }
6814  1018 84            	pop	a
6815  1019 81            	ret
6852                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6852                     ; 1528 {
6853                     	switch	.text
6854  101a               _TIM1_OC3NPolarityConfig:
6856  101a 88            	push	a
6857       00000000      OFST:	set	0
6860                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6862  101b 4d            	tnz	a
6863  101c 2704          	jreq	L4411
6864  101e a188          	cp	a,#136
6865  1020 2603          	jrne	L2411
6866  1022               L4411:
6867  1022 4f            	clr	a
6868  1023 2010          	jra	L6411
6869  1025               L2411:
6870  1025 ae05fa        	ldw	x,#1530
6871  1028 89            	pushw	x
6872  1029 ae0000        	ldw	x,#0
6873  102c 89            	pushw	x
6874  102d ae0000        	ldw	x,#L101
6875  1030 cd0000        	call	_assert_failed
6877  1033 5b04          	addw	sp,#4
6878  1035               L6411:
6879                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6881  1035 0d01          	tnz	(OFST+1,sp)
6882  1037 2706          	jreq	L1652
6883                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6885  1039 7216525d      	bset	21085,#3
6887  103d 2004          	jra	L3652
6888  103f               L1652:
6889                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6891  103f 7217525d      	bres	21085,#3
6892  1043               L3652:
6893                     ; 1541 }
6896  1043 84            	pop	a
6897  1044 81            	ret
6934                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6934                     ; 1552 {
6935                     	switch	.text
6936  1045               _TIM1_OC4PolarityConfig:
6938  1045 88            	push	a
6939       00000000      OFST:	set	0
6942                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6944  1046 4d            	tnz	a
6945  1047 2704          	jreq	L4511
6946  1049 a122          	cp	a,#34
6947  104b 2603          	jrne	L2511
6948  104d               L4511:
6949  104d 4f            	clr	a
6950  104e 2010          	jra	L6511
6951  1050               L2511:
6952  1050 ae0612        	ldw	x,#1554
6953  1053 89            	pushw	x
6954  1054 ae0000        	ldw	x,#0
6955  1057 89            	pushw	x
6956  1058 ae0000        	ldw	x,#L101
6957  105b cd0000        	call	_assert_failed
6959  105e 5b04          	addw	sp,#4
6960  1060               L6511:
6961                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6963  1060 0d01          	tnz	(OFST+1,sp)
6964  1062 2706          	jreq	L3062
6965                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6967  1064 721a525d      	bset	21085,#5
6969  1068 2004          	jra	L5062
6970  106a               L3062:
6971                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6973  106a 721b525d      	bres	21085,#5
6974  106e               L5062:
6975                     ; 1565 }
6978  106e 84            	pop	a
6979  106f 81            	ret
7025                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7025                     ; 1580 {
7026                     	switch	.text
7027  1070               _TIM1_CCxCmd:
7029  1070 89            	pushw	x
7030       00000000      OFST:	set	0
7033                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7035  1071 9e            	ld	a,xh
7036  1072 4d            	tnz	a
7037  1073 270f          	jreq	L4611
7038  1075 9e            	ld	a,xh
7039  1076 a101          	cp	a,#1
7040  1078 270a          	jreq	L4611
7041  107a 9e            	ld	a,xh
7042  107b a102          	cp	a,#2
7043  107d 2705          	jreq	L4611
7044  107f 9e            	ld	a,xh
7045  1080 a103          	cp	a,#3
7046  1082 2603          	jrne	L2611
7047  1084               L4611:
7048  1084 4f            	clr	a
7049  1085 2010          	jra	L6611
7050  1087               L2611:
7051  1087 ae062e        	ldw	x,#1582
7052  108a 89            	pushw	x
7053  108b ae0000        	ldw	x,#0
7054  108e 89            	pushw	x
7055  108f ae0000        	ldw	x,#L101
7056  1092 cd0000        	call	_assert_failed
7058  1095 5b04          	addw	sp,#4
7059  1097               L6611:
7060                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7062  1097 0d02          	tnz	(OFST+2,sp)
7063  1099 2706          	jreq	L2711
7064  109b 7b02          	ld	a,(OFST+2,sp)
7065  109d a101          	cp	a,#1
7066  109f 2603          	jrne	L0711
7067  10a1               L2711:
7068  10a1 4f            	clr	a
7069  10a2 2010          	jra	L4711
7070  10a4               L0711:
7071  10a4 ae062f        	ldw	x,#1583
7072  10a7 89            	pushw	x
7073  10a8 ae0000        	ldw	x,#0
7074  10ab 89            	pushw	x
7075  10ac ae0000        	ldw	x,#L101
7076  10af cd0000        	call	_assert_failed
7078  10b2 5b04          	addw	sp,#4
7079  10b4               L4711:
7080                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
7082  10b4 0d01          	tnz	(OFST+1,sp)
7083  10b6 2610          	jrne	L1362
7084                     ; 1588     if (NewState != DISABLE)
7086  10b8 0d02          	tnz	(OFST+2,sp)
7087  10ba 2706          	jreq	L3362
7088                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
7090  10bc 7210525c      	bset	21084,#0
7092  10c0 2040          	jra	L7362
7093  10c2               L3362:
7094                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7096  10c2 7211525c      	bres	21084,#0
7097  10c6 203a          	jra	L7362
7098  10c8               L1362:
7099                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
7101  10c8 7b01          	ld	a,(OFST+1,sp)
7102  10ca a101          	cp	a,#1
7103  10cc 2610          	jrne	L1462
7104                     ; 1601     if (NewState != DISABLE)
7106  10ce 0d02          	tnz	(OFST+2,sp)
7107  10d0 2706          	jreq	L3462
7108                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
7110  10d2 7218525c      	bset	21084,#4
7112  10d6 202a          	jra	L7362
7113  10d8               L3462:
7114                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7116  10d8 7219525c      	bres	21084,#4
7117  10dc 2024          	jra	L7362
7118  10de               L1462:
7119                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
7121  10de 7b01          	ld	a,(OFST+1,sp)
7122  10e0 a102          	cp	a,#2
7123  10e2 2610          	jrne	L1562
7124                     ; 1613     if (NewState != DISABLE)
7126  10e4 0d02          	tnz	(OFST+2,sp)
7127  10e6 2706          	jreq	L3562
7128                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
7130  10e8 7210525d      	bset	21085,#0
7132  10ec 2014          	jra	L7362
7133  10ee               L3562:
7134                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7136  10ee 7211525d      	bres	21085,#0
7137  10f2 200e          	jra	L7362
7138  10f4               L1562:
7139                     ; 1625     if (NewState != DISABLE)
7141  10f4 0d02          	tnz	(OFST+2,sp)
7142  10f6 2706          	jreq	L1662
7143                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
7145  10f8 7218525d      	bset	21085,#4
7147  10fc 2004          	jra	L7362
7148  10fe               L1662:
7149                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7151  10fe 7219525d      	bres	21085,#4
7152  1102               L7362:
7153                     ; 1634 }
7156  1102 85            	popw	x
7157  1103 81            	ret
7203                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7203                     ; 1648 {
7204                     	switch	.text
7205  1104               _TIM1_CCxNCmd:
7207  1104 89            	pushw	x
7208       00000000      OFST:	set	0
7211                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7213  1105 9e            	ld	a,xh
7214  1106 4d            	tnz	a
7215  1107 270a          	jreq	L2021
7216  1109 9e            	ld	a,xh
7217  110a a101          	cp	a,#1
7218  110c 2705          	jreq	L2021
7219  110e 9e            	ld	a,xh
7220  110f a102          	cp	a,#2
7221  1111 2603          	jrne	L0021
7222  1113               L2021:
7223  1113 4f            	clr	a
7224  1114 2010          	jra	L4021
7225  1116               L0021:
7226  1116 ae0672        	ldw	x,#1650
7227  1119 89            	pushw	x
7228  111a ae0000        	ldw	x,#0
7229  111d 89            	pushw	x
7230  111e ae0000        	ldw	x,#L101
7231  1121 cd0000        	call	_assert_failed
7233  1124 5b04          	addw	sp,#4
7234  1126               L4021:
7235                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7237  1126 0d02          	tnz	(OFST+2,sp)
7238  1128 2706          	jreq	L0121
7239  112a 7b02          	ld	a,(OFST+2,sp)
7240  112c a101          	cp	a,#1
7241  112e 2603          	jrne	L6021
7242  1130               L0121:
7243  1130 4f            	clr	a
7244  1131 2010          	jra	L2121
7245  1133               L6021:
7246  1133 ae0673        	ldw	x,#1651
7247  1136 89            	pushw	x
7248  1137 ae0000        	ldw	x,#0
7249  113a 89            	pushw	x
7250  113b ae0000        	ldw	x,#L101
7251  113e cd0000        	call	_assert_failed
7253  1141 5b04          	addw	sp,#4
7254  1143               L2121:
7255                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
7257  1143 0d01          	tnz	(OFST+1,sp)
7258  1145 2610          	jrne	L7072
7259                     ; 1656     if (NewState != DISABLE)
7261  1147 0d02          	tnz	(OFST+2,sp)
7262  1149 2706          	jreq	L1172
7263                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7265  114b 7214525c      	bset	21084,#2
7267  114f 202a          	jra	L5172
7268  1151               L1172:
7269                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7271  1151 7215525c      	bres	21084,#2
7272  1155 2024          	jra	L5172
7273  1157               L7072:
7274                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
7276  1157 7b01          	ld	a,(OFST+1,sp)
7277  1159 a101          	cp	a,#1
7278  115b 2610          	jrne	L7172
7279                     ; 1668     if (NewState != DISABLE)
7281  115d 0d02          	tnz	(OFST+2,sp)
7282  115f 2706          	jreq	L1272
7283                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7285  1161 721c525c      	bset	21084,#6
7287  1165 2014          	jra	L5172
7288  1167               L1272:
7289                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7291  1167 721d525c      	bres	21084,#6
7292  116b 200e          	jra	L5172
7293  116d               L7172:
7294                     ; 1680     if (NewState != DISABLE)
7296  116d 0d02          	tnz	(OFST+2,sp)
7297  116f 2706          	jreq	L7272
7298                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7300  1171 7214525d      	bset	21085,#2
7302  1175 2004          	jra	L5172
7303  1177               L7272:
7304                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7306  1177 7215525d      	bres	21085,#2
7307  117b               L5172:
7308                     ; 1689 }
7311  117b 85            	popw	x
7312  117c 81            	ret
7358                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7358                     ; 1713 {
7359                     	switch	.text
7360  117d               _TIM1_SelectOCxM:
7362  117d 89            	pushw	x
7363       00000000      OFST:	set	0
7366                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7368  117e 9e            	ld	a,xh
7369  117f 4d            	tnz	a
7370  1180 270f          	jreq	L0221
7371  1182 9e            	ld	a,xh
7372  1183 a101          	cp	a,#1
7373  1185 270a          	jreq	L0221
7374  1187 9e            	ld	a,xh
7375  1188 a102          	cp	a,#2
7376  118a 2705          	jreq	L0221
7377  118c 9e            	ld	a,xh
7378  118d a103          	cp	a,#3
7379  118f 2603          	jrne	L6121
7380  1191               L0221:
7381  1191 4f            	clr	a
7382  1192 2010          	jra	L2221
7383  1194               L6121:
7384  1194 ae06b3        	ldw	x,#1715
7385  1197 89            	pushw	x
7386  1198 ae0000        	ldw	x,#0
7387  119b 89            	pushw	x
7388  119c ae0000        	ldw	x,#L101
7389  119f cd0000        	call	_assert_failed
7391  11a2 5b04          	addw	sp,#4
7392  11a4               L2221:
7393                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7395  11a4 0d02          	tnz	(OFST+2,sp)
7396  11a6 272a          	jreq	L6221
7397  11a8 7b02          	ld	a,(OFST+2,sp)
7398  11aa a110          	cp	a,#16
7399  11ac 2724          	jreq	L6221
7400  11ae 7b02          	ld	a,(OFST+2,sp)
7401  11b0 a120          	cp	a,#32
7402  11b2 271e          	jreq	L6221
7403  11b4 7b02          	ld	a,(OFST+2,sp)
7404  11b6 a130          	cp	a,#48
7405  11b8 2718          	jreq	L6221
7406  11ba 7b02          	ld	a,(OFST+2,sp)
7407  11bc a160          	cp	a,#96
7408  11be 2712          	jreq	L6221
7409  11c0 7b02          	ld	a,(OFST+2,sp)
7410  11c2 a170          	cp	a,#112
7411  11c4 270c          	jreq	L6221
7412  11c6 7b02          	ld	a,(OFST+2,sp)
7413  11c8 a150          	cp	a,#80
7414  11ca 2706          	jreq	L6221
7415  11cc 7b02          	ld	a,(OFST+2,sp)
7416  11ce a140          	cp	a,#64
7417  11d0 2603          	jrne	L4221
7418  11d2               L6221:
7419  11d2 4f            	clr	a
7420  11d3 2010          	jra	L0321
7421  11d5               L4221:
7422  11d5 ae06b4        	ldw	x,#1716
7423  11d8 89            	pushw	x
7424  11d9 ae0000        	ldw	x,#0
7425  11dc 89            	pushw	x
7426  11dd ae0000        	ldw	x,#L101
7427  11e0 cd0000        	call	_assert_failed
7429  11e3 5b04          	addw	sp,#4
7430  11e5               L0321:
7431                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
7433  11e5 0d01          	tnz	(OFST+1,sp)
7434  11e7 2610          	jrne	L5572
7435                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7437  11e9 7211525c      	bres	21084,#0
7438                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7438                     ; 1725                             | (uint8_t)TIM1_OCMode);
7440  11ed c65258        	ld	a,21080
7441  11f0 a48f          	and	a,#143
7442  11f2 1a02          	or	a,(OFST+2,sp)
7443  11f4 c75258        	ld	21080,a
7445  11f7 203a          	jra	L7572
7446  11f9               L5572:
7447                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7449  11f9 7b01          	ld	a,(OFST+1,sp)
7450  11fb a101          	cp	a,#1
7451  11fd 2610          	jrne	L1672
7452                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7454  11ff 7219525c      	bres	21084,#4
7455                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7455                     ; 1734                             | (uint8_t)TIM1_OCMode);
7457  1203 c65259        	ld	a,21081
7458  1206 a48f          	and	a,#143
7459  1208 1a02          	or	a,(OFST+2,sp)
7460  120a c75259        	ld	21081,a
7462  120d 2024          	jra	L7572
7463  120f               L1672:
7464                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7466  120f 7b01          	ld	a,(OFST+1,sp)
7467  1211 a102          	cp	a,#2
7468  1213 2610          	jrne	L5672
7469                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7471  1215 7211525d      	bres	21085,#0
7472                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7472                     ; 1743                             | (uint8_t)TIM1_OCMode);
7474  1219 c6525a        	ld	a,21082
7475  121c a48f          	and	a,#143
7476  121e 1a02          	or	a,(OFST+2,sp)
7477  1220 c7525a        	ld	21082,a
7479  1223 200e          	jra	L7572
7480  1225               L5672:
7481                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7483  1225 7219525d      	bres	21085,#4
7484                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7484                     ; 1752                             | (uint8_t)TIM1_OCMode);
7486  1229 c6525b        	ld	a,21083
7487  122c a48f          	and	a,#143
7488  122e 1a02          	or	a,(OFST+2,sp)
7489  1230 c7525b        	ld	21083,a
7490  1233               L7572:
7491                     ; 1754 }
7494  1233 85            	popw	x
7495  1234 81            	ret
7529                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7529                     ; 1763 {
7530                     	switch	.text
7531  1235               _TIM1_SetCounter:
7535                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7537  1235 9e            	ld	a,xh
7538  1236 c7525e        	ld	21086,a
7539                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7541  1239 9f            	ld	a,xl
7542  123a c7525f        	ld	21087,a
7543                     ; 1767 }
7546  123d 81            	ret
7580                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7580                     ; 1776 {
7581                     	switch	.text
7582  123e               _TIM1_SetAutoreload:
7586                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7588  123e 9e            	ld	a,xh
7589  123f c75262        	ld	21090,a
7590                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7592  1242 9f            	ld	a,xl
7593  1243 c75263        	ld	21091,a
7594                     ; 1780  }
7597  1246 81            	ret
7631                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7631                     ; 1789 {
7632                     	switch	.text
7633  1247               _TIM1_SetCompare1:
7637                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7639  1247 9e            	ld	a,xh
7640  1248 c75265        	ld	21093,a
7641                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7643  124b 9f            	ld	a,xl
7644  124c c75266        	ld	21094,a
7645                     ; 1793 }
7648  124f 81            	ret
7682                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7682                     ; 1802 {
7683                     	switch	.text
7684  1250               _TIM1_SetCompare2:
7688                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7690  1250 9e            	ld	a,xh
7691  1251 c75267        	ld	21095,a
7692                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7694  1254 9f            	ld	a,xl
7695  1255 c75268        	ld	21096,a
7696                     ; 1806 }
7699  1258 81            	ret
7733                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7733                     ; 1815 {
7734                     	switch	.text
7735  1259               _TIM1_SetCompare3:
7739                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7741  1259 9e            	ld	a,xh
7742  125a c75269        	ld	21097,a
7743                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7745  125d 9f            	ld	a,xl
7746  125e c7526a        	ld	21098,a
7747                     ; 1819 }
7750  1261 81            	ret
7784                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7784                     ; 1828 {
7785                     	switch	.text
7786  1262               _TIM1_SetCompare4:
7790                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7792  1262 9e            	ld	a,xh
7793  1263 c7526b        	ld	21099,a
7794                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7796  1266 9f            	ld	a,xl
7797  1267 c7526c        	ld	21100,a
7798                     ; 1832 }
7801  126a 81            	ret
7838                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7838                     ; 1845 {
7839                     	switch	.text
7840  126b               _TIM1_SetIC1Prescaler:
7842  126b 88            	push	a
7843       00000000      OFST:	set	0
7846                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7848  126c 4d            	tnz	a
7849  126d 270c          	jreq	L2521
7850  126f a104          	cp	a,#4
7851  1271 2708          	jreq	L2521
7852  1273 a108          	cp	a,#8
7853  1275 2704          	jreq	L2521
7854  1277 a10c          	cp	a,#12
7855  1279 2603          	jrne	L0521
7856  127b               L2521:
7857  127b 4f            	clr	a
7858  127c 2010          	jra	L4521
7859  127e               L0521:
7860  127e ae0737        	ldw	x,#1847
7861  1281 89            	pushw	x
7862  1282 ae0000        	ldw	x,#0
7863  1285 89            	pushw	x
7864  1286 ae0000        	ldw	x,#L101
7865  1289 cd0000        	call	_assert_failed
7867  128c 5b04          	addw	sp,#4
7868  128e               L4521:
7869                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7869                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7871  128e c65258        	ld	a,21080
7872  1291 a4f3          	and	a,#243
7873  1293 1a01          	or	a,(OFST+1,sp)
7874  1295 c75258        	ld	21080,a
7875                     ; 1852 }
7878  1298 84            	pop	a
7879  1299 81            	ret
7916                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7916                     ; 1865 {
7917                     	switch	.text
7918  129a               _TIM1_SetIC2Prescaler:
7920  129a 88            	push	a
7921       00000000      OFST:	set	0
7924                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7926  129b 4d            	tnz	a
7927  129c 270c          	jreq	L2621
7928  129e a104          	cp	a,#4
7929  12a0 2708          	jreq	L2621
7930  12a2 a108          	cp	a,#8
7931  12a4 2704          	jreq	L2621
7932  12a6 a10c          	cp	a,#12
7933  12a8 2603          	jrne	L0621
7934  12aa               L2621:
7935  12aa 4f            	clr	a
7936  12ab 2010          	jra	L4621
7937  12ad               L0621:
7938  12ad ae074c        	ldw	x,#1868
7939  12b0 89            	pushw	x
7940  12b1 ae0000        	ldw	x,#0
7941  12b4 89            	pushw	x
7942  12b5 ae0000        	ldw	x,#L101
7943  12b8 cd0000        	call	_assert_failed
7945  12bb 5b04          	addw	sp,#4
7946  12bd               L4621:
7947                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7947                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7949  12bd c65259        	ld	a,21081
7950  12c0 a4f3          	and	a,#243
7951  12c2 1a01          	or	a,(OFST+1,sp)
7952  12c4 c75259        	ld	21081,a
7953                     ; 1873 }
7956  12c7 84            	pop	a
7957  12c8 81            	ret
7994                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7994                     ; 1886 {
7995                     	switch	.text
7996  12c9               _TIM1_SetIC3Prescaler:
7998  12c9 88            	push	a
7999       00000000      OFST:	set	0
8002                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
8004  12ca 4d            	tnz	a
8005  12cb 270c          	jreq	L2721
8006  12cd a104          	cp	a,#4
8007  12cf 2708          	jreq	L2721
8008  12d1 a108          	cp	a,#8
8009  12d3 2704          	jreq	L2721
8010  12d5 a10c          	cp	a,#12
8011  12d7 2603          	jrne	L0721
8012  12d9               L2721:
8013  12d9 4f            	clr	a
8014  12da 2010          	jra	L4721
8015  12dc               L0721:
8016  12dc ae0761        	ldw	x,#1889
8017  12df 89            	pushw	x
8018  12e0 ae0000        	ldw	x,#0
8019  12e3 89            	pushw	x
8020  12e4 ae0000        	ldw	x,#L101
8021  12e7 cd0000        	call	_assert_failed
8023  12ea 5b04          	addw	sp,#4
8024  12ec               L4721:
8025                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
8025                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
8027  12ec c6525a        	ld	a,21082
8028  12ef a4f3          	and	a,#243
8029  12f1 1a01          	or	a,(OFST+1,sp)
8030  12f3 c7525a        	ld	21082,a
8031                     ; 1894 }
8034  12f6 84            	pop	a
8035  12f7 81            	ret
8072                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8072                     ; 1907 {
8073                     	switch	.text
8074  12f8               _TIM1_SetIC4Prescaler:
8076  12f8 88            	push	a
8077       00000000      OFST:	set	0
8080                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8082  12f9 4d            	tnz	a
8083  12fa 270c          	jreq	L2031
8084  12fc a104          	cp	a,#4
8085  12fe 2708          	jreq	L2031
8086  1300 a108          	cp	a,#8
8087  1302 2704          	jreq	L2031
8088  1304 a10c          	cp	a,#12
8089  1306 2603          	jrne	L0031
8090  1308               L2031:
8091  1308 4f            	clr	a
8092  1309 2010          	jra	L4031
8093  130b               L0031:
8094  130b ae0776        	ldw	x,#1910
8095  130e 89            	pushw	x
8096  130f ae0000        	ldw	x,#0
8097  1312 89            	pushw	x
8098  1313 ae0000        	ldw	x,#L101
8099  1316 cd0000        	call	_assert_failed
8101  1319 5b04          	addw	sp,#4
8102  131b               L4031:
8103                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8103                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
8105  131b c6525b        	ld	a,21083
8106  131e a4f3          	and	a,#243
8107  1320 1a01          	or	a,(OFST+1,sp)
8108  1322 c7525b        	ld	21083,a
8109                     ; 1915 }
8112  1325 84            	pop	a
8113  1326 81            	ret
8165                     ; 1922 uint16_t TIM1_GetCapture1(void)
8165                     ; 1923 {
8166                     	switch	.text
8167  1327               _TIM1_GetCapture1:
8169  1327 5204          	subw	sp,#4
8170       00000004      OFST:	set	4
8173                     ; 1926   uint16_t tmpccr1 = 0;
8175                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
8179                     ; 1929   tmpccr1h = TIM1->CCR1H;
8181  1329 c65265        	ld	a,21093
8182  132c 6b02          	ld	(OFST-2,sp),a
8183                     ; 1930   tmpccr1l = TIM1->CCR1L;
8185  132e c65266        	ld	a,21094
8186  1331 6b01          	ld	(OFST-3,sp),a
8187                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
8189  1333 7b01          	ld	a,(OFST-3,sp)
8190  1335 5f            	clrw	x
8191  1336 97            	ld	xl,a
8192  1337 1f03          	ldw	(OFST-1,sp),x
8193                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8195  1339 7b02          	ld	a,(OFST-2,sp)
8196  133b 5f            	clrw	x
8197  133c 97            	ld	xl,a
8198  133d 4f            	clr	a
8199  133e 02            	rlwa	x,a
8200  133f 01            	rrwa	x,a
8201  1340 1a04          	or	a,(OFST+0,sp)
8202  1342 01            	rrwa	x,a
8203  1343 1a03          	or	a,(OFST-1,sp)
8204  1345 01            	rrwa	x,a
8205  1346 1f03          	ldw	(OFST-1,sp),x
8206                     ; 1935   return (uint16_t)tmpccr1;
8208  1348 1e03          	ldw	x,(OFST-1,sp)
8211  134a 5b04          	addw	sp,#4
8212  134c 81            	ret
8264                     ; 1943 uint16_t TIM1_GetCapture2(void)
8264                     ; 1944 {
8265                     	switch	.text
8266  134d               _TIM1_GetCapture2:
8268  134d 5204          	subw	sp,#4
8269       00000004      OFST:	set	4
8272                     ; 1947   uint16_t tmpccr2 = 0;
8274                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
8278                     ; 1950   tmpccr2h = TIM1->CCR2H;
8280  134f c65267        	ld	a,21095
8281  1352 6b02          	ld	(OFST-2,sp),a
8282                     ; 1951   tmpccr2l = TIM1->CCR2L;
8284  1354 c65268        	ld	a,21096
8285  1357 6b01          	ld	(OFST-3,sp),a
8286                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
8288  1359 7b01          	ld	a,(OFST-3,sp)
8289  135b 5f            	clrw	x
8290  135c 97            	ld	xl,a
8291  135d 1f03          	ldw	(OFST-1,sp),x
8292                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8294  135f 7b02          	ld	a,(OFST-2,sp)
8295  1361 5f            	clrw	x
8296  1362 97            	ld	xl,a
8297  1363 4f            	clr	a
8298  1364 02            	rlwa	x,a
8299  1365 01            	rrwa	x,a
8300  1366 1a04          	or	a,(OFST+0,sp)
8301  1368 01            	rrwa	x,a
8302  1369 1a03          	or	a,(OFST-1,sp)
8303  136b 01            	rrwa	x,a
8304  136c 1f03          	ldw	(OFST-1,sp),x
8305                     ; 1956   return (uint16_t)tmpccr2;
8307  136e 1e03          	ldw	x,(OFST-1,sp)
8310  1370 5b04          	addw	sp,#4
8311  1372 81            	ret
8363                     ; 1964 uint16_t TIM1_GetCapture3(void)
8363                     ; 1965 {
8364                     	switch	.text
8365  1373               _TIM1_GetCapture3:
8367  1373 5204          	subw	sp,#4
8368       00000004      OFST:	set	4
8371                     ; 1967   uint16_t tmpccr3 = 0;
8373                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
8377                     ; 1970   tmpccr3h = TIM1->CCR3H;
8379  1375 c65269        	ld	a,21097
8380  1378 6b02          	ld	(OFST-2,sp),a
8381                     ; 1971   tmpccr3l = TIM1->CCR3L;
8383  137a c6526a        	ld	a,21098
8384  137d 6b01          	ld	(OFST-3,sp),a
8385                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
8387  137f 7b01          	ld	a,(OFST-3,sp)
8388  1381 5f            	clrw	x
8389  1382 97            	ld	xl,a
8390  1383 1f03          	ldw	(OFST-1,sp),x
8391                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8393  1385 7b02          	ld	a,(OFST-2,sp)
8394  1387 5f            	clrw	x
8395  1388 97            	ld	xl,a
8396  1389 4f            	clr	a
8397  138a 02            	rlwa	x,a
8398  138b 01            	rrwa	x,a
8399  138c 1a04          	or	a,(OFST+0,sp)
8400  138e 01            	rrwa	x,a
8401  138f 1a03          	or	a,(OFST-1,sp)
8402  1391 01            	rrwa	x,a
8403  1392 1f03          	ldw	(OFST-1,sp),x
8404                     ; 1976   return (uint16_t)tmpccr3;
8406  1394 1e03          	ldw	x,(OFST-1,sp)
8409  1396 5b04          	addw	sp,#4
8410  1398 81            	ret
8462                     ; 1984 uint16_t TIM1_GetCapture4(void)
8462                     ; 1985 {
8463                     	switch	.text
8464  1399               _TIM1_GetCapture4:
8466  1399 5204          	subw	sp,#4
8467       00000004      OFST:	set	4
8470                     ; 1987   uint16_t tmpccr4 = 0;
8472                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
8476                     ; 1990   tmpccr4h = TIM1->CCR4H;
8478  139b c6526b        	ld	a,21099
8479  139e 6b02          	ld	(OFST-2,sp),a
8480                     ; 1991   tmpccr4l = TIM1->CCR4L;
8482  13a0 c6526c        	ld	a,21100
8483  13a3 6b01          	ld	(OFST-3,sp),a
8484                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
8486  13a5 7b01          	ld	a,(OFST-3,sp)
8487  13a7 5f            	clrw	x
8488  13a8 97            	ld	xl,a
8489  13a9 1f03          	ldw	(OFST-1,sp),x
8490                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8492  13ab 7b02          	ld	a,(OFST-2,sp)
8493  13ad 5f            	clrw	x
8494  13ae 97            	ld	xl,a
8495  13af 4f            	clr	a
8496  13b0 02            	rlwa	x,a
8497  13b1 01            	rrwa	x,a
8498  13b2 1a04          	or	a,(OFST+0,sp)
8499  13b4 01            	rrwa	x,a
8500  13b5 1a03          	or	a,(OFST-1,sp)
8501  13b7 01            	rrwa	x,a
8502  13b8 1f03          	ldw	(OFST-1,sp),x
8503                     ; 1996   return (uint16_t)tmpccr4;
8505  13ba 1e03          	ldw	x,(OFST-1,sp)
8508  13bc 5b04          	addw	sp,#4
8509  13be 81            	ret
8543                     ; 2004 uint16_t TIM1_GetCounter(void)
8543                     ; 2005 {
8544                     	switch	.text
8545  13bf               _TIM1_GetCounter:
8547  13bf 89            	pushw	x
8548       00000002      OFST:	set	2
8551                     ; 2006   uint16_t tmpcntr = 0;
8553                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8555  13c0 c6525e        	ld	a,21086
8556  13c3 5f            	clrw	x
8557  13c4 97            	ld	xl,a
8558  13c5 4f            	clr	a
8559  13c6 02            	rlwa	x,a
8560  13c7 1f01          	ldw	(OFST-1,sp),x
8561                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8563  13c9 c6525f        	ld	a,21087
8564  13cc 5f            	clrw	x
8565  13cd 97            	ld	xl,a
8566  13ce 01            	rrwa	x,a
8567  13cf 1a02          	or	a,(OFST+0,sp)
8568  13d1 01            	rrwa	x,a
8569  13d2 1a01          	or	a,(OFST-1,sp)
8570  13d4 01            	rrwa	x,a
8573  13d5 5b02          	addw	sp,#2
8574  13d7 81            	ret
8608                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8608                     ; 2020 {
8609                     	switch	.text
8610  13d8               _TIM1_GetPrescaler:
8612  13d8 89            	pushw	x
8613       00000002      OFST:	set	2
8616                     ; 2021   uint16_t temp = 0;
8618                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8620  13d9 c65260        	ld	a,21088
8621  13dc 5f            	clrw	x
8622  13dd 97            	ld	xl,a
8623  13de 4f            	clr	a
8624  13df 02            	rlwa	x,a
8625  13e0 1f01          	ldw	(OFST-1,sp),x
8626                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8628  13e2 c65261        	ld	a,21089
8629  13e5 5f            	clrw	x
8630  13e6 97            	ld	xl,a
8631  13e7 01            	rrwa	x,a
8632  13e8 1a02          	or	a,(OFST+0,sp)
8633  13ea 01            	rrwa	x,a
8634  13eb 1a01          	or	a,(OFST-1,sp)
8635  13ed 01            	rrwa	x,a
8638  13ee 5b02          	addw	sp,#2
8639  13f0 81            	ret
8814                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8814                     ; 2048 {
8815                     	switch	.text
8816  13f1               _TIM1_GetFlagStatus:
8818  13f1 89            	pushw	x
8819  13f2 89            	pushw	x
8820       00000002      OFST:	set	2
8823                     ; 2049   FlagStatus bitstatus = RESET;
8825                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8829                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8831  13f3 a30001        	cpw	x,#1
8832  13f6 2737          	jreq	L6231
8833  13f8 a30002        	cpw	x,#2
8834  13fb 2732          	jreq	L6231
8835  13fd a30004        	cpw	x,#4
8836  1400 272d          	jreq	L6231
8837  1402 a30008        	cpw	x,#8
8838  1405 2728          	jreq	L6231
8839  1407 a30010        	cpw	x,#16
8840  140a 2723          	jreq	L6231
8841  140c a30020        	cpw	x,#32
8842  140f 271e          	jreq	L6231
8843  1411 a30040        	cpw	x,#64
8844  1414 2719          	jreq	L6231
8845  1416 a30080        	cpw	x,#128
8846  1419 2714          	jreq	L6231
8847  141b a30200        	cpw	x,#512
8848  141e 270f          	jreq	L6231
8849  1420 a30400        	cpw	x,#1024
8850  1423 270a          	jreq	L6231
8851  1425 a30800        	cpw	x,#2048
8852  1428 2705          	jreq	L6231
8853  142a a31000        	cpw	x,#4096
8854  142d 2603          	jrne	L4231
8855  142f               L6231:
8856  142f 4f            	clr	a
8857  1430 2010          	jra	L0331
8858  1432               L4231:
8859  1432 ae0805        	ldw	x,#2053
8860  1435 89            	pushw	x
8861  1436 ae0000        	ldw	x,#0
8862  1439 89            	pushw	x
8863  143a ae0000        	ldw	x,#L101
8864  143d cd0000        	call	_assert_failed
8866  1440 5b04          	addw	sp,#4
8867  1442               L0331:
8868                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8870  1442 c65255        	ld	a,21077
8871  1445 1404          	and	a,(OFST+2,sp)
8872  1447 6b01          	ld	(OFST-1,sp),a
8873                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8875  1449 7b03          	ld	a,(OFST+1,sp)
8876  144b 6b02          	ld	(OFST+0,sp),a
8877                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8879  144d c65256        	ld	a,21078
8880  1450 1402          	and	a,(OFST+0,sp)
8881  1452 1a01          	or	a,(OFST-1,sp)
8882  1454 2706          	jreq	L7643
8883                     ; 2060     bitstatus = SET;
8885  1456 a601          	ld	a,#1
8886  1458 6b02          	ld	(OFST+0,sp),a
8888  145a 2002          	jra	L1743
8889  145c               L7643:
8890                     ; 2064     bitstatus = RESET;
8892  145c 0f02          	clr	(OFST+0,sp)
8893  145e               L1743:
8894                     ; 2066   return (FlagStatus)(bitstatus);
8896  145e 7b02          	ld	a,(OFST+0,sp)
8899  1460 5b04          	addw	sp,#4
8900  1462 81            	ret
8936                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8936                     ; 2088 {
8937                     	switch	.text
8938  1463               _TIM1_ClearFlag:
8940  1463 89            	pushw	x
8941       00000000      OFST:	set	0
8944                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8946  1464 01            	rrwa	x,a
8947  1465 9f            	ld	a,xl
8948  1466 a4e1          	and	a,#225
8949  1468 97            	ld	xl,a
8950  1469 4f            	clr	a
8951  146a 02            	rlwa	x,a
8952  146b 5d            	tnzw	x
8953  146c 2607          	jrne	L4331
8954  146e 1e01          	ldw	x,(OFST+1,sp)
8955  1470 2703          	jreq	L4331
8956  1472 4f            	clr	a
8957  1473 2010          	jra	L6331
8958  1475               L4331:
8959  1475 ae082a        	ldw	x,#2090
8960  1478 89            	pushw	x
8961  1479 ae0000        	ldw	x,#0
8962  147c 89            	pushw	x
8963  147d ae0000        	ldw	x,#L101
8964  1480 cd0000        	call	_assert_failed
8966  1483 5b04          	addw	sp,#4
8967  1485               L6331:
8968                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8970  1485 7b02          	ld	a,(OFST+2,sp)
8971  1487 43            	cpl	a
8972  1488 c75255        	ld	21077,a
8973                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8973                     ; 2095                         (uint8_t)0x1E);
8975  148b 7b01          	ld	a,(OFST+1,sp)
8976  148d 43            	cpl	a
8977  148e a41e          	and	a,#30
8978  1490 c75256        	ld	21078,a
8979                     ; 2096 }
8982  1493 85            	popw	x
8983  1494 81            	ret
9048                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9048                     ; 2113 {
9049                     	switch	.text
9050  1495               _TIM1_GetITStatus:
9052  1495 88            	push	a
9053  1496 89            	pushw	x
9054       00000002      OFST:	set	2
9057                     ; 2114   ITStatus bitstatus = RESET;
9059                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9063                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9065  1497 a101          	cp	a,#1
9066  1499 271c          	jreq	L4431
9067  149b a102          	cp	a,#2
9068  149d 2718          	jreq	L4431
9069  149f a104          	cp	a,#4
9070  14a1 2714          	jreq	L4431
9071  14a3 a108          	cp	a,#8
9072  14a5 2710          	jreq	L4431
9073  14a7 a110          	cp	a,#16
9074  14a9 270c          	jreq	L4431
9075  14ab a120          	cp	a,#32
9076  14ad 2708          	jreq	L4431
9077  14af a140          	cp	a,#64
9078  14b1 2704          	jreq	L4431
9079  14b3 a180          	cp	a,#128
9080  14b5 2603          	jrne	L2431
9081  14b7               L4431:
9082  14b7 4f            	clr	a
9083  14b8 2010          	jra	L6431
9084  14ba               L2431:
9085  14ba ae0846        	ldw	x,#2118
9086  14bd 89            	pushw	x
9087  14be ae0000        	ldw	x,#0
9088  14c1 89            	pushw	x
9089  14c2 ae0000        	ldw	x,#L101
9090  14c5 cd0000        	call	_assert_failed
9092  14c8 5b04          	addw	sp,#4
9093  14ca               L6431:
9094                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9096  14ca c65255        	ld	a,21077
9097  14cd 1403          	and	a,(OFST+1,sp)
9098  14cf 6b01          	ld	(OFST-1,sp),a
9099                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9101  14d1 c65254        	ld	a,21076
9102  14d4 1403          	and	a,(OFST+1,sp)
9103  14d6 6b02          	ld	(OFST+0,sp),a
9104                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9106  14d8 0d01          	tnz	(OFST-1,sp)
9107  14da 270a          	jreq	L3453
9109  14dc 0d02          	tnz	(OFST+0,sp)
9110  14de 2706          	jreq	L3453
9111                     ; 2126     bitstatus = SET;
9113  14e0 a601          	ld	a,#1
9114  14e2 6b02          	ld	(OFST+0,sp),a
9116  14e4 2002          	jra	L5453
9117  14e6               L3453:
9118                     ; 2130     bitstatus = RESET;
9120  14e6 0f02          	clr	(OFST+0,sp)
9121  14e8               L5453:
9122                     ; 2132   return (ITStatus)(bitstatus);
9124  14e8 7b02          	ld	a,(OFST+0,sp)
9127  14ea 5b03          	addw	sp,#3
9128  14ec 81            	ret
9165                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9165                     ; 2150 {
9166                     	switch	.text
9167  14ed               _TIM1_ClearITPendingBit:
9169  14ed 88            	push	a
9170       00000000      OFST:	set	0
9173                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
9175  14ee 4d            	tnz	a
9176  14ef 2703          	jreq	L2531
9177  14f1 4f            	clr	a
9178  14f2 2010          	jra	L4531
9179  14f4               L2531:
9180  14f4 ae0868        	ldw	x,#2152
9181  14f7 89            	pushw	x
9182  14f8 ae0000        	ldw	x,#0
9183  14fb 89            	pushw	x
9184  14fc ae0000        	ldw	x,#L101
9185  14ff cd0000        	call	_assert_failed
9187  1502 5b04          	addw	sp,#4
9188  1504               L4531:
9189                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9191  1504 7b01          	ld	a,(OFST+1,sp)
9192  1506 43            	cpl	a
9193  1507 c75255        	ld	21077,a
9194                     ; 2156 }
9197  150a 84            	pop	a
9198  150b 81            	ret
9250                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
9250                     ; 2175                        uint8_t TIM1_ICSelection,
9250                     ; 2176                        uint8_t TIM1_ICFilter)
9250                     ; 2177 {
9251                     	switch	.text
9252  150c               L3_TI1_Config:
9254  150c 89            	pushw	x
9255  150d 88            	push	a
9256       00000001      OFST:	set	1
9259                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9261  150e 7211525c      	bres	21084,#0
9262                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9262                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9264  1512 7b06          	ld	a,(OFST+5,sp)
9265  1514 97            	ld	xl,a
9266  1515 a610          	ld	a,#16
9267  1517 42            	mul	x,a
9268  1518 9f            	ld	a,xl
9269  1519 1a03          	or	a,(OFST+2,sp)
9270  151b 6b01          	ld	(OFST+0,sp),a
9271  151d c65258        	ld	a,21080
9272  1520 a40c          	and	a,#12
9273  1522 1a01          	or	a,(OFST+0,sp)
9274  1524 c75258        	ld	21080,a
9275                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9277  1527 0d02          	tnz	(OFST+1,sp)
9278  1529 2706          	jreq	L3163
9279                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
9281  152b 7212525c      	bset	21084,#1
9283  152f 2004          	jra	L5163
9284  1531               L3163:
9285                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9287  1531 7213525c      	bres	21084,#1
9288  1535               L5163:
9289                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9291  1535 7210525c      	bset	21084,#0
9292                     ; 2197 }
9295  1539 5b03          	addw	sp,#3
9296  153b 81            	ret
9348                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
9348                     ; 2216                        uint8_t TIM1_ICSelection,
9348                     ; 2217                        uint8_t TIM1_ICFilter)
9348                     ; 2218 {
9349                     	switch	.text
9350  153c               L5_TI2_Config:
9352  153c 89            	pushw	x
9353  153d 88            	push	a
9354       00000001      OFST:	set	1
9357                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9359  153e 7219525c      	bres	21084,#4
9360                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9360                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9362  1542 7b06          	ld	a,(OFST+5,sp)
9363  1544 97            	ld	xl,a
9364  1545 a610          	ld	a,#16
9365  1547 42            	mul	x,a
9366  1548 9f            	ld	a,xl
9367  1549 1a03          	or	a,(OFST+2,sp)
9368  154b 6b01          	ld	(OFST+0,sp),a
9369  154d c65259        	ld	a,21081
9370  1550 a40c          	and	a,#12
9371  1552 1a01          	or	a,(OFST+0,sp)
9372  1554 c75259        	ld	21081,a
9373                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9375  1557 0d02          	tnz	(OFST+1,sp)
9376  1559 2706          	jreq	L5463
9377                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
9379  155b 721a525c      	bset	21084,#5
9381  155f 2004          	jra	L7463
9382  1561               L5463:
9383                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9385  1561 721b525c      	bres	21084,#5
9386  1565               L7463:
9387                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9389  1565 7218525c      	bset	21084,#4
9390                     ; 2236 }
9393  1569 5b03          	addw	sp,#3
9394  156b 81            	ret
9446                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
9446                     ; 2255                        uint8_t TIM1_ICSelection,
9446                     ; 2256                        uint8_t TIM1_ICFilter)
9446                     ; 2257 {
9447                     	switch	.text
9448  156c               L7_TI3_Config:
9450  156c 89            	pushw	x
9451  156d 88            	push	a
9452       00000001      OFST:	set	1
9455                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9457  156e 7211525d      	bres	21085,#0
9458                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9458                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9460  1572 7b06          	ld	a,(OFST+5,sp)
9461  1574 97            	ld	xl,a
9462  1575 a610          	ld	a,#16
9463  1577 42            	mul	x,a
9464  1578 9f            	ld	a,xl
9465  1579 1a03          	or	a,(OFST+2,sp)
9466  157b 6b01          	ld	(OFST+0,sp),a
9467  157d c6525a        	ld	a,21082
9468  1580 a40c          	and	a,#12
9469  1582 1a01          	or	a,(OFST+0,sp)
9470  1584 c7525a        	ld	21082,a
9471                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9473  1587 0d02          	tnz	(OFST+1,sp)
9474  1589 2706          	jreq	L7763
9475                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
9477  158b 7212525d      	bset	21085,#1
9479  158f 2004          	jra	L1073
9480  1591               L7763:
9481                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9483  1591 7213525d      	bres	21085,#1
9484  1595               L1073:
9485                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9487  1595 7210525d      	bset	21085,#0
9488                     ; 2276 }
9491  1599 5b03          	addw	sp,#3
9492  159b 81            	ret
9544                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
9544                     ; 2295                        uint8_t TIM1_ICSelection,
9544                     ; 2296                        uint8_t TIM1_ICFilter)
9544                     ; 2297 {
9545                     	switch	.text
9546  159c               L11_TI4_Config:
9548  159c 89            	pushw	x
9549  159d 88            	push	a
9550       00000001      OFST:	set	1
9553                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9555  159e 7219525d      	bres	21085,#4
9556                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9556                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9558  15a2 7b06          	ld	a,(OFST+5,sp)
9559  15a4 97            	ld	xl,a
9560  15a5 a610          	ld	a,#16
9561  15a7 42            	mul	x,a
9562  15a8 9f            	ld	a,xl
9563  15a9 1a03          	or	a,(OFST+2,sp)
9564  15ab 6b01          	ld	(OFST+0,sp),a
9565  15ad c6525b        	ld	a,21083
9566  15b0 a40c          	and	a,#12
9567  15b2 1a01          	or	a,(OFST+0,sp)
9568  15b4 c7525b        	ld	21083,a
9569                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9571  15b7 0d02          	tnz	(OFST+1,sp)
9572  15b9 2706          	jreq	L1373
9573                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9575  15bb 721a525d      	bset	21085,#5
9577  15bf 2004          	jra	L3373
9578  15c1               L1373:
9579                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9581  15c1 721b525d      	bres	21085,#5
9582  15c5               L3373:
9583                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9585  15c5 7218525d      	bset	21085,#4
9586                     ; 2317 }
9589  15c9 5b03          	addw	sp,#3
9590  15cb 81            	ret
9603                     	xdef	_TIM1_ClearITPendingBit
9604                     	xdef	_TIM1_GetITStatus
9605                     	xdef	_TIM1_ClearFlag
9606                     	xdef	_TIM1_GetFlagStatus
9607                     	xdef	_TIM1_GetPrescaler
9608                     	xdef	_TIM1_GetCounter
9609                     	xdef	_TIM1_GetCapture4
9610                     	xdef	_TIM1_GetCapture3
9611                     	xdef	_TIM1_GetCapture2
9612                     	xdef	_TIM1_GetCapture1
9613                     	xdef	_TIM1_SetIC4Prescaler
9614                     	xdef	_TIM1_SetIC3Prescaler
9615                     	xdef	_TIM1_SetIC2Prescaler
9616                     	xdef	_TIM1_SetIC1Prescaler
9617                     	xdef	_TIM1_SetCompare4
9618                     	xdef	_TIM1_SetCompare3
9619                     	xdef	_TIM1_SetCompare2
9620                     	xdef	_TIM1_SetCompare1
9621                     	xdef	_TIM1_SetAutoreload
9622                     	xdef	_TIM1_SetCounter
9623                     	xdef	_TIM1_SelectOCxM
9624                     	xdef	_TIM1_CCxNCmd
9625                     	xdef	_TIM1_CCxCmd
9626                     	xdef	_TIM1_OC4PolarityConfig
9627                     	xdef	_TIM1_OC3NPolarityConfig
9628                     	xdef	_TIM1_OC3PolarityConfig
9629                     	xdef	_TIM1_OC2NPolarityConfig
9630                     	xdef	_TIM1_OC2PolarityConfig
9631                     	xdef	_TIM1_OC1NPolarityConfig
9632                     	xdef	_TIM1_OC1PolarityConfig
9633                     	xdef	_TIM1_GenerateEvent
9634                     	xdef	_TIM1_OC4FastConfig
9635                     	xdef	_TIM1_OC3FastConfig
9636                     	xdef	_TIM1_OC2FastConfig
9637                     	xdef	_TIM1_OC1FastConfig
9638                     	xdef	_TIM1_OC4PreloadConfig
9639                     	xdef	_TIM1_OC3PreloadConfig
9640                     	xdef	_TIM1_OC2PreloadConfig
9641                     	xdef	_TIM1_OC1PreloadConfig
9642                     	xdef	_TIM1_CCPreloadControl
9643                     	xdef	_TIM1_SelectCOM
9644                     	xdef	_TIM1_ARRPreloadConfig
9645                     	xdef	_TIM1_ForcedOC4Config
9646                     	xdef	_TIM1_ForcedOC3Config
9647                     	xdef	_TIM1_ForcedOC2Config
9648                     	xdef	_TIM1_ForcedOC1Config
9649                     	xdef	_TIM1_CounterModeConfig
9650                     	xdef	_TIM1_PrescalerConfig
9651                     	xdef	_TIM1_EncoderInterfaceConfig
9652                     	xdef	_TIM1_SelectMasterSlaveMode
9653                     	xdef	_TIM1_SelectSlaveMode
9654                     	xdef	_TIM1_SelectOutputTrigger
9655                     	xdef	_TIM1_SelectOnePulseMode
9656                     	xdef	_TIM1_SelectHallSensor
9657                     	xdef	_TIM1_UpdateRequestConfig
9658                     	xdef	_TIM1_UpdateDisableConfig
9659                     	xdef	_TIM1_SelectInputTrigger
9660                     	xdef	_TIM1_TIxExternalClockConfig
9661                     	xdef	_TIM1_ETRConfig
9662                     	xdef	_TIM1_ETRClockMode2Config
9663                     	xdef	_TIM1_ETRClockMode1Config
9664                     	xdef	_TIM1_InternalClockConfig
9665                     	xdef	_TIM1_ITConfig
9666                     	xdef	_TIM1_CtrlPWMOutputs
9667                     	xdef	_TIM1_Cmd
9668                     	xdef	_TIM1_PWMIConfig
9669                     	xdef	_TIM1_ICInit
9670                     	xdef	_TIM1_BDTRConfig
9671                     	xdef	_TIM1_OC4Init
9672                     	xdef	_TIM1_OC3Init
9673                     	xdef	_TIM1_OC2Init
9674                     	xdef	_TIM1_OC1Init
9675                     	xdef	_TIM1_TimeBaseInit
9676                     	xdef	_TIM1_DeInit
9677                     	xref	_assert_failed
9678                     .const:	section	.text
9679  0000               L101:
9680  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
9681  0012 697665725c73  	dc.b	"iver\src\stm8s_tim"
9682  0024 312e6300      	dc.b	"1.c",0
9702                     	end
