.global _start

.section .text
_start:
   # Write the string to stdout
    li a0, 1       # File descriptor 1 is stdout
    la a1, message # Load address of message
    li a2, 14   # Length of message
    li a7, 64     # syscall number for write
    ecall              # Make syscall

    # Exit the program
    li a0, 0         # Return 0
    li a7, 93    # syscall number for exit
    ecall      # Make syscall

.section .data
message:
    .string "Hello, World!\n"


/// Notes
/// So I learnt about the commands li which means Load immediate and what it does it load the immediate value 1 into the register
/// a0 is being set to 1 because 1 is the file descriptor for stdout

/// la means Load Address
/// It loads the address of the label message into register a1 and this give the memeory location of our Hello World program

/// li a2 loads the immediat value 14 into the rgister 14
/// 14 is length on of Hello.. string plus the namespace

/*
a0: File descriptor (1 for stdout)
a1: Address of the string to write
a2: Length of the string
a7: System call number
*/

/// ecall to actually make the system call

/// a0-a7 are argument registers, used to pass arguments to functions or system calls