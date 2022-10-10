#Name: jialiangzhao
#Class: csc 252
#Content:These functions simply implement some
#functions of the binary tree, such as search, resume, and add.
.text
.globl bst_init_node
#This is a code that creates an empty tree. 
#He turns the entered number into root and 
#produces two meaningless left and right sides.
bst_init_node:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	sw $a1,0($a0)
	addi $a0,$a0,4
	
	sw $zero,0($a0)
	addi $a0,$a0,4
	sw $zero,0($a0)
	
	
	
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
.globl bst_in_order_traversal
#He is based on what we have learned about 
#the binary tree of resume. By putting print 
#in different locations. The results of different
# resumes produced. This is in order
bst_in_order_traversal:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	addiu $fp,$sp,20 

	beq $a0,$zero,inOrder
	
	
	
	lw $t1,0($a0)
	lw $t8,4($a0)
	
	j orderEnd
	
	inOrder:
	
	add $v0,$zero,$zero
	j orderZero
	
	orderEnd:
	
	

	add $a0,$t8,$zero
	jal     bst_in_order_traversal
	
	

	
	
	lw $a0,8($sp)
	 add $t5,$v0,$zero
	add $t6,$a0,$zero
	
	lw $a0,0($a0)
	add     $a0, $zero,$a0
	addi    $v0, $zero,1           # print_char('\n')
	syscall
	
	addi   $v0, $zero, 11      # print_char('\n')
	addi   $a0, $zero, 0xa
	syscall
	
	add $v0,$t5,$zero
	add $a0,$t6,$zero
	lw $t9,8($a0)
	add $a0,$t9,$zero
	jal    bst_in_order_traversal
	
	
	
	orderZero:
	
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
.globl bst_pre_order_traversal
#He is based on what we have learned about 
#the binary tree of resume. By putting print 
#in different locations. The results of different
# resumes produced. This is pre order
bst_pre_order_traversal:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	addiu $fp,$sp,20 

	beq $a0,$zero,countH1
	
	
	
	lw $t1,0($a0)
	lw $t8,4($a0)
	
	j countZero1
	
	countH1:
	
	add $v0,$zero,$zero
	j countEnd1
	
	countZero1:
	
	 add $t5,$v0,$zero
	add $t6,$a0,$zero
	
	lw $a0,0($a0)
	add     $a0, $zero,$a0
	addi    $v0, $zero,1           # print_char('\n')
	syscall
	
	addi   $v0, $zero, 11      # print_char('\n')
	addi   $a0, $zero, 0xa
	syscall
	
	add $v0,$t5,$zero
	add $a0,$t6,$zero

	add $a0,$t8,$zero
	jal    bst_pre_order_traversal
	
	

	
	
	lw $a0,8($sp)
	lw $t9,8($a0)
	add $a0,$t9,$zero
	jal     bst_pre_order_traversal
	
	
	
	countEnd1:
	
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
.globl bst_insert
#This is a binary tree insertion code, he 
#enters his subtree through careful selection. 
#Then insert the new node at the appropriate location.
bst_insert:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	
	beq $a0,$zero,countH2
	lw $t1,0($a0)
	
	beq $t1,$zero,countH2
	
 	
	
	
	j countZero2
	countH2:
	add $v0,$zero,$a1

	j End
	countZero2:

	lw $t2,0($a1)
	

	slti $t3,$t1,1000
	beq $t3,$zero,fix
	j do
	fix:
	
	lw $t1,0($t1)
	
	do:
	
	slt $t2,$t2,$t1
	
	
	beq $t2,$zero,right
	
	
	
	left:
	
	lw $a0,4($a0)
	addi $a1,$a1,0
	jal bst_insert
	
	lw $a0,8($sp)
	
	sw $v0,4($a0)
	j recur
	
	right:
	
	
	
	lw $a0,8($a0)
	addi $a1,$a1,0
	
	
	
	jal bst_insert
	
	lw $a0,8($sp)
	
	

	sw $v0,8($a0)
	
	recur:

	
	add $v0,$a0,$zero
	

	End:
	
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
.globl bst_search
#He is a search function. He does not 
#pass the recursion. He searches for nodes
# that match the input through a normal loop.
bst_search:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	sw $a1,12($sp)
	addiu $fp,$sp,20 
	
	add $t0,$a0,$zero
	
	seachLoop:
	
	lw $t1,0($t0)
	beq $t1,$zero,searchNull
	beq $t1,$a1,returnCur
	
	
	slt $t3,$a1,$t1
	bne $t3,$zero,searchTrue
	addi $t0,$t0,8
	lw $t2,0($t0)
	add $t0,$zero,$t2
	beq $t2,$zero,searchNull
	j seachLoop
	
	searchTrue:
	addi $t0,$t0,4
	lw $t2,0($t0)
	add $t0,$zero,$t2
	beq $t2,$zero,searchNull
	j seachLoop
	
	
	searchNull:
	add $v0,$zero,$zero
	j searchEnd
	
	returnCur:
	add $v0,$zero,$t0
	j searchEnd
	
	searchEnd:
	
	lw $a1,12($sp)
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
.globl bst_count
#It is a function to find the number of 
#nodes. Each node he finds will increase
# the result by 1. Finally, there are several 
#nodes in return.
bst_count:
	addiu $sp,$sp,-24   
	sw $fp,0($sp)
	sw $ra,4($sp)
	sw $a0,8($sp)
	addiu $fp,$sp,20 

	beq $a0,$zero,countH
	
	
	
	lw $t1,0($a0)
	lw $t8,8($a0)
	
	j countZero
	
	countH:
	
	addi $v0,$zero,0
	j countEnd
	
	countZero:
	
	add $a0,$t8,$zero
	jal     bst_count
	add $t2,$zero,$v0
	
	sw $t2,12($sp)
	
	
	lw $a0,8($sp)
	lw $t9,4($a0)
	add $a0,$t9,$zero
	jal     bst_count
	add $t3,$zero,$v0
	lw $t2,12($sp)
	
	add $t3,$t2,$t3
	addi $v0,$t3,1
	countEnd:
	
	
	lw $a0,8($sp)
	lw $ra,4($sp)
	lw $fp,0($sp)
	addiu $sp,$sp,24
	jr $ra
