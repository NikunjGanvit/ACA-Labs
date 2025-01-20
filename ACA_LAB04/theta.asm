; 4. Compute sec(x), cosec(x) and cot(x).

data segment
    pi dd 3.1428
    angle dd 30
    oneeighty dd 180
    sec dd ?
    cosec dd ?
    cot dd ?
    tan dd ?
data ends

code segment
    Assume cs:code,ds:data
    start:nop
    mov ax,data
    mov ds,ax
    ;tan
    fld pi
    fld angle
    fmul
    fdiv oneeighty
    fptan
    fxch ST(1)
    fst tan
    ; sec
    fld tan
    fmul
    fld1
    fadd
    fsqrt
    fst sec
    ;cosec
    fld tan

    fdiv
    fst cosec
    ;cot
    fld1
    fld tan
    fdiv
    fst cot
    int 3
code ends
end start