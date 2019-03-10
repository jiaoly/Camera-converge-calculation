function [angle] = AngleLieQuadrant(CosValue,SinValue)
%根据输入的余弦和正弦值，函数确定这组三角函数对应的角度
%输入参数：CosValue,SinValue（同一角度对应的余弦值和正弦值）
%输出结果:angle(弧度制)
x=CosValue^2+SinValue^2;
% if(x ~=1)
%    disp('输入的余弦值和正弦值不满足自洽，请重新输入'); 
%    return;
% end


if(CosValue>=0&&CosValue*SinValue>=0)
    angle=acos(CosValue);     %第一象限·
    return  ;
elseif (CosValue<=0&&CosValue*SinValue<=0)
        angle=pi-acos(CosValue);     %第二象限·
    return  ;
elseif (CosValue<=0&&CosValue*SinValue>=0)
        angle=pi+acos(CosValue);     %第三象限·
    return  ;
    else
        angle=pi*2-acos(CosValue);     %第四象限· 
 end
 end


