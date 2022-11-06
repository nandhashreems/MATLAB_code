function [tc_x_loc]=track_cell(img,channel_width,min_circle_radius,max_circle_radius,imf_sensitivity,laser_center_y)
% channel_width=81;   %%number pixels between 2 vertical lines
% laser_center=[320/2 256*4/5]    %center in x direction and 4/5th in y direction of the camera
% x=cellflow2i_20160422_avi(2000).cdata;
x=im2gray(img);
imshow(x);
% [xbw,x1]=find_circles(x);
[centers, radii] = imfindcircles(x,[min_circle_radius max_circle_radius],'ObjectPolarity','bright',...
    'Sensitivity',imf_sensitivity); % use min_circle_radius=2, max_circle_radius=4 for optimal prediction, Sensitivity=0.95
imshow(x);viscircles(centers,radii);
% imshow(x1)
% x1=imadjust(x);
% [ybw,y]=segmentImage(x1);
%% finding the channels (strong gradients in x)

[gx gy]=imgradientxy(x);
% VertLines=gx>120;
% figure, imshow(VertLines,[]);
gxsum = sum(gx); %sum of every column
plot(gxsum); %show the peak black values in x
[gmax,maxloc1]=max(gxsum);  %finds 1 channel based on peak black color outputs max value and location of max value
%% to find second channel, look at a distance of width of channel to the left and right and find it

if gxsum(maxloc1+channel_width)>1e4
    maxloc2=maxloc1+channel_width;
    left=0;
else
    maxloc2=maxloc1-channel_width;
    left=1;
end
%% eliminating circles which are out of bounds (channel bound and laser bound)

n=size(centers);
no_circles=n(1)
for i=1:no_circles
    if centers(i,1)<(min(maxloc1,maxloc2)+3.5)||centers(i,1)>(max(maxloc1,maxloc2)-3.5)
        centers(i,2)=0; % flow from top to bottom - so pushing the unwanted circle to the bottom (behind the laser) 
    end
    if centers(i,2)>(laser_center_y-20) % use laser center based on pos - use 256*4/5
        centers(i,2)=0;
    end
end
% figure
% imshow(x);viscircles(centers,radii);
% y_centers=centers(:,2)
% centers(centers(:,2)<laser_center(2))
%finding the closest circle to the laser - output xloc and yloc
[tc_y_loc,tc_index]=max(centers(:,2))
tc_x_loc = centers(tc_index,1)
end
