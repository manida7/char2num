
.section .bss
.comm arr, 1
.section .rodata
fmt:
   .asciz "%d\n"
eol:
   .asciz "\n"
not_number:
   .asciz "not a number, pass digit character to stdin\n"
number:
   .asciz "got number!\n"

.section .text

err0:
   mov $1, %rax                # system call for write
   mov  $1, %rdi               # file handle for stdout
   mov  $not_number, %rsi      # address of string to output
   mov  $44, %rdx              # number of bytes
   syscall
   jmp exit


.globl _start
_start:
 # read one byte
  mov $0, %rax   # number of read syscall
  mov $0, %rdi   # where to read from (stdin)
  mov $arr, %rsi # string address to write to
  mov $1, %rdx   # how many bytes to read
  syscall

 # Load the character from memory
    xor %rbx, %rbx
    movb (%rsi), %bl
    # Check if the character is a digit (ASCII 48-57)
    #cmp $48, %rbx          # Compare with '0'
    #jl err0           # If less, it's not a digit
    #cmp $57, %rbx          # Compare with '9'
    #jg err0           # If greater, it's not a digit

    # If it's a digit, print "got number!"
    #mov $1, %rbx           # syscall: write
    #mov $1, %rdi           # file descriptor: stdout
    #mov $number, %rsi      # address of "got number!\n"
    #mov $13, %rdx          # length of message
    #syscall



   sub $48, %rbx          # Convert character to number


  #Call printf to print the number
    mov %rbx, %rsi        #Move integer to RSI (printf argument)
    mov $fmt, %rdi       #Move format string address to RDI
    xor %rax, %rax      # Clear RAX (for variadic function)
    call printf        # Call printf("%d\n", num)

   #mov %rbx, %rsi         # Move converted number to RSI (argument for printf)
   #mov $fmt, %rdi         # First argument: format string
   #call printf            # Call printf

   

exit:
 mov $60, %rax
 xor %rdi, %rdi
 syscall
