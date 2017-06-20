


region1 = selectRegion(im1, positions1);
%region2 = selectRegion(im2, positions2);
H = dist2 (descriptors1, descriptors2);
display = displaySIFTPatches(positions2, scales2, orients2,im2);
