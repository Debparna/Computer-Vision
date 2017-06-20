

%load descriptors
%acc array = size of k cluster, pick id center of image
%count how many times the cluster center is close to desc
%hist for each frame % choose 3
%find 5 hist that are closest to it, Normalized scalar product = dot
% (M=5 most similar frames (in rank order) based on the normalized scalar product between their bag of words histograms.)
%product by the 
%display frames
 
load kmeans
addpath('Debparna_Pratiher_PS3/');
addpath('frames/');
addpath('sift/');
framesDir = dir('frames/'); 
siftDir = dir('sift/*.mat');  
 
% Select 3 random query frames
queryF = randperm(size(framesDir, 1), 3);
%fnames = dir([siftDir '/*.mat']);
 
for i = queryF
    %fname = [siftdir '/' fnames(j).name];
    %load(fname);
    load(['sift/' siftDir(i).name]);
    
    % Get normalized Bag of Words (BOW) histogram for query image
    queryBOWhist = BOWHist(descriptors, kmeans);
 
                % IMAGES FOR QUERY MATCHES(TEST) - Randomly sample some images out of which the best matches are to be  found. 
                testF = randperm(size(framesDir, 1), 1500);
                allTestBOWhist = [];
                for j = testF
                    load(['sift/' siftDir(i).name]);
                    testBOWhist = BOWHist(descriptors, kmeans);
                    % concantenate normalized BOW histograms for test images 
                    allTestBOWhist = [allTestBOWhist; testBOWhist];
                end
    
    % Find distance between query image histogram and all test image histograms
    distVec = dist2(queryBOWhist, allTestBOWhist);
 
    %%%%% SORT MATCH PLOT %%%%%%%
    [~, sorted] = sort(distVec);    
    matchedFrames = testF(sorted(1:5));
    figure,
    subplot(2,3, 1) 
    imshow(imread(framesDir(i).name));   
    for j=1:5
        subplot(2,3,j+1)
        imshow(imread(framesDir(matchedFrames(j)).name))
    end
    %%%%%%%%%%%%%
    
end
 
function bowhist = BOWHist(desc, words)
 
                    distMat = dist2(words, desc);
                    [~, wordInd] = min(distMat);
                    for i = 1:size(words, 1)
                        bowhist(i) = numel(find(wordInd == i));
                    end
                    bowhist = bowhist ./ norm(bowhist);
end
 
 
 

