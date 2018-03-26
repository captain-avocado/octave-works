function [out] = matri(n) 
	tic
	out = zeros(1,length(n));
	for i = 1:length(n),
		% M = randn(i);
		M = zeros(i);
		for k = 1:i,
			M(k, 1) = 1;
		end;
		for j = 1:i,
			x = rand();
			for k = 2:i,
				M(j, k) = x;
				x *= x;
			end;
		end;
		M
		multi = M * inv(M);
		out(i) = sum(multi(:)) - i;
	end;
	toc
endfunction

%Octave-1-L