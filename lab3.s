# UNTITLED PROGRAM

	.data	# Data declaration section
STR: 	.asciiz "Enter your age\n"



	.text

main:		# Start of code section
	
	li $v0, 4		# system call code for printing string = 4
	la $a0, STR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation
	
	
	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	li $v0, 1
	move $a0, $s2		# a0=s2
	syscall 
	
	li $v0, 10 		#v0=10 #exits program
	syscall

# END OF PROGRAM