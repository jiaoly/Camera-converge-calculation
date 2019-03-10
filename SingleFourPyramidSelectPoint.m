function [ output_args ] = SingleFourPyramidSelectPoint( PeakPoint,SpaceAllPoint,PlaneNormal )
%���ȣ�4��ƽ��ı��ʽ�ĸ�ʽҪͳһ�����������Թ滮��Լ����׼����
%���㷨���ص��������Ϊ����׶�ڲ�����ô���õ����һ����ı��ʽ���������ķ������෴�ġ�
%���������ڴ������ռ��У�ѡȡһ��4��׶�ڵĵ�����
%���������SpaceAllPoint,PlaneNormal,PeakPoint�ֱ�Ϊ�������ռ�����ꡢ������׶�ĸ�����ķ���ľ�������׶�Ķ������ꡣ
%�������ݵĸ�ʽ��
%SpaceAllPoint��3*n
%PlaneNormal:3*4
%PeakPoint*3*1
%���������Ϊ����׶�ڵĵ����ꡣ�ò������ص㣺ά����SpaceAllPoint��ά��һ����������SpaceAllPoint������Ҫ��ĵ����꣬���ڲ�����Ҫ��ĵ����꣬������Ҫ��ĵ������滻��
SpaceAllPoint_Num=length(SpaceAllPoint);    %�������SpaceAllPoint������
PeakPoint_Mat=repmat(PeakPoint,[1,SpaceAllPoint_Num]);    %����SpaceAllPoint_Num�е�PeakPoint_Mat����
SpaceAllPoint_PeakPoint_Mat=SpaceAllPoint-PeakPoint_Mat;
Temp_out=SpaceAllPoint_PeakPoint_Mat'*PlaneNormal;   %���ڴ洢����SpaceAllPoint_PeakPoint_Mat��PlaneNormal�ĳ˻�������Ա�����ж������
[r,c]=find(Temp_out>0);    %
r_unique=unique(r);  
%�������ĸ��淨����ʸ������С��0������������õ㼴����������׶��
PointInPyramid = setdiff(1:SpaceAllPoint_Num,r_unique);
% result=zeros(size(SpaceAllPoint));
for i=1:length(PointInPyramid)
   result(:,i)=SpaceAllPoint(:,PointInPyramid(i)); 
end

%�������������
CameraLimit = 900;
index_del = [];
for i = 1:length(result)
    norm_result = norm(result(:,i)-PeakPoint);
    if(norm_result>CameraLimit)
        index_del = [index_del,i];       
    end
end
result(:,index_del)=[];
%ɾ��������Χ��

output_args=result;
end

