#name:jialiangzhao
#csc 252 asm2
#Implement some for loops and other functions such as while loops.
.data
Nonzero1:	.asciiz "The intArray[] had "
Nonzero2:	.asciiz " nonzero values, "
Nonzero3:	.asciiz " of which were positive."
group1:	.asciiz "The group sizes are "
group2:	.asciiz ","
Factors1:	.asciiz "Factors of "
.globl upword
upword:      .word	32
.text
.globl studentMain

studentMain:
    	addiu $sp, $sp, -24
    	sw    $fp, 0($sp)
  	sw    $ra, 4($sp)
   	addiu $fp, $sp, 20
# allocate stack space -- default of 24 here
# save caller’s frame pointer
# save return address
# setup main’s frame pointer

	la $t0, countNonzero 
	lw $t0, 0($t0)	#$t0=conuntNonzeor
	beq $t0,$zero, ELSE #if(conuntNonzeor=0) go ELSE
	la $t0, intArray_len
	lw $t0, 0($t0)	#$t0=intArray_len
	add $t1,$t1,$zero #t1=i
	add $t2,$t2,$zero #t2=nonzero number
	add $t3,$t3,$zero #t3=positive number	
	
	la $t5,intArray #t5=intArray
	add $t4,$t4,$t5 #t4=address
	
	#Create a loop that can find numbers that are non-zero and greater than 0.
	NonzeroeLoop:	
	beq $t0,$t1,NonzeroDone
	lw $t6,0($t4)
	addi $t4,$t4,4
	addi $t1,$t1,1
	bne $zero,$t6, ElseAdd
	j NonzeroeLoop
	#When this number is not equal to 0, the variable $t2 is increased by 1.
	ElseAdd:
	addi $t2,$t2,1
	slt $t7,$zero,$t6
	bne $t7,$zero,AddPositive
	j NonzeroeLoop
	#When this number is positive, the variable $t3 is increased by 1.
	AddPositive:
	addi $t3,$t3,1
	j NonzeroeLoop
	#Type the number you just got out according to the format.
	NonzeroDone:
	addi $v0,$zero,4
	la $a0,Nonzero1
	syscall
	addi $v0,$zero,1
	add $a0,$t2,$zero
	syscall
	addi $v0,$zero,4
	la $a0,Nonzero2
	syscall
	addi $v0,$zero,1
	add $a0,$t3,$zero
	syscall
	addi $v0,$zero,4
	la $a0,Nonzero3
	syscall
	addi $v0,$zero,11
	addi $a0,$zero,'\n'
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	#Check if skipprint is needed
	ELSE:
	la $t0,skipPrint
	lw $t0,0($t0)
	add $t1,$zero,$zero
	#A skip loop, which takes out the numbers in str and then loops. +2 per cycle position
	SKIP:
	beq $t0,$zero,ELSE2
	addi $v0,$zero,11
	la $a0,str
	add $a0,$t1,$a0
	lb $a0,0($a0)
	beq $a0,$zero,SPACE
	syscall
	addi $t1,$t1,2
	bne $a0,$zero,SKIP
	
	#At the end of the loop, two blank lines are printed
	SPACE:
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	
	#Check if groupcount is needed
	ELSE2:
	la $t0,groupCount
	lw $t0,0($t0)
	beq $t0,$zero,ELSE3
	add $t1,$zero,$zero
	la $t0,intArray_len
	lw $t0,0($t0)
	la $t3,intArray
	la $t6,groups
	
	#Through special calculation, calculate how many times the array is in the group.
	GROUPS:
	
	add $t2,$t1,$t1
	add $t2,$t2,$t2
	add $t4,$t3,$t2
	lw $t5,0($t4)
	andi $t5,$t5,0x3
	
	add $t2,$t5,$t5
	add $t2,$t2,$t2
	add $t7,$t6,$t2
	
	lw $t5,0($t7)
	addi $t5,$t5,1
	sw $t5,0($t7)
	
	
	
	addi $t1,$t1,1
	bne $t1,$t0, GROUPS
	#Print out the group you just got.
	groupPrint:
	addi	$v0, $zero,4
	la	$a0, group1
	syscall
	addi	$v0, $zero,1
	lw	$a0, 0($t6)
	syscall
	addi	$v0, $zero,4
	la	$a0, group2
	syscall
	
	addi	$v0, $zero,1
	lw	$a0, 4($t6)
	syscall
	addi	$v0, $zero,4
	la	$a0, group2
	syscall
	
	addi	$v0, $zero,1
	lw	$a0, 8($t6)
	syscall
	addi	$v0, $zero,4
	la	$a0, group2
	syscall
	
	addi	$v0, $zero,1
	lw	$a0, 12($t6)
	syscall
	
	addi $v0,$zero,11
	addi $a0,$zero,'\n'
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	#Check if indirect is needed
	ELSE3:
	la $t0,indirect
	lw $t0,0($t0)
	beq $t0,$zero,ELSE4
	la $t1,intArray
	la $t2,str
	la $t4,intArray_len
	lw $t4,0($t4)
	add $t3,$zero,$zero
	#It is probably to find the number in the array first, and then use this number in str. 
	INDIRECT:
	add $t5,$t3,$t3
	add $t5,$t5,$t5
	add $t6,$t5,$t1
	lw $t6,0($t6)
	
	add $t6,$t6,$t2
	
	addi $v0,$zero,11
	lb  $a0,0($t6)
	syscall
	addi $t3,$t3,1
	
	bne $t3,$t4,INDIRECT
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	
	#To reduce the asciiz number of each byte by 0x20 bits,
	# it has reached lower case if it is less than 61 then it will not move.
	ELSE4:
	la $t0,toUpper
	lw $t0,0($t0)
	beq $t0,$zero,ELSE5
	la $t0,str
	
	add $t1,$zero,$zero
	add $t1,$t0,$t1
	TOUPPER:
	addi $v0,$zero,11
	lb $a0,0($t1)
	beq $a0,$zero,ToupperSpace
	slti $t3,$a0,0x61
	bne $t3,$zero,ToupperPrint
	la $t8,upword
	lw $t8,0($t8)
	sub $a0,$a0,$t8
	sb $a0,0($t1)
	syscall 
	
	addi $t1,$t1,1
	bne $a0,$zero,TOUPPER
	
	#Print the upper according to the specification, and modify the content in the original str.
	ToupperPrint:
	syscall 
	addi $t1,$t1,1
	bne $a0,$zero,TOUPPER
	
	ToupperSpace:
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	
	#Check if factors are needed
	ELSE5:
	la $t0, factors
	lw $t0, 0($t0)
	beq $t0,$zero,ELSE6
	
	addi $t1,$zero,2
	la $t0,num
	lw $t0,0($t0)
	addi	$v0, $zero,4
	la	$a0, Factors1
	syscall
	addi	$v0, $zero,1
	add	$a0, $zero,$t0
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,':'
	syscall
	#Through a special algorithm, continue to divide num by an increasing number.
	
	FACTOR:
	slti $t2,$t0,2
	bne $t2,$zero,FactorPrint
	
	div $t0,$t1
	mflo $t3
	mfhi $t4
	bne $t4,$zero,FactorAdd
	add $t0,$t3,$zero
	addi $v0,$zero,11
	addi $a0,$zero,' '
	syscall
	addi $v0,$zero,1
	add $a0,$zero,$t1
	syscall
	bne $t2,$zero,FactorPrint
	
	j FACTOR
	# If it is divisible, then pass, if it cannot, then the divisor is increased by 1.
	FactorAdd:
	addi $t1,$t1,1
	j FACTOR
	
	FactorPrint:
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall
	ELSE6:


	lw    $ra, 4($sp)
	lw    $fp, 0($sp)
	addiu $sp, $sp, 24
	jr    $ra
# get return address from stack
# restore the caller’s frame pointer
# restore the caller’s stack pointer
# return to caller’s code
