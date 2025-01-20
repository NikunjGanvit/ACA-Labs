; 1. Compute x^y. x and y can be integer or real.

data segment
	x dd 2.5
	y dd 3.0
	cw dw 07ffh
	temp dd 0.0
	inte dd 0.0
	frac dd 0.0
	ans dd 0.0
data ends

code segment
	assume cs:code, ds:data
	start:
	mov ax, data
	mov ds, ax

	finit
	fldcw cw
	fld y
	fld x
	fyl2x    ; compute st(1)*log(st(0)) => y*log2(x) = 3.96...
	fst temp ; temp = 3.96...
	frndint  ; st(0) = 3
	fst inte   ; in = 3
	fld temp ; st(1) = 3, st(0) = 3.96...
	fxch     ; st(1) = 3.96..., st(0) = 3
	fsub     ; st(0) = st(1) - st(0) = 0.96...
	fst frac ; frac = 0.96...
	
	f2xm1    ; compute [ 2^st(0) - 1 ] = 2^(0.96...) - 1
	fld1
	faddp    ; st(0) = 2^(0.96...) = 1.95...
	fld inte   ; st(1) = 1.95..., st(0) = 3
	fxch     ; st(1) = 3, st(0) = 1.95...
	fscale   ; st(0) * 2^st(1) = 2^(0.96..) * 2^3

	fst ans
	int 3
	code ends
end start