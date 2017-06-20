function [Iwarp, Imerge] = warpImage(Iin, Iref, H)
    
    %size
    [height,width,~] = size(Iin);
    [height1,width1,~] = size(Iref);

    %corner points
    corner = H * [ 1 1 width width ; 1 height 1 height ; 1 1 1 1 ];  
    corner1 = corner(:, 1) / corner(3,1);
    corner2 = corner(:, 2) / corner(3,2);
    corner3 = corner(:, 3) / corner(3,3);
    corner4 = corner(:, 4) / corner(3,4);
    corner = [corner1, corner2, corner3, corner4];
    
    xMin = min(corner(1,:));
    xMax = max(corner(1,:)); 
    yMin = min(corner(2,:));
    yMax = max(corner(2,:)); 

    Tranlated = [1 0 -xMin; 0 1 -yMin; 0 0 1];

    transformation_matrix = Tranlated * H;

    final = transformation_matrix * [ 1 1 width width ; 1 height 1 height ; 1 1 1 1 ]; 
    final1 = final(:, 1) / final(3,1);
    final2 = final(:, 2) / final(3,2);
    final3 = final(:, 3) / final(3,3);
    final4 = final(:, 4) / final(3,4);
    
    final = [final1, final2, final3, final4];
    
    warped_Xmin = min(final(1,:));
    warped_Xmax = floor(max(final(1,:))); 
    warped_Ymin = min(final(2,:));
    warped_Ymax = floor(max(final(2,:)));

    warped_image = [];

    for i=1:warped_Ymax
        for j=1:warped_Xmax
            dimension = transformation_matrix \ [j, i, 1]';
            x = floor(dimension(2,1) / dimension(3,1));
            y = floor(dimension(1,1) / dimension(3,1));
            if(x >= 1 && y >= 1 && x <= height && y <= width)
                warped_image(i, j, :) = Iin(x, y, :);
            end
        end
    end
    
    Iwarp = uint8(warped_image);
    %figure(1)
    %imshow(Iwarp);
    
    transpose = -floor([min([corner(1,:), 0]), min([corner(2,:), 0])]);
    warped_image(1+transpose(2):height1+transpose(2), 1+transpose(1):width1+transpose(1), :) = double(Iref(1:height1, 1:width1, :));

    Imerge = uint8(warped_image);
    figure; 
    imshow(Imerge);
    
end
