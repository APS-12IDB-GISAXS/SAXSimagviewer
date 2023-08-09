function Data = get_1ddata
% ����� cell format���� ����Ѵ�.
% cell format �� Data�� ���� vector format���� �����͸� �����Ϸ���
% [a, b, c, d ... ] = deal(Data{:}) �� ���� command�� ����Ͼ��Ѵ�.

handle_lines = get(get(findobj('Tag', '1D_Data_Display'), 'Children'), 'Children');
number_line = length(handle_lines);
tempLine = get(handle_lines);
Data = cell(2, number_line);
    
for i = 1:number_line
    Data{1, i} = tempLine(i).XData';
    Data{2, i} = tempLine(i).YData';
end
