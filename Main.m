%���ű�����ɸѡ��ͷ���ǵ���Ч�����������ĵ㼯����������Ч�ռ���Ƴ�����

InitData  %�������ݣ���ʼ��
RegionPoint=FixFramRegion(long_region,width_region,heignt_region,dimension_grain);  %���ɾ�ͷ���ڿռ�ĵ㼯

%�������ͷ��ռ�Ŀռ�ĵ����꼯����ʼ
for i = 1:num_shot
    LateralPlaneNormalVector= PlaneNormal(PlaneNormalVector(:,i),dihedral_angle(1),dihedral_angle(2));
    shot{i}=SingleFourPyramidSelectPoint( PeakPoint(:,i),RegionPoint,LateralPlaneNormalVector ); 
end
%�������ͷ��ռ�Ŀռ�ĵ����꼯������
%��ͼ
subplot(2,2,[1 3])
for i = 1:num_shot
    scatter3(shot{i}(1,:),shot{i}(2,:),shot{i}(3,:),'.');
    hold on
end

%******************����������غϵ�ļ��ϣ���ʼ
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
%******************����������غϵ�ļ��ϣ�����

%******************����������غϵ�ļ��ϣ���ʼ
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

%******************����������غϵ�ļ��ϣ�����