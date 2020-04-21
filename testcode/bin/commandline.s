# 1 "./src/start.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./src/start.S"

 .section .stack
 .align 2



 .equ Stack_Size, 0x400

 .globl __StackTop
 .globl __StackLimit
__StackLimit:
    .space Stack_Size
    .size __StackLimit, . - __StackLimit
__StackTop:
    .size __StackTop, . - __StackTop


    .section .heap
    .align 2



    .equ Heap_Size, 0

    .globl __HeapBase
    .globl __HeapLimit
__HeapBase:
    .if Heap_Size
 .space Heap_Size
    .endif
    .size __HeapBase, . - __HeapBase
__HeapLimit:
    .size __HeapLimit, . - __HeapLimit


 .section .vectors
 .globl __vectors
__vectors :
 .long Reset_Handler
 .size __vectors, . - __vectors


 .section .text
 .globl Reset_Handler
Reset_Handler:

 mv x1, x0
 mv x2, x1
 mv x3, x1
 mv x4, x1
 mv x5, x1
 mv x6, x1
 mv x7, x1
 mv x8, x1
 mv x9, x1
 mv x10, x1
 mv x11, x1
 mv x12, x1
 mv x13, x1
 mv x14, x1
 mv x15, x1
 mv x16, x1
 mv x17, x1
 mv x18, x1
 mv x19, x1
 mv x20, x1
 mv x21, x1
 mv x22, x1
 mv x23, x1
 mv x24, x1
 mv x25, x1
 mv x26, x1
 mv x27, x1
 mv x28, x1
 mv x29, x1
 mv x30, x1
 mv x31, x1

 la x2, __StackTop

_start:
 .global _start

 la x26, __bss_start__
 la x27, __bss_end__
 bge x26, x27, zero_loop_end

zero_loop:
 sw x0, 0(x26)
 addi x26, x26, 4
 blt x26, x27, zero_loop


zero_loop_end:

main_entry:

 addi x10, x0, 0
 addi x11, x0, 0
 jal x1, main
