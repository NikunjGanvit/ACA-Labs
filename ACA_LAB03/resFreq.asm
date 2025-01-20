; 6. Find resonance frequency.

data segment
pi dd 3.1428
one dd 1.0
two dd 2.0
l dd 10.0
capacitence dd 20.0
result dd ?
data ends
code segment
assume cs:code,ds:data
start:nop
mov ax,data
mov ds,ax
fld one
fld l
fld capacitence
fmul
fsqrt
fld two
fmul
fld pi
fmul
fdiv
fst result
int 3
code ends
end start