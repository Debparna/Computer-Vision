I = imread('inputSeamCarvingPrague.jpg');
J = imread('outputReduceWidthMall.png');
energyImage = energy_image(J);
[reducedColorImage,reducedEnergyImage] = reduce_height(J, energyImage);

for i=1:1:49
    [reducedColorImage,reducedEnergyImage] = reduce_height(reducedColorImage,reducedEnergyImage);
end

imwrite(I, 'outputReduceWidthPrague.png');
imwrite(J, 'outputReduceWidthMall.png');

%figure;
%subplot(3, 2, 1); imshow(J);
%title('original');

%subplot(3, 2, 2); imshow(reducedColorImage);
%title('Seam Carved');

%K = imresize(J, [50 150]);
%subplot(3, 2, 3); imshow(K)
%title('Resized Image')


