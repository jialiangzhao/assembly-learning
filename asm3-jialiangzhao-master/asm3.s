#Author: jialiangzhao
#Classroom: csc252, asm3
#Content: There are 5 functions in this file. 
#Each function has a different function, and 
#its purpose is to strengthen students' writing 
#function skills.
.globl strlen
strlen:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	addiu $fp,$sp,20 
	
	#Here I am creating a for loop to loop
	# through the table columns.
	add $t0,$a0,$zero
	add $t2,$zero,$zero
	strLoop:
	lb $t1,0($t0)
	beq $t1,$zero,strElse
	
	# When he finds the number 0 in this
	# str, the loop will terminate.
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
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	# This is a recursion function, it will
	# enter itself after creating some values.
	
	add $t0,$a0,$zero
	add $t1,$a1,$zero
	slt $t2, $t0,$t1
	beq $t2,$zero,gcfElse1
	add $t1,$a0,$zero
	add $t0,$a1,$zero
	
	# if (a < b)
           # swap(a,b);
	gcfElse1:
	bne $t1,$zero,gcfElse2
	addi $v0,$zero,1
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
	
	
	#if (b == 1)
            #return 1;
	gcfElse2:
	div $t0,$t1
	mfhi $t4
	
        #if (a % b == 0)
            #return b;
	bne $t4,$zero, gcfElse3
	
	add $v0,$zero,$t1
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
	
	gcfElse3:
	
	#return gcf(b, a % b);
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
	
	# Create str that will appear next time
.data
bWord1: .asciiz " bottles of "
bWord2: .asciiz " on the wall, "
bWord3: .asciiz "Take one down, pass it around, "

bWord5: .asciiz " on the wall.\n"
bWord6: .asciiz "No more bottles of "
bWord7: .asciiz " on the wall!\n"	
.text
	addi $t0,$a0,-1
	add $t1,$zero,$a1
	
	# Check the number of cycles, and then print them and str.
	bottlesLoop:
	addi $t3,$t0,1
	beq $t3,$zero,bottlesElse
	
	addi $v0,$zero,1 #number
	add $a0,$t3,$zero
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
	add $a0,$t3,$zero 
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
	add $a0,$t0,$zero 
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
	addi $t3,$t0,1
	bne $t3,$zero,bottlesLoop
	
	## At the end, hit the last number of times it has left.
	
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
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	# We need to find the largest number
	# in consecutive ascending order.
	
	add $t0,$zero,$a0
	add $t6,$zero,$zero
	add $t1,$a1,$zero
	beq $t1,$zero,longElse
	addi $t1,$a1,-1
	addi $t2,$zero,1
	addi $t6,$zero,1
	
	#Create a constant, and set if the length is
	# equal to 0, it will not enter the loop directly.
	longLoop:
	beq $t1,$zero,longElse
	
	lw $t3,0($t0)
	addi $t0,$t0,4
	lw $t4,0($t0)
	slt $t5,$t4,$t3
	beq $t5,$zero,longNothing
	addi $t2,$zero,0
	
	#After entering the loop, create a number that 
	#currently matches the sequence, and a maximum 
	#number that currently matches the number. But 
	#when the former exceeds the latter, the latter will be replaced.
	
	longNothing:
	addi $t2,$t2,1
	
	slt $t7,$t6,$t2
	beq $t7,$zero,longElse2
	add $t6,$zero,$t2
	
	#When the number finally equals 0, it will exit the loop
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
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	sw $a2,16($sp)
	sw $a3,20($sp)
	
	addiu $fp,$sp,32
	
	#This is the current parameters, I need to call them out to use.
	lw $t4,24($sp)
	lw $t5,28($sp)
	lw $t6,32($sp)
	
	add $t2,$a0,$zero
	
	
	
	add $a0,$zero,$a1
	add $t0,$zero,$zero
	add $t1,$zero,$zero
	
	
	add $a1,$zero,$a2
	add $a2,$zero,$a3
	add $a3,$zero,$t4
	add $t4,$zero,$t5
	add $t5,$zero,$t6
	add $t6,$zero,$t3
	
	sw $t4,-8($sp)
	sw $t5,-4($sp)
	#Because a0 is equal to the number of times I want to loop,
	# I need to save it to another location. And a1 will
	# be regarded as a parameter into util.
	
	
	
	
	rotateLoop:
	
	beq $t0,$t2,rotateElse
	sw $t0,-12($sp)
	sw $t2,-16($sp)
	sw $t1,-20($sp)
	
	jal util
	lw $t1,-20($sp)
	add $t1,$v0,$t1
	
	lw $t4,-8($sp)
	lw $t5,-4($sp)
	lw $a3,24($sp)
	lw $a2,20($sp)
	lw $a1,16($sp)
	lw $a0,12($sp)
	
	#This loop will move the order of the values all the way 
	#backwards until the loop ends, during which I will change their addresses.
	
	
	add $t3,$zero,$a0
	
	add $a0,$zero,$a1
	add $a1,$zero,$a2
	add $a2,$zero,$a3
	add $a3,$zero,$t4
	add $t4,$zero,$t5
	add $t5,$zero,$t3

	sw $t4,-8($sp)
	sw $t5,-4($sp)
	sw $a3,24($sp)
	sw $a2,20($sp)
	sw $a1,16($sp)
	sw $a0,12($sp)
	
	
	lw $t0,-12($sp)
	lw $t2,-16($sp)
	
	addi $t0,$t0,1
	
	bne $t0,$t2,rotateLoop
	rotateElse:
	#After exiting the loop, all will be restored.
	add $v0,$t1,$zero
	
	lw $a3,20($sp)
	lw $a2,16($sp)
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,36
	jr $ra

