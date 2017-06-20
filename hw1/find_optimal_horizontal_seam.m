function horizontalSeam = find_optimal_horizontal_seam(energyMap)

energyMap2 = energyMap';
I  = find_optimal_vertical_seam(energyMap2);
horizontalSeam = I';

end 
   