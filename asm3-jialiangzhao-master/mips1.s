.globl strlen
strlen:
	addiu $sp,$sp,-24
	sw $sp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	addiu $fp,$sp,20 
	
	add $t0,$a0,$zero
	add $t2,$zero,$zero
	strLoop:
	lb $t1,0($t0)
	beq $t1,$zero,strElse
	
	
	addi $t2,$t2,1
	addi $t0,$t0,1
	bne $t1,$zero,strLoop
	
	strElse:
	add $v0,$t2,$zero
	
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
	
.globl gcf
gcf:
	addiu $sp,$sp,-24
	sw $sp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	add $t0,$a0,$zero
	add $t1,$a1,$zero
	slt $t2, $t0,$t1
	beq $t2,$zero,gcfElse1
	add $t1,$a0,$zero
	add $t0,$a1,$zero
	
	gcfElse1:
	bne $t1,$zero,gcfElse2
	addi $v0,$zero,1
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
	
	gcfElse2:
	div $t0,$t1
	mfhi $t4
	
	bne $t4,$zero, gcfElse3
	
	add $v0,$zero,$t1
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
	
	gcfElse3:
	
	
	add    $a0, $zero,$t1
	add    $a1, $zero,$t4
	jal     gcf
	
	
	add $v0,$zero,$v0
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	
	
	jr $ra

.globl bottles
bottles:
	addiu $sp,$sp,-24
	sw $fp,0($sp)
	sw $ra,4($sp)	
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp, $sp,20
.data
bWord1: .asciiz " bottles of "
bWord2: .asciiz " on the wall, "
bWord3: .asciiz "Take one down, pass it around, "

bWord5: .asciiz " on the wall.\n"
bWord6: .asciiz "No more bottles of "
bWord7: .asciiz " on the wall!\n"	
.text
	add $t0,$zero,$a0
	add $t1,$zero,$a1
	bottlesLoop:
	beq $t0,$zero,bottlesElse
	
	addi $v0,$zero,1 #number
	add $a0,$t0,$zero
	syscall
	
	addi $v0,$zero,4#  bottles of 
	la $a0,bWord1
	syscall
	
	addi $v0,$zero,4 # name
	add $a0,$t1,$zero
	syscall
	
	addi $v0,$zero,4 #  on the wall, 
	la $a0,bWord2
	syscall
	
	addi $v0,$zero,1 # number
	add $a0,$t0,$zero 
	syscall
	
	addi $v0,$zero,4#  bottles of 
	la $a0,bWord1
	syscall 
	
	addi $v0,$zero,4 # name
	add $a0,$t1,$zero
	syscall
	
	addi $v0,$zero,11 #  !
	addi $a0,$zero,'!'
	syscall 
	
	addi $v0,$zero,11#   \n
	addi $a0,$zero,'\n'
	syscall 
	
	addi $v0,$zero,4#  Take one down, pass it around, 
	la $a0,bWord3
	syscall 
	
	addi $v0,$zero,1 # number
	add $a0,$t1,$zero
	syscall
	
	addi $v0,$zero,4#  bottles of 
	la $a0,bWord1
	syscall 
	
	
	addi $v0,$zero,4 # name
	add $a0,$t1,$zero
	syscall
	
	addi $v0,$zero,4#   on the wall.\n
	la $a0,bWord5
	syscall 
	
	addi $v0,$zero,11#   \n
	addi $a0,$zero,'\n'
	syscall 
	
	
	
	
	
	addi $t0,$t0,-1
	bne $t0,$zero,bottlesLoop
	
	
	bottlesElse:
	addi $v0,$zero,4#   on the wall.\n
	la $a0,bWord6
	syscall 
	
	addi $v0,$zero,4 # name
	add $a0,$t1,$zero
	syscall
	
	addi $v0,$zero,4#   on the wall.\n
	la $a0,bWord7
	syscall 
	
	addi $v0,$zero,11#  \n
	addi $a0,$zero,'\n'
	syscall 
	
	
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
.globl longestSorted
longestSorted:
	addiu $sp,$sp,-24
	sw $sp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	add $t0,$zero,$a0
	addi $t1,$a1,-1
	addi $t2,$zero,0
	add $t6,$zero,0
	
	longLoop:
	beq $t1,$zero,longElse
	
	lw $t3,0($t0)
	addi $t0,$t0,4
	lw $t4,0($t0)
	slt $t5,$t4,$t3
	beq $t5,$zero,longNothing
	addi $t2,$zero,0
	longNothing:
	addi $t2,$t2,1
	
	slt $t7,$t6,$t2
	beq $t7,$zero,longElse2
	add $t6,$zero,$t2
	
	longElse2:
	addi $t1,$t1,-1
	bne $t1,$zero,longLoop
	longElse:
	
	add $v0,$t6,$zero
	
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
	
.globl rotate
rotate:
	addiu $sp,$sp,-36
	sw $sp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	sw $a2,16($sp)
	sw $a3,20($sp)
	
	addiu $fp,$sp,32
	
	
	lw $s0,24($sp)
	lw $s1,28($sp)
	lw $s2,32($sp)
	
	add $t2,$a0,$zero
	
	addi $v0,$zero,1 # name
	add $a0,$zero,$t2
	syscall
	
	add $a0,$zero,$a1
	add $t0,$zero,$zero
	add $t1,$zero,$zero
	
	
	add $a1,$zero,$a2
	add $a2,$zero,$a3
	add $a3,$zero,$s0
	add $s0,$zero,$s1
	add $s1,$zero,$s2
	add $s2,$zero,$t3
	
	sw $s0,-8($sp)
	sw $s1,-4($sp)

	
	
	
	
	rotateLoop:
	
	beq $t0,$t2,rotateElse
	sw $t0,-12($sp)
	sw $t2,-16($sp)
	sw $t1,-20($sp)
	
	jal util
	lw $t1,-20($sp)
	add $t1,$v0,$t1
	
	lw $s0,-8($sp)
	lw $s1,-4($sp)
	lw $a3,24($sp)
	lw $a2,20($sp)
	lw $a1,16($sp)
	lw $a0,12($sp)
	
	
	add $t3,$zero,$a0
	
	add $a0,$zero,$a1
	add $a1,$zero,$a2
	add $a2,$zero,$a3
	add $a3,$zero,$s0
	add $s0,$zero,$s1
	add $s1,$zero,$t3

	sw $s0,-8($sp)
	sw $s1,-4($sp)
	sw $a3,24($sp)
	sw $a2,20($sp)
	sw $a1,16($sp)
	sw $a0,12($sp)
	
	
	lw $t0,-12($sp)
	lw $t2,-16($sp)
	
	addi $t0,$t0,1
	
	bne $t0,$t2,rotateLoop
	rotateElse:
	
	add $v0,$t1,$zero
	
	lw $a3,20($sp)
	lw $a2,16($sp)
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,36
	jr $ra