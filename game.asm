 processor 6502
	ORG $1201
	.byte    $0E, $08, $0A, $00, $9E, $20, $28
	.byte   $34,$36,$32,$34
	.byte    $29, $00, $00, $00
	ORG $1210
EnchantedForest
	jmp block41
ticks = $35
oldticks = $3d
px = $3e
py = $3f
pd = $40
i = $41
j = $42
k = $43
m = $44
musTime = $45
musDelay = $46
musSustain = $47
p1	= $64
pa	= $66
pb	= $68
cm	= $6A
m1	= $6C
 ; Temp vars section
 ; Temp vars section ends
	org $2000
sprRight_A	dc.w $03a00, $03a10, $03a20, $03a30
sprRight_B	dc.w $03a08, $03a18, $03a28, $03a38
sprLeft_A	dc.w $03a40, $03a50, $03a60, $03a70
sprLeft_B	dc.w $03a48, $03a58, $03a68, $03a78
sprVert1_A	dc.w $03a80, $03a90, $03aa0, $03ab0
sprVert1_B	dc.w $03a88, $03a98, $03aa8, $03ab8
sprVert2_A	dc.w $03ac0, $03ad0, $03ae0, $03af0
sprVert2_B	dc.w $03ac8, $03ad8, $03ae8, $03af8
sprDir	dc.w sprRight_A, sprRight_B, sprLeft_A, sprLeft_B, sprVert1_A, sprVert1_B, sprVert2_A, sprVert2_B
	dc.w 
colmem	dc.w $09400, $09414, $09428, $0943c, $09450, $09464, $09478, $0948c
	dc.w $094a0, $094b4, $094c8, $094dc
musCh1b	dc.b $0c3, $00, $00, $00, $00, $00, $0c9, $00
	dc.b $0c3, $00, $00, $00, $0bb, $00, $00, $00
	dc.b $0af, $00, $00, $00, $097, $00, $00, $00
	dc.b $0a3, $00, $00, $00, $00, $00, $0af, $00
	dc.b $0a3, $00, $00, $00, $093, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $087, $00, $00, $00, $00, $00, $093, $00
	dc.b $097, $00, $0a3, $00, $0af, $00, $00, $00
	dc.b $097, $00, $00, $00, $0af, $00, $00, $00
	dc.b $0b3, $00, $0af, $00, $0a3, $00, $00, $00
	dc.b $097, $00, $00, $00, $093, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $087, $00, $00, $00, $00, $00, $093, $00
	dc.b $097, $00, $0a3, $00, $0af, $00, $00, $00
	dc.b $097, $00, $00, $00, $0af, $00, $00, $00
	dc.b $0b3, $00, $00, $00, $00, $00, $0c3, $00
	dc.b $0b3, $00, $00, $00, $0af, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0a3, $00, $00, $00, $00, $00, $0b3, $00
	dc.b $0a3, $00, $00, $00, $0af, $00, $00, $00
	dc.b $097, $00, $00, $00, $087, $00, $00, $00
	dc.b $093, $00, $00, $00, $097, $00, $00, $00
	dc.b $093, $00, $00, $00, $087, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0c3, $00, $00, $00, $00, $00, $0c9, $00
	dc.b $0c3, $00, $00, $00, $0bb, $00, $00, $00
	dc.b $0af, $00, $00, $00, $097, $00, $00, $00
	dc.b $0a3, $00, $00, $00, $00, $00, $0af, $00
	dc.b $0a3, $00, $00, $00, $093, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $087, $00, $00, $00, $00, $00, $093, $00
	dc.b $097, $00, $0a3, $00, $0af, $00, $00, $00
	dc.b $097, $00, $00, $00, $0af, $00, $00, $00
	dc.b $0b3, $00, $0af, $00, $0a3, $00, $00, $00
	dc.b $097, $00, $00, $00, $093, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $087, $00, $00, $00, $00, $00, $093, $00
	dc.b $097, $00, $0a3, $00, $0af, $00, $00, $00
	dc.b $097, $00, $00, $00, $0af, $00, $00, $00
	dc.b $0b3, $00, $00, $00, $00, $00, $0c3, $00
	dc.b $0b3, $00, $00, $00, $0af, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0a3, $0a3, $00, $00, $00, $00, $0b3, $00
	dc.b $0a3, $00, $00, $00, $0af, $00, $00, $00
	dc.b $097, $00, $00, $00, $087, $00, $00, $00
	dc.b $093, $00, $00, $00, $097, $00, $00, $00
	dc.b $093, $00, $00, $00, $087, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $01
