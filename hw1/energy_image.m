%M(i, j) = e(i, j)+ min(M(i?1, j?1),M(i?1, j),M(i?1, j+1))
function energyImg = energy_image(im)
G = rgb2gray(im);
[Gx, Gy] = imgradientxy(im2double(G), 'intermediate');
%[Gmag, Gdir] = imgradient(Gx, Gy);

energyImg = sqrt((Gx.^2) + (Gy.^2));
%figure, imshow(energyImg);

%x = Gmag;
%figure, imshow(x, []);
%figure, imshowpair(Gx, Gy, 'montage');
end
