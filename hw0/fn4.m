%|| d
function I2 = fn4(image)
redChannel = image(:, :, 1);
greenChannel = image(:, :, 2);
blueChannel = image(:, :, 3);
I2 = cat(3, redChannel, blueChannel, greenChannel);

subplot(3, 2, 4); imshow(I2, []);
title('swap');