function [v] = vec()
	num = input('Enter the number of elements in vector: ');
	v = [];
	for i = 1:num,
	    v(end+1) = input('Input a number: ');
	end;
endfunction