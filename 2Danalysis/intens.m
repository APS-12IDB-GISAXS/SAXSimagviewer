function C = intens(img, posi)
% �̹����� ���� �־��� position(������ �ƴ϶�)�� ���� �д� �Լ�
% ���� ������ �ƴ� index�̸� linear interpolate�ؼ� ��´�.
% function C = intens(img, position)
% ���⼭ position�� ��ǥ��.
%
% �׷������� X���� column, Y���� row...
% img(matrix)�� �׸����� �׷�����..
% X���� column, Y���� row
% �׸����� ��ǥ (4, 3)�� �� matrix�� (3, 4)�� �����Ϳ� �ش���.
% �׷��Ƿ� ���⼭ posi��ġ�� ���� ��� ���ؼ��� X�� Y�� ��ġ��
% �ٲ��� ��.
if numel(posi) == 2
    X = posi(1); % row
    Y = posi(2); % column

    X1 = fix(X);
    X2 = fix(X)+1;
    Y1 = fix(Y);
    Y2 = fix(Y)+1;

    if fix(X) == X
        X2 = X1;
    end

    if fix(Y) == Y
        Y2 = Y1;
    end

    try
    temp1 = [img(Y1, X1), img(Y1, X2)];
    temp2 = [img(Y2, X1), img(Y2, X2)];

    C = (((temp2(2)-temp1(2))*(Y-Y1)+temp1(2))-((temp2(1)-temp1(1))*(Y-Y1)+temp1(1)))*(X-X1)+((temp2(1)-temp1(1))*(Y-Y1)+temp1(1));
    catch
        C = 0;
    end
end
% old
%X = posi(1); % row
%Y = posi(2); % column

%if ((X == fix(X))&(Y== fix(Y)))
%   C = img(Y, X);
%elseif ((X == fix(X))&(Y ~= fix(Y)))
%   Y1 = fix(Y);
%   Y2 = fix(Y)+1;
%   temp(1) = img(Y1, X);
%   temp(2) = img(Y2, X);
   %a = polyfit((Y1:1:Y2), temp,1);
   %C = a(1)*Y+a(2);
%   C = spline([Y1 Y2], temp, Y);
%elseif ((X ~= fix(X))&(Y == fix(Y)))
%   X1 = fix(X);
%   X2 = fix(X)+1;
%   temp(1) = img(Y, X1);
%   temp(2) = img(Y, X2);
   %a = polyfit((X1:1:X2), temp,1);
   %C = a(1)*X+a(2);
%   C = spline([X1 X2], temp, X);
%elseif ((X ~= fix(X))&(Y ~= fix(Y)))
%   X1 = fix(X);
%   X2 = fix(X)+1;
%   Y1 = fix(Y);
%   Y2 = fix(Y)+1;
%   temp1(1) = img(Y1, X1);
%   temp1(2) = img(Y1, X2);
%   temp2(1) = img(Y2, X1);
%   temp2(2) = img(Y2, X2);
   %a1 = polyfit((fix(Y):1:(fix(Y)+1)), temp1,1);
   %a2 = polyfit((fix(Y):1:(fix(Y)+1)), temp2,1);
   %CC(1) = a1(1)*Y+a1(2);
   %CC(2) = a2(1)*Y + a2(2);
   %a3 = polyfit((fix(X):1:(fix(X)+1)), CC,1);
%   C = spline([X1 X2], [spline([Y1 Y2], temp1, Y), spline([Y1 Y2], temp2, Y)], X);
   %C = a3(1)*X + a3(2);
%end