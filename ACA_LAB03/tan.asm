; 1. Compute tan(x)

data segment
theta dd 30.0
oneeaghty dd 180.0
res dd ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
finit
fld theta
fldpi
fmul
fld oneeaghty
fdiv
fptan
fxch
fst res
int 3
code ends
end start