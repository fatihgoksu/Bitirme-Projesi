close all;
%v = VideoWriter('cosBaskaBirBakisAcisi.avi');
%v.FrameRate = 4;
%open(v);
N=100;M=100;
I=zeros(M , N);
for i=1:30
theta = linspace(0, i*pi, 100);
y = -cos(theta);
%figure;
%plot(theta,y);
for c=1:N
    gri=(cos(2*theta)+1)/2;
    I(:,c)=gri;
    Ifft2=fft2(I);
    shiftI=fftshift(Ifft2);
end

h=figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(shiftI);
%F = getframe(h);
%writeVideo(v,F)
end
for r=1:30
    dondurme=imrotate(I,-r,'crop');
    buyutme=dondurme(15:80, 15:80);
    buyutmefft2=fft2(buyutme);
    shiftbuyutme=fftshift(buyutmefft2);

h=figure;
subplot(1,2,1);
imshow(buyutme);
subplot(1,2,2);
imshow(shiftbuyutme);
%F = getframe(h);
%writeVideo(v,F)
end
%close(v);