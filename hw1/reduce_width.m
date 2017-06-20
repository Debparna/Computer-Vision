function [ reducedColorImage, reducedEnergyImage ] = reduce_width( myImg, energyImage )

dir = 'VERTICAL';
map = cumulative_minimum_energy_map(energyImage, dir);
seam = find_optimal_vertical_seam(map);

rows = size(myImg,1);
cols = size(myImg,2);
for i=1:rows
            reducedColorImage(i,:,:) = myImg(i,[1:(seam(i)-1) (seam(i)+1):end],:);
            reducedEnergyImage(i,:) = energyImage(i,[1:(seam(i)-1) (seam(i)+1):end]);
end

figure;
imshow(reducedColorImage);

figure;
imshow(reducedEnergyImage);

end