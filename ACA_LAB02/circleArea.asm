;2. Write an ALP to find area of a circle using 8087 instruction set.
;Test case data: Pi = 3.1472 radius = 5.0

data segment
pi dd 3.1472
r dd 5.0
area dd ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
finit
fld r
fld r
fld pi
fmul
fmul
fst area
int 3
code ends
end start