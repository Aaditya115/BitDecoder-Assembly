#BY SUBMITTING THIS FILE TO CARMEN, I CERTIFY THAT I STRICTLY ADHERED TO THE TENURES OF
#THE OHIO STATE UNIVERSITY’S ACADEMIC INTEGRITY POLICY. THIS IS THE README FILE FOR LAB
#6.

    .text
    .globl rotate_right
rotate_right:
    pushq %rbp
    movq %rsp, %rbp

    # Save original
    movb %dil, %al
    movb %al, %bl

   # rotate bits
   shrb $1, %al
   shlb $7, %bl

   #Bitwise or
   orb %bl, %al

   #clear upper bits
   movzbl %al, %eax    

    leave
    ret 
