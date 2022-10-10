# test_02.s
#
# A testcase for Asm 2.

.data

.globl countNonzero
countNonzero:   .word	1

.globl skipPrint
skipPrint:      .word	1

.globl groupCount
groupCount:     .word	0

.globl indirect
indirect:       .word	0

.globl toUpper
toUpper:        .word	0

.globl factors
factors:        .word	0



.globl intArray
intArray:
	.word	0
	.word	45
	.word	82
	.word	0
	.word	0
	.word	-23
	.word	0
	.word	37
	.word	15
	.word	0
	.word	-40
	.word	0
	.word	0
	.word	0
	.word	79
	.word	8
	.word	0

.globl intArray_len
intArray_len:
	.word   17

.globl str
str:
	.asciiz "the QUICK brown FOX jumps OVER the LAZY dog.  Or so I've heard."

.globl groups
groups:
	.word   0
	.word   0
	.word   0
	.word   0

.globl num
num:	.word   154935379



# ----------- main() -----------
.text


.globl	main
main:
	# call the student code
	jal	studentMain


.data
MAIN_MSG:
	.asciiz	"Dumping out all of the variables, after the student code ran:\n"
.text

	# print_str(MSG)
	addi	$v0, $zero,4
	la	$a0, MAIN_MSG
	syscall

	# print_int(countNonzero)
	addi	$v0, $zero,1
	la	$a0, countNonzero
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall

	# print_int(skipPrint)
	addi	$v0, $zero,1
	la	$a0, skipPrint
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall

	# print_int(groupCount)
	addi	$v0, $zero,1
	la	$a0, groupCount
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall

	# print_int(indirect)
	addi	$v0, $zero,1
	la	$a0, indirect
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall

	# print_int(toUpper)
	addi	$v0, $zero,1
	la	$a0, toUpper
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall

	# print_int(factors)
	addi	$v0, $zero,1
	la	$a0, factors
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall


	# print_int(intArray_len)
	addi	$v0, $zero,1
	la	$a0, intArray_len
	lw	$a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall


.data
MAIN_INTARRAY_MSG:	.asciiz "intArray[]: "
.text

	# print_str(INTARRAY_MSG)
	addi    $v0, $zero,4
	la      $a0, MAIN_INTARRAY_MSG
	syscall

	# print_int(intArray[0])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 0($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[1])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 4($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[2])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 8($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[3])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 12($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[4])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 16($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[5])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 20($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[6])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 24($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[7])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 28($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[8])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 32($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[9])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 36($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[10])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 40($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[11])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 44($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[12])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 48($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[13])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 52($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[14])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 56($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[15])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 60($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(intArray[16])
	addi	$v0, $zero,1
	la	$a0, intArray
	lw	$a0, 64($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall


.data
MAIN_GROUPS_MSG:	.asciiz "groups[]: "
.text

	# print_str(GROUPS_MSG)
	addi    $v0, $zero,4
	la      $a0, MAIN_GROUPS_MSG
	syscall

	# print_int(groups[0])
	addi	$v0, $zero,1
	la	$a0, groups
	lw	$a0, 0($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(groups[1])
	addi	$v0, $zero,1
	la	$a0, groups
	lw	$a0, 4($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(groups[2])
	addi	$v0, $zero,1
	la	$a0, groups
	lw	$a0, 8($a0)
	syscall

	# print_chr(' ')
	addi	$v0, $zero,11
	addi	$a0, $zero,' '
	syscall

	# print_int(groups[3])
	addi	$v0, $zero,1
	la	$a0, groups
	lw	$a0, 12($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,'\n'
	syscall


	# print_str(str)
	addi    $v0, $zero,4
	la      $a0, str
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,0xa
	syscall


	# print_int(num)
	addi    $v0, $zero,1
	la      $a0, num
	lw      $a0, 0($a0)
	syscall

	# print_chr('\n')
	addi	$v0, $zero,11
	addi	$a0, $zero,0xa
	syscall


	# sys_exit()
	addi	$v0, $zero,10
	syscall

