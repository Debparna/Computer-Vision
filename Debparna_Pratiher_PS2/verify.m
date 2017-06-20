I1 = imread('D.png');
figure;

imshow(I1);
points = ginput;

figure;
subplot(1,2,1);
imshow(I1);
hold;
H = computeH(points, new_points);

