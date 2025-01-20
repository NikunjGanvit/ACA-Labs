; 8. Compute area of a cone.

data segment
pi dd 3.1428
h dd 10.0
r dd 5.0
area dd ?
data ends
code segment
assume cs:code,ds:data
start:nop
mov ax,data
mov ds,ax
fld pi
fld r
fld r
fld r
fld r
fmul
fld h
fld h
fmul
fadd
fsqrt
fadd
fmul
fmul
fst area
int 3
code ends
end start