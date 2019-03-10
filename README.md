# Camera-converge-calculation
本程序用于模拟若干个镜头在空间可拍摄到的空间范围
本程序所用函数之间的关系如下：
***************提点所用的函数，及执行顺序：
1.创建空间点坐标：FixFramRegion;
2.计算光束或者四棱锥四个侧面的法向：PlaneNormal;
3.从空间中，提取一个四棱锥包含的点；SelectPoint（选点算法参考SingleFourPyramidSelectPoint函数最后弄得注释）
4.由于一个点至少要属于两个四棱锥，该点才是有效的。根据该约束，生成所有棱锥构成的空间区域并绘图
4.计算三个相机覆盖的区域并绘图
