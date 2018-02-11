function [out] = matri(n) 
	tic
	out = zeros(1,length(n));
	for i = 1:length(n),
		M = randn(i);
		multi = M * inv(M);
		out(i) = sum(multi(:)) - i;
	end;
	toc
endfunction