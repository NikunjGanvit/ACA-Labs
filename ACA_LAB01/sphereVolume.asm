;3. Write an ALP to find volume of sphere using 8087 instruction set.
;Test case data: Pi = 3.1472 radius = 5.0

data segment
pi dd 3.1472
r dd 5.0
num3 dd 3.0
num4 dd 4.0
volume dd ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
finit
fld pi
fld r
fld r
fld r

fmul
fmul
fmul
fld num4
fmul
fld num3
fdiv
fst volume
fst Volume
int 3
code ends
end start