function R = ipflineplot(img)
% R = lineplot2(img)
% image plate �̹����� �� position�� ���콺�� ������ ������ �׷���.. 
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

d_max = sqrt((final(2) - start(2))^2+(final(1) - start(1))^2);

for i = 0:step:d_max
   R(i+1,1) = i;
   Xposi(i+1) = i*cos(theta)+start(1);
   Yposi(i+1) = i*sin(theta)+start(2);
   R(i+1,2) = intens(img, [Xposi(i+1), Yposi(i+1)]);
end

%contour(img)
%contour(img(321:880, 201:560))
%Xposi = Xposi - 200;
%Yposi = Yposi - 320;
line(Xposi, Yposi)