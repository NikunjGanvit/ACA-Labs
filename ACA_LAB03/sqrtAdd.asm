; 5. Compute xsqrt(y) + ysqrt(x)

data segment
x dd 4.0
y dd 9.0
res dd ?
data ends
code segment
assume cs:code,ds:data
start:nop
mov ax,data
mov ds,ax

fld x
fld y
fsqrt
fmul
fld y
fld x
fsqrt
fmul
fadd
fst res
int 3
code ends
end start