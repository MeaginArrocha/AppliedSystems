# UNTITLED PROGRAM

	.data	# Data declaration section
FSTR:	.asciiz "Enter first number: ";
SSTR:	.asciiz "Enter second number: ";
TSTR:	.asciiz "Enter third number: ";
ESTR:	.asciiz "\n"

	.text

main:		# Start of code section
	
#main part

	li $v0, 4		# system call code for printing string = 4
	la $a0, FSTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	move $s5, $v0
	
	li $v0, 4		# system call code for printing string = 4
	la $a0, SSTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation


	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	move $s6, $v0

	li $v0, 4		# system call code for printing string = 4
	la $a0, TSTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input
	
	move $s7, $v0
	
	#getting ready to call fxn
	move $a0, $s5
	move $a1, $s6
	
	jal COMBINE		#jumps to combine fxn
	move $a0, $v0		#saves return value
	
	li $v0, 1		# system call code for print_int
	syscall			# print it
	
	move $t1, $a0
	
	li $v0, 4		# system call code for printing string = 4
	la $a0, ESTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	move $a0, $t1
	
	#getting ready to call fxn
	move $a1, $a0
	move $a0, $s5
	move $a2, $s7
	
	jal GROUP		#jumps to other fxn
	move $a0, $v0		#saves return value
	
	li $v0, 1		# system call code for print_int
	syscall			# print it

	li $v0, 4		# system call code for printing string = 4
	la $a0, ESTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	
	li 	$v0, 10	#v0=10	# exits program
	syscall
#fucntions
COMBINE:
	add $v0, $a0, $a1	#adds the numbers
	mul $v0, $v0, 100	#multiply by 100
	jr $ra			#goes back 
	
OTHER:
	mul $v0, $a2, $a1	#multiplies a2*a1
	mul $a0, $a0, 2		#multiplies a2*2
	sub $v0, $v0, $a0	#subtracts v0 - a0
	jr $ra			#jumps back
	
GROUP:
	#saves a registers in s registers
	move $s0, $a0		
	move $s1, $a1
	move $s2, $a2
	#flips order for other
	move $a1, $s2
	move $a2, $s1
	
	move $s3, $ra		#saves return address in s3
	
	jal OTHER
	
	move $s4, $v0		#save v0 from other fxn
	
	move $a0, $s2		#a0=s2
	move $a1, $s0		#a1=s0
	
	jal COMBINE
	
	add $v0, $s4, $v0	#adds return values from combine and other
	
	jr $s3			#goes back
	

# END OF PROGRAM