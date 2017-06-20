function [ reducedColorImage, reducedEnergyImage ] = reduce_height( myImg, energyImage )

dir = 'HORIZONTAL';
map = cumulative_minimum_energy_map(energyImage, dir);
seam = find_optimal_horizontal_seam(map);


rows = size(myImg,1);
cols = size(myImg,2);

    for i=1:cols
        reducedColorImage(:,i,:) = myImg([1:(seam(i)-1) (seam(i)+1):end],i,:);
        reducedEnergyImage(:,i) = energyImage([1:(seam(i)-1) (seam(i)+1):end],i);
    end

end
