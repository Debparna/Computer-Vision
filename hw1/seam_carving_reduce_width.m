I = imread('outputReduceWidthPrague.png');
J = imread('inputSeamCarvingMall.jpg');

energyImage = energy_image(I);
[reducedColorImage,reducedEnergyImage] = reduce_width(I, energyImage);

for i=1:1:99
    [reducedColorImage,reducedEnergyImage] = reduce_width(reducedColorImage,reducedEnergyImage);
end

imwrite(I, 'outputReduceWidthPrague.png');
imwrite(J, 'outputReduceWidthMall.png');

%figure;
%subplot(3, 2, 1); imshow(I);
%title('original');

%subplot(3, 2, 2); imshow(reducedColorImage);
%title('Seam Carved');

%J = imresize(I, [177 84]);
%subplot(3, 2, 3); imshow(J)
%title('Resized Image')