musCh1x	dc.b $0b7, $00, $0cf, $00, $0cf, $00, $0c9, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $0cf, $00
	dc.b $0d7, $00, $0c9, $00, $0c9, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0b7, $00, $0cf, $00, $0cf, $00, $0c9, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $0cf, $00
	dc.b $0d7, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0cf, $00, $0d7, $00
	dc.b $0db, $00, $0db, $00, $0db, $00, $0db, $00
	dc.b $0db, $00, $00, $00, $00, $00, $0db, $00
	dc.b $0d7, $00, $00, $00, $0c9, $00, $00, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $00, $00
	dc.b $0c9, $00, $0c9, $00, $0c9, $00, $0cf, $00
	dc.b $0c9, $00, $0b7, $00, $00, $00, $0c9, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0b7, $00, $0cf, $00, $0cf, $00, $0c9, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $0d7, $00
	dc.b $0c9, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0b7, $00, $0cf, $00, $0cf, $00, $0c9, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $0cf, $00
	dc.b $0d7, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0cf, $00, $0d7, $00
	dc.b $0db, $00, $0db, $00, $0db, $00, $0db, $00
	dc.b $0db, $00, $00, $00, $00, $00, $0db, $00
	dc.b $0d7, $00, $00, $00, $0c9, $00, $00, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $00, $00
	dc.b $0c9, $00, $0c9, $00, $0c9, $00, $0cf, $00
	dc.b $0c9, $00, $0b7, $00, $00, $00, $0c3, $00
	dc.b $0c3, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0c9, $00, $0c9, $00, $0c9, $00, $0cf, $00
	dc.b $0c9, $00, $0b7, $00, $00, $00, $0c3, $00
	dc.b $0c3, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0db, $00, $0db, $00, $0db, $00, $0df, $00
	dc.b $0db, $00, $00, $00, $00, $00, $0db, $00
	dc.b $0e1, $00, $00, $00, $0df, $00, $00, $00
	dc.b $0cf, $00, $00, $00, $00, $00, $00, $00
	dc.b $0c9, $00, $00, $00, $0d7, $00, $00, $00
	dc.b $0cf, $00, $00, $00, $0c3, $00, $0cf, $00
	dc.b $0df, $00, $0df, $00, $0df, $00, $0e1, $00
	dc.b $0df, $00, $00, $00, $00, $00, $0c3, $00
	dc.b $0e1, $00, $00, $00, $0df, $00, $00, $00
	dc.b $0cf, $00, $00, $00, $0cf, $00, $0cf, $00
	dc.b $0db, $00, $00, $00, $0d7, $00, $0d1, $00
	dc.b $0d7, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0cf, $00, $0d7, $00
	dc.b $0db, $00, $00, $00, $0e1, $00, $00, $00
	dc.b $0df, $00, $0cf, $00, $00, $00, $0d7, $00
	dc.b $0db, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0cf, $00, $0d7, $00
	dc.b $0db, $00, $00, $00, $0e1, $00, $00, $00
	dc.b $0df, $00, $0cf, $00, $00, $00, $0d7, $00
	dc.b $0db, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $01
musCh1	dc.b $0d9, $00, $00, $0e1, $00, $00, $0d7, $00
	dc.b $00, $0d9, $00, $00, $0d1, $00, $00, $0d7
	dc.b $00, $00, $0cb, $00, $00, $0c9, $00, $00
	dc.b $0bb, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $00, $00, $00, $0e1, $00, $00, $0d7, $00
	dc.b $00, $0d9, $00, $00, $0d1, $00, $00, $0d7
	dc.b $00, $00, $0d9, $00, $00, $0dd, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0d1, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0d1, $00, $00, $0d1, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $00, $00
	dc.b $00, $0e1, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d7
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $0d7, $00, $00, $0d1, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0d1, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0d1, $00, $00, $0d1, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $00, $00
	dc.b $00, $0e1, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d7
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $0d7, $00, $00, $0d1, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0d1, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0d1, $00, $00, $0d1, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $00, $00
	dc.b $00, $0e1, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d7
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $0d7, $00, $00, $0d1, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0d1, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0d1, $00, $00, $0d1, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $00, $00
	dc.b $00, $0e1, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d7
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0d9
	dc.b $00, $00, $0d7, $00, $00, $0d1, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0d1, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0e1, $00, $00, $0e1, $00, $00
	dc.b $0e4, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $0e4, $00, $00, $0e4
	dc.b $00, $00, $0dd, $00, $00, $0dd, $00, $00
	dc.b $0d1, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0e1, $00, $00, $0e1, $00, $00
	dc.b $0e4, $00, $00, $0dd, $00, $00, $0dd, $00
	dc.b $00, $0dd, $00, $00, $0e4, $00, $00, $0e4
	dc.b $00, $00, $0dd, $00, $00, $0dd, $00, $00
	dc.b $0d1, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0e1, $00, $00, $0e1, $00, $00
	dc.b $0e4, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $0dd, $00, $00, $0e4, $00, $00, $0e4
	dc.b $00, $00, $0dd, $00, $00, $0dd, $00, $00
	dc.b $0d1, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $0d1, $00, $00, $0d9, $00, $00, $0d9
	dc.b $00, $00, $0e1, $00, $00, $0e1, $00, $00
	dc.b $0e4, $00, $00, $0dd, $00, $00, $0dd, $00
	dc.b $00, $0dd, $00, $00, $0e4, $00, $00, $0e4
	dc.b $00, $00, $0dd, $00, $00, $0dd, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0d9, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $0d1, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $0d9, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $0d1, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0d1, $00, $00, $0d1
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $0d1, $00, $00, $0d1, $00, $00, $0e1, $00
	dc.b $00, $0e1, $00, $00, $00, $00, $00, $0e1
	dc.b $00, $00, $00, $00, $00, $0d9, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0dd, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0dd
	dc.b $00, $00, $00, $00, $00, $0d7, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0dd, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0dd
	dc.b $00, $00, $00, $00, $00, $0d9, $00, $00
	dc.b $0d7, $00, $00, $0d1, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0d1, $00, $00, $0d1
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $0d1, $00, $00, $0d1, $00, $00, $0e1, $00
	dc.b $00, $0e1, $00, $00, $00, $00, $00, $0e1
	dc.b $00, $00, $00, $00, $00, $0d9, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0dd, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0dd
	dc.b $00, $00, $00, $00, $00, $0d7, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0dd, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0dd
	dc.b $00, $00, $00, $00, $00, $0d9, $00, $00
	dc.b $0d7, $00, $00, $0d1, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $0d1, $00, $00, $0d1
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $0e4, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0dd
	dc.b $00, $00, $0e4, $00, $00, $0e4, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $0d1, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $0d1
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $0e4, $00
	dc.b $00, $0dd, $00, $00, $0dd, $00, $00, $0dd
	dc.b $00, $00, $0e4, $00, $00, $0e4, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $0d1, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $0d1
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $0e4, $00
	dc.b $00, $0dd, $00, $00, $00, $00, $00, $0dd
	dc.b $00, $00, $0e4, $00, $00, $0e4, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $0d1, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $0d1
	dc.b $00, $00, $0d9, $00, $00, $0d9, $00, $00
	dc.b $0e1, $00, $00, $0e1, $00, $00, $0e4, $00
	dc.b $00, $0dd, $00, $00, $0dd, $00, $00, $0dd
	dc.b $00, $00, $0e4, $00, $00, $0e4, $00, $00
	dc.b $0dd, $00, $00, $0dd, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $0d9, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $0d1, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $00, $00, $0d9, $00, $00, $00, $00, $00
	dc.b $00, $00, $00, $0d1, $00, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $0d9, $00, $00
	dc.b $0d9, $00, $00, $0d9, $00, $00, $0d9, $00
	dc.b $00, $00, $00, $00, $0d1, $00, $00, $00
	dc.b $00, $00, $00, $00, $00, $00, $0d9, $00
	dc.b $00, $00, $00, $00, $00, $00, $00, $0d1
	dc.b $00, $00, $00, $00, $00, $00, $00, $00
	dc.b $01
	
	
	; ***********  Defining procedure : initVbm
	;    Procedure type : User-defined procedure
	
	; Initialise the core VBM (Vic20 Bitmap Mode) library
	; Created by Andy H - Hewco.uk for use in Turbo Rascal
	; See help to get started, all commmands begin with 'vbm'
