function [point_martrix] =FixFramRegion(Rec_l,Rec_w,Rec_h,fine_grain)
%���������Rec_l,Rec_w,Rec_h,fine_grain��ʾ����̶��ܵĳ���ߺ����ǵ����ȡ���λ��cm
%˵�����̶��ܵ�����ά�Ⱦ�����ͬ�����ȡ�
%����������ռ�����꣬��3*nά�����ʾ

x=linspace(0,Rec_l,fine_grain+1);
y=linspace(0,Rec_w,fine_grain+1);
[xx,yy]=meshgrid(x,y);
point_martrix=zeros(3,(fine_grain+1)^3);
count=0;      %ѭ�������ļ���
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

