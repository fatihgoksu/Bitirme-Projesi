close all;
%v = VideoWriter('v1.2.avi');
%v.FrameRate = 4;
%open(v);
I = zeros(200,200);
I(70:130,100 :100) = 1;
figure;
imshow(I)
Ifft=fft2(I);
Ilog=log(abs(Ifft));
figure;
imshow(Ilog,[-1 5],'InitialMagnification','fit');
colormap(jet); colorbar
for r=1:45
dondurme=imrotate(I,-r);
Idondurmefft = fft2(dondurme);
Idondurmelog=log(abs(Idondurmefft));
h=figure;
subplot(1,2,1);
imshow(dondurme);
subplot(1,2,2);
imshow(Idondurmelog,[-1 5],'InitialMagnification','fit');
%F = getframe(h);
%writeVideo(v,F)
end
%close(v);