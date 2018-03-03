function [out] = newton(px, x, y)
	out = zeros(1, length(px));
	for k = 1:length(px),
		% dx = x(2) - x(1);
		out(k) = y(1);
		for i = 1:length(x) - 1,
			df = sum(y(1: i+1) .* pascal(i, 0));
			dx = x(i + 1) - x(i);
			w = 1;
			for j = 1:i,
				w = w * (px(k) - x(j));
			end;
			out(k) += (df * w) / (dx.^i * factorial(i));
		end;
	end;
endfunction