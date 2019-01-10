# UNTITLED PROGRAM

	.data	# Data declaration section
STR:	.asciiz " "
ESTR:	.asciiz "\n"

	.text

main:		# Start of code section
	
	li $s0, 1		#int i
	
Loop:
	bge $s0, 7, Afterloop	#if i > 7 then done with loop
	#else
	
	move $a0, $s0		#copying i into a0 register
	
	#cout << i
	li $v0, 1		# system call code for print_int
	syscall			# print it

	#" "	
	li $v0, 4		# system call code for printing string = 4
	la $a0, STR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	#fib(i)
	
	move $a0, $s0		#a0 = i
	jal 	Fib		#call fib
	
	move $a0, $v0
	
	li $v0, 1		# system call code for print_int
	syscall			# print it

	
	#endl;
	li $v0, 4		# system call code for printing string = 4
	la $a0, ESTR		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	
	add $s0, $s0, 1		#i++
	
	j	Loop
	
Afterloop:
	
	#exit program
	li $v0, 10
	syscall
	
Fib:	
	ble $a0, 2, Base
	#else

	subu $sp, $sp, 12	#allocating space on stack

	sw $a0, 4($sp)		#return address
	sw $ra, ($sp)
 	
	#fib(n-1)
	sub $a0, $a0, 1		#n-1
	jal	Fib
	
	sw $v0, 8($sp)		#v1 = return vaule from fib(n-1)
	lw $a0, 4($sp)		

	#fib(n-2)
	sub $a0, $a0, 2		#n-2
	jal	Fib
	move $t1, $v0
	
	lw $v0, 8($sp)
	
	add $v0, $v0, $t1
	
	lw $ra, ($sp)
		
	addiu $sp, $sp, 12
	
	jr $ra
	
Base:
	li $v0, 1
	jr $ra
	
	
# END OF PROGRAM