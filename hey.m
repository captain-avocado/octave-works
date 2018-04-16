
clc;
clear;

func = @(x) sin(x);

degree = 5;
% degree = 10;

nodesT = linspace(-3, 5, degree + 2);
lengthT = length(nodesT);

epsilon = 1;

while epsilon > 10^(-6)
    
    fig = 1;
    
    for i = 1 : lengthT
        valuesT(i) = func(nodesT(i));
    end
    B = valuesT;
    
    A = ones(lengthT, lengthT);
    for i = 1 : (lengthT / 2)
        A(2 * i, 1) = -1;
    end

    for i = 1 : lengthT
        for j = 3 : lengthT
            A(i, j) = nodesT(i) ^ (j - 2);
        end
    end
    A
    x = linsolve(A, B');
    delta = x(1);
    
    p = zeros(1, degree + 1);
    for i = 1 : (degree + 1)
        p(i) = x(degree + 2 - i + 1);
    end
    
    nodesF = linspace(-3, 5, 10000);
    lengthF = length(nodesF);
    polynom = polyval(p, nodesF); 
    max = 0;
    index = 0;
    for i = 1 : lengthF
        valuesF(i) = func(nodesF(i));
        m(i) = abs(valuesF(i) - polyval(p, nodesF(i)));
        if m(i) > max
            vm = func(nodesF(i));
            index = i;
            max = m(i);
        end
    end
    check = nodesT
    indexMax = nodesF(index)
    
    t = 1;
    for i = 1 : lengthT
        if and(nodesT(i) > indexMax, i > 1)
            t = i - 1;
            break;
        end
    end
    if(nodesT(end) < indexMax)
        t = lengthT;
    end
    a = t
    pMax = polyval(p, indexMax);
    
% % % % % % % % % %     
    figure(fig);
    fig = fig + 1;
    plot(nodesF, valuesF, 'b');
    axis([-3, 5, 6, 22])
    grid on
    hold on
    plot(nodesF, polynom, 'm');
    plot(nodesT, B, 'ko');
    
    plot(indexMax, pMax, 'r.');
    plot(indexMax, func(indexMax), 'r.');
    legend('function', 'polynom')
    hold off
% % % % % % % % % %     

    ptLeft = polyval(p, nodesT(t));
    valueMax = pMax - vm;
    signLeft = ptLeft - func(nodesT(t));
    if and (valueMax < 0, signLeft < 0)
        nodesT(t) = indexMax;
        b = 1
    elseif and(valueMax > 0, signLeft > 0)
        nodesT(t) = indexMax;
        b =1
    else
        nodesT(t+1) = indexMax;
    end
    
    epsilon = max - delta;
end