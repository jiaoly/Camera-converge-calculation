%��Ҫ����Ļ�����������ʼ
long_region=500;   %���뾵ͷ���ڿռ�ĳ���,��λcm
width_region=500;   %��ͷ���ڿռ�Ŀ��,��λcm
heignt_region=250;  %��ͷ���ڿռ�ĸ߶�,��λcm
dimension_grain=50;    %ά�ȵ�����,��ֵΪ����1������
num_shot=4;   %��ͷ�ĸ���
%���1
index_camera = 1;
PeakPoint(:,index_camera) = [0 0 300];   %���λ������
AimPoint(:,index_camera) = [250 250 0];  %���Ŀ�������
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera); %���������������

%���2 ����������ӣ�
index_camera = 2;
PeakPoint(:,index_camera) = [500 0 300];
AimPoint(:,index_camera) = [250 250 0];
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera);

%���3
index_camera = 3;
PeakPoint(:,index_camera) = [500 500 300];
AimPoint(:,index_camera) = [250 250 0];
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera);

%���4
index_camera = 4;
PeakPoint(:,index_camera) = [0 500 300];
AimPoint(:,index_camera) = [250 250 0];
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera);

%�������о�ͷ���䷽�����������3*n�ľ�����ʽ����
%�������о�ͷ����λ�õ����꣬��3*n�ľ�����ʽ����

dihedral_angle=[80;80]; %�������������������ǣ���2*1�ľ�����ʽ����,�ҵ�һ��Ԫ����ֵΪ��С�Ķ���ǣ��Ƕ���

%��Ҫ����Ļ�������������