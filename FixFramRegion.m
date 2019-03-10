function [point_martrix] =FixFramRegion(Rec_l,Rec_w,Rec_h,fine_grain)
%输入参数：Rec_l,Rec_w,Rec_h,fine_grain表示相机固定架的长宽高和他们的粒度。单位：cm
%说明，固定架的三个维度具有相同的粒度。
%输出参数：空间点坐标，以3*n维矩阵表示

x=linspace(0,Rec_l,fine_grain+1);
y=linspace(0,Rec_w,fine_grain+1);
[xx,yy]=meshgrid(x,y);
point_martrix=zeros(3,(fine_grain+1)^3);
count=0;      %循环次数的计数
    for i=0:Rec_h/fine_grain:Rec_h
        count=count+1;
        zz=i*ones(length(xx));
        xx1=reshape(xx,[1,(fine_grain+1)^2]);
        xx2=reshape(yy,[1,(fine_grain+1)^2]);
        xx3=reshape(zz,[1,(fine_grain+1)^2]);
        A=[xx1;xx2;xx3];
        point_martrix(1:3,1+(count-1)*(fine_grain+1)^2:count*(fine_grain+1)^2)=A;
    end
% plot3(point_martrix(1,:),point_martrix(2,:),point_martrix(3,:),'*');
end

