% ========================================================================

function draw_cm(mat,tick,num_class)
%%
%  参数：mat-矩阵；tick-要在坐标轴上显示的label向量，例如{'label_1','label_2'...}
%
%%
imagesc(mat);            %# 绘彩色图
colormap(flipud(gray));  %# 转成灰度图，因此高value是渐黑色的，低value是渐白的
set(gca, 'XTick', 1:num_class);
set(gca, 'YTick', 1:num_class);
textStrings = num2str(mat(:),'%0.2f');  
textStrings = strtrim(cellstr(textStrings)); 
[x,y] = meshgrid(1:num_class); 
hStrings = text(x(:),y(:),textStrings(:), 'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim')); 
textColors = repmat(mat(:) > midValue,1,3); 
%改变test的颜色，在黑cell里显示白色
set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors

set(gca,'XTickLabel',tick,'XAxisLocation','top');

rotateXLabels(gca, 315 );% 旋转X轴label

set(gca,'YTickLabel',tick);


