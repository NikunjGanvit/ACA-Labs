; 2. Compute P × (1 + (r/100) ) ^n. Example: P = 500.0, r =12% and n =4.0

data segment
	p dd 500.0
	n dd 4.0
	r dd 12.0
	hundred dd 100.0
	x dd 0.0
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
	fld r
	fld hundred
	fdiv
	fld1
	fadd
	fst x

	fld n
	fxch	 ; fld x

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

	fld p
	fmul
	fst ans
	int 3
	code ends
end start