function R = lineplot2(img, start, step, final)
% R = lineplot2(img, start, step, final)
% img is image 
% start = starting point   [X, Y]
% step = 1
% final = d_max
%
% img(matrix)�� �׸����� �׷�����..
% X���� column, Y���� row
% �׸����� ��ǥ (4, 3)�� �� matrix�� (3, 4)�� �����Ϳ� �ش���.

slope = (418 - 413.6)./(411 - 430);  % CCD�� ��� Grid�� ����..
slope = (418 - 413.63)./(411 - 430);  % Gas�� ��� Grid�� ����..

slope = -1/slope; % ������ ���� �߰� ���� ��.
theta = atan(slope);

d_max = final;

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