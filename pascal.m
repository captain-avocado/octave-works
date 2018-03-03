function out = pascal(n, sign)
	if n < 0,
		error('Incorrect n');
	end;
	out = [1];
	if sign == -1, 
		gen = [1 -1];
	elseif sign == 1,
		gen = [1 1];
	elseif sign == 0,
		gen = [-1 1];
	elseif
		error('Sign value must be 1 or -1 or 0');
	end;
	for i = 1:n,
		out = conv(out, gen);
	end;
endfunction