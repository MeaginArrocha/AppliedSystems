# UNTITLED PROGRAM

	.data	# Data declaration section
SIZE:	.asciiz "Enter size: "
INIT:	.asciiz "Enter init: "

	.text

main:		# Start of code section
	
	#"Enter size"
	li $v0, 4		# system call code for printing string = 4
	la $a0, SIZE		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	#cin >> size
	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input

	move $a0, $v0		#put size into a1
	
	#call arrayFun
	jal arrayFun
	
	#saving answer to print
	move $a0, $v0
	
	#cout << answer
	li $v0, 1		# system call code for print_int
	syscall			# print it
	
	#exit program
	li $v0, 10
	syscall
	
arrayFun:
	#need to save $ra
	subu $sp, $sp, 4
	sw $ra, 0($sp)		#ra is saved at 0 offset
	
	mul $s0, $a0, 4		#have to *4 b/c 4 bytes for int in t0
	subu $sp, $sp, $s0	#allocate memory on stack

	move $a1, $a0		#moving size into a1
	move $a0, $sp		#save sp into a0
	
	#init(arr,size)
	jal init	
		
	#reset pointer from loop
	move $a0, $sp		#save sp into a0
	
	#sum(arr,size)
	jal sum
	
	mul $v0, $v0, 10	#answer = total (returned) *10
	
	addu $sp, $sp, $s0
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
init:
	
	move $t2, $a0		#copying a0 into t2
	
	#COUT << "enter init"
	li $v0, 4		# system call code for printing string = 4
	la $a0, INIT		# load address of string to be printed into $a0
	syscall			# call operating system to perform print operation

	li $v0, 5		# get ready to read in integers
	syscall			# system waits for input
	
	move $t4, $v0		#save user in $t4
	
	
	li $t3, 0		#int i=0
	
Loop:
	bge $t3, $a1, afterLoop	#if i > size
	
	add $t5, $t3 ,$t4	#t5 is sum of i+user
	
	sw $t5, ($t2)		#stores i+user into ptr[i]
	
	add $t3, $t3, 1		#i++
	add $t2, $t2, 4		#add 4 to ptr
	j	Loop
	
afterLoop:
	jr $ra

sum:
	li $v0, 0		#int total = 0
	
	move $t2, $a0		#copying a0 into t2
	li $t3, 0		#int i=0
	
	#v0 already there
		
Loop2:
	bge $t3, $a1, afterLoop2#if i > size
	
	lw $t7, 0($t2)		#t7 = ptr[i]
	add $v0, $v0, $t7	#total += ptr[i] 
	
	add $t3, $t3, 1		#i++
	add $t2, $t2, 4		#add 4 to ptr
	j	Loop2
	
afterLoop2:
	jr $ra

	
# END OF PROGRAM