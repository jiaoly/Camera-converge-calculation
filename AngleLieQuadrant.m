function [angle] = AngleLieQuadrant(CosValue,SinValue)
%������������Һ�����ֵ������ȷ���������Ǻ�����Ӧ�ĽǶ�
%���������CosValue,SinValue��ͬһ�Ƕȶ�Ӧ������ֵ������ֵ��
%������:angle(������)
x=CosValue^2+SinValue^2;
% if(x ~=1)
%    disp('���������ֵ������ֵ��������Ǣ������������'); 
%    return;
% end


if(CosValue>=0&&CosValue*SinValue>=0)
    angle=acos(CosValue);     %��һ���ޡ�
    return  ;
elseif (CosValue<=0&&CosValue*SinValue<=0)
        angle=pi-acos(CosValue);     %�ڶ����ޡ�
    return  ;
elseif (CosValue<=0&&CosValue*SinValue>=0)
        angle=pi+acos(CosValue);     %�������ޡ�
    return  ;
    else
        angle=pi*2-acos(CosValue);     %�������ޡ� 
 end
 end


