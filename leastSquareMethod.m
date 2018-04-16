clc;
clear;

a = input('Enter the left border: ');
b = input('Enter the right border: ');
num = input('Enter the number of points: ');

x = linspace(a, b, num);

strFunc = input('Enter the function: ', 's');
func = str2func(strcat('@(x)', strFunc));

y = func(x);

degree = 1 : num/2;

fault = zeros(1, length(degree));

px = linspace(a, b, 100);
fy = func(px);

for i = degree,

  LSMCoefs = getLSMCoefs(x, y, i);
  py = polyval(LSMCoefs, px);

  % hold on;
  % sleep(2);
  plot(x, y, px, py);

  fault(i) = max(abs(fy - py));

end;

% hold off;
% plot(degree, fault);