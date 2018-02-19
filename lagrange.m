function [out] = langrange(px, x, y)
	% x -- аргументы функции (узлы)
	% y -- значения функции
	% px -- точки в которых хотим интерполировать 
	L = ones(1, length(x));
	for i = 1:length(x) - 1,
		for j = 1:length(x),
			if (i ~= j),
				L(i) *= (px - x(j))/(x(i) - x(j));
			end;
		end;
	end;
	out = 0;
	for i = 1:length(x)-1,
		out += y(i) * L(i);
	end;
endfunction