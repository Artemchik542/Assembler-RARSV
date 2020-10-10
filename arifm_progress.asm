	li x17, 5
	ecall
	mv x11, x10
	ecall
	mv x12, x10
	ecall
	mv x13, x10
	mv x14, x11
	li x11, 0
	beqz x13, stop
	mv x11, x14
	mv x15, x11
	b step
loop:
	add x15, x15, x12
	add x11, x11, x15
step:
	addi x13, x13, -1
	bgtz x13, loop
	
stop:
	mv x10, x11
	li x17, 1
	ecall
