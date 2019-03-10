function [ output_args ] = SingleFourPyramidSelectPoint( PeakPoint,SpaceAllPoint,PlaneNormal )
%首先，4个平面的表达式的格式要统一（类似于线性规划的约束标准化）
%该算法的特点是如果点为四棱锥内部，那么将该点带入一对面的表达式，计算结果的符号是相反的。
%本函数用于从整个空间中，选取一个4棱锥内的点坐标
%输入参数：SpaceAllPoint,PlaneNormal,PeakPoint分别为：整个空间点坐标、该四棱锥四个侧面的法向的矩阵、四棱锥的顶点坐标。
%输入数据的格式：
%SpaceAllPoint：3*n
%PlaneNormal:3*4
%PeakPoint*3*1
%输出参数：为四棱锥内的点坐标。该参数的特点：维度与SpaceAllPoint的维度一样，即保留SpaceAllPoint中满足要求的点坐标，对于不满足要求的点坐标，用满足要求的点坐标替换。
SpaceAllPoint_Num=length(SpaceAllPoint);    %计算矩阵SpaceAllPoint的行数
PeakPoint_Mat=repmat(PeakPoint,[1,SpaceAllPoint_Num]);    %生成SpaceAllPoint_Num行的PeakPoint_Mat向量
SpaceAllPoint_PeakPoint_Mat=SpaceAllPoint-PeakPoint_Mat;
Temp_out=SpaceAllPoint_PeakPoint_Mat'*PlaneNormal;   %用于存储矩阵SpaceAllPoint_PeakPoint_Mat与PlaneNormal的乘积结果，以便后续判断其符号
[r,c]=find(Temp_out>0);    %
r_unique=unique(r);  
%计算与四个面法向量矢量积均小于0的相机向量，该点即在视线四棱锥中
PointInPyramid = setdiff(1:SpaceAllPoint_Num,r_unique);
% result=zeros(size(SpaceAllPoint));
for i=1:length(PointInPyramid)
   result(:,i)=SpaceAllPoint(:,PointInPyramid(i)); 
end

%设置相机最大距离
CameraLimit = 900;
index_del = [];
for i = 1:length(result)
    norm_result = norm(result(:,i)-PeakPoint);
    if(norm_result>CameraLimit)
        index_del = [index_del,i];       
    end
end
result(:,index_del)=[];
%删除超出范围点

output_args=result;
end

