clear; clc;
printf('Laboratory works #0-1-2\n');
while 1,
	clear;
	printf('Press (1) to conv vectors \nPress (2) to plot matricies \n--------------------------------\nPress (3) to calculate diff \n--------------------------------\nPress (4) to calculate Newton polynom \n--------------------------------\nPress (0) to exit \n\n');
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
		f = str2func(strcat('@(x)', strFunc));
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
		plot (lx, f(lx), lx, ly, "m")
	elseif choose == 4,
		% ввести начало и конец отрезка
		a = input('Enter the left border: ');
		b = input('Enter the right border: ');
		if (b < a) error('Incorrect borders'); end;
		% ввести промежуток между точками
		h = input('Enter the distance: ');
		if or(h <= 0, h > abs(b - a)) error('Incorrect distance'); end;
		% ввести рассматриваемую функцию
		strFunc = input('Enter the function: ', 's');
		f = str2func(strcat('@(x)', strFunc));
		% вектор узлов интерполяции
		x = a:h:b;
		% вектор значений по ox для нахождения значений полинома на заданном промежутке
		nx = a:0.1:b;
		% интерполяционный полином в форме Ньютона (для равноотстоящих узлов)
		ny = newton(nx, x, f(x));
		% нахождение опитмальных узлов интерполяции с помощью полинома Чебышев
		chx = chebushev(a, b, fix((b - a) / h) + 1);
		% интерполяционный полином в форме Лагранжа (для неравноотстоящих узлов)
		% chy = newton(nx, chx, f(chx));
		chy = lagrange(nx, chx, f(chx));
		% сравнительные графики
		plot(nx, f(nx), nx, ny, "r", nx, chy, "c")
		legend('Исходная функция','Равноотстоящие узлы','Узлы по полиному Чебышева', 4);
		printf('Plotting completed\n')
		% максимальные погрешности на промежутке: теоретические и практические
		maxTeor = teorL(a, b, f, h)
		maxPract = max(abs(f(nx) .- ny))
		maxTeorChebushev = teorCh(a, b, f, fix((b - a) / h) + 1)
		maxPractChebushev = max(abs(f(nx) .- chy))
		t = 1;
		while t ~= 0,
		t = input("Enter the point to сalculate approximation: ");
		d = alph = zeros(1, 12);
		for i = 1:50,
			% t = 5.673;
			% x = a:
			chx = chebushev(a, b, i);
			chy = lagrange(t, chx, f(chx));
			ny = newton(t, )
			d(i) = abs(f(t) - chy);
			alph(i) = -log(d(i))/log(i);
		end;
		i = [1:50];
		plot(i, d, i, alph, "m")
end;
	elseif ~choose,
		break;
	end;
end;
