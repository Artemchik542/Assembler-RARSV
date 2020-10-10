	li x17, 5
	ecall
	mv x11, x10
	ecall
	mv x12, x10
	ecall
	mv x13, x10
	
	
	ble x11, x12, branch1
	ble x12, x13, branch2
	ble x13, x11, branch3
	
branch1:
	ble x11, x13, end1
branch2:
	ble x12, x11, end2
branch3:
	ble x13, x12, end3

end1:
	mv x10, x11
	b stop
end2:
	mv x10, x12
	b stop
end3:
	mv x10, x13
	b stop
stop:
	li x17, 1
	ecall