; Screen address table Low byte / high byte
vbmScrL = $0c ; 20 bytes
;    dc.b 0,0,0,0,0,0,0,0,0,0
;    dc.b 0,0,0,0,0,0,0,0,0,0
vbmScrH = $20 ; 20 bytes
;    dc.b 0,0,0,0,0,0,0,0,0,0
;    dc.b 0,0,0,0,0,0,0,0,0,0
; ends at $32
vbm9000     = $00 ; store $9000 address value
vbm9001     = $01 ; store $9001 address value
vbm9005     = $02 ; store $9005 address value
vbmX        = $03 ; x position
vbmY        = $04 ; y position
vbmI        = $05 ; index
vbmJ        = $06 ; index
vbmT        = $07 ; index
vbmScroll   = $08    ; 16 - character scroll start
vbmNumColumns = $09  ; 20 -number of columns
vbmScrLstart = $0a   ; $00 - start address for bitmap L
vbmScrHstart = $0b   ; $11 - start address for bitmap H
vbmSetDisplayMode
    ; initialise
    lda #16 ; start char
    sta vbmScroll
    lda #$00 ; address L
    sta vbmScrLstart
    lda #$11 ; address H
    sta vbmScrHstart
    lda $9000
    sta vbm9000
    cmp #$c;keep
    beq vbmIsPal
    lda $9000	; Adjust horizontal position for NTSC
    clc
    adc #1
    sta $9000
    jmp vbmIsNtsc
	
vbmIsPal
    lda $9000	; Adjust horizontal position for PAL
    clc
    adc #2
    sta $9000
vbmIsNtsc
    lda #25		; (12x2) + 1
    sta $9003	; set screen height to 12 double height chars
    lda vbmNumColumns ;#20
    sta $9002	; set screen width to 20 characters
    cmp #20
    beq vbmSDM_noadjust
    lda $9000	; 19 column mode, move horiz position another 4 pixels right to centre
    clc
    adc #1
    sta $9000
vbmSDM_noadjust
    lda $9001
    sta vbm9001
    sec
    sbc #1
    sta $9001	; adjust vertical position
    lda $9005
    sta vbm9005
    lda #%11001100	; 204 - set screen and character to $1000
    sta $9005
    jsr vbmLayoutCharacters
    jsr vbmCreateColumnAddresses
    rts
;; Write column start addresses
vbmCreateColumnAddresses
    ; address table for logical character memory
    ; (bitmap x start addresses)
    ldx #0
    lda vbmScrLstart    ; L start address of bitmap
    sta vbmScrL,x
    ldy vbmScrHstart    ; H start address of bitmap
    tya
    sta vbmScrH,x
vbmAddrTable2
    lda vbmScrL,x
    inx
    clc
    adc #192 ; height of screen in pixels
    bcc vbmNoOverflow2
    iny
vbmNoOverflow2
    sta vbmScrL,x
    tya
    sta vbmScrH,x
    cpy #$20             ; address needs to wrap back around?
    bne vbmAddrTable3
    ; reset address to start of memory VIC bitmap
    lda #$00
    sta vbmScrL,x
    ldy #$11
    tya
    sta vbmScrH,x
vbmAddrTable3
    cpx #19		; width in characters-1
    bcc vbmAddrTable2
    rts
;; Draw character map to screen to form bitmap layout
vbmLayoutCharacters
    ; Layout characters on screen
    lda vbmScroll 	; character to start drawing with (16)
    sta vbmI            ; character
    lda #0
    sta vbmX
vbmXDrawForLoop
    lda #0
    sta vbmY
    ; screen start
    lda #$00
    ldy #$10
    sta screenmemory
    sty screenmemory+1
vbmYDrawForLoop
    lda vbmI
    ldy vbmX
    sta (screenmemory),y
    ; add 20 for next row (or 19)
    lda screenmemory
    clc
    adc vbmNumColumns ; 20
    sta screenmemory
    bcc vbmYDrawForLoopOverflow
    inc screenmemory+1
vbmYDrawForLoopOverflow
    inc vbmY
    inc vbmI    ; character
    bne vbmDrawForLoopResetChar
    lda #16     ; reset character
    sta vbmI
vbmDrawForLoopResetChar
    lda #12	; comapare 12 rows
    cmp vbmY ;keep
    bne vbmYDrawForLoop ; loop rows
    inc vbmX
    lda vbmNumColumns	; compare 20 columns
    cmp vbmX ;keep
    bne vbmXDrawForLoop	; loop columns
	rts
	
	
	; ***********  Defining procedure : initVbmClear
	;    Procedure type : User-defined procedure
	
	; VBM Clear bitmap routine
vbmClear
	; Address of bitmap $1100
	lda #0
	ldx #17
	sta screenmemory
	stx screenmemory+1
	sta vbmX
vbmClearForX
	lda #0
	sta vbmY
vbmClearForY
	lda vbmI ; vbmI contains byte to clear bitmap with
	ldy vbmY
	sta (screenmemory),y
	inc vbmY
	lda #192    ; reached end of row?
	cmp vbmY ;keep
	bne vbmClearForY
	lda screenmemory
	clc
	adc #192
	bcc vbmClearXOverflow
	inc screenmemory+1
