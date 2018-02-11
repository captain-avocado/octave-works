function [out] = conv (a, b)
	% проверка на вектор
	if or(~isvector(a), ~isvector(b)), 		% and(isvector(a), isvector(b))
    error('Input must be a vector')
	end;
	% заполнение результирующего ветора нулями
	out = zeros(1, length(a) + length(b) - 1);
	%нахождение коэффициентов
	for i = 1:length(a),
		for j = 1:length(b),
			out(i+j-1) += a(i) * b(j);
		end;
	end;
	%удаление незначащих нулей
	out = out(find(out, 1, 'first'):end);
endfunction