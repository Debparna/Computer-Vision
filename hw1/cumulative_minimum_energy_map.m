function E = cumulative_minimum_energy_map(I, dir)

if strcmp(dir, 'HORIZONTAL')
    I = transpose(I);
end

x = size(I, 1);
y = size(I, 2);

E = zeros(x,y);


E(1, :) = I(1, :);

for m = 2:x
    E(m, 1) = I(m, 1)   + min([E(m-1, 1), E(m-1, 2)]);
    E(m, end) = I(m, end) + min([E(m-1, end-1), E(m-1, end)]);
    
    for n = 2:y-1
        E(m, n)   = I(m, n) + min([E(m-1, n-1), E(m-1, n), E(m-1, n+1)]);
    end
end

if strcmp(dir, 'HORIZONTAL')
    E = transpose(E);
end

%figure;
%imagesc(E);
end 