vbmClearXOverflow
	sta screenmemory
	inc vbmX
	lda #20 ; reched end of column?
	cmp vbmX ;keep
	bne vbmClearForX
    ; bitmap has been cleared
	rts
	
	
	; ***********  Defining procedure : initVbmDrawSprite8E
	;    Procedure type : User-defined procedure
	
	; VBM - draw an 8x8 sprite with EOR - use vbmSetPosition first
	; Left Side = $80
	; Right side = $82
vbmDrawSprite8E
	; draw left side
	ldy #0
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($80),y
	eor (screenmemory),y
	sta (screenmemory),y
	; move screenmemory to next column
	lda screenmemory
	clc
	adc #192 ; next column
	bcc vbmDS8E_overflow
	inc screenmemory+1
vbmDS8E_overflow
	sta screenmemory
	lda vbmX
	bne vbmDS8E_Right
	rts ; in position 0 there is no right side to draw
vbmDS8E_Right
	; draw right side
	ldy #0
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	iny
	lda ($82),y
	eor (screenmemory),y
	sta (screenmemory),y
	rts
	
	
	; ***********  Defining procedure : initVbmSetPosition
	;    Procedure type : User-defined procedure
	
	; ----------
	; init vbmSetPosition
vbmSetPosition
    lda vbmX ; x position
    pha      ; store x position for later
    lsr      ; divide by 8 to get column number
    lsr
    lsr
    tax      ; locate address of start of column
    lda vbmScrL,x
    ldy vbmScrH,x
    clc
    adc vbmY ; add y position
    bcc vbmSPos_noOverflow
    iny ; overflow
vbmSPos_noOverflow
    sta screenmemory   ; set screenmemory to the correct address in the bitmap
    sty screenmemory+1
    pla      ; retrieve x position
    rts
; call to set position on bitmap supporting 8 shifted x positions
vbmSetPosition1
    jsr vbmSetPosition
    and #7   ; get x offset 0-7
    sta vbmX ; for use in sprite routines
    rts
; call to set position on bitmap supporting 4 shifted x positions
vbmSetPosition2
    jsr vbmSetPosition
    and #7   ; get x offset 0-7
    lsr
    sta vbmX ; for use in sprite routines
    rts
; call to set position on bitmap supporting 2 shifted x positions
vbmSetPosition4
    jsr vbmSetPosition
    and #7   ; get x offset 0-7
    lsr
    lsr
    sta vbmX ; for use in sprite routines
	rts
	
	
	; ***********  Defining procedure : init_viairq
	;    Procedure type : User-defined procedure
	
init_via_irq:
  ldx #0       ; wait for this raster line (times 2)
A0_vic_raster:
  cpx $9004
  bne A0_vic_raster        ; at this stage, the inaccuracy is 7 clock cycles
                ; the processor is in this place 2 to 9 cycles
                ; after $9004 has changed
  ldy #9
  bit $24
A1_vic_raster:
  ldx $9004
  txa
  bit $24
  ldx #24
  dex
  bne *-1       ; first spend some time (so that the whole
  cmp $9004     ; loop will be 2 raster lines)
  bcs *+2       ; save one cycle if $9004 changed too late
  dey
  bne A1_vic_raster
                ; now it is fully synchronized
                ; 6 cycles have passed since last $9004 change
                ; and we are on line 2(28+9)=74
;initialize the timers
  lda #$40      ; enable Timer A free run of both VIAs
  sta $911b
  sta $912b
        ; 312*71-2 = $568
timers_vic_raster:
  lda #$56
  ldx #$86
  sta $9116     ; load the timer low byte latches
  sta $9126
  ldy #7        ; make a little delay to get the raster effect to the
  dey           ; right place
  bne *-1
  nop
  nop
  stx $9125     ; start the IRQ timer A
                ; 6560-101: 65 cycles from $9004 change
                ; 6561-101: 77 cycles from $9004 change
  ldy #10       ; spend some time (1+5*9+4=55 cycles)
  dey           ; before starting the reference timer
  bne *-1
  stx $9115     ; start the reference timer
pointers_vic_raster:
  lda #00     ; set the raster IRQ routine pointer
  sta $314
  lda #00
  sta $315
  lda #$c0
  sta $912e     ; enable Timer A underflow interrupts
  rts
	rts
	
	
	; ***********  Defining procedure : initjoy1
	;    Procedure type : Built-in function
	;    Requires initialization : no
	
	; ----------
	; ReadJoy1 and ReadJoy2 (on supported platforms)
	; populates joy1 and joy1pressed which can be tested by AND-ing with the following constants:
;JOY_DOWN  = %00000100
;JOY_UP    = %00000010
;JOY_LEFT  = %00001000
;JOY_RIGHT = %00000001
;JOY_FIRE  = %00010000
VIC20_PORTACASS = $911F
VIC20_PORTBVIA2 = $9120  ; Port B 6522 2 value (joystick)
VIC20_PORTBVIA2d = $9122 ; Port B 6522 2 direction (joystick)
joy1 .byte 0
joy1last .byte 0
joy1pressed .byte 0
callReadJoy1
	LDA VIC20_PORTACASS
	EOR #$FF
	AND #$3C
	LDX #$7F
	SEI
	STX VIC20_PORTBVIA2d
	LDY VIC20_PORTBVIA2
	BMI initjoy1_JoySkip18467
	ORA #$02
initjoy1_JoySkip18467
	LDX #$FF
	STX VIC20_PORTBVIA2d
	CLI
	LSR
	STA joy1
	eor joy1last
	and joy1
	sta joy1pressed
	lda joy1
	sta joy1last
	rts
	
	
	; ***********  Defining procedure : initrandom256
	;    Procedure type : Built-in function
	;    Requires initialization : no
	
	; init random256
Random
	lda #$01
	asl
	bcc initrandom256_RandomSkip6334
	eor #$4d
initrandom256_RandomSkip6334
	sta Random+1
	eor $9124
	rts
	
