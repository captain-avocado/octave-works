clc;
clear;

a = input('Enter the left border: ');
b = input('Enter the right border: ');
num = input('Enter the number of points: ');

% x = linspace(a, b, num);

strFunc = input('Enter the function: ', 's');
func = str2func(strcat('@(x)', strFunc));

defaultIntegral = quad(func, a, b);
% y = func(x);

valueLeft = zeros(1, num);
valueRight = zeros(1, num);
valueTrapz = zeros(1, num);
valueSimps = zeros(1, num);

deltLeft = zeros(1, num);
alphLeft = zeros(1, num);

deltRight = zeros(1, num);
alphRight = zeros(1, num);

deltTrapz = zeros(1, num);
alphTrapz = zeros(1, num);

deltSimps = zeros(1, num);
alphSimps = zeros(1, num);


for i = 1 : num,

	defaultIntegral

	x = linspace(a, b, i + 1);
	h = x(2) - x(1);

	y = zeros(1, i + 1);
	for j = 1 : i + 1,
		y(j) = func(x(j)) + rand * 0.001;
	end;

	% метод левых прямоугольников
	for j = 1 : i,
		valueLeft(i) += y(j) * h;
	end;
	valueLeft(i)
	deltLeft(i) = abs(valueLeft(i) - defaultIntegral);
	alphLeft(i) = -log(deltLeft(i))/log(i);

	% deltLeft(i)
	% alphLeft(i)
	% printf("\n")

	% метод правых прямоугольников
	for j = 1 : i,
		valueRight(i) += y(j + 1) * h;
	end;
	valueRight(i)
	deltRight(i) = abs(valueRight(i) - defaultIntegral);
	alphRight(i) = -log(deltRight(i))/log(i);

	% deltRight(i)
	% alphRight(i)
	% printf("\n")

	% метод трапеций
	for j = 1 : i,
		valueTrapz(i) += ((y(j) + y(j + 1))/2) * h;
	end;
	valueTrapz(i)
	deltTrapz(i) = abs(valueTrapz(i) - defaultIntegral);
	alphTrapz(i) = -log(deltTrapz(i))/log(i);

	% deltTrapz(i)
	% alphTrapz(i)
	% printf("\n")

	% формула Симпсона
	for j = 1 : i,
		valueSimps(i) += (y(j) + y(j + 1) + 4 * (func((x(j) + x(j + 1))/2) + rand * 0.001)) * h/6;
	end;
	valueSimps(i)
	deltSimps(i) = abs(valueSimps(i) - defaultIntegral);
	alphSimps(i) = -log(deltSimps(i))/log(i);

	% deltSimps(i)
	% alphSimps(i)
	% printf("\n")

	printf("----\n")

end;

plot(1:num, alphLeft, 1:num, alphRight, 1:num, alphTrapz, 1:num, alphSimps);
legend('Левые прям-ки', 'Правые прям-ки', 'Трапеции', 'Ф-ла Симпсона');

