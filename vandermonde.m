function V = vandermonde(x, n) 
  x = x(:);
  V = ones(length(x), n + 1);
  for j = n : -1 : 1
    V(:, j) = V(:, j + 1) .* x;
  end
endfunction