; // Music pointer
; // -------------------------------------------------------------------------------
; // Data
; // player sprites
; // S E H M
; // S E H M
; // S E H M
; // S E H M
; // forest graphics
; // S E H M
; // S W H M
; // memory - load addresses
; // incbin data
; // Include Resources and variables
; // -------------------------------------------------------------------------------
; // -------------------------------------------------------------------------------
; // look up data
; // -------------------------------------------------------------------------------
; // ------------- Player sprite look up addresses -------------
; // pre-shifted addresses for Player Right - side A
; // pre-shifted addresses for Player Right - side B
; // pre-shifted addresses for Player Left - side A
; // pre-shifted addresses for Player Left - side B
; // pre-shifted addresses for Player Vert1 - side A
; // pre-shifted addresses for Player Vert1 - side B
; // pre-shifted addresses for Player Vert21 - side A
; // pre-shifted addresses for Player Vert2 - side B
; // -------------------------------------------------------------------------------
; // ------------- Colour memory look up addresses -------------
; // -------------------------------------------------------------------------------
; // Music - A Stillness in the Rain - snd ch3, sp 3 (or 4)
; // Music - Princess Mononoke Theme - snd ch2, sp 6 (5 or 4)
; // Music - Mad World - ch1, sp 5
; // -------------------------------------------------------------------------------
; // source files
	
	
	; ***********  Defining procedure : Music_Play
	;    Procedure type : User-defined procedure
	
Music_Play
	; Assigning single variable : musTime
	inc musTime
	
; //m2 := m2 + 1;
	; Full binary clause
	; Binary clause: GREATER
	lda musTime
	; Compare with pure num / var optimization
	cmp musDelay;keep
	; BC done
	bcc Music_Play_binaryclausefailed28703
	beq Music_Play_binaryclausefailed28703
Music_Play_binaryclausesuccess31322
	lda #1; success
	jmp Music_Play_binaryclausefinished23811
Music_Play_binaryclausefailed28703
	lda #0 ; failed state
Music_Play_binaryclausefinished23811
	cmp #1
	beq Music_Play_ConditionalTrueBlock15724
	jmp Music_Play_elsedoneblock29358
Music_Play_ConditionalTrueBlock15724
	; Assigning single variable : musTime
	; Load pointer array
	ldy #$0
	lda (m1),y
	
	sta musTime
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne Music_Play_elsedoneblock7711
Music_Play_ConditionalTrueBlock4664
	
; // reached end - restart music after intro part
	; Assigning single variable : m1
	lda #<musCh1
	ldx #>musCh1
	sta m1
	stx m1+1
	
; //m2 := musCh1;
	; Assigning single variable : musTime
	; Load pointer array
	ldy #$0
	lda (m1),y
	
	sta musTime
Music_Play_elseblock15141
Music_Play_elsedoneblock7711
	; Binary clause Simplified: NOTEQUALS
	lda musTime
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq Music_Play_elsedoneblock32757
Music_Play_ConditionalTrueBlock27644
	; Assigning memory location
	; Assigning single variable : $900a
	lda musTime
	sta $900a
	; Assigning single variable : musSustain
	lda #0
	sta musSustain
Music_Play_elseblock32662
Music_Play_elsedoneblock32757
	; Binary clause Simplified: EQUALS
	lda musTime
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne Music_Play_elsedoneblock778
Music_Play_ConditionalTrueBlock9741
	; Assigning single variable : musSustain
	inc musSustain
Music_Play_elseblock27529
Music_Play_elsedoneblock778
	; Binary clause: EQUALS
	lda musSustain
	; Compare with pure num / var optimization
	cmp #$6;keep
	; BC done
	bne Music_Play_tempfail8942
Music_Play_binaryclausesuccess22648
	jmp Music_Play_ConditionalTrueBlock1842
Music_Play_tempfail8942
	; Binary clause: NOTEQUALS
	; Load pointer array
	ldy #$1
	lda (m1),y
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	; BC done
	beq Music_Play_elseblock288
Music_Play_binaryclausesuccess23805
Music_Play_ConditionalTrueBlock1842
	; Assigning memory location
	; Assigning single variable : $900a
	lda #0
	sta $900a
	; Assigning single variable : musSustain
	sta musSustain
Music_Play_elseblock288
Music_Play_elsedoneblock30106
	; Assigning memory location
	; Assigning single variable : $900e
	; 8 bit binop
	; Add/sub right value is variable/expression
	lda musSustain
	lsr
	lsr
	
Music_Play_rightvarAddSub_var6729 = $88
	sta Music_Play_rightvarAddSub_var6729
	lda #3
	sec
	sbc Music_Play_rightvarAddSub_var6729
	
	sta $900e
	
; //musTime := m2[0];
; //SOUND3_REGISTER := musTime;
	; Assigning single variable : musTime
	lda #0
	sta musTime
	
; // next note	
	; Assigning single variable : m1
	; WORD optimization: a=a+b
	lda m1+0
	
	clc
	adc #1
	bcc Music_Play_WordAdd24370
	inc m1+1
Music_Play_WordAdd24370
	sta m1+0
Music_Play_elseblock11478
Music_Play_elsedoneblock29358
	rts
	
; // Vertical Blank Interrupt
	
	
	; ***********  Defining procedure : vbl_Interrupt
	;    Procedure type : User-defined procedure
	
vbl_Interrupt
	; StartIRQ
	pha
	txa
	pha
	tya
	pha
	; Assigning memory location
	; Assigning single variable : $900f
	lda #15
	
	sta $900f
	; Assigning single variable : ticks
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	lda ticks
	clc
	adc #1
	 ; end add / sub var with constant
	
	and #63
	 ; end add / sub var with constant
	
	sta ticks
	jsr Music_Play
	; Assigning memory location
	; Assigning single variable : $900f
	lda #8
	
	sta $900f
	; CloseIRQ
	pla
	tay
	pla
	tax
	pla
	 jmp $eabf     ; return to normal IRQ	
	rti
	
