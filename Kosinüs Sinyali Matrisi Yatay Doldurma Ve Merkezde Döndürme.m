close all;
%v = VideoWriter('rotate.avi');
%v.FrameRate = 4;
%open(v);
N=100;M=100;
I=zeros(M , N);
for i=1:25
theta = linspace(0, i*pi, 100);
y = cos(theta);
%figure;
%plot(theta,y);
for c=1:N
    gri=(cos(2*theta)+1)/2;
    I(:,c)=gri;
    Jorg = imrotate(I, -i, 'crop', 'bilinear');
    J = Jorg(15:80, 15:80);
    Ifft2=fft2(J);
    shiftI=fftshift(Ifft2);
end
h=figure;
subplot(1,2,1);
imshow(J);
subplot(1,2,2);
imshow(shiftI);
%F = getframe(h);
%writeVideo(v,F)
end
%close(v);