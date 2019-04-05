# this program prints out the maximum of two numbers 
# The two numbers are read through the keyboard 
.text
.globl main

main:
# Display prompt1
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall
move $t1,$v0 # move the first number from $v0 in $t0

# Display the prmopt2 (string)
li $v0, 4
la $a0, prompt2
syscall

# read keyboard into $v0 
li $v0, 5 
syscall
move $t2,$v0 # move the first number from $v0 in $t0
#Branch (jump) to L1 if $t1 is greater or equal to $t0

li $t3,0 #Variable C
li $t4,0 #Variable D
li $t5,1 #Variable Compare
li $t6,0 #E
li $t7, 1 #
sll $t7, $t7, 31

StartLoop:
beqz $t5,End
and $t6,$t5,$t2 # use AND for B and 1 and store in $t6
sll $t5, $t5, 1 #shift left one time 
beqz $t6,Zero
addu $t3,$t1,$t3 # add A to C
Zero: 
Continue:
and $t6,$t3,1 # add 1 to C and store in tempE
srl  $t3, $t3, 1 # shift C one time for reset
srl  $t4, $t4, 1 # shift D one time for reset
beqz $t6,ADDd
addu $t4,$t7,$t4 #add one to D and store in D
ADDd: 
j StartLoop

End:
# print answer 
li $v0, 4
la $a0, answerC
syscall

# print integer function call 1 
# put the answer into $a0
li $v0, 1 
move $a0, $t3 
syscall

# print answer 
li $v0, 4
la $a0, answerD
syscall

# print integer function call 1 
# put the answer into $a0
li $v0, 1 
move $a0, $t4
syscall

.data
prompt1:
 .asciiz "Enter the first number (A) "
prompt2:
 .asciiz "Enter the next number (B)"
answerC:
 .asciiz "The result for C is: "
answerD:
 .asciiz " The result for D is: "