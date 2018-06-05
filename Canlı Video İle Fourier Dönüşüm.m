close all;
%v = VideoWriter('denemevideo1.avi');
%v.FrameRate = 4;
%open(v);
webcamlist
cam = webcam('EasyCamera');
preview(cam);
cam.Resolution = '320x240';
h=figure;
for idx = 1:500 %time 
   rgbImage = snapshot(cam);
   imggray=rgb2gray(rgbImage);
   gray=double(imggray) ./ 255;
   Ifft=fft2(gray);
   Ishift=fftshift(Ifft);
   Ilog=log(abs(Ishift));
   %h=figure;
   subplot(1,2,1);
   imshow(gray);
   subplot(1,2,2);
   imshow(Ilog);
   %F = getframe(h);
   %writeVideo(v,F)
   hold on;
   drawnow limitrate
end
clear('cam');
%close(v);
