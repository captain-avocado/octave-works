function [out] = chebushev(a, b, n)
	% n -- кол-во узлов интерполяции
	out = zeros(1, n);
	for i = 1:n,
		out(i) = (1/2) * ((b - a) * cos(((2*(i - 1) + 1) * pi)/(2*(n - 1) + 2)) + b + a);
	end;
endfunction