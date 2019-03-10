function [output] = PlaneNormal(NormalSection_NormalVector,dihedral_angle_little,dihedral_angle_big)
%功能说明：本函数用于描述镜头光束的边界。光束为四棱锥。由于光束的正截面是长方形，所以对应侧面与底面的二面角是相同的。
%输入参数说明：用3个参数描述四棱锥：分别为底面法向、两个二面角（peak_vector,NormalSection_NormalVector,dihedral_angle_little,dihedral_angle_big）;二面角的单位：角度。
%底面的初始法向与XY平面相交但不垂直，其中一对侧面的法向所在的平面与XY平面相交；另一对侧面的法向所在的平面与前一对发现所在的平面垂直。
%输出参数：四棱锥4个面的法向构成的3*4得矩阵。
A=[3,1];
NormalSection_NormalVector_Size=size(NormalSection_NormalVector);
if(A~=NormalSection_NormalVector_Size)
    disp('底面法相输入的纬度不对。底面法向的维度是3*1');
    return
end

%% 
%计算一对侧面法向与XY平面相交但不垂直的侧向法向
%求底面向量与两母线形成平面的法向量
%求底面向量在XY平面上的投影向量
NormalSection_NormalVector_XY = [NormalSection_NormalVector(1),NormalSection_NormalVector(2),0]';
%绕Z轴旋转90度即为与法向量垂直的向量
NormalSection_NormalVector_XY_Vertical = [0 1 0;-1 0 0; 0 0 1]*NormalSection_NormalVector_XY;
%求叉积，即所需法向量
NormalPlane = cross(NormalSection_NormalVector_XY_Vertical,NormalSection_NormalVector);
NormalPlane = NormalPlane/norm(NormalPlane); %单位化
%在该平面上求侧向法向量
%旋转矩阵
[x,y,z] = deal(NormalPlane(1),NormalPlane(2),NormalPlane(3));
a = pi-dihedral_angle_big*pi/180;
R1 = [x*x*(1-cos(a))+cos(a),x*y*(1-cos(a))+z*sin(a),x*z*(1-cos(a))-y*sin(a)];
R2 = [x*y*(1-cos(a))-z*sin(a),y*y*(1-cos(a))+cos(a),y*z*(1-cos(a))+x*sin(a)];
R3 = [x*z*(1-cos(a))+y*sin(a),y*z*(1-cos(a))-x*sin(a),z*z*(1-cos(a))+cos(a)];   %建立以法向量为轴的旋转矩阵
NormalSection_NormalVector_Plane_Positive = [R1;R2;R3]*NormalSection_NormalVector; %旋转底面法向量，得到侧边法向量
a = pi+dihedral_angle_big*pi/180;
R1 = [x*x*(1-cos(a))+cos(a),x*y*(1-cos(a))+z*sin(a),x*z*(1-cos(a))-y*sin(a)];
R2 = [x*y*(1-cos(a))-z*sin(a),y*y*(1-cos(a))+cos(a),y*z*(1-cos(a))+x*sin(a)];
R3 = [x*z*(1-cos(a))+y*sin(a),y*z*(1-cos(a))-x*sin(a),z*z*(1-cos(a))+cos(a)];
NormalSection_NormalVector_Plane_Negative = [R1;R2;R3]*NormalSection_NormalVector;

NormalSection_NormalVector_Plane_Positive = NormalSection_NormalVector_Plane_Positive/norm(NormalSection_NormalVector_Plane_Positive);
NormalSection_NormalVector_Plane_Negative = NormalSection_NormalVector_Plane_Negative/norm(NormalSection_NormalVector_Plane_Negative); %单位化
%%
%计算一对侧面的法向所在的平面与XY平面垂直的侧面法向：开始
%该平面法向量即为之前所求NormalSection_NormalVector_XY_Vertical
NormalPlane = NormalSection_NormalVector_XY_Vertical;
NormalPlane = NormalPlane/norm(NormalPlane);  %单位化

[x,y,z] = deal(NormalPlane(1),NormalPlane(2),NormalPlane(3));
a = pi-dihedral_angle_little*pi/180;
R1 = [x*x*(1-cos(a))+cos(a),x*y*(1-cos(a))+z*sin(a),x*z*(1-cos(a))-y*sin(a)];
R2 = [x*y*(1-cos(a))-z*sin(a),y*y*(1-cos(a))+cos(a),y*z*(1-cos(a))+x*sin(a)];
R3 = [x*z*(1-cos(a))+y*sin(a),y*z*(1-cos(a))-x*sin(a),z*z*(1-cos(a))+cos(a)];
NormalSection_NormalVector_Vertical_positive = [R1;R2;R3]*NormalSection_NormalVector;
a = pi+dihedral_angle_little*pi/180;
R1 = [x*x*(1-cos(a))+cos(a),x*y*(1-cos(a))+z*sin(a),x*z*(1-cos(a))-y*sin(a)];
R2 = [x*y*(1-cos(a))-z*sin(a),y*y*(1-cos(a))+cos(a),y*z*(1-cos(a))+x*sin(a)];
R3 = [x*z*(1-cos(a))+y*sin(a),y*z*(1-cos(a))-x*sin(a),z*z*(1-cos(a))+cos(a)];
NormalSection_NormalVector_Vertical_negative = [R1;R2;R3]*NormalSection_NormalVector;

NormalSection_NormalVector_Vertical_positive = NormalSection_NormalVector_Vertical_positive/norm(NormalSection_NormalVector_Vertical_positive);
NormalSection_NormalVector_Vertical_negative = NormalSection_NormalVector_Vertical_negative/norm(NormalSection_NormalVector_Vertical_negative);

%%
output=[NormalSection_NormalVector_Plane_Positive,NormalSection_NormalVector_Plane_Negative,NormalSection_NormalVector_Vertical_positive,NormalSection_NormalVector_Vertical_negative];


end

