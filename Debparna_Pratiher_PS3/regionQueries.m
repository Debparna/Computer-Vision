
%{
Select a polygonal region interactively with the mouse, and compute a bag of words histogram from only the SIFT descriptors that fall withinthatregion. 

you can use the histograms generated from 2.3 if you have saved it somewhere...essentially you are comparing the histogram generated from your selected region (using the number of kMeans words occurrences in that region) to the set of histograms generated for each frame (from part 2.3, also using kMeans words occurrences)

You only care about the region's historgram.
%}

load kmeans
addpath('Debparna_Pratiher_PS3/');
addpath('frames/');
addpath('sift/');
framesDir = dir('frames/'); 
siftDir = dir('sift/*.mat'); 
 
 
queryF = randperm(size(framesDir, 1), 3);
for i = queryF
    load(['sift/' siftDir(i).name]);
    
    im = imread(framesDir(i).name);
    indsInRegion = selectRegion(im, positions);
    queryBOWhist = BOWHist(descriptors(indsInRegion, :), kmeans);
    
    %queryBOWhist = BOWHist(descriptors, kmeans);
 
    testF = randperm(size(framesDir, 1), 1500);
    allTestBOWhist = [];
    
    for j = testF
        load(['sift/' siftDir(i).name]);
        testBOWhist = BOWHist(descriptors, kmeans);
        allTestBOWhist = [allTestBOWhist; testBOWhist];
    end
    
    %%%DISPLAY
    distVec = dist2(queryBOWhist, allTestBOWhist);
    [~, sorted] = sort(distVec);
    matchedFrames = testF(sorted(1:5));
    figure,
    subplot(2,3, 1) 
    imshow(imread(framesDir(i).name)); 
    for j=1:5
        subplot(2,3,j+1)
        imshow(imread(framesDir(matchedFrames(j)).name))
    end
    %%%
end
 
function bowhist = BOWHist(desc, words)
    distMat = dist2(words, desc);
    [~, wordInd] = min(distMat);
    for i = 1:size(words, 1)
        bowhist(i) = numel(find(wordInd == i));
    end
    bowhist = bowhist ./ norm(bowhist);
end
 
 

