	li x17, 5
	ecall
	mv x11, x10
	li x12, 2 # ������������ �������
	li x10, 0 # ��� ����� ���������, ��� 0 - �� ������� ������, � 1 - ��� �����
	
	beq x11, x10, end # ���� ����� 0 
	
loop:
	rem x13, x11, x12 # ����� ��������� ��� � 2-�� �� �����
	div x11, x11, x12 # ��� �� ��� ������
	beqz x13, loop # ��������� ��� ���� �� ����������, ������� ����� ����� 1
	
	bgtz x11, end # ���������, ��� ������ ��� ����� ��������� (��� ���� ����� ������� ����)
	li x10, 1 # ����� ��� ������� 2-��
end:
	li x17, 1
	ecall
