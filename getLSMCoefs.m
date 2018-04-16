function out = getLSMCoefs(x, y, n)
  
  % Vandermonde matrix
  x = x(:);
  y = y(:);
  V = ones(length(x), n + 1);
  for j = n:-1:1
    V(:, j) = V(:, j + 1) .* x;
  end
  
  % calculate coeffs
  out = (V \ y)';
  
endfunction



% function p1 =  leastSquareMethod(x, y, n)



% % Construct Vandermonde matrix:
% x = x(:);
% V = ones(length(x), n + 1);
% for j = n:-1:1
%    V(:, j) = V(:, j + 1) .* x;
% end
% % Solve least squares problem:
% [Q, R] = qr(V, 0);
% p      = transpose(R \ (transpose(Q) * y(:)));


% p1 = (V \ y')';
% plot (x, y, x, p1)
% % Equivalent: (V \ y)'
% endfunction


% function [out] = leastSquareMethod()
  
%   % degree of polynom
%   degree = 5;

%   % function
%   func = @(x) sin(x);

%   % borders
%   a = 0;
%   b = 1;

%   % vector of fi's
%   fi = zeros(1, degree);

%   % matrix to solve
%   matrix = zeros(degree, degree);

%   for i = 1:degree,
%     fi(i) = x.^(i - 1);
%   end;

% endfunction