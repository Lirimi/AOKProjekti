	.text
.globl main
main:
 
	la $a0, vektori1 		# load base addr. of vektori1 into $a0   
	lw $s0, 0($a0)                  # sum_pre = vektori1[0]
	li $s1, 0                       # sum_post = 0
	lw $s2, n			# n = 7
	li $s3, 1 			# i = 1

	
for:
	
	sll $t1, $s3, 2      		# shift characters to the left 2^n
     	
	lw  $t4, vektori1($t1)		# $t4 = vektori1[i]
	add $s0, $s0, $t4 		# sum_pre = sum_pre + vektori1[i] 
 	
 	sll $t2, $s3, 2      		# shift characters to the left
	sub $t2, $t2, 4			# [i-1]
	lw  $t5, vektori1($t2)          # $t5 = vektori1[i-1] 

	add $t5, $t4, $s3               # vektori1[i-1] = vektori1[i] + i 
	add $s1, $s1, $t5 		# sum_post = sum_post + vektori1[i-1]

	add $s3, $s3, 1 		# i++
	bge $s3, $s2, exit 		# exit loop when i >= n
	j for				# jump to loop

exit:
 
	sll $t3, $s2, 2			# shift characters to the left
	sub $t3, $t3, 4                 # [n-1]
	lw  $t6, vektori1($t3)		# $t6 = vektori1[n-1]
	add $s1, $s1, $t6  		# sum_post = sum_post + vektori1[n-1]


	
	
	# Printo new Line
	li $v0, 4
	la $a0, newline
	syscall
	
	# Printo shumen paraprake ne vektor
	li $v0, 1
	addi $a0,$s0,0
	syscall
 
	# Printo new Line
	li $v0, 4
	la $a0, newline
	syscall
  
	# Printo shumen pas ndryshimeve ne vektor
	li $v0, 1
	addi $a0,$s1,0
	syscall


.data
	vektori1:	.word  4, 9, -3, -5, 6, 8, 1
	n: 		.word  7 
	newline:	.ascii "\n"

