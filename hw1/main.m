i = imread('inputSeamCarvingPrague.jpg');
j = imread('inputSeamCarvingMall.jpg');

figure;
imshow(j);
energyImage = energy_image(i);
cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
vertSeam = find_optimal_vertical_seam(cumulativeEnergyMap);
horizSeam = find_optimal_horizontal_seam(cumulativeEnergyMap);
%display_seam(i,vertSeam,'VERTICAL');
%[reducedColorImage, reducedEnergyImage] = reduce_width(i, energyImage);
[reducedColorImage, reducedEnergyImage] = reduce_height(i, energyImage);