; // Set up VBL interrupt
	
	
	; ***********  Defining procedure : Vbl_Init
	;    Procedure type : User-defined procedure
	
Vbl_Init
	lda #$7f
	sta $912e ; disable and acknowledge interrupts
	sta $912d
	; Binary clause Simplified: EQUALS
	lda $9000
	; Compare with pure num / var optimization
	cmp #$c;keep
	bne Vbl_Init_elseblock3548
Vbl_Init_ConditionalTrueBlock24393
	
; // Time the interrupt directly with the raster (PAL);
; // 312 scanlines * 71 cycles -2 = $5686
; //VIAIRQ(vbl(), $86, $56);
	lda #<vbl_Interrupt
	sta pointers_vic_raster+1
	lda #>vbl_Interrupt
	sta pointers_vic_raster+6
	ldx #121 ; optimized, look out for bugs
	lda #0
	bne Vbl_Init_viarasterirq_ntsc_timing11840
	lda #$86
	sta timers_vic_raster+1
	lda #$56
	sta timers_vic_raster+3
	jsr A0_vic_raster
	jmp Vbl_Init_viarasterirq_end4966
Vbl_Init_viarasterirq_ntsc_timing11840
	lda #$43
	sta timers_vic_raster+1
	lda #$42
	sta timers_vic_raster+3
	jsr A0_vic_raster
Vbl_Init_viarasterirq_end4966
	jmp Vbl_Init_elsedoneblock19629
Vbl_Init_elseblock3548
	
; // Time the interrupt directly with the raster (NTSC);
; //VIAIRQ(vbl(), $43, $42);
	lda #<vbl_Interrupt
	sta pointers_vic_raster+1
	lda #>vbl_Interrupt
	sta pointers_vic_raster+6
	ldx #107 ; optimized, look out for bugs
	lda #1
	bne Vbl_Init_viarasterirq_ntsc_timing13931
	lda #$86
	sta timers_vic_raster+1
	lda #$56
	sta timers_vic_raster+3
	jsr A0_vic_raster
	jmp Vbl_Init_viarasterirq_end26308
Vbl_Init_viarasterirq_ntsc_timing13931
	lda #$43
	sta timers_vic_raster+1
	lda #$42
	sta timers_vic_raster+3
	jsr A0_vic_raster
Vbl_Init_viarasterirq_end26308
Vbl_Init_elsedoneblock19629
	rts
	
	
	; ***********  Defining procedure : Level_Generate
	;    Procedure type : User-defined procedure
	
Level_Generate
	; Assigning single variable : j
	lda #0
	sta j
Level_Generate_for32439
Level_Generate_forLoopFix6483
	
; // X position
	; ----------
	; vbmSetColumn in ScreenMemory ZP - column offset
	; column is complex
	ldx j ; optimized, look out for bugs
	lda vbmScrL,x   ; Address of table lo
	ldy vbmScrH,x   ; Address of table hi
	sta screenmemory   ; Set sceenmemory to start of column lo
	sty screenmemory+1 ; Set sceenmemory to start of column hi
	; Binary clause Simplified: EQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda j
	and #2
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne Level_Generate_elsedoneblock9374
Level_Generate_ConditionalTrueBlock10291
	; Assigning single variable : k
	lda #10
	sta k
Level_Generate_elseblock30836
Level_Generate_elsedoneblock9374
	; Assigning single variable : i
	lda #0
	sta i
Level_Generate_for24021
Level_Generate_forLoopFix31556
	
; // Y position
	; Assigning single variable : screenmemory
	; WORD optimization: a=a+b
	lda screenmemory+0
	
	clc
	adc #8
	bcc Level_Generate_WordAdd11008
	inc screenmemory+1
Level_Generate_WordAdd11008
	sta screenmemory+0
	; Full binary clause
	; Binary clause: GREATER
	lda k
	; Compare with pure num / var optimization
	cmp #$0;keep
	; BC done
	bcc Level_Generate_binaryclausefailed6618
	beq Level_Generate_binaryclausefailed6618
Level_Generate_binaryclausesuccess19796
	lda #1; success
	jmp Level_Generate_binaryclausefinished20580
Level_Generate_binaryclausefailed6618
	lda #0 ; failed state
Level_Generate_binaryclausefinished20580
	cmp #1
	beq Level_Generate_ConditionalTrueBlock32609
	jmp Level_Generate_elsedoneblock32702
Level_Generate_ConditionalTrueBlock32609
	; Binary clause Simplified: EQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	jsr Random
	
	and #3
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne Level_Generate_elsedoneblock28009
Level_Generate_ConditionalTrueBlock19589
	; Assigning single variable : k
	dec k
	; Assigning single variable : m
	; 8 bit binop
	; Add/sub where right value is constant number
	jsr Random
	
	and #3
	 ; end add / sub var with constant
	
	asl
	asl
	asl
	
	sta m
	; Assigning single variable : p1
	
	; HandleVarBinopB16bit
	ldy #0 ; Fake 16 bit
	lda m
Level_Generate_rightvarInteger_var6038 = $88
	sta Level_Generate_rightvarInteger_var6038
	sty Level_Generate_rightvarInteger_var6038+1
	
	lda #>chrGfx
	clc
	adc Level_Generate_rightvarInteger_var6038+1
	tay
	lda #<chrGfx
	clc
	adc Level_Generate_rightvarInteger_var6038
	bcc Level_Generate_wordAdd12292
	iny
Level_Generate_wordAdd12292
	
	sta p1
	sty p1+1
	ldy #$0
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
	iny
	lda (p1),y
	ora (screenmemory),y
	sta (screenmemory),y
Level_Generate_elseblock20798
Level_Generate_elsedoneblock28009
Level_Generate_elseblock14989
Level_Generate_elsedoneblock32702
	inc i
	lda #23
	cmp i ;keep
	beq Level_Generate_forLoopDone22798
Level_Generate_forLoopNotDone30303
	jmp Level_Generate_for24021
Level_Generate_forLoopDone22798
	inc j
	lda #20
	cmp j ;keep
	beq Level_Generate_forLoopDone27595
