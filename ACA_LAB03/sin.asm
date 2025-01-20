; 2. Compute sin(x)

data segment
theta dd 45.0
oneeaghty dd 180.0
num2 dd 2.0
num1 dd 1.0
res dd ?
numerator dd ?
dinometer dd ?
sin dd ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
finit
fld theta
fldpi

fmul ; pi * theta
fld oneeaghty
fdiv ; (pi * oneeaghty ) /180 ;theta i radian
fld num2
fdiv ; theta/2
fptan
fxch
fst res ; tan(theta/2)
fld num2
fmul
fst numerator ; tan(theta/2) *2
fld res
fld res
fmul ; tan^2(theta/2)
fld num1
fadd ; tan^2(theta/2) + 1
fdiv
fst sin
int 3
code ends
end start