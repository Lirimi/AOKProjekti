	.text
.globl main
main:

	lw   $a3, n          		# load n in $a3
	
	#la   $a1, vektori1
	#la   $a2, vektori2
	
		
	
	jal  operacioniMeVektore
      
      	move $s4, $v1                  # Rezultati i kthyer ruhet ne regjistrin $s4
      
      	li $v0, 4                       
	la $a0, sumprint               # Printojme mesazhin
	syscall  
	 		               #
	addi $a0,$s4,0                 # Printojme Shumen ne regjistrin $s4
	li $v0, 1
	syscall 
	li $v0, 10
	syscall
	
operacioniMeVektore:
	 
	addi   $s0, $0, 0     	 	# load temp1 in $s0;
	addi   $s1, $0, 0      		# load temp2 in $s1;
	addi   $v1, $0, 0       	# load sum in $v1	
	li     $s3, 0          		# i = 0
loop:
	
	sll $t0, $s3, 2      		# shift characters to the left     
	lw $t1, vektori1($t0)   	# register vektori1[i] in $t1
	
	sll $t2, $a3, 2
	sub $t2, $t2, $t0
	sub $t2, $t2, 4
	lw  $t4, vektori2($t2)          # register vektori2[n-1-i] in $t4
	

	
	###################### P.S Nqs kerkohet si prove per access te sakte te vektorit2[n-1-i] ##########################      
	#li $v0, 1			#
	#move $a0,$t4			#
	#syscall 			#
	#li $v0, 4                      # 
	#la $a0,whitespace              # 
	#syscall                        #
	################### Kjo pjese e kodit eshte per printimin  e anetareve te vektorit v2[n-1-i] #######################   
	  
	move $s0, $t1  			#temp1 = vektori1[i]
	move $s1, $t4  			#temp2 = vektori2[n-1-i]
	
	
	
	add $t1, $s0, $s1    		#vektori1[i] = temp1 + temp2
	sub $t2, $s0, $s1    		#vektori2[n-1-i] = temp1 - temp2
	
	
	add $s5, $t1, $t2   		# $s5 = vektori1[i] + vektori2[n-1-i]
	add $v1, $v1, $s5   		# sum = sum + vektori1[i] + vektori2[n-1-i](we have to pass this value
	addi $s3, $s3, 1                # i++
	blt $s3, $a3, loop              # while i<n, back to loop
	
	
exit:
	jr $ra


.data
	n: 		.word  6                    # n = 6
	vektori1:      	.word  5, 4, 9, 17, 31, 8   # initialise vektori1[]     
	vektori2:     	.word  -5, 2, 3, 4, 6, -3   # initialise vektori2[]
	whitespace:     .asciiz " "
	sumprint:       .asciiz "\nRezultati i operacionit: "
	
	
	

	
