;Write an ALP to do addition of three floating point numbers using 8087
;instruction set.
;Test case data: x = 3.5 y = 5.0 z = 2.2

data segment
a dd 5.4
b dd 3.5
c dd 1.6
res dd ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
finit
fld a
fld b
fld c
fadd
fadd
fst res
int 3
code ends
end start