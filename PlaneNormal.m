function [output] = PlaneNormal(NormalSection_NormalVector,dihedral_angle_little,dihedral_angle_big)
%����˵��������������������ͷ�����ı߽硣����Ϊ����׶�����ڹ������������ǳ����Σ����Զ�Ӧ���������Ķ��������ͬ�ġ�
%�������˵������3��������������׶���ֱ�Ϊ���淨����������ǣ�peak_vector,NormalSection_NormalVector,dihedral_angle_little,dihedral_angle_big��;����ǵĵ�λ���Ƕȡ�
%����ĳ�ʼ������XYƽ���ཻ������ֱ������һ�Բ���ķ������ڵ�ƽ����XYƽ���ཻ����һ�Բ���ķ������ڵ�ƽ����ǰһ�Է������ڵ�ƽ�洹ֱ��
%�������������׶4����ķ��򹹳ɵ�3*4�þ���
A=[3,1];
NormalSection_NormalVector_Size=size(NormalSection_NormalVector);
if(A~=NormalSection_NormalVector_Size)
    disp('���淨�������γ�Ȳ��ԡ����淨���ά����3*1');
    return
end

%% 
%����һ�Բ��淨����XYƽ���ཻ������ֱ�Ĳ�����
%�������������ĸ���γ�ƽ��ķ�����
%�����������XYƽ���ϵ�ͶӰ����
NormalSection_NormalVector_XY = [NormalSection_NormalVector(1),NormalSection_NormalVector(2),0]';
%��Z����ת90�ȼ�Ϊ�뷨������ֱ������
NormalSection_NormalVector_XY_Vertical = [0 1 0;-1 0 0; 0 0 1]*NormalSection_NormalVector_XY;
%�����������跨����
NormalPlane = cross(NormalSection_NormalVector_XY_Vertical,NormalSection_NormalVector);
NormalPlane = NormalPlane/norm(NormalPlane); %��λ��
%�ڸ�ƽ�������������
%��ת����
[x,y,z] = deal(NormalPlane(1),NormalPlane(2),NormalPlane(3));
a = pi-dihedral_angle_big*pi/180;
R1 = [x*x*(1-cos(a))+cos(a),x*y*(1-cos(a))+z*sin(a),x*z*(1-cos(a))-y*sin(a)];
R2 = [x*y*(1-cos(a))-z*sin(a),y*y*(1-cos(a))+cos(a),y*z*(1-cos(a))+x*sin(a)];
R3 = [x*z*(1-cos(a))+y*sin(a),y*z*(1-cos(a))-x*sin(a),z*z*(1-cos(a))+cos(a)];   %�����Է�����Ϊ�����ת����
NormalSection_NormalVector_Plane_Positive = [R1;R2;R3]*NormalSection_NormalVector; %��ת���淨�������õ���߷�����
a = pi+dihedral_angle_big*pi/180;
R1 = [x*x*(1-cos(a))+cos(a),x*y*(1-cos(a))+z*sin(a),x*z*(1-cos(a))-y*sin(a)];
R2 = [x*y*(1-cos(a))-z*sin(a),y*y*(1-cos(a))+cos(a),y*z*(1-cos(a))+x*sin(a)];
R3 = [x*z*(1-cos(a))+y*sin(a),y*z*(1-cos(a))-x*sin(a),z*z*(1-cos(a))+cos(a)];
NormalSection_NormalVector_Plane_Negative = [R1;R2;R3]*NormalSection_NormalVector;

NormalSection_NormalVector_Plane_Positive = NormalSection_NormalVector_Plane_Positive/norm(NormalSection_NormalVector_Plane_Positive);
NormalSection_NormalVector_Plane_Negative = NormalSection_NormalVector_Plane_Negative/norm(NormalSection_NormalVector_Plane_Negative); %��λ��
%%
%����һ�Բ���ķ������ڵ�ƽ����XYƽ�洹ֱ�Ĳ��淨�򣺿�ʼ
%��ƽ�淨������Ϊ֮ǰ����NormalSection_NormalVector_XY_Vertical
NormalPlane = NormalSection_NormalVector_XY_Vertical;
NormalPlane = NormalPlane/norm(NormalPlane);  %��λ��

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

