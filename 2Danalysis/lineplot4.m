function R = lineplot4(img)
% R = lineplot2(img)
% �̹����� �� position�� ���콺�� ������ ������ �׷���.. 
% start = starting point   [X, Y]
% step = 1
% final = d_max
%
% img(matrix)�� �׸����� �׷�����..
% X���� column, Y���� row
% �׸����� ��ǥ (4, 3)�� �� matrix�� (3, 4)�� �����Ϳ� �ش���.
step = 1;

A = ginput(1);
start = [A(1) A(2)]
A = ginput(1);
final = [A(1) A(2)]

if final(1) ~= start(1)
    slope = (final(2)-start(2))/(final(1)-start(1))

% slope = -1/slope; % ������ ���� �߰� ���� ��.
    theta = atan(slope);

    if (final(1) >= start(1)) & (final(2) >= start(2))
       theta = atan(slope);
    elseif (final(1) < start(1)) & (final(2) >= start(2))
       theta = atan(slope)+ pi;
    elseif (final(1) >= start(1)) & (final(2) < start(2))
       theta = atan(slope);
    elseif (final(1) < start(1)) & (final(2) < start(2))
       theta = atan(slope)+ pi;
    end

    d_max = fix(sqrt((start(1) - start(2))^2 + (final(1) - final(2))^2))

    for i = 0:step:d_max
       R(i+1,1) = i;
       Xposi(i+1) = i*cos(theta)+start(1);
       Yposi(i+1) = i*sin(theta)+start(2);
       R(i+1,2) = intens(img, [Xposi(i+1), Yposi(i+1)]);
    end
    
else
    
    R = img(start(1):final(1), start(2):final(2));
    
    if final(1) >= start(1)
        Xposi = start(1):step:final(1);
    else 
        step = -1*step;
        Xposi = start(1):step:final(1);
    end
    
    if final(1) >= start(1)
        Yposi = final(1):step:final(2);
    else 
        step = -1*step;
        Yposi = final(1):step:final(2);
    end
end
line(Xposi, Yposi)