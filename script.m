clear; clc;
printf('Laboratory works #0-1\n');
while 1,
	clear;
	printf('Press (1) to conv vectors \nPress (2) to plot matricies \nPress (3) to calculate diff \nPress (0) to exit \n');
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
	elseif choose == 3,
		% ввести начало и конец отрезка
		a = input('Enter the left border: ');
		b = input('Enter the right border: ');
		if (b < a) error('Incorrect borders'); end;
		% ввести промежуток между точками
		h = input('Enter the distance: ');
		if or(h <= 0, h > abs(b - a)) error('Incorrect distance'); end;
		% ввести рассматирваемую функцию
		strFunc = input('Enter the function: ', 's');
		f = str2func(strcat('@(x)', strFunc))
		% ввести точку для расчета погрешностей
		p = input('Enter the point to calculate diff: ');
		if or(p < a, p > b) error('Incorrect point'); end;
		% расчет теоретической погрешности
		teor = teorR(a, b, strFunc, h, p)
		% расчет практической погрешности
		x = a:h:b;
		pract = abs(lagrange(p, x, f(x)) - f(p))
		% построение интерполяционного полинома в форме Лагранжа
		lx = a:0.01:b;
		ly = lagrange(lx, x, f(x));
		plot (x, f(x), "m", lx, ly)
	elseif ~choose
		break;
	end;
end;
