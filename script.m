warning("off");
clear; clc;
printf('Laboratory works #0-1-2\n');
while 1,
	clear;
	printf('Press (1) to conv vectors \nPress (2) to plot matricies \n--------------------------------\nPress (3) to calculate diff \n--------------------------------\nPress (4) to calculate Newton polynom \n--------------------------------\nPress (5) to calculate Remez algorithm\n--------------------------------\nPress (0) to exit \n\n');
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
		% интерполяционный полином в форме Ньютона (для равностоящих узлов)
		ny = newton(nx, x, f(x));
		% нахождение опитмальных узлов интерполяции с помощью полинома Чебышев
		chx = chebushev(a, b, fix((b - a) / h) + 1);
		% интерполяционный полином в форме Лагранжа (для неравноотстоящих узлов)
		chy = newNewton(nx, chx, f(chx));
		% chy = lagrange(nx, chx, f(chx));
		% сравнительные графики
		plot(nx, f(nx), nx, ny, "r", nx, chy, "c")
		legend('Исходная функция','Равностоящие узлы','Узлы по полиному Чебышева', 4);
		printf('Plotting completed\n')
		% максимальные погрешности на промежутке: теоретические и практические
		maxTeor = teorL(a, b, f, h)
		maxPract = max(abs(f(nx) .- ny))
		maxTeorChebushev = teorCh(a, b, f, fix((b - a) / h) + 1)
		maxPractChebushev = max(abs(f(nx) .- chy))
		t = 0;

		while t ~= 1,
			t = input("Enter the point to сalculate approximation: ");
			if or(t > b, t < a), error("Incorrect point"); end;
			d = alph = zeros(1, 50);
			for i = 1:50,
				chx = chebushev(a, b, i);
				% chy = lagrange(t, chx, f(chx));
				chy = newNewton(t, chx, f(chx));
				d(i) = abs(f(t) - chy);
				if i ~= 1,
					alph(i) = (log(d(i)))/log(i);
				end;
			end;
			% i = [1:25];
			% z = zeros(1, length(p));
			% i = [1:5];
			% p = 0:0.1:10;
			% z = zeros(1, length(p));
			% for j = 1:5
			% z = 1./p.^(alph(j));
			% plot(p, z)
			% hold on;
			% end;
			i = [1:50];
			plot(i, alph, "m")

			legend('Погрешность', 'Степень гиберболы', 4);
			printf('Plotting completed\n')
		end;
	elseif choose == 5,
		a = input('Enter the left border: ');
		num = input('Enter the number of points: ');
		if (num <= 3) error('Incorrect number'); end;
		h = input('Enter the distance between points: ');
		if or(h <= 0) error('Incorrect distance'); end;
		strFunc = input('Enter the function: ', 's');
		f = str2func(strcat('@(x)', strFunc));
		b = a + h*num;

		x = a:h:b;
		px = a:0.1:b;

		A = zeros(num, num);
		for i = 1:num,
			for j = 1:num - 2,
				A(i, j) = x(i).^(num-2 + 1 - j); 
			end;
			A(i, num - 1) = 1;
			A(i, num) = (-1).^(i);
		end;
		A
		fvect = zeros(num, 1);
		for i = 1:num,
			fvect(i) = f(x(i));
		end;
		fvect
		alph = mldivide(A, fvect)
		x = a:0.1:b;
 		Q = zeros(length(x), 1);
 		for i = 1:length(x)
			for j = 1:num-1,
				Q(i) += alph(j+1) * (x(i).^(j - 1));
			end;
		end;
		Q
		plot(x, Q)
	elseif ~choose,
		break;
	end;
end;
