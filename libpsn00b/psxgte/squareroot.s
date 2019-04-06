.set noreorder

.include "gtereg.h"
.include "inline_s.h"

.section .text

.global SquareRoot12
.type SquareRoot12, @function
SquareRoot12:
	mtc2	$a0, C2_LZCS
	nop
	nop
	mfc2	$v0, C2_LZCR
	beq		$v0, 32, $bad_sqr12
	nop
	andi	$t0, $v0, 0x1
	addiu	$v1, $0 , -2
	and		$t2, $v0, $v1
	li		$t1, 19
	sub		$t1, $t2
	sra		$t1, 1
	addi	$t3, $t2, -24
	bltz	$t3, $value_less12
	nop
	sllv	$t4, $a0, $t3
	b		$value_greater12
$value_less12:
	addiu	$t3, $0 , 24
	sub		$t3, $t2
	srav	$t4, $a0, $t3
$value_greater12:
	addi	$t4, -64
	sll		$t4, 1
	la		$t5, sqrt_table
	addu	$t5, $t4
	lh		$t5, 0($t5)
	nop
	
	bltz	$t1, $1594c
	nop
	jr		$ra
	sllv	$v0, $t5, $t1
	
$1594c:

	sub		$t1, $0 , $t1
	jr		$ra
	srl		$v0, $t5, $t1
	
$bad_sqr12:
	jr		$ra
	move	$v0, $0
	
	
.global SquareRoot0
.type SquareRoot0, @function
SquareRoot0:
	mtc2	$a0, C2_LZCS
	nop
	nop
	mfc2	$v0, C2_LZCR
	beq		$v0, 32, $bad_sqr
	nop
	andi	$t0, $v0, 0x1
	addiu	$v1, $0 , -2
	and		$t2, $v0, $v1
	li		$t1, 31
	sub		$t1, $t2
	sra		$t1, 1
	addi	$t3, $t2, -24
	bltz	$t3, $value_less
	nop
	sllv	$t4, $a0, $t3
	b		$value_greater
$value_less:
	addiu	$t3, $0 , 24
	sub		$t3, $t2
	srav	$t4, $a0, $t3
$value_greater:
	addi	$t4, -64
	sll		$t4, 1
	la		$t5, sqrt_table
	addu	$t5, $t4
	lh		$t5, 0($t5)
	nop
	sllv	$t5, $t5, $t1
	jr		$ra
	srl		$v0, $t5, 12
$bad_sqr:
	jr		$ra
	move	$v0, $0
	

.section .data
	
sqrt_table:
	.hword	0x1000,0x101f,0x103f,0x105e,0x107e,0x109c,0x10bb,0x10da
	.hword	0x10f8,0x1116,0x1134,0x1152,0x116f,0x118c,0x11a9,0x11c6
	.hword	0x11e3,0x1200,0x121c,0x1238,0x1254,0x1270,0x128c,0x12a7
	.hword	0x12c2,0x12de,0x12f9,0x1314,0x132e,0x1349,0x1364,0x137e
	.hword	0x1398,0x13b2,0x13cc,0x13e6,0x1400,0x1419,0x1432,0x144c
	.hword	0x1465,0x147e,0x1497,0x14b0,0x14c8,0x14e1,0x14f9,0x1512
	.hword	0x152a,0x1542,0x155a,0x1572,0x158a,0x15a2,0x15b9,0x15d1
	.hword	0x15e8,0x1600,0x1617,0x162e,0x1645,0x165c,0x1673,0x1689
	.hword	0x16a0,0x16b7,0x16cd,0x16e4,0x16fa,0x1710,0x1726,0x173c
	.hword	0x1752,0x1768,0x177e,0x1794,0x17aa,0x17bf,0x17d5,0x17ea
	.hword	0x1800,0x1815,0x182a,0x183f,0x1854,0x1869,0x187e,0x1893
	.hword	0x18a8,0x18bd,0x18d1,0x18e6,0x18fa,0x190f,0x1923,0x1938
	.hword	0x194c,0x1960,0x1974,0x1988,0x199c,0x19b0,0x19c4,0x19d8
	.hword	0x19ec,0x1a00,0x1a13,0x1a27,0x1a3a,0x1a4e,0x1a61,0x1a75
	.hword	0x1a88,0x1a9b,0x1aae,0x1ac2,0xa1d5,0x1ae8,0x1afb,0x1b0e
	.hword	0x1b21,0x1b33,0x1b46,0x1b59,0x1b6c,0x1b7e,0x1b91,0x1ba3
	.hword	0x1bb6,0x1bc8,0x1bdb,0x1bed,0x1c00,0x1c12,0x1c24,0x1c36
	.hword	0x1c48,0x1c5a,0x1c6c,0x1c7e,0x1c90,0x1ca2,0x1cb4,0x1cc6
	.hword	0x1cd8,0x1ce9,0x1cfb,0x1d0d,0x1d1e,0x1d30,0x1d41,0x1d53
	.hword	0x1d64,0x1d76,0x1d87,0x1d98,0x1daa,0x1dbb,0x1dcc,0x1ddd
	.hword	0x1dee,0x1e00,0x1e11,0x1e22,0x1e33,0x1e43,0x1e54,0x1e65
	.hword	0x1e76,0x1e87,0x1e98,0x1ea8,0x1eb9,0x1eca,0x1eda,0x1eeb
	.hword	0x1efb,0x1f0c,0x1f1c,0x1f2d,0x1f3d,0x1f4e,0x1f5e,0x1f6e
	.hword	0x1f7e,0x1f8f,0x1f9f,0x1faf,0x1fbf,0x1fcf,0x1fdf,0x1fef