   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 54 void ADC2_DeInit(void)
  43                     ; 55 {
  45                     	switch	.text
  46  0000               _ADC2_DeInit:
  50                     ; 56   ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  52  0000 725f5400      	clr	21504
  53                     ; 57   ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  55  0004 725f5401      	clr	21505
  56                     ; 58   ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  58  0008 725f5402      	clr	21506
  59                     ; 59   ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  61  000c 725f5406      	clr	21510
  62                     ; 60   ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  64  0010 725f5407      	clr	21511
  65                     ; 61 }
  68  0014 81            	ret
 595                     ; 83 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 595                     ; 84 {
 596                     	switch	.text
 597  0015               _ADC2_Init:
 599  0015 89            	pushw	x
 600       00000000      OFST:	set	0
 603                     ; 86   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 605  0016 9e            	ld	a,xh
 606  0017 4d            	tnz	a
 607  0018 2705          	jreq	L21
 608  001a 9e            	ld	a,xh
 609  001b a101          	cp	a,#1
 610  001d 2603          	jrne	L01
 611  001f               L21:
 612  001f 4f            	clr	a
 613  0020 2010          	jra	L41
 614  0022               L01:
 615  0022 ae0056        	ldw	x,#86
 616  0025 89            	pushw	x
 617  0026 ae0000        	ldw	x,#0
 618  0029 89            	pushw	x
 619  002a ae0000        	ldw	x,#L172
 620  002d cd0000        	call	_assert_failed
 622  0030 5b04          	addw	sp,#4
 623  0032               L41:
 624                     ; 87   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 626  0032 0d02          	tnz	(OFST+2,sp)
 627  0034 275a          	jreq	L02
 628  0036 7b02          	ld	a,(OFST+2,sp)
 629  0038 a101          	cp	a,#1
 630  003a 2754          	jreq	L02
 631  003c 7b02          	ld	a,(OFST+2,sp)
 632  003e a102          	cp	a,#2
 633  0040 274e          	jreq	L02
 634  0042 7b02          	ld	a,(OFST+2,sp)
 635  0044 a103          	cp	a,#3
 636  0046 2748          	jreq	L02
 637  0048 7b02          	ld	a,(OFST+2,sp)
 638  004a a104          	cp	a,#4
 639  004c 2742          	jreq	L02
 640  004e 7b02          	ld	a,(OFST+2,sp)
 641  0050 a105          	cp	a,#5
 642  0052 273c          	jreq	L02
 643  0054 7b02          	ld	a,(OFST+2,sp)
 644  0056 a106          	cp	a,#6
 645  0058 2736          	jreq	L02
 646  005a 7b02          	ld	a,(OFST+2,sp)
 647  005c a107          	cp	a,#7
 648  005e 2730          	jreq	L02
 649  0060 7b02          	ld	a,(OFST+2,sp)
 650  0062 a108          	cp	a,#8
 651  0064 272a          	jreq	L02
 652  0066 7b02          	ld	a,(OFST+2,sp)
 653  0068 a109          	cp	a,#9
 654  006a 2724          	jreq	L02
 655  006c 7b02          	ld	a,(OFST+2,sp)
 656  006e a10a          	cp	a,#10
 657  0070 271e          	jreq	L02
 658  0072 7b02          	ld	a,(OFST+2,sp)
 659  0074 a10b          	cp	a,#11
 660  0076 2718          	jreq	L02
 661  0078 7b02          	ld	a,(OFST+2,sp)
 662  007a a10c          	cp	a,#12
 663  007c 2712          	jreq	L02
 664  007e 7b02          	ld	a,(OFST+2,sp)
 665  0080 a10d          	cp	a,#13
 666  0082 270c          	jreq	L02
 667  0084 7b02          	ld	a,(OFST+2,sp)
 668  0086 a10e          	cp	a,#14
 669  0088 2706          	jreq	L02
 670  008a 7b02          	ld	a,(OFST+2,sp)
 671  008c a10f          	cp	a,#15
 672  008e 2603          	jrne	L61
 673  0090               L02:
 674  0090 4f            	clr	a
 675  0091 2010          	jra	L22
 676  0093               L61:
 677  0093 ae0057        	ldw	x,#87
 678  0096 89            	pushw	x
 679  0097 ae0000        	ldw	x,#0
 680  009a 89            	pushw	x
 681  009b ae0000        	ldw	x,#L172
 682  009e cd0000        	call	_assert_failed
 684  00a1 5b04          	addw	sp,#4
 685  00a3               L22:
 686                     ; 88   assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 688  00a3 0d05          	tnz	(OFST+5,sp)
 689  00a5 272a          	jreq	L62
 690  00a7 7b05          	ld	a,(OFST+5,sp)
 691  00a9 a110          	cp	a,#16
 692  00ab 2724          	jreq	L62
 693  00ad 7b05          	ld	a,(OFST+5,sp)
 694  00af a120          	cp	a,#32
 695  00b1 271e          	jreq	L62
 696  00b3 7b05          	ld	a,(OFST+5,sp)
 697  00b5 a130          	cp	a,#48
 698  00b7 2718          	jreq	L62
 699  00b9 7b05          	ld	a,(OFST+5,sp)
 700  00bb a140          	cp	a,#64
 701  00bd 2712          	jreq	L62
 702  00bf 7b05          	ld	a,(OFST+5,sp)
 703  00c1 a150          	cp	a,#80
 704  00c3 270c          	jreq	L62
 705  00c5 7b05          	ld	a,(OFST+5,sp)
 706  00c7 a160          	cp	a,#96
 707  00c9 2706          	jreq	L62
 708  00cb 7b05          	ld	a,(OFST+5,sp)
 709  00cd a170          	cp	a,#112
 710  00cf 2603          	jrne	L42
 711  00d1               L62:
 712  00d1 4f            	clr	a
 713  00d2 2010          	jra	L03
 714  00d4               L42:
 715  00d4 ae0058        	ldw	x,#88
 716  00d7 89            	pushw	x
 717  00d8 ae0000        	ldw	x,#0
 718  00db 89            	pushw	x
 719  00dc ae0000        	ldw	x,#L172
 720  00df cd0000        	call	_assert_failed
 722  00e2 5b04          	addw	sp,#4
 723  00e4               L03:
 724                     ; 89   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 726  00e4 0d06          	tnz	(OFST+6,sp)
 727  00e6 2706          	jreq	L43
 728  00e8 7b06          	ld	a,(OFST+6,sp)
 729  00ea a101          	cp	a,#1
 730  00ec 2603          	jrne	L23
 731  00ee               L43:
 732  00ee 4f            	clr	a
 733  00ef 2010          	jra	L63
 734  00f1               L23:
 735  00f1 ae0059        	ldw	x,#89
 736  00f4 89            	pushw	x
 737  00f5 ae0000        	ldw	x,#0
 738  00f8 89            	pushw	x
 739  00f9 ae0000        	ldw	x,#L172
 740  00fc cd0000        	call	_assert_failed
 742  00ff 5b04          	addw	sp,#4
 743  0101               L63:
 744                     ; 90   assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 746  0101 0d07          	tnz	(OFST+7,sp)
 747  0103 2706          	jreq	L24
 748  0105 7b07          	ld	a,(OFST+7,sp)
 749  0107 a101          	cp	a,#1
 750  0109 2603          	jrne	L04
 751  010b               L24:
 752  010b 4f            	clr	a
 753  010c 2010          	jra	L44
 754  010e               L04:
 755  010e ae005a        	ldw	x,#90
 756  0111 89            	pushw	x
 757  0112 ae0000        	ldw	x,#0
 758  0115 89            	pushw	x
 759  0116 ae0000        	ldw	x,#L172
 760  0119 cd0000        	call	_assert_failed
 762  011c 5b04          	addw	sp,#4
 763  011e               L44:
 764                     ; 91   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 766  011e 0d08          	tnz	(OFST+8,sp)
 767  0120 2706          	jreq	L05
 768  0122 7b08          	ld	a,(OFST+8,sp)
 769  0124 a108          	cp	a,#8
 770  0126 2603          	jrne	L64
 771  0128               L05:
 772  0128 4f            	clr	a
 773  0129 2010          	jra	L25
 774  012b               L64:
 775  012b ae005b        	ldw	x,#91
 776  012e 89            	pushw	x
 777  012f ae0000        	ldw	x,#0
 778  0132 89            	pushw	x
 779  0133 ae0000        	ldw	x,#L172
 780  0136 cd0000        	call	_assert_failed
 782  0139 5b04          	addw	sp,#4
 783  013b               L25:
 784                     ; 92   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 786  013b 0d09          	tnz	(OFST+9,sp)
 787  013d 2760          	jreq	L65
 788  013f 7b09          	ld	a,(OFST+9,sp)
 789  0141 a101          	cp	a,#1
 790  0143 275a          	jreq	L65
 791  0145 7b09          	ld	a,(OFST+9,sp)
 792  0147 a102          	cp	a,#2
 793  0149 2754          	jreq	L65
 794  014b 7b09          	ld	a,(OFST+9,sp)
 795  014d a103          	cp	a,#3
 796  014f 274e          	jreq	L65
 797  0151 7b09          	ld	a,(OFST+9,sp)
 798  0153 a104          	cp	a,#4
 799  0155 2748          	jreq	L65
 800  0157 7b09          	ld	a,(OFST+9,sp)
 801  0159 a105          	cp	a,#5
 802  015b 2742          	jreq	L65
 803  015d 7b09          	ld	a,(OFST+9,sp)
 804  015f a106          	cp	a,#6
 805  0161 273c          	jreq	L65
 806  0163 7b09          	ld	a,(OFST+9,sp)
 807  0165 a107          	cp	a,#7
 808  0167 2736          	jreq	L65
 809  0169 7b09          	ld	a,(OFST+9,sp)
 810  016b a108          	cp	a,#8
 811  016d 2730          	jreq	L65
 812  016f 7b09          	ld	a,(OFST+9,sp)
 813  0171 a109          	cp	a,#9
 814  0173 272a          	jreq	L65
 815  0175 7b09          	ld	a,(OFST+9,sp)
 816  0177 a10a          	cp	a,#10
 817  0179 2724          	jreq	L65
 818  017b 7b09          	ld	a,(OFST+9,sp)
 819  017d a10b          	cp	a,#11
 820  017f 271e          	jreq	L65
 821  0181 7b09          	ld	a,(OFST+9,sp)
 822  0183 a10c          	cp	a,#12
 823  0185 2718          	jreq	L65
 824  0187 7b09          	ld	a,(OFST+9,sp)
 825  0189 a10d          	cp	a,#13
 826  018b 2712          	jreq	L65
 827  018d 7b09          	ld	a,(OFST+9,sp)
 828  018f a10e          	cp	a,#14
 829  0191 270c          	jreq	L65
 830  0193 7b09          	ld	a,(OFST+9,sp)
 831  0195 a10f          	cp	a,#15
 832  0197 2706          	jreq	L65
 833  0199 7b09          	ld	a,(OFST+9,sp)
 834  019b a11f          	cp	a,#31
 835  019d 2603          	jrne	L45
 836  019f               L65:
 837  019f 4f            	clr	a
 838  01a0 2010          	jra	L06
 839  01a2               L45:
 840  01a2 ae005c        	ldw	x,#92
 841  01a5 89            	pushw	x
 842  01a6 ae0000        	ldw	x,#0
 843  01a9 89            	pushw	x
 844  01aa ae0000        	ldw	x,#L172
 845  01ad cd0000        	call	_assert_failed
 847  01b0 5b04          	addw	sp,#4
 848  01b2               L06:
 849                     ; 93   assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 851  01b2 0d0a          	tnz	(OFST+10,sp)
 852  01b4 2706          	jreq	L46
 853  01b6 7b0a          	ld	a,(OFST+10,sp)
 854  01b8 a101          	cp	a,#1
 855  01ba 2603          	jrne	L26
 856  01bc               L46:
 857  01bc 4f            	clr	a
 858  01bd 2010          	jra	L66
 859  01bf               L26:
 860  01bf ae005d        	ldw	x,#93
 861  01c2 89            	pushw	x
 862  01c3 ae0000        	ldw	x,#0
 863  01c6 89            	pushw	x
 864  01c7 ae0000        	ldw	x,#L172
 865  01ca cd0000        	call	_assert_failed
 867  01cd 5b04          	addw	sp,#4
 868  01cf               L66:
 869                     ; 98   ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 871  01cf 7b08          	ld	a,(OFST+8,sp)
 872  01d1 88            	push	a
 873  01d2 7b03          	ld	a,(OFST+3,sp)
 874  01d4 97            	ld	xl,a
 875  01d5 7b02          	ld	a,(OFST+2,sp)
 876  01d7 95            	ld	xh,a
 877  01d8 cd03a6        	call	_ADC2_ConversionConfig
 879  01db 84            	pop	a
 880                     ; 100   ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 882  01dc 7b05          	ld	a,(OFST+5,sp)
 883  01de ad6e          	call	_ADC2_PrescalerConfig
 885                     ; 105   ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 887  01e0 7b07          	ld	a,(OFST+7,sp)
 888  01e2 97            	ld	xl,a
 889  01e3 7b06          	ld	a,(OFST+6,sp)
 890  01e5 95            	ld	xh,a
 891  01e6 cd047f        	call	_ADC2_ExternalTriggerConfig
 893                     ; 110   ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 895  01e9 7b0a          	ld	a,(OFST+10,sp)
 896  01eb 97            	ld	xl,a
 897  01ec 7b09          	ld	a,(OFST+9,sp)
 898  01ee 95            	ld	xh,a
 899  01ef cd0293        	call	_ADC2_SchmittTriggerConfig
 901                     ; 113   ADC2->CR1 |= ADC2_CR1_ADON;
 903  01f2 72105401      	bset	21505,#0
 904                     ; 114 }
 907  01f6 85            	popw	x
 908  01f7 81            	ret
 944                     ; 121 void ADC2_Cmd(FunctionalState NewState)
 944                     ; 122 {
 945                     	switch	.text
 946  01f8               _ADC2_Cmd:
 948  01f8 88            	push	a
 949       00000000      OFST:	set	0
 952                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 954  01f9 4d            	tnz	a
 955  01fa 2704          	jreq	L47
 956  01fc a101          	cp	a,#1
 957  01fe 2603          	jrne	L27
 958  0200               L47:
 959  0200 4f            	clr	a
 960  0201 2010          	jra	L67
 961  0203               L27:
 962  0203 ae007c        	ldw	x,#124
 963  0206 89            	pushw	x
 964  0207 ae0000        	ldw	x,#0
 965  020a 89            	pushw	x
 966  020b ae0000        	ldw	x,#L172
 967  020e cd0000        	call	_assert_failed
 969  0211 5b04          	addw	sp,#4
 970  0213               L67:
 971                     ; 126   if (NewState != DISABLE)
 973  0213 0d01          	tnz	(OFST+1,sp)
 974  0215 2706          	jreq	L113
 975                     ; 128     ADC2->CR1 |= ADC2_CR1_ADON;
 977  0217 72105401      	bset	21505,#0
 979  021b 2004          	jra	L313
 980  021d               L113:
 981                     ; 132     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 983  021d 72115401      	bres	21505,#0
 984  0221               L313:
 985                     ; 134 }
 988  0221 84            	pop	a
 989  0222 81            	ret
