function k = drawC(center, l)
% k = drawC(center, l)
% ���� �׸��� �Լ�
% center�� �ݰ� l�� �����ؾ���.
% return���� ���� handle, delete(handle)�� ��������

k = rectangle('position', [center(1)-l, center(2)-l, 2*l, 2*l], 'curvature', [1,1])