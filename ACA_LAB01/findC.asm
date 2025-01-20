; 4. Write an ALP to find c = sqrt(a^2 + b^2)
; Test case data: a = 5.0 b = 3.0

data segment
numA dd 5.0
numB dd 3.0
numC dd ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
finit
fld numA
fld numA
fmul
fld numB
fld numB
fmul
fadd
fsqrt
fst numC
fst volume
fst Volume
int 3
code ends
end start