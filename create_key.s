#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE TENURES OF
#THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. THIS IS THE README FILE FOR LAB
#6.

.section .data
prompt:
    .asciz "Enter 4-bit key: "

key_value:
    .quad 0  # Reserved space to store key, if necessary

.text
.globl create_key
create_key:
    pushq %rbp
    movq %rsp, %rbp

    # Save callee-saved registers
    pushq %rbx
    pushq %r12

    # Print prompt
    leaq prompt(%rip), %rdi
    callq printf

    # Initialize %rbx to 0
    xorq %rbx, %rbx          # Clear %rbx to start with an empty key

    # Get first bit
    callq getchar            # Call getchar to get first bit
    movq %rax, %rbx          # Move result to %rbx
    subq $'0', %rbx          # Convert ASCII '0' or '1' to integer (0 or 1)
    shlq $7, %rbx            # Shift to bit position 7

    # Get second bit
    callq getchar            # Get second bit
    subq $'0', %rax          # Convert ASCII to number
    shlq $6, %rax            # Shift to bit position 6
    orq %rax, %rbx           # Combine with first bit in %rbx

    # Get third bit
    callq getchar            # Get third bit
    subq $'0', %rax          # Convert ASCII to number
    shlq $5, %rax            # Shift to bit position 5
    orq %rax, %rbx           # Combine with previous bits

    # Get fourth bit
    callq getchar            # Get fourth bit
    subq $'0', %rax          # Convert ASCII to number
    shlq $4, %rax            # Shift to bit position 4
    orq %rax, %rbx           # Combine with previous bits

    
    # Create duplicate bits for the lower nibble by shifting %rbx
    movq %rbx, %rax         
    shrq $4, %rax            
    orq %rbx, %rax           

    # Save the key (optional)
    movq %rax, key_value(%rip)

    # Restore callee-saved registers
    popq %r12
    popq %rbx
   
    movq key_value(%rip), %rax
    leave                     # Clean up the stack and return
    ret                       # Return to the caller with key in %rax

