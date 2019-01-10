# UNTITLED PROGRAM

	.data	# Data declaration section
	
	
ASKSTR:		.asciiz "Please enter a number\n"
ASK2STR:	.asciiz "Enter another number\n"
DIVSTR:		.asciiz "Divisible by 4\n"
NODIVSTR: 	.asciiz "Not Divisible by 4\n"

	.text

main:			# Start of code section
			
Loop:
	
	li $v0, 4		# system call code for printing string = 4
	la $a0, ASKSTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input
	
	beqz $v0, AfterLoop 	#if input is zero
	
	rem $a0, $v0, 4		#get remainder
	
	beqz $a0, AfterIf	#if remainder is 0
	
	
	li $v0, 4		# system call code for printing string = 4
	la $a0, NODIVSTR	# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	j	Loop		#go to top of loop
	
AfterIf:
	li $v0, 4		# system call code for printing string = 4
	la $a0, DIVSTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	j	Loop		#go to top of loop
	
	
#number input was 0	
AfterLoop:
	
Loop2:
	li $v0, 4		# system call code for printing string = 4
	la $a0, ASK2STR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	move $a0, $v0		#a0 = v0
	
	bge $a0, 5, ElseIf	# number >= 5
	
	j	Loop2		#go to top of this loop
	
	
ElseIf:
	blt $a0, 10, AfterLoop2
	j	Loop2		#go top top of loop2
AfterLoop2:
	
Loop3:
	beqz $a0, AfterLoop3
	
	li $v0, 1		# system call code for print_int
	syscall			# print it

	addi	$a0, $a0, -1	#subtract 1
	
	j	Loop3
	
AfterLoop3:

	
	li 	$v0, 10	#v0=10	# exits program
	syscall

# END OF PROGRAM