Level_Generate_forLoopNotDone4041
	jmp Level_Generate_for32439
Level_Generate_forLoopDone27595
	rts
	
; // Set the animation pointers for the Player
	
	
	; ***********  Defining procedure : Player_SetAnimation
	;    Procedure type : User-defined procedure
	
Player_SetAnimation
	; Assigning single variable : pa
	
	; Load Integer array
	ldx pd
	txa   ; watch for bug, Integer array has index range of 0 to 127
	asl
	tax
	lda sprDir,x
	ldy sprDir+1,x
	
	
	sta pa
	sty pa+1
	; Assigning single variable : pb
	
	; Load Integer array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda pd
	clc
	adc #1
	 ; end add / sub var with constant
	
	asl
	tax
	lda sprDir,x
	ldy sprDir+1,x
	
	
	sta pb
	sty pb+1
	rts
block41
	
; // -------------------------------------------------------------------------------
; // **** MAIN PROGRAM ****
	; Assigning single variable : m1
	lda #<musCh1
	ldx #>musCh1
	sta m1
	stx m1+1
	
; //m2 := musCh1;
	; Assigning single variable : musDelay
	lda #5
	sta musDelay
	; Assigning single variable : musTime
	lda #0
	sta musTime
	jsr Vbl_Init
	
; // call before set display mode
screenmemory =  $fe
	; Set special display mode for VBM bitmap graphics
	lda #20
	sta vbmNumColumns
	jsr vbmSetDisplayMode
	; Clear VBM bitmap
	lda #0
	sta vbmI ; byte to clear bitmap with
	jsr vbmClear
	lda #$93
	sta screenmemory+1
	lda #$ff
	sta screenmemory
	lda #5
	ldy #241 ; colour mem to clear (stops at zero so +1)
MainProgram_vbmCC_loop18190
	sta (screenmemory),y
	dey
	bne MainProgram_vbmCC_loop18190
	; Assigning memory location
	; Assigning single variable : $900e
	lda #2
	sta $900e
	; Assigning memory location
	; Assigning single variable : $900f
	lda #8
	
	sta $900f
	jsr Level_Generate
	; Assigning single variable : p1
	lda #<chrTest
	ldx #>chrTest
	sta p1
	stx p1+1
	; Assigning single variable : j
	lda #0
	sta j
MainProgram_for29657
	; ----------
	; vbmSetColumn in ScreenMemory ZP - column offset
	; column is complex
	ldx j ; optimized, look out for bugs
	lda vbmScrL,x   ; Address of table lo
	ldy vbmScrH,x   ; Address of table hi
	sta screenmemory   ; Set sceenmemory to start of column lo
	sty screenmemory+1 ; Set sceenmemory to start of column hi
	; Assigning single variable : i
	lda #0
	sta i
MainProgram_for22646
	ldy #$0
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	iny
	lda (p1),y
	sta (screenmemory),y
	; Assigning single variable : screenmemory
	; WORD optimization: a=a+b
	lda screenmemory+0
	
	clc
	adc #8
	bcc MainProgram_WordAdd20142
	inc screenmemory+1
MainProgram_WordAdd20142
	sta screenmemory+0
	; Assigning single variable : p1
	; WORD optimization: a=a+b
	lda p1+0
	
	clc
	adc #8
	bcc MainProgram_WordAdd23844
	inc p1+1
MainProgram_WordAdd23844
	sta p1+0
	inc i
	lda #5
	cmp i ;keep
	bne MainProgram_for22646
MainProgram_forLoopDone28433
	inc j
	lda #5
	cmp j ;keep
	bne MainProgram_for29657
MainProgram_forLoopDone20055
	; Assigning single variable : pd
	lda #0
	sta pd
	jsr Player_SetAnimation
MainProgram_while1416
	; Full binary clause
	; Binary clause: NOTEQUALS
	lda #1
	; Compare with pure num / var optimization
	cmp #$0;keep
	; BC done
	beq MainProgram_binaryclausefailed9905
MainProgram_binaryclausesuccess7391
	lda #1; success
	jmp MainProgram_binaryclausefinished17958
MainProgram_binaryclausefailed9905
	lda #0 ; failed state
MainProgram_binaryclausefinished17958
	cmp #1
	beq MainProgram_ConditionalTrueBlock21881
	jmp MainProgram_elsedoneblock10322
MainProgram_ConditionalTrueBlock21881
	; ----------
	; vbmSetPosition2 x, y
	; y is complex
	lda py
	sta vbmY
	; x is complex
	lda px
	sta vbmX
	jsr vbmSetPosition2
	; Read address 1
	; Read address 2
	lda vbmX ; x offset 0-7
	asl ; for simplicty, storing lo, hi in one array
	tay
	lda (pa),y
	sta $80
	iny
	lda (pa),y
	sta $80+1
	dey
	lda (pb),y
	sta $82
	iny
	lda (pb),y
	sta $82+1
	jsr vbmDrawSprite8E
	; Assigning memory location
	; Assigning single variable : $900f
	lda #8
	
	sta $900f
MainProgram_while3625
	; Binary clause Simplified: EQUALS
	lda ticks
	; Compare with pure num / var optimization
	cmp oldticks;keep
	bne MainProgram_elsedoneblock9314
MainProgram_ConditionalTrueBlock26477
	jmp MainProgram_while3625
MainProgram_elseblock4414
MainProgram_elsedoneblock9314
	; Assigning single variable : oldticks
	lda ticks
	sta oldticks
	; Assigning memory location
	; Assigning single variable : $900f
	lda #11
	
	sta $900f
	; ----------
	; vbmSetPosition2 x, y
	; y is complex
	lda py
	sta vbmY
	; x is complex
	lda px
	sta vbmX
	jsr vbmSetPosition2
	; Read address 1
	; Read address 2
	lda vbmX ; x offset 0-7
	asl ; for simplicty, storing lo, hi in one array
	tay
	lda (pa),y
	sta $80
	iny
	lda (pa),y
	sta $80+1
	dey
	lda (pb),y
	sta $82
	iny
	lda (pb),y
	sta $82+1
	jsr vbmDrawSprite8E
	; Full binary clause
	; Binary clause: EQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda ticks
	and #1
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	; BC done
	bne MainProgram_binaryclausefailed12550
