; 3. Compute cos(x)

data segment
theta dd 30.0
oneeaghty dd 180.0
num1 dd 1.0
res dd ?
cos dd ?
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
fld res
fmul
fld num1
fadd ; 1+tan^2(theta)
fsqrt

fdiv
fst cos
int 3
code ends
end start