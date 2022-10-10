.data 
PRINTRED:	.asciiz "red: "
PRINTORANGE:	.asciiz "orange: "
PRINTYELLOW:	.asciiz "yellow: "
PRINTGREEN:	.asciiz "green: "
PRINTBLUE:	.asciiz "blue: "
PRINTPURPLE:	.asciiz "purple: "
REVERSE:.asciiz "REVERSE\n"
EQUAL:	.asciiz "EQUALS\n"
NOTEQUAL: .asciiz "NOTHING EQUALS\n"
ASCENDING:	.asciiz "ASCENDING\n"
DESCENDING:.asciiz "DESCENDING\n"
ALL_EQUAL:.asciiz "ALL EQUAL\n"
UNORDERED:.asciiz "UNORDERED\n"

.text
.globl studentMain
studentMain:
   	addiu $sp, $sp, -24
    	sw    $fp, 0($sp)
    	sw    $ra, 4($sp)
    	addiu $fp, $sp, 20
    	
	la $t2, red
	lw $s1,0($t2)
	
	la $t3, orange
	lw $s3,0($t3)
	
	la $t4, yellow
	lw $s5,0($t4)
	
	la $t5, green
	lw $s7,0($t5)
	
	la $t6, blue
	lw $s2,0($t6)
	
	la $s6, purple
	lw $s4,0($s6)
	
	la $t0, equals
	lw $t1,0($t0)
	
	
	
	beq $t1,$zero,DONE
	
	
	beq $s1,$s3,ELSE
	
	
	beq $s3,$s5,ELSE
	
	beq $s5,$s7,ELSE
	beq $s1,$s5,ELSE
	beq $s1,$s7,ELSE
	beq $s3,$s7,ELSE
	addi	$v0, $zero, 4		
	la	$a0, NOTEQUAL
	syscall
	
	
	j DONE
	ELSE:
	addi	$v0, $zero, 4		
	la	$a0, EQUAL
	syscall
	
	j DONE
	
	DONE:
	la $t0, order
	lw $t1,0($t0)
	
	beq $t1,$zero,DONE1
	bne $s1,$s3,ELSE3
	bne $s3,$s5,ELSE3
	bne $s5,$s7,ELSE3
	bne $s7,$s2,ELSE3
	bne $s2,$s4,ELSE3
	
	addi	$v0, $zero, 4		
	la	$a0, ALL_EQUAL
	syscall
	j DONE1
	ELSE3:
	slt $t7,$s1,$s3
	bne $t7,$zero,ELSE1
	slt $t7,$s3,$s5
	bne $t7,$zero,ELSE1
	slt $t7,$s5,$s7
	bne $t7,$zero,ELSE1
	slt $t7,$s7,$s2
	bne $t7,$zero,ELSE1
	slt $t7,$s2,$s4
	bne $t7,$zero,ELSE1
	
	addi	$v0, $zero, 4		
	la	$a0, DESCENDING
	syscall
	j DONE1
	ELSE1:
	slt $t7,$s3,$s1
	bne $t7,$zero,ELSE2
	slt $t7,$s5,$s3
	bne $t7,$zero,ELSE2
	slt $t7,$s7,$s5
	bne $t7,$zero,ELSE2
	slt $t7,$s2,$s7
	bne $t7,$zero,ELSE2
	slt $t7,$s4,$s2
	bne $t7,$zero,ELSE2
	addi	$v0, $zero, 4		
	la	$a0, ASCENDING
	syscall
	j DONE1
	
	ELSE2:
	addi	$v0, $zero, 4		
	la	$a0, UNORDERED
	syscall
	j DONE1
	DONE1:
	la $t0, reverse
	lw $t1,0($t0)
	
	beq $t1,$zero,DONE2
	addi	$v0, $zero, 4		
	la	$a0, REVERSE
	syscall
	add $t8,$zero,$s5
	add $t9,$zero,$s7
	
	sw $t9,0($t4)
	sw $t8,0($t5)
	add $t8,$zero,$s3
	add $t9,$zero,$s2
	sw $t9,0($t3)
	sw $t8,0($t6)
	
	add $t8,$zero,$s1
	add $t9,$zero,$s4
	sw $t9,0($t2)
	sw $t8,0($s6)
	
	
	DONE2:
	la $t0, print
	lw $t1,0($t0)
	beq $t1,$zero,DONE3
	
	addi	$v0, $zero, 4		
	la	$a0, PRINTRED
	syscall
	addi	$v0, $zero, 1		# print_int(red)
	la	$a0, red
	lw	$a0, 0($a0)
	syscall
	addi	$v0, $zero,11		# print_char('\n')
	addi	$a0, $zero,'\n'
	syscall
	
	addi	$v0, $zero, 4		
	la	$a0, PRINTORANGE
	syscall
	addi	$v0, $zero, 1		# print_int(red)
	la	$a0, orange
	lw	$a0, 0($a0)
	syscall
	addi	$v0, $zero,11		# print_char('\n')
	addi	$a0, $zero,'\n'
	syscall
	
	addi	$v0, $zero, 4		
	la	$a0, PRINTYELLOW
	syscall
	addi	$v0, $zero, 1		# print_int(red)
	la	$a0, yellow
	lw	$a0, 0($a0)
	syscall
	addi	$v0, $zero,11		# print_char('\n')
	addi	$a0, $zero,'\n'
	syscall
	
	addi	$v0, $zero, 4		
	la	$a0, PRINTGREEN
	syscall
	addi	$v0, $zero, 1		# print_int(red)
	la	$a0, green
	lw	$a0, 0($a0)
	syscall
	addi	$v0, $zero,11		# print_char('\n')
	addi	$a0, $zero,'\n'
	syscall
	
	addi	$v0, $zero, 4		
	la	$a0, PRINTBLUE
	syscall
	addi	$v0, $zero, 1		# print_int(red)
	la	$a0, blue
	lw	$a0, 0($a0)
	syscall
	addi	$v0, $zero,11		# print_char('\n')
	addi	$a0, $zero,'\n'
	syscall
	
	addi	$v0, $zero, 4		
	la	$a0, PRINTPURPLE
	syscall
	addi	$v0, $zero, 1		# print_int(red)
	la	$a0, purple
	lw	$a0, 0($a0)
	syscall
	addi	$v0, $zero,11		# print_char('\n')
	addi	$a0, $zero,'\n'
	syscall
	DONE3:

	lw    $ra, 4($sp)
	lw    $fp, 0($sp)
	addiu $sp, $sp, 24
	jr    $ra
