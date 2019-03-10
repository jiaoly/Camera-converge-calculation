%需要输入的基本参数：开始
long_region=500;   %输入镜头所在空间的长度,单位cm
width_region=500;   %镜头所在空间的宽度,单位cm
heignt_region=250;  %镜头所在空间的高度,单位cm
dimension_grain=50;    %维度的粒度,该值为大于1的整数
num_shot=4;   %镜头的个数
%相机1
index_camera = 1;
PeakPoint(:,index_camera) = [0 0 300];   %相机位置坐标
AimPoint(:,index_camera) = [250 250 0];  %相机目标点坐标
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera); %计算相机视线向量

%相机2 （可任意添加）
index_camera = 2;
PeakPoint(:,index_camera) = [500 0 300];
AimPoint(:,index_camera) = [250 250 0];
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera);

%相机3
index_camera = 3;
PeakPoint(:,index_camera) = [500 500 300];
AimPoint(:,index_camera) = [250 250 0];
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera);

%相机4
index_camera = 4;
PeakPoint(:,index_camera) = [0 500 300];
AimPoint(:,index_camera) = [250 250 0];
PlaneNormalVector(:,index_camera) = AimPoint(:,index_camera)-PeakPoint(:,index_camera);

%输入所有镜头照射方向的向量，以3*n的矩阵形式给出
%输入所有镜头所在位置的坐标，以3*n的矩阵形式给出

dihedral_angle=[80;80]; %请输入光束的两个二面角，以2*1的矩阵形式给出,且第一个元素是值为较小的二面角，角度制

%需要输入的基本参数：结束