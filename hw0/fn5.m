%|| e
function meanImage = fn5(image,upDown)
input = uint8(double(image)); % Inialize to first image.
mirror = uint8(double(upDown));
meanImage = (input + mirror) / 2;

subplot(3, 2, 5); imshow(meanImage);
title('mean');