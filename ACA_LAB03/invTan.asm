; 7. Compute tan inverse (y/x)

data segment
x dd 1.0
y dd 1.7320

res dd ?
data ends
code segment
assume cs:code,ds:data
start:nop
mov ax,data
mov ds,ax
fld x
fld y
fpatan
fst res
code ends
end start