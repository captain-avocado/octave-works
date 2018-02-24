function [out] = lagrange(px, x, y)
	% x -- аргументы функции (узлы)
	% y -- значения функции
	% px -- точки в которых хотим интерполировать 

	% построение матрицы полиномов: каждая строка матрицы состоит из коэффициентов для конкретной точки, каждый элемент в строке L -- это слагаемое из полинома (при x(i)) без учета f(x(i))
	L = ones(length(px), length(x));
	for k = 1:length(px),
		for i = 1:length(x),
			for j = 1:length(x),
				if (i ~= j),
					L(k, i) *= (px(k) - x(j))/(x(i) - x(j));
				end;
			end;
		end;
	end;
	out = zeros(1, length(px));
	
	% значения всех слагаемых суммируются, предварительно каждое умножается на коэффициент f(x(i))
	for k = 1:length(px),
		for i = 1:length(x),
			out(k) += y(i) * L(k, i);
		end;
	end;
endfunction