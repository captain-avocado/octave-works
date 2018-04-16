a = input('Enter the left border: ');
b = input('Enter the right border: ');
num = input('Enter the number of points: ');

degree = num - 2;

x = linspace(a, b, num);


strFunc = input('Enter the function: ', 's');
f = str2func(strcat('@(x)', strFunc));


e = 1;
% while e > 10^(-5)

	fvect = zeros(num, 1);
	for i = 1:length(x)
		fvect(i) = f(x(i));
	end;

	A = zeros(length(x), length(x));
	for i = 1:num,
		for j = 1:num - 2,
			A(i, j) = x(i).^(num-2 + 1 - j); 
		end;
		A(i, num - 1) = 1;
		A(i, num) = (-1).^(i);
	end;
	A


% end;
