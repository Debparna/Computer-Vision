%|| a
function G = fn1(image)
G = rgb2gray(image);
figure;
subplot(3, 2, 1); imshow(G);
title('greyscale');