.text
.globl main

main:
# Display primpt1
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5 # read keyboard into $v0 (number x is number to test)
syscall

move $t0,$v0 # move the first number from $v0 in $t0

# Display the prmopt2 (string)
li $v0, 4
la $a0, prompt2 #display prompt2
syscall #print prompt2 to console

# read keyboard into $v0 
li $v0, 5 
syscall

# move the second number from $v0 in $t1
move $t1,$v0

#Calculation of Product
move $t2,$zero #register $t2 is the sum, $t2 = 0



.data
prompt1:
 .asciiz "Enter the first number "
prompt2:
 .asciiz "Enter the second number "
answer:
 .asciiz "The largest number is "