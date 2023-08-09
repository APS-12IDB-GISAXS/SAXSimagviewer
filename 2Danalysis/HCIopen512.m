function R = HCIopen512(filename)
% this function is for loading HCI binary data file.
% default data size is 1024*1024.

fid = fopen(filename, 'r');
fseek(fid, 512, -1);
datatype = 'int32';
R = fread(fid, [512, 512], datatype);
R = R(45:455, 45:455);  % inactive area�� �����ϱ� ���Ѱ�.
fclose(fid);