%m=csvread('/home/hulishuang/project-data/VLAD_SIFT_W64.csv',0,1);
%C = compressITQ(m,64)
#####
col_num = 8192;
fid = fopen('vlad_descriptor/VLAD_SIFT_W64_subimg.csv');
#####
data = textscan(fid,['%s',repmat('%f',[1,col_num])],'Delimiter',',','CollectOutput',1);
fclose(fid);
image_name = data{1,1};
feature = data(1,2);
feature_vector = cell2mat(feature);
code = compressITQ(feature_vector,256);
code_cell = num2cell(code);
output = [image_name code_cell];
#####
cell2csv('image_code_256_subimg.csv',output,' ');
#####
