function verticalSeam = find_optimal_vertical_seam(E)
    [yAxis, xAxis] = size(E);
    verticalSeam = zeros(yAxis,1);
    [minRow, minCol] = min(E(yAxis,:));
    x = minCol;
    verticalSeam(yAxis) = x;

    for y=yAxis-1:-1:2
        if (x == 1)
            [minRow, mincol] = min([E(y-1,x), E(y-1,x+1)]);
            if (mincol == 2)
                x = x + 1;
            end;
        elseif (x == xAxis)
            [minRow, mincol] = min([E(y-1,x), E(y-1,x-1)]);
            if (mincol == 2)
                x = x - 1;
            end;
        else
            [minRow, mincol] = min([E(y-1,x-1), E(y-1,x), E(y-1,x+1)]);
            if (mincol == 1)
                x = x - 1;
            elseif (mincol == 3)
                x = x + 1;
            end;
        end;
        verticalSeam(y) = x;
    end;
    
    % rest is for the first row; choose the pixel with minimum energy value
    y = 1;
    x = verticalSeam(2);
    
    if (x == 1)
        [minRow, mincol] = min([E(y,x), E(y,x+1)]);
        if (mincol == 2)
            x = x + 1;
        end;
    elseif (x == xAxis)
        [minRow, mincol] = min([E(y,x), E(y,x-1)]);
        if (mincol == 2)
            x = x - 1;
        end;
    else
        [minRow, mincol] = min([E(y,x), E(y,x-1), E(y,x+1)]);
        if (mincol == 2)
            x = x - 1;
        elseif (mincol == 3)
            x = x + 1;
        end;
    end;
    
    verticalSeam(1) = x;
end