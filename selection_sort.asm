	li x12, 4 # ������ ���������
	li x13, 0 # ������ �������
	li x28, 0 # ����� �������� � �������
	li x24, 0 # ������� 1
	li x25, 0 # ������� 2
	
	li x17, 5 
	ecall
	mv, x11, x10 # ���-�� ��������� � �������
	addi x11, x11, -1 # �.�. ������ � 0
	li x17, 9 # ����������� ������
	ecall
	mv x13, x10 # ������ �������
	mv x23, x13 # ������������ ����� �������
	li x17, 5
	
read_loop: # ������ �������� ��������� � ������
	ecall
	sw x10, (x23) # ������ � ������
	addi x23, x23, 4 # ��������� ������ ������
	addi x24, x24, 1 # �������
	bge x11, x24, read_loop
	
	mv x23, x13 # ������� ���������� ����� �������
	li x24, 0 # �������� �������
	
main_loop:
	lw x27, (x23) # x27 - ����� ������ � ����� ���� ����������� ������� �� ���������� �� ���������������
	mv x25, x23 # ����� � ������ ��� ����� ������
	mv x26, x24 # ��������� ������� ��� ����� ������
	
	
choose_loop: # ���� ������ ����������� ��������
	addi x25, x25, 4
	addi x26, x26, 1 # ��������� �������
	lw x10, (x25) # ����� ����. ������� � ������� ��� ���������
	bge x10, x27, skip
	mv x27, x10 # ���� ����������� (�������������) ��������
	mv x28, x25 # �� ������� � ������
skip:
	blt x26, x11, choose_loop
	lw x10, (x23)
	beq x10, x27, noswapneed # ���� �������� �����, �� ���������� �����
	
	lw x10, (x23) # ������ "������������" �������, �� ������� ��������� ������� �������
	sw x27, (x23) # �������� ����� ���. ������ �� ����� �������
	sw x10, (x28) # �������� ������� ������� �� ����� "�������������"
	
noswapneed:
	addi x23, x23, 4 # ������� ������� ����� � ������
	addi x24, x24, 1 # ������� �������
	
	blt x24, x11, main_loop
	
	mv x23, x13 # ������� ���������� ����� �������
	li x24, 0 # �������� �������
	
write_loop: # ����� ��������� �� ���������������� �������
	li x17, 1
	lw x10, (x23) # ������� �� �����
	ecall
	li x17, 11
	li x10, ' ' # ���������� �����
	ecall
	addi x23, x23, 4
	addi x24, x24, 1 # �������
	bge x11, x24, write_loop