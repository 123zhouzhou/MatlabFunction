%%���ͼƬ��Ϊ������ŵ�Matlab����
file_path = 'C:\Users\Arlen\Documents\MATLAB\PictoMat\Pose07_64x64_files\';%ͼƬ·�����Ը����Լ���Ҫ�޸�;  
pic = '*jpg';%ͼƬ��ʽ�������Լ���ͼƬ��ʽ�����޸�;  
img_path_list = dir(strcat(file_path,pic));%��ȡ���ļ���������jpg��ʽ����Ϣ
fea = [];%����
gnd = [];%�������
num_perClass=24;%ÿһ�������ͼƬ����
for i = 1:size(img_path_list,1)
img=imread([file_path,num2str(i),'.jpg']);
im = reshape(img,1,size(img,1)*size(img,2));
fea(i,:) = im;
class = fix(i/num_perClass)+1;%��������ʱ�����������ʵ����1
if(class)
    gnd(i,1) = class;
    if(~rem(i,num_perClass)) %�������Ϊ0�������ֱ������
       gnd(i,1) = i/num_perClass;
    end
end
end
save PIE07_64x64.mat fea gnd