MainProgram_binaryclausesuccess13694
	lda #1; success
	jmp MainProgram_binaryclausefinished140
MainProgram_binaryclausefailed12550
	lda #0 ; failed state
MainProgram_binaryclausefinished140
	cmp #1
	beq MainProgram_ConditionalTrueBlock24372
	jmp MainProgram_elsedoneblock11833
MainProgram_ConditionalTrueBlock24372
	jsr callReadJoy1
	; Binary clause Simplified: EQUALS
	lda 197
	
	; Compare with pure num / var optimization
	cmp #$c;keep
	bne MainProgram_elsedoneblock26576
MainProgram_ConditionalTrueBlock28019
	
; // force in keyboard
	; Assigning single variable : joy1
	lda #2
	sta joy1
MainProgram_elseblock2125
MainProgram_elsedoneblock26576
	; Binary clause Simplified: EQUALS
	lda 197
	
	; Compare with pure num / var optimization
	cmp #$2c;keep
	bne MainProgram_elsedoneblock4678
MainProgram_ConditionalTrueBlock17371
	; Assigning single variable : joy1
	lda #4
	sta joy1
MainProgram_elseblock22466
MainProgram_elsedoneblock4678
	; Binary clause Simplified: EQUALS
	lda 197
	
	; Compare with pure num / var optimization
	cmp #$14;keep
	bne MainProgram_elsedoneblock21119
MainProgram_ConditionalTrueBlock1018
	; Assigning single variable : joy1
	lda #8
	sta joy1
MainProgram_elseblock28464
MainProgram_elsedoneblock21119
	; Binary clause Simplified: EQUALS
	lda 197
	
	; Compare with pure num / var optimization
	cmp #$15;keep
	bne MainProgram_elsedoneblock9010
MainProgram_ConditionalTrueBlock31060
	; Assigning single variable : joy1
	lda #1
	sta joy1
MainProgram_elseblock1926
MainProgram_elsedoneblock9010
	; Binary clause Simplified: NOTEQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda joy1
	and #2
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock12043
MainProgram_ConditionalTrueBlock9576
	; Assigning single variable : py
	; Optimizer: a = a +/- b
	lda py
	sec
	sbc #2
	sta py
	; Assigning single variable : pd
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	and #4
	 ; end add / sub var with constant
	
	lsr
	
	clc
	adc #4
	 ; end add / sub var with constant
	
	sta pd
	jsr Player_SetAnimation
MainProgram_elseblock30227
MainProgram_elsedoneblock12043
	; Binary clause Simplified: NOTEQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda joy1
	and #4
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock29565
MainProgram_ConditionalTrueBlock7882
	; Assigning single variable : py
	; Optimizer: a = a +/- b
	lda py
	clc
	adc #2
	sta py
	; Assigning single variable : pd
	; 8 bit binop
	; Add/sub where right value is constant number
	; 8 bit binop
	; Add/sub where right value is constant number
	and #4
	 ; end add / sub var with constant
	
	lsr
	
	clc
	adc #4
	 ; end add / sub var with constant
	
	sta pd
	jsr Player_SetAnimation
MainProgram_elseblock17086
MainProgram_elsedoneblock29565
	; Binary clause Simplified: NOTEQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda joy1
	and #8
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock5629
MainProgram_ConditionalTrueBlock2625
	; Assigning single variable : px
	; Optimizer: a = a +/- b
	lda px
	sec
	sbc #2
	sta px
	; Assigning single variable : pd
	lda #2
	sta pd
	jsr Player_SetAnimation
MainProgram_elseblock25627
MainProgram_elsedoneblock5629
	; Binary clause Simplified: NOTEQUALS
	; 8 bit binop
	; Add/sub where right value is constant number
	lda joy1
	and #1
	 ; end add / sub var with constant
	
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock123
MainProgram_ConditionalTrueBlock6902
	; Assigning single variable : px
	; Optimizer: a = a +/- b
	lda px
	clc
	adc #2
	sta px
	; Assigning single variable : pd
	lda #0
	sta pd
	jsr Player_SetAnimation
MainProgram_elseblock14962
MainProgram_elsedoneblock123
	; Assigning single variable : cm
	
	; ----------
	; AddressTable address, xoffset, yoffset
	; yoffset is complex
	lda py
	lsr
	lsr
	lsr
	lsr
	asl ; *2
	tax
	lda colmem,x   ; Address of table lo
	ldy colmem+1,x   ; Address of table hi
	; xoffset is complex
	sta $80
	lda px
	lsr
	lsr
	lsr
	clc
	adc $80
	bcc MainProgram_dtnooverflow13261
	iny  ; overflow into high byte
MainProgram_dtnooverflow13261
	
	sta cm
	sty cm+1
	; Assigning single variable : cm
	; Store Variable simplified optimization : right-hand term is pure
	ldy #0 ; optimized, look out for bugs
	lda #1
	sta (cm),y
MainProgram_elseblock20159
MainProgram_elsedoneblock11833
	jmp MainProgram_while1416
MainProgram_elseblock31998
MainProgram_elsedoneblock10322
EndSymbol
EndBlock1376
	org $3a00
sprRight
	incbin "C:/src/EnchantedForest///spr/sprRight.bin"
	org $3a40
sprLeft
	incbin "C:/src/EnchantedForest///spr/sprLeft.bin"
	org $3a80
sprVert1
	incbin "C:/src/EnchantedForest///spr/sprVert1.bin"
	org $3ac0
sprVert2
	incbin "C:/src/EnchantedForest///spr/sprVert2.bin"
	org $3b00
chrGfx
	incbin "C:/src/EnchantedForest///chr/tiles.bin"
	org $3b50
chrTest
	incbin "C:/src/EnchantedForest///chr/test.bin"