1025                     ; 141 void ADC2_ITConfig(FunctionalState NewState)
1025                     ; 142 {
1026                     	switch	.text
1027  0223               _ADC2_ITConfig:
1029  0223 88            	push	a
1030       00000000      OFST:	set	0
1033                     ; 144   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1035  0224 4d            	tnz	a
1036  0225 2704          	jreq	L401
1037  0227 a101          	cp	a,#1
1038  0229 2603          	jrne	L201
1039  022b               L401:
1040  022b 4f            	clr	a
1041  022c 2010          	jra	L601
1042  022e               L201:
1043  022e ae0090        	ldw	x,#144
1044  0231 89            	pushw	x
1045  0232 ae0000        	ldw	x,#0
1046  0235 89            	pushw	x
1047  0236 ae0000        	ldw	x,#L172
1048  0239 cd0000        	call	_assert_failed
1050  023c 5b04          	addw	sp,#4
1051  023e               L601:
1052                     ; 146   if (NewState != DISABLE)
1054  023e 0d01          	tnz	(OFST+1,sp)
1055  0240 2706          	jreq	L333
1056                     ; 149     ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
1058  0242 721a5400      	bset	21504,#5
1060  0246 2004          	jra	L533
1061  0248               L333:
1062                     ; 154     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
1064  0248 721b5400      	bres	21504,#5
1065  024c               L533:
1066                     ; 156 }
1069  024c 84            	pop	a
1070  024d 81            	ret
1107                     ; 164 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
1107                     ; 165 {
1108                     	switch	.text
1109  024e               _ADC2_PrescalerConfig:
1111  024e 88            	push	a
1112       00000000      OFST:	set	0
1115                     ; 167   assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
1117  024f 4d            	tnz	a
1118  0250 271c          	jreq	L411
1119  0252 a110          	cp	a,#16
1120  0254 2718          	jreq	L411
1121  0256 a120          	cp	a,#32
1122  0258 2714          	jreq	L411
1123  025a a130          	cp	a,#48
1124  025c 2710          	jreq	L411
1125  025e a140          	cp	a,#64
1126  0260 270c          	jreq	L411
1127  0262 a150          	cp	a,#80
1128  0264 2708          	jreq	L411
1129  0266 a160          	cp	a,#96
1130  0268 2704          	jreq	L411
1131  026a a170          	cp	a,#112
1132  026c 2603          	jrne	L211
1133  026e               L411:
1134  026e 4f            	clr	a
1135  026f 2010          	jra	L611
1136  0271               L211:
1137  0271 ae00a7        	ldw	x,#167
1138  0274 89            	pushw	x
1139  0275 ae0000        	ldw	x,#0
1140  0278 89            	pushw	x
1141  0279 ae0000        	ldw	x,#L172
1142  027c cd0000        	call	_assert_failed
1144  027f 5b04          	addw	sp,#4
1145  0281               L611:
1146                     ; 170   ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
1148  0281 c65401        	ld	a,21505
1149  0284 a48f          	and	a,#143
1150  0286 c75401        	ld	21505,a
1151                     ; 172   ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
1153  0289 c65401        	ld	a,21505
1154  028c 1a01          	or	a,(OFST+1,sp)
1155  028e c75401        	ld	21505,a
1156                     ; 173 }
1159  0291 84            	pop	a
1160  0292 81            	ret
1208                     ; 183 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
1208                     ; 184 {
1209                     	switch	.text
1210  0293               _ADC2_SchmittTriggerConfig:
1212  0293 89            	pushw	x
1213       00000000      OFST:	set	0
1216                     ; 186   assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
1218  0294 9e            	ld	a,xh
1219  0295 4d            	tnz	a
1220  0296 2750          	jreq	L421
1221  0298 9e            	ld	a,xh
1222  0299 a101          	cp	a,#1
1223  029b 274b          	jreq	L421
1224  029d 9e            	ld	a,xh
1225  029e a102          	cp	a,#2
1226  02a0 2746          	jreq	L421
1227  02a2 9e            	ld	a,xh
1228  02a3 a103          	cp	a,#3
1229  02a5 2741          	jreq	L421
1230  02a7 9e            	ld	a,xh
1231  02a8 a104          	cp	a,#4
1232  02aa 273c          	jreq	L421
1233  02ac 9e            	ld	a,xh
1234  02ad a105          	cp	a,#5
1235  02af 2737          	jreq	L421
1236  02b1 9e            	ld	a,xh
1237  02b2 a106          	cp	a,#6
1238  02b4 2732          	jreq	L421
1239  02b6 9e            	ld	a,xh
1240  02b7 a107          	cp	a,#7
1241  02b9 272d          	jreq	L421
1242  02bb 9e            	ld	a,xh
1243  02bc a108          	cp	a,#8
1244  02be 2728          	jreq	L421
1245  02c0 9e            	ld	a,xh
1246  02c1 a109          	cp	a,#9
1247  02c3 2723          	jreq	L421
1248  02c5 9e            	ld	a,xh
1249  02c6 a10a          	cp	a,#10
1250  02c8 271e          	jreq	L421
1251  02ca 9e            	ld	a,xh
1252  02cb a10b          	cp	a,#11
1253  02cd 2719          	jreq	L421
1254  02cf 9e            	ld	a,xh
1255  02d0 a10c          	cp	a,#12
1256  02d2 2714          	jreq	L421
1257  02d4 9e            	ld	a,xh
1258  02d5 a10d          	cp	a,#13
1259  02d7 270f          	jreq	L421
1260  02d9 9e            	ld	a,xh
1261  02da a10e          	cp	a,#14
1262  02dc 270a          	jreq	L421
1263  02de 9e            	ld	a,xh
1264  02df a10f          	cp	a,#15
1265  02e1 2705          	jreq	L421
1266  02e3 9e            	ld	a,xh
1267  02e4 a11f          	cp	a,#31
1268  02e6 2603          	jrne	L221
1269  02e8               L421:
1270  02e8 4f            	clr	a
1271  02e9 2010          	jra	L621
1272  02eb               L221:
1273  02eb ae00ba        	ldw	x,#186
1274  02ee 89            	pushw	x
1275  02ef ae0000        	ldw	x,#0
1276  02f2 89            	pushw	x
1277  02f3 ae0000        	ldw	x,#L172
1278  02f6 cd0000        	call	_assert_failed
1280  02f9 5b04          	addw	sp,#4
1281  02fb               L621:
1282                     ; 187   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1284  02fb 0d02          	tnz	(OFST+2,sp)
1285  02fd 2706          	jreq	L231
1286  02ff 7b02          	ld	a,(OFST+2,sp)
1287  0301 a101          	cp	a,#1
1288  0303 2603          	jrne	L031
1289  0305               L231:
1290  0305 4f            	clr	a
1291  0306 2010          	jra	L431
1292  0308               L031:
1293  0308 ae00bb        	ldw	x,#187
1294  030b 89            	pushw	x
1295  030c ae0000        	ldw	x,#0
1296  030f 89            	pushw	x
1297  0310 ae0000        	ldw	x,#L172
1298  0313 cd0000        	call	_assert_failed
1300  0316 5b04          	addw	sp,#4
1301  0318               L431:
1302                     ; 189   if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
1304  0318 7b01          	ld	a,(OFST+1,sp)
1305  031a a11f          	cp	a,#31
1306  031c 2620          	jrne	L773
1307                     ; 191     if (NewState != DISABLE)
1309  031e 0d02          	tnz	(OFST+2,sp)
1310  0320 270a          	jreq	L104
1311                     ; 193       ADC2->TDRL &= (uint8_t)0x0;
1313  0322 725f5407      	clr	21511
1314                     ; 194       ADC2->TDRH &= (uint8_t)0x0;
1316  0326 725f5406      	clr	21510
1318  032a 2078          	jra	L504
1319  032c               L104:
1320                     ; 198       ADC2->TDRL |= (uint8_t)0xFF;
1322  032c c65407        	ld	a,21511
1323  032f aaff          	or	a,#255
1324  0331 c75407        	ld	21511,a
1325                     ; 199       ADC2->TDRH |= (uint8_t)0xFF;
1327  0334 c65406        	ld	a,21510
1328  0337 aaff          	or	a,#255
1329  0339 c75406        	ld	21510,a
1330  033c 2066          	jra	L504
1331  033e               L773:
1332                     ; 202   else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
1334  033e 7b01          	ld	a,(OFST+1,sp)
1335  0340 a108          	cp	a,#8
1336  0342 242f          	jruge	L704
1337                     ; 204     if (NewState != DISABLE)
1339  0344 0d02          	tnz	(OFST+2,sp)
1340  0346 2716          	jreq	L114
1341                     ; 206       ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
1343  0348 7b01          	ld	a,(OFST+1,sp)
1344  034a 5f            	clrw	x
1345  034b 97            	ld	xl,a
1346  034c a601          	ld	a,#1
1347  034e 5d            	tnzw	x
1348  034f 2704          	jreq	L631
1349  0351               L041:
1350  0351 48            	sll	a
1351  0352 5a            	decw	x
1352  0353 26fc          	jrne	L041
1353  0355               L631:
1354  0355 43            	cpl	a
1355  0356 c45407        	and	a,21511
1356  0359 c75407        	ld	21511,a
1358  035c 2046          	jra	L504
1359  035e               L114:
1360                     ; 210       ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
1362  035e 7b01          	ld	a,(OFST+1,sp)
1363  0360 5f            	clrw	x
1364  0361 97            	ld	xl,a
1365  0362 a601          	ld	a,#1
1366  0364 5d            	tnzw	x
1367  0365 2704          	jreq	L241
1368  0367               L441:
1369  0367 48            	sll	a
1370  0368 5a            	decw	x
1371  0369 26fc          	jrne	L441
1372  036b               L241:
1373  036b ca5407        	or	a,21511
1374  036e c75407        	ld	21511,a
1375  0371 2031          	jra	L504
1376  0373               L704:
1377                     ; 215     if (NewState != DISABLE)
1379  0373 0d02          	tnz	(OFST+2,sp)
1380  0375 2718          	jreq	L714
1381                     ; 217       ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
1383  0377 7b01          	ld	a,(OFST+1,sp)
1384  0379 a008          	sub	a,#8
1385  037b 5f            	clrw	x
1386  037c 97            	ld	xl,a
1387  037d a601          	ld	a,#1
1388  037f 5d            	tnzw	x
1389  0380 2704          	jreq	L641
1390  0382               L051:
1391  0382 48            	sll	a
1392  0383 5a            	decw	x
1393  0384 26fc          	jrne	L051
1394  0386               L641:
1395  0386 43            	cpl	a
1396  0387 c45406        	and	a,21510
1397  038a c75406        	ld	21510,a
1399  038d 2015          	jra	L504
1400  038f               L714:
1401                     ; 221       ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
1403  038f 7b01          	ld	a,(OFST+1,sp)
1404  0391 a008          	sub	a,#8
1405  0393 5f            	clrw	x
1406  0394 97            	ld	xl,a
1407  0395 a601          	ld	a,#1
1408  0397 5d            	tnzw	x
1409  0398 2704          	jreq	L251
1410  039a               L451:
1411  039a 48            	sll	a
1412  039b 5a            	decw	x
1413  039c 26fc          	jrne	L451
1414  039e               L251:
1415  039e ca5406        	or	a,21510
1416  03a1 c75406        	ld	21510,a
1417  03a4               L504:
1418                     ; 224 }
1421  03a4 85            	popw	x
1422  03a5 81            	ret
1480                     ; 236 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1480                     ; 237 {
1481                     	switch	.text
1482  03a6               _ADC2_ConversionConfig:
1484  03a6 89            	pushw	x
1485       00000000      OFST:	set	0
1488                     ; 239   assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1490  03a7 9e            	ld	a,xh
1491  03a8 4d            	tnz	a
1492  03a9 2705          	jreq	L261
1493  03ab 9e            	ld	a,xh
1494  03ac a101          	cp	a,#1
1495  03ae 2603          	jrne	L061
1496  03b0               L261:
1497  03b0 4f            	clr	a
1498  03b1 2010          	jra	L461
1499  03b3               L061:
1500  03b3 ae00ef        	ldw	x,#239
1501  03b6 89            	pushw	x
1502  03b7 ae0000        	ldw	x,#0
1503  03ba 89            	pushw	x
1504  03bb ae0000        	ldw	x,#L172
1505  03be cd0000        	call	_assert_failed
1507  03c1 5b04          	addw	sp,#4
1508  03c3               L461:
1509                     ; 240   assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1511  03c3 0d02          	tnz	(OFST+2,sp)
1512  03c5 275a          	jreq	L071
1513  03c7 7b02          	ld	a,(OFST+2,sp)
1514  03c9 a101          	cp	a,#1
1515  03cb 2754          	jreq	L071
1516  03cd 7b02          	ld	a,(OFST+2,sp)
1517  03cf a102          	cp	a,#2
1518  03d1 274e          	jreq	L071
1519  03d3 7b02          	ld	a,(OFST+2,sp)
1520  03d5 a103          	cp	a,#3
1521  03d7 2748          	jreq	L071
1522  03d9 7b02          	ld	a,(OFST+2,sp)
1523  03db a104          	cp	a,#4
1524  03dd 2742          	jreq	L071
1525  03df 7b02          	ld	a,(OFST+2,sp)
1526  03e1 a105          	cp	a,#5
1527  03e3 273c          	jreq	L071
1528  03e5 7b02          	ld	a,(OFST+2,sp)
1529  03e7 a106          	cp	a,#6
1530  03e9 2736          	jreq	L071
1531  03eb 7b02          	ld	a,(OFST+2,sp)
1532  03ed a107          	cp	a,#7
1533  03ef 2730          	jreq	L071
1534  03f1 7b02          	ld	a,(OFST+2,sp)
1535  03f3 a108          	cp	a,#8
1536  03f5 272a          	jreq	L071
1537  03f7 7b02          	ld	a,(OFST+2,sp)
1538  03f9 a109          	cp	a,#9
1539  03fb 2724          	jreq	L071
1540  03fd 7b02          	ld	a,(OFST+2,sp)
1541  03ff a10a          	cp	a,#10
1542  0401 271e          	jreq	L071
1543  0403 7b02          	ld	a,(OFST+2,sp)
1544  0405 a10b          	cp	a,#11
1545  0407 2718          	jreq	L071
1546  0409 7b02          	ld	a,(OFST+2,sp)
1547  040b a10c          	cp	a,#12
1548  040d 2712          	jreq	L071
1549  040f 7b02          	ld	a,(OFST+2,sp)
1550  0411 a10d          	cp	a,#13
1551  0413 270c          	jreq	L071
1552  0415 7b02          	ld	a,(OFST+2,sp)
1553  0417 a10e          	cp	a,#14
1554  0419 2706          	jreq	L071
1555  041b 7b02          	ld	a,(OFST+2,sp)
1556  041d a10f          	cp	a,#15
1557  041f 2603          	jrne	L661
1558  0421               L071:
1559  0421 4f            	clr	a
1560  0422 2010          	jra	L271
1561  0424               L661:
1562  0424 ae00f0        	ldw	x,#240
1563  0427 89            	pushw	x
1564  0428 ae0000        	ldw	x,#0
1565  042b 89            	pushw	x
1566  042c ae0000        	ldw	x,#L172
1567  042f cd0000        	call	_assert_failed
1569  0432 5b04          	addw	sp,#4
1570  0434               L271:
1571                     ; 241   assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1573  0434 0d05          	tnz	(OFST+5,sp)
1574  0436 2706          	jreq	L671
1575  0438 7b05          	ld	a,(OFST+5,sp)
1576  043a a108          	cp	a,#8
1577  043c 2603          	jrne	L471
1578  043e               L671:
1579  043e 4f            	clr	a
1580  043f 2010          	jra	L002
1581  0441               L471:
1582  0441 ae00f1        	ldw	x,#241
1583  0444 89            	pushw	x
1584  0445 ae0000        	ldw	x,#0
1585  0448 89            	pushw	x
1586  0449 ae0000        	ldw	x,#L172
1587  044c cd0000        	call	_assert_failed
1589  044f 5b04          	addw	sp,#4
1590  0451               L002:
1591                     ; 244   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
1593  0451 72175402      	bres	21506,#3
1594                     ; 246   ADC2->CR2 |= (uint8_t)(ADC2_Align);
1596  0455 c65402        	ld	a,21506
1597  0458 1a05          	or	a,(OFST+5,sp)
1598  045a c75402        	ld	21506,a
1599                     ; 248   if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1601  045d 7b01          	ld	a,(OFST+1,sp)
1602  045f a101          	cp	a,#1
1603  0461 2606          	jrne	L154
1604                     ; 251     ADC2->CR1 |= ADC2_CR1_CONT;
1606  0463 72125401      	bset	21505,#1
1608  0467 2004          	jra	L354
1609  0469               L154:
1610                     ; 256     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
1612  0469 72135401      	bres	21505,#1
1613  046d               L354:
1614                     ; 260   ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
1616  046d c65400        	ld	a,21504
1617  0470 a4f0          	and	a,#240
1618  0472 c75400        	ld	21504,a
1619                     ; 262   ADC2->CSR |= (uint8_t)(ADC2_Channel);
1621  0475 c65400        	ld	a,21504
1622  0478 1a02          	or	a,(OFST+2,sp)
1623  047a c75400        	ld	21504,a
1624                     ; 263 }
1627  047d 85            	popw	x
1628  047e 81            	ret
1675                     ; 275 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
1675                     ; 276 {
1676                     	switch	.text
1677  047f               _ADC2_ExternalTriggerConfig:
1679  047f 89            	pushw	x
1680       00000000      OFST:	set	0
1683                     ; 278   assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1685  0480 9e            	ld	a,xh
1686  0481 4d            	tnz	a
1687  0482 2705          	jreq	L602
1688  0484 9e            	ld	a,xh
1689  0485 a101          	cp	a,#1
1690  0487 2603          	jrne	L402
1691  0489               L602:
1692  0489 4f            	clr	a
1693  048a 2010          	jra	L012
1694  048c               L402:
1695  048c ae0116        	ldw	x,#278
1696  048f 89            	pushw	x
1697  0490 ae0000        	ldw	x,#0
1698  0493 89            	pushw	x
1699  0494 ae0000        	ldw	x,#L172
1700  0497 cd0000        	call	_assert_failed
1702  049a 5b04          	addw	sp,#4
1703  049c               L012:
1704                     ; 279   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1706  049c 0d02          	tnz	(OFST+2,sp)
1707  049e 2706          	jreq	L412
1708  04a0 7b02          	ld	a,(OFST+2,sp)
1709  04a2 a101          	cp	a,#1
1710  04a4 2603          	jrne	L212
1711  04a6               L412:
1712  04a6 4f            	clr	a
1713  04a7 2010          	jra	L612
1714  04a9               L212:
1715  04a9 ae0117        	ldw	x,#279
1716  04ac 89            	pushw	x
1717  04ad ae0000        	ldw	x,#0
1718  04b0 89            	pushw	x
1719  04b1 ae0000        	ldw	x,#L172
1720  04b4 cd0000        	call	_assert_failed
1722  04b7 5b04          	addw	sp,#4
1723  04b9               L612:
1724                     ; 282   ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
1726  04b9 c65402        	ld	a,21506
1727  04bc a4cf          	and	a,#207
1728  04be c75402        	ld	21506,a
1729                     ; 284   if (NewState != DISABLE)
1731  04c1 0d02          	tnz	(OFST+2,sp)
1732  04c3 2706          	jreq	L774
1733                     ; 287     ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
1735  04c5 721c5402      	bset	21506,#6
1737  04c9 2004          	jra	L105
1738  04cb               L774:
1739                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
1741  04cb 721d5402      	bres	21506,#6
1742  04cf               L105:
1743                     ; 296   ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
1745  04cf c65402        	ld	a,21506
1746  04d2 1a01          	or	a,(OFST+1,sp)
1747  04d4 c75402        	ld	21506,a
1748                     ; 297 }
1751  04d7 85            	popw	x
1752  04d8 81            	ret
1776                     ; 308 void ADC2_StartConversion(void)
1776                     ; 309 {
1777                     	switch	.text
1778  04d9               _ADC2_StartConversion:
1782                     ; 310   ADC2->CR1 |= ADC2_CR1_ADON;
1784  04d9 72105401      	bset	21505,#0
1785                     ; 311 }
1788  04dd 81            	ret
1832                     ; 320 uint16_t ADC2_GetConversionValue(void)
1832                     ; 321 {
1833                     	switch	.text
1834  04de               _ADC2_GetConversionValue:
1836  04de 5205          	subw	sp,#5
1837       00000005      OFST:	set	5
1840                     ; 322   uint16_t temph = 0;
1842                     ; 323   uint8_t templ = 0;
1844                     ; 325   if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
1846  04e0 c65402        	ld	a,21506
1847  04e3 a508          	bcp	a,#8
1848  04e5 2715          	jreq	L535
1849                     ; 328     templ = ADC2->DRL;
1851  04e7 c65405        	ld	a,21509
1852  04ea 6b03          	ld	(OFST-2,sp),a
1853                     ; 330     temph = ADC2->DRH;
1855  04ec c65404        	ld	a,21508
1856  04ef 5f            	clrw	x
1857  04f0 97            	ld	xl,a
1858  04f1 1f04          	ldw	(OFST-1,sp),x
1859                     ; 332     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1861  04f3 1e04          	ldw	x,(OFST-1,sp)
1862  04f5 7b03          	ld	a,(OFST-2,sp)
1863  04f7 02            	rlwa	x,a
1864  04f8 1f04          	ldw	(OFST-1,sp),x
1866  04fa 2021          	jra	L735
1867  04fc               L535:
1868                     ; 337     temph = ADC2->DRH;
1870  04fc c65404        	ld	a,21508
1871  04ff 5f            	clrw	x
1872  0500 97            	ld	xl,a
1873  0501 1f04          	ldw	(OFST-1,sp),x
1874                     ; 339     templ = ADC2->DRL;
1876  0503 c65405        	ld	a,21509
1877  0506 6b03          	ld	(OFST-2,sp),a
1878                     ; 341     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1880  0508 1e04          	ldw	x,(OFST-1,sp)
1881  050a 4f            	clr	a
1882  050b 02            	rlwa	x,a
1883  050c 1f01          	ldw	(OFST-4,sp),x
1884  050e 7b03          	ld	a,(OFST-2,sp)
1885  0510 97            	ld	xl,a
1886  0511 a640          	ld	a,#64
1887  0513 42            	mul	x,a
1888  0514 01            	rrwa	x,a
1889  0515 1a02          	or	a,(OFST-3,sp)
1890  0517 01            	rrwa	x,a
1891  0518 1a01          	or	a,(OFST-4,sp)
1892  051a 01            	rrwa	x,a
1893  051b 1f04          	ldw	(OFST-1,sp),x
1894  051d               L735:
1895                     ; 344   return ((uint16_t)temph);
1897  051d 1e04          	ldw	x,(OFST-1,sp)
1900  051f 5b05          	addw	sp,#5
1901  0521 81            	ret
1945                     ; 352 FlagStatus ADC2_GetFlagStatus(void)
1945                     ; 353 {
1946                     	switch	.text
1947  0522               _ADC2_GetFlagStatus:
1951                     ; 355   return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
1953  0522 c65400        	ld	a,21504
1954  0525 a480          	and	a,#128
1957  0527 81            	ret
1980                     ; 363 void ADC2_ClearFlag(void)
1980                     ; 364 {
1981                     	switch	.text
1982  0528               _ADC2_ClearFlag:
1986                     ; 365   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1988  0528 721f5400      	bres	21504,#7
1989                     ; 366 }
1992  052c 81            	ret
2016                     ; 374 ITStatus ADC2_GetITStatus(void)
2016                     ; 375 {
2017                     	switch	.text
2018  052d               _ADC2_GetITStatus:
2022                     ; 376   return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
2024  052d c65400        	ld	a,21504
2025  0530 a480          	and	a,#128
2028  0532 81            	ret
2052                     ; 384 void ADC2_ClearITPendingBit(void)
2052                     ; 385 {
2053                     	switch	.text
2054  0533               _ADC2_ClearITPendingBit:
2058                     ; 386   ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
2060  0533 721f5400      	bres	21504,#7
2061                     ; 387 }
2064  0537 81            	ret
2077                     	xdef	_ADC2_ClearITPendingBit
2078                     	xdef	_ADC2_GetITStatus
2079                     	xdef	_ADC2_ClearFlag
2080                     	xdef	_ADC2_GetFlagStatus
2081                     	xdef	_ADC2_GetConversionValue
2082                     	xdef	_ADC2_StartConversion
2083                     	xdef	_ADC2_ExternalTriggerConfig
2084                     	xdef	_ADC2_ConversionConfig
2085                     	xdef	_ADC2_SchmittTriggerConfig
2086                     	xdef	_ADC2_PrescalerConfig
2087                     	xdef	_ADC2_ITConfig
2088                     	xdef	_ADC2_Cmd
2089                     	xdef	_ADC2_Init
2090                     	xdef	_ADC2_DeInit
2091                     	xref	_assert_failed
2092                     .const:	section	.text
2093  0000               L172:
2094  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
2095  0012 697665725c73  	dc.b	"iver\src\stm8s_adc"
2096  0024 322e6300      	dc.b	"2.c",0
2116                     	end
