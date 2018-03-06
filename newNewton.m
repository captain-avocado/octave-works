function [out] = newNewton(px, x, y)
	out = zeros(1, length(px));
	for k = 1:length(px),
		out(k) = y(1);
		for i = 1:length(x) - 1,
			dfx = dividedDiff(x, y, i + 1);
			w = 1;
			for j = 1:i,
				w = w * (px(k) - x(j));
			end;
			out(k) += w * dfx;
		end;
	end;
endfunction