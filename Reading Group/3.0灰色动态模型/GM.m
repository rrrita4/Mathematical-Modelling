clc;
close;
clear all;
format short;
x=[130756 131448 132129 132802 133450 134091 134916 135922 136726 137646 138326 139232 130011 140541 141008 141212 141260];
n1=size(x,1);
for i=1:n1
    x(i,:)=x(i,:)/x(i,1);
end
data=x;
consult=data(6:n1,:);
m1=size(consult,1);
compare=data(1:5,:);
m2=size(compare,1);
for i=1:m1
for j=1:m2
t(j,:)=compare(j,:)-consult(i,:);
end
min_min=min(min(abs(t')));
max_max=max(max(abs(t')));
resolution=0.5;
coefficient=(min_min+resolution*max_max)./(abs(t)+resolution*max_max);
corr_degree=sum(coefficient')/size(coefficient,2);
r(i,:)=corr_degree;
end
r
bar(r,0.90);
axis tight;
legend('总人口');
set(gca,'XTickLabel','');
n=1
x_value=1:1:n;
x_range=[0.1 n+.4];
set(gca,'XTick',x_value,'XLim',x_range);
profits={'总人口数'};
y_range=y_lim;
handle_date=text(x_value,y_range(1)*ones(1,n)+.018,profits(1:1:n));
set(handle_date,'HorizontalAlignment','right','VerticalAlignment','top','Rotation',35,'fontname','Arial','fontsize',10.5);
ylabel('y');
title('总人口数');
