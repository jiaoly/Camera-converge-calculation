%本脚本用于筛选镜头覆盖的有效区域所包含的点集，并将改有效空间绘制出来。

InitData  %输入数据，初始化
RegionPoint=FixFramRegion(long_region,width_region,heignt_region,dimension_grain);  %生成镜头所在空间的点集

%计算各镜头所占的空间的点坐标集：开始
for i = 1:num_shot
    LateralPlaneNormalVector= PlaneNormal(PlaneNormalVector(:,i),dihedral_angle(1),dihedral_angle(2));
    shot{i}=SingleFourPyramidSelectPoint( PeakPoint(:,i),RegionPoint,LateralPlaneNormalVector ); 
end
%计算各镜头所占的空间的点坐标集：结束
%绘图
subplot(2,2,[1 3])
for i = 1:num_shot
    scatter3(shot{i}(1,:),shot{i}(2,:),shot{i}(3,:),'.');
    hold on
end

%******************计算两相机重合点的集合：开始
EffectRegion = [0,0,-1];  
for i=1:num_shot-1    
    for j = (i+1):num_shot
        [c, ia, ib] = intersect(shot{i}',shot{j}','rows');
%         scatter3(c(:,1)',c(:,2)',c(:,3)','filled');
        EffectRegion = union(EffectRegion,c,'rows');              
    end
end
EffectRegion(1,:) = [];
subplot(2,2,2)
scatter3(EffectRegion(:,1)',EffectRegion(:,2)',EffectRegion(:,3)')
%******************计算两相机重合点的集合：结束

%******************计算三相机重合点的集合：开始
EffectRegion = [0,0,-1];
for i=1:num_shot-2    
    for j = (i+1):num_shot-1
        for k = (j+1):num_shot
            [c, ia, ib] = intersect(shot{i}',shot{j}','rows');
            [c, ia, ib] = intersect(c,shot{k}','rows');
%           scatter3(c(:,1)',c(:,2)',c(:,3)','filled');
            EffectRegion = union(EffectRegion,c,'rows');          
        end
    end
end
EffectRegion(1,:) = [];
subplot(2,2,4)
scatter3(EffectRegion(:,1)',EffectRegion(:,2)',EffectRegion(:,3)')

%******************计算三相机重合点的集合：结束