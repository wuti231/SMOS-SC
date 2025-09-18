clc;
clear;
close all
lat_lon_path = ' ';
load([lat_lon_path,'EASE2_M25km.lat.584x1388x1.mat']);
load([lat_lon_path,'EASE2_M25km.lon.584x1388x1.mat']);
lons=lon_25KM;
lats=lat_25KM;
data_path=' ';%MTMA-SC product path
file_name=' ';%such as MTMA-SC_SMOS_25KM_20180101_V01.nc
underline_list = split(file_name,'_');
date=char(underline_list(4,1));
MTMASC_data=ncread([data_path,file_name],'SM');
% figure('Position',[100 80 1300 590]);%%%figure 的位置和大小 
% 
% axes('position',[0.034,0.31,0.45,0.88]);       
pcolor(lons,lats,MTMASC_data);       
shading flat;       %去电网格线      
shading interp;      
colorbar      
colormap(flipud(parula));      
load coastlines;%返回[lat,long],海岸线数据    
geoshow(coastlat,coastlon,'color','k');
title([date,'\_MTMA\_SC'],'FontName','Arial','FontSize',14)
set(gca,'CLim',[0,0.45]);%改变clolobar范围
h1 = colorbar('Ticks',[0:0.05:0.450],'YTicklabel',{'0','0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40','0.45'},'Limits',[0 0.45]);
set(get(h1,'Title'),'string','SM(m^3/m^3)','FontName','Arial','FontSize',11);
% colorbar('off')
box on
set(gca,'XLim',[-180 180]);
set(gca,'YLim',[-80 80]);
set(gca,'XTick',-180:60:180);
set(gca,'YTick',-60:30:60);
set(gca,'XTicklabel',{'180°','120°W','60°W','0°','60°E','120°E','180°'},'FontName','Arial','FontSize',11);
set(gca,'YTicklabel',{'60°S','30°S','0°','30°N','60°N'},'FontName','Arial','FontSize',11);
img =gcf;  %获取当前画图的句柄
%     outPath=['I:\SMOSL1C_V734_Site_DGG\',tifName,'.png'];
outPath=[file_name(1:end-3),'.png'];
print(gcf, '-dpng', '-r600',outPath);
       
       