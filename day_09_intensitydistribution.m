I=imread('005.jpg');
g1=im2gray(I);
imshow(g1)
im=size(g1);
x=1:1:im(2);
y=1:1:im(1);
figure
y1=length(y)-y;% inverting the image because the matrix y(1,1) in the image and the contour are inverted upside down
contour(x,y1,g1./50)
colorbar
% drawing lines on plot
m=length(x);
n=length(y);
line([0;m],[n/3;n/3],'linestyle','--', 'color','r');
line([0;m],[n/1.5;n/1.5],'linestyle','--','color','r');
line([m/3;m/3],[0;n],'linestyle','--','color','r');
line([m/1.5;m/1.5],[0;n],'linestyle','--','color','r');
figure
plot(x,g1(1000,:))
x1=g1./50;
%dividing the matrix into 9 parts
 a = x1(1:end/3, 1:end/3);
 b = x1(end/3+1:end/1.5, 1:end/3);
 c = x1(end/1.5+1:end, 1:end/3);
 d = x1(1:end/3, end/3+1:end/1.5);
 e = x1(end/3+1:end/1.5, end/3+1:end/1.5);
 f = x1(end/1.5+1:end, end/3+1:end/1.5);
 g = x1(1:end/3, end/1.5+1:end);
 h = x1(end/3+1:end/1.5, end/1.5+1:end);
 i = x1(end/1.5+1:end, end/1.5+1:end);
 %summing the values inside the matrix
 sa=sum(a , 'all' );
 sb=sum(b , 'all' );
 sc=sum(c , 'all' );
 sd=sum(d , 'all' );
 se=sum(e , 'all' );
 sf=sum(f , 'all' );
 sg=sum(g , 'all' );
 sh=sum(h , 'all' );
 si=sum(i , 'all' );
 
 