load('twoFrameData.mat');

%DONT LOAD IF ALREADY LOADED
region = selectRegion(im1, positions1);

m = [];
for d = descriptors1(region,:)'
    dist = dist2(d', descriptors2);
    
    
    [Y, I] = min(dist);
    
    
    m = [m; Y, I];
end

m = sortrows(m, 1)
matchedInds     =       m(1:75, :)

figure;
imshow(im2);

arg1 = positions2(matchedInds(:,2),:);
arg2 = scales2(matchedInds(:,2),:);
arg3 = orients2(matchedInds(:,2),:);

displaySIFTPatches(arg1, arg2, arg3, im2);

%displaySIFTPatches(positions2(matchedInds, :), scales2(matchedInds), orients2(matchedInds), im2);

