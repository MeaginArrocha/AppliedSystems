# UNTITLED PROGRAM

	.data	# Data declaration section

ASKSTR: .asciiz "Enter 5 different numbers: \n"
BIG:	.asciiz "\nBig"
SMALL:	.asciiz "\nSmall"

V: 	.word 1
W:	.word 2
X:	.word 3
Y:	.word 4
Z:	.word 5
ANSWER: .word 6

	.text

main:		# Start of code section
	
	
	
	li $v0, 4		# system call code for printing string = 4
	la $a0, ASKSTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	
	
	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	sw $v0, V		#V = v0
	
	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	sw $v0, W		#W = v0

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	sw $v0, X		#X = v0

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	sw $v0, Y		#Y = v0

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	sw $v0, Z		#Z = v0
	
	
	
	lw $a0, Z		#a0 = Z
	lw $v0, V		#v0 = V
	sub $a0, $a0, $v0	#a0 = Z - V
			
	lw $v0, W		#v0 = W
	mul $a0, $a0, $v0	#a0 = a0 * W
	
	sw $a0, ANSWER		#current answer
	
	lw $a0, X		#a0 = X
	lw $v0, Y		#v0 = Y
	div $a0, $a0, $v0	#a0 = X / Y
	
	lw $v0, ANSWER		#v0 = answer
	add $a0, $a0, $v0	#v0 = a0 + v0
	sw $a0, ANSWER		#a0 = answer

	#print answer
	li $v0, 1		# system call code for print_int
	syscall			# print it


	bgt $a0, 20, then
	#false part
	li $v0, 4		# system call code for printing string = 4
	la $a0, SMALL		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	j	afterif
then :
	#true part
	li $v0, 4		# system call code for printing string = 4
	la $a0, BIG		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

afterif:
	
	
	li $v0, 10 		#v0=10 #exits program
	syscall
	

# END OF PROGRAM