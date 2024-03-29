# Programa para ordenar 3 números

.section .data

abert: .asciz "Programa para odernar 3 numeros\n\n"
pedeN: .asciz "\nDigite N%d => "
mostra: .asciz "\nNumeros ordenados: %d, %d, %d\n\n"
perg: .asciz "\nDeseja nova execucao? <S>im/<N>ao "

tipoN: .asciz "%d"
tipoC: .asciz " %c"

n1: .int 0
n2: .int 0
n3: .int 0

resp: .byte 'n'

.section .text
.globl _start
_start:

    pushl $abert
    call printf

    pushl $1
    pushl $pedeN
    call printf

    pushl $n1
    pushl $tipoN
    call scanf

    pushl $2
    pushl $pedeN
    call printf

    pushl $n2
    pushl $tipoN
    call scanf

    pushl $3
    pushl $pedeN
    call printf

    pushl $n3
    pushl $tipoN
    call scanf

    addl $52, %esp

    movl n2, %eax
    cmpl n1, %eax
    jg n1_n2

n2_n1:
    movl n3, %eax
    cmpl n1, %eax
    jg n2_n1_n3

    movl n3, %eax
    cmpl n2, %eax
    jg n2_n3_n1

n3_n2_n1:
    movl n3, %eax
    movl n1, %ebx
    xchgl %eax, %ebx
    movl %eax, n3
    movl %ebx, n1
    
    jmp fim

n2_n3_n1:
    movl n2, %eax
    movl n1, %ebx
    xchgl %eax, %ebx
    movl %eax, n2
    movl %ebx, n1
    
    movl n3, %eax
    movl n2, %ebx
    xchgl %eax, %ebx
    movl %eax, n3
    movl %ebx, n2
    
    jmp fim

n2_n1_n3:
    movl n2, %eax
    movl n1, %ebx
    xchgl %eax, %ebx
    movl %eax, n2
    movl %ebx, n1
    
    jmp fim

n1_n2:
    movl n3, %eax
    cmpl n2, %eax
    jg fim

    movl n3, %eax
    cmpl n1, %eax
    jg n1_n3_n2

n3_n1_n2:
    movl n3, %eax
    movl n1, %ebx
    xchgl %eax, %ebx
    movl %eax, n3
    movl %ebx, n1
    
    movl n3, %eax
    movl n2, %ebx
    xchgl %eax, %ebx
    movl %eax, n3
    movl %ebx, n2
    
    jmp fim

n1_n3_n2:
    movl n3, %eax
    movl n2, %ebx
    xchgl %eax, %ebx
    movl %eax, n3
    movl %ebx, n2
    
    jmp fim

fim:
    pushl n3
    pushl n2
    pushl n1
    pushl $mostra
    call printf

    pushl $perg
    call printf

    pushl $resp
    pushl $tipoC
    call scanf

    addl $28, %esp

    movb resp, %al
    cmpb $'s', %al
    je _start

    pushl $0
    call exit
