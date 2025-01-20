; 3.Compute roots of quadratic equation. If roots are imaginary display
; message “Roots are imaginary”.

; Example: x
; 2 + 7x + 10 = 0
; Roots are: (5, 2)

data segment
	a dd 5.0
	b dd 1.0
	c dd 5.0
	sw dw ?
	message db "Roots are imaginary.$"
	two dd 2.0
	four dd 4.0
	minusOne dd -1.0
	delta dd 0.0
	ans1 dd 0.0
	ans2 dd 0.0
data ends

code segment
	assume cs:code, ds:data
	start:
	mov ax, data
	mov ds, ax

	finit
	fld b
	fld b
	fmul
	fld a
	fld c
	fmul
	fld four
	fmul
	fsub
	fsqrt
	fst delta
	FSTSW sw
	mov ax, sw
	AND ax, 0001h
	CMP ax, 0001h
	JZ imaginary

	fld b
	fld minusOne
	fmul
	fadd
	fld a
	fdiv
	fld two
	fdiv
	fst ans1

	fld b
	fld minusOne
	fmul
	fld delta
	fsub
	fld a
	fdiv
	fld two
	fdiv
	fst ans2
	jmp over

	imaginary: nop
	mov dx, offset message
	mov ah, 09h
	INT 21h

	over: INT 3
	code ends
end start