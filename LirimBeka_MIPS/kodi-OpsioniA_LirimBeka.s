.text
.globl main
main:

	li $v1, 0		# n = 0
	jal populloVektorin
	jal unazaKalimit
	
	# Mundeson qe ti tregoj sistemit ku perfundon kodi
	li $v0, 10  		
	syscall
	

populloVektorin:
	
	li $v0, 4
	la $a0, nPrompt
	syscall
	
	li $v0, 5
	syscall
	
	move $v1, $v0       # n = user input
	
	li $v0, 4
	la $a0, arrayPrompt
	syscall
	
	
	li   $s0, 1         # i = 0
	
	loop:
		sll $s1, $s0, 2			# shift charecters to the left
		
		li $v0, 5			# user input
		syscall				# 
		move $t1, $v0			# ruaje input ne regjistrin $s1
		sw $t1, array($s1)		# mbushe array
	
	
		addi $s0, $s0, 1                # i++
		ble $s0, $v1, loop              # while i<n, back to loop
	exit:
	jr $ra

unazaVlerave:
	
	addi $t2, $a1, 1  			# k = p + 1 
	
				
	for:
		sll $s2, $t2, 2			# shift characters to the left
		lw  $t3, array($s2)		# a[k]
		
		bgt $a2, $t3, if		# if (min > a[k])  jump to if;
		ble $a2, $t3, endif		# if (min <= a[k]) jump to endif;		
		if:

		move $a2, $t3		# min = a[k]
		move $a3, $t2		# loc = k	
		endif:
		addi $t2, $t2, 1
		ble  $t2, $v1, for
	done:
	jr $ra 	#return
	
unazaKalimit:

	li  $a1, 1			# p = 1
	li  $a2, 0			# min
	li  $a3, 0			# loc
	li  $t4, 0			# tmp
	
	  
	while:
		sll $s3, $a1, 2		# shift characters to the left
		lw  $t5, array($s3)     # a[p]
		
		move $a2, $t5		# min = a[p]
		move $a3, $a1		# loc = p
		
		
		# In order to call a procedure inside a procedure(we need to put return value in stack) #
		add $sp, $sp, -4
		sw $ra, 0($sp)
		jal unazaVlerave
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		##########################################################################################
		
		sll $s4, $a1, 2
		lw  $t4, array($s4) 	# temp = a[p]
		
		sll  $s5, $a3, 2 	# shfit character to the left
		lw   $t7, array($s5)	# a[loc]
		
		sw $t7, array($s4)	# a[p] = a[loc]
		sw $t4, array($s5)	# a[loc] = tmp
		
		
		
		addi $a1, $a1, 1	# p++
		blt  $a1, $v1, while	# while p <= n-1 back to while
	end:	
	li $v0, 4
	la $a0, vleraVektorit
	syscall
	
	li $s6, 1 			# i = 1
	do:
		sll $s7, $s6, 2		# shift characters to the left
		lw  $t7, array($s7)	# a[i]
		
		li $v0,1
		move $a0, $t7
		syscall
		
		li $v0, 4
		la $a0, newLine
		syscall
		
		addi $s6, $s6, 1
		ble  $s6, $v1, do
	finish:
	
	jr $ra	#return
	
.data

	array: 		.space 20
	nPrompt: 	.asciiz "Jep numrin e anetareve te vektorit (max. 5): "
	arrayPrompt: 	.asciiz "\nShtyp elementet nje nga nje: \n"
	vleraVektorit: 	.asciiz "\nVlerat e vektorit ne fund: \n"
	newLine:	.asciiz "\n"	
	



