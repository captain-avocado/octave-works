clc;
clear;

func = @(x) 1000/(x.^2-6*x+76);

degree = 5;
% degree = 10;

nodesT = linspace(-3, 5, degree + 2);
lengthT = length(nodesT);

delta = 1;

while delta > 10^(-6)
    
    % %     Ðàñ÷åò çíà÷åíèé ôóíêöèè
    for i = 1 : lengthT
        valuesT(i) = func(nodesT(i));
    end
    B = valuesT;
    
    % %     Íàõîæäåíèå àëüôà è ñèãìà
    A = ones(lengthT, lengthT);
    for i = 1 : (lengthT / 2)
        A(2 * i, 1) = -1;
    end
    for i = 1 : lengthT
        for j = 3 : lengthT
            A(i, j) = nodesT(i) ^ (j - 2);
        end
    end
    
    x = linsolve(A, B');
    sygma = x(1);
    
    % %     Íàõîæäåíèå çíà÷åíèé èíòåðïîëÿöèîííîãî ïîëèíîìà

    p = zeros(1, degree + 1);
    for i = 1 : (degree + 1)
        p(i) = x(degree + 2 - i + 1);
    end
    
    % %     Çàäàíèå òî÷åê äëÿ ïîñòðîåíèÿ ãðàôèêà

    nodesF = linspace(-3, 5, 10000);
    lengthF = length(nodesF);
    polynom = polyval(p, nodesF); 
    
    % %     Ïîèñê íàèáîëüøåãî çíà÷åíèÿ ïîëèíîìà

    max = 0;
    index = 0;
    for i = 1 : lengthF
        valuesF(i) = func(nodesF(i));
        m(i) = abs(valuesF(i) - polyval(p, nodesF(i)));
        if m(i) > max
%             % çíà÷åíèå ôóíêöèè â òî÷êå ìàêñ ðàçíîñòè
            vm = func(nodesF(i));
%             % òî÷êà, â êîòîðîé îíî íàõîäèòñÿ
            index = i;
% %             ìàêñèìàëüíûé ìîäóëü ðàçíîñòè ìåæäó çíà÷åíèÿìè ôóíêöèè
            max = m(i);
            indexMax = nodesF(index);
        end
    end
    check = nodesT;
    length(nodesF);
    
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
    a = t;
    pMax = polyval(p, indexMax);
    
    % %     Âûâîä ãðàôèêîâ íà ýêðàí
%     plot(nodesF, valuesF, 'b');
    axis([-3, 5, 6, 22])
    grid on
    hold on
    plot(nodesF, polynom, 'm');
    plot(nodesT, B, 'ko');
    
    plot(indexMax, pMax, 'r.');
    plot(indexMax, func(indexMax), 'r.');
    legend('function', 'polynom')
    hold off
    
% %     Îáðàáîòêà ïîïàäàíèÿ òî÷êè â ëåâûé êðàé èëè ïðàâûé êðàé

    ptLeft = polyval(p, nodesT(t));
    valueMax = pMax - vm;
    signLeft = ptLeft - func(nodesT(t));
    if and (valueMax < 0, signLeft < 0)
        nodesT(t) = indexMax;
        b = 1;
    elseif and(valueMax > 0, signLeft > 0)
        nodesT(t) = indexMax;
        b =1;
    else
        nodesT(t+1) = indexMax;
    end
    
    delta = max - sygma;
end