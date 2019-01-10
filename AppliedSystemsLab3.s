# UNTITLED PROGRAM

	.data	# Data declaration section

AGESTR: 	.asciiz "Enter your age:"
FAVESTR:	.asciiz "Enter your favorite integer\n"
SUMSTR:		.asciiz "The sum is:"

	.text

main:		# Start of code section
	
	
	la $a0, AGESTR		# load address of string to be printed into $a0
	li $v0, 4		# system call code for printing string = 4
	syscall			# call operating system to perform print operation

	
	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	move $s1, $v0		#v0=s1
	
	la $a0, FAVESTR		 # load address of string to be printed into $a0
	li $v0, 4		# system call code for printing string = 4
	syscall			# call operating system to perform print operation

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	move $s2, $v0		#v0=s2

	add $t5, $s1, $s2	#add s1 + s2 and store in $t5
	
	la $a0, SUMSTR		# load address of string to be printed into $a0
	li $v0, 4		# system call code for printing string = 4
	syscall			# call operating system to perform print operation

	
	li $v0, 1		# system call code for print_int
	move $a0, $t5
	#li $a0, 5		# integer to print
	syscall			# print it
	
	
	li $v0, 10		#v0=10 #exits program
	syscall

# END OF PROGRAM