clear; clc;
printf('Laboratory works #0-1\n');
while 1,
	clear;
	printf('Press (1) to conv vectors \nPress (2) to plot matricies \nPress (0) to exit \n');
	prompt = '';
	choose = input('');
	if choose == 1,
		a = vec()
		b = vec()
		conv(a, b)
	elseif choose == 2,
		m_prompt= 'Enter the border for the number of elements  ';
	  n = input(m_prompt);
		x = [1: n];
		y = matrix(x);
		plot(x, y)
	elseif ~choose
		break;
	end;
end;
