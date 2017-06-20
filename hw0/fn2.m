%|| b
function upDown = fn2(image)
upDown = flipdim(image,1); 
subplot(3, 2, 2); imshow(upDown);
title('flip');