%figure;
I = imread('crop1.jpg');
A = imread('wdc1.jpg');
E = imread('E.jpg');
S = imread('S.jpg');
%imshow(S);
%t1 = ginput;
%points1 = t1';

G = imread('crop2.jpg');
B = imread('wdc2.jpg');
F = imread('F.jpg');
D = imread('D.png');
%imshow(D);
%t2 = ginput;
%points2 = t2';

HMatrix = computeH(cc1, cc2);
%HMatrix = computeH(points1, points2);
[warpIm, mergeIm] = warpImage(I, G, HMatrix);

