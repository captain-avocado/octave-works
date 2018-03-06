function yy = dividedDiff(x, y, n)

divDiff = 0;
for i = 1:n
    bMult = 1;
    for j = 1:n
        if (i ~= j)
            bMult = bMult * (x(i) - x(j));
        end;
    end;
    divDiff = divDiff + y(i)/bMult;
end;

yy = divDiff;

