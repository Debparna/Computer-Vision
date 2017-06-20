%|| f
function ran = fn6(G)
D = G + randi(255,1);    
ran = 255.*rand(size(D));
ran = uint8(ran);
ran = D - ran;
ran(ran < 0) = 0;
ran(ran > 255) = 255;

subplot(3, 2, 6); imshow(ran);
title('RGB');