# this program reads a positive number (including 0)  from the user, and prints all the prime numbers between 0 and that number.
# the positive number is read through the keyboard
.text
.globl main

main:
# Display prompt1
li $v0, 4 #variable v0 intitialized to 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall

move $t0,$v0 # move the first number from $v0 in $t0

addi $s0, $zero, 2 

While: 	bge $s0,$t0, doneWhileFirst 
	addi $s1, $zero, 0 #variable s1 is 0
	addi $s2, $zero, 2 #variable s2 is 2
	loop: 	bge $s2, $s0, doneWhiletwo
		remu $t1, $s0, $s2 #finds the modulus of the input with 0 and 2
		beq $t1, $zero, doneif
		addi $s2,$s2, 1
		j loop
		doneif:
		addi $s1,$zero, 1 #increments s1 by 1
	doneWhiletwo: beq $s1, 1, L1
		
		li $v0, 1
		move $a0, $s0 
		syscall
		L1:
		addi $s0, $s0, 1
	j While
doneWhileFirst:
		


# print integer function call 1 
# put the answer into $a0


#exit
end: li $v0, 10 
syscall 

.data
prompt1:
 .asciiz "Enter the a number "
 answer:
 .asciiz "The prime numbers are: "
comma:
.ascii ", "
