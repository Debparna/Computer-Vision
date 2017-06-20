clc
clear all;
close all;
%siftDir = dir('./sift/'); 
%framesDir = dir('./frames/'); 
 
%First I take a random group of frames and put all their descriptors into an array
%Then I perform Kmeans on these descriptors
%For each cluster center, I put all descriptors assigned to the cluster in an array and find the distance matrix between the center and the descriptors.
%Then I sort this distance matrix and find the 25 smallest distance descriptors to find their source frame and display on a subplot.

addpath('Debparna_Pratiher_PS3/');

addpath('frames/');
framesDir = dir('frames/');
framesDir = dir('frames/'); 
framesDir = framesDir(2:end);

addpath('sift/');
siftDir = dir('./sift/*.mat'); 
siftDir = siftDir(1:end);

%flist = dir('./sift/*.mat');

Descriptors = [];
Positions = [];
Scales = [];
orients = [];
id = [];
 

 %for i = 1:numel(siftDir)
for i = 1:numel(siftDir)
load(siftDir(i).name);
        deb = size(descriptors,1); indexes = randperm(deb); number = indexes(1:min([100,deb]));

        
        %%%%%%ARRAYY%%%%%%%%
                    Descriptors = [Descriptors; descriptors(number,:)];
                    Positions = [Positions; positions(number,:)];
                    Scales = [Scales; scales(number,:)];
                    Orients = [Orients; orients(number,:)];
 
id(end+1: end+number) = i;
end


[membership, kmeans, ~] = kmeansML(1500, Descriptors');
kmeans = kmeans';
save kmeans.mat membership kmeans Positions Scales orients id;

%%


%load descriptors
%acc array = size of k cluster, pick id center of image
%count how many times the cluster center is close to desc
%hist for each frame % choose 3
%find 5 hist that are closest to it, Normalized scalar product = dot
% (M=5 most similar frames (in rank order) based on the normalized scalar product between their bag of words histograms.)
%product by the 
%display frames


load kmeans.mat membership kmeans allPositions allScales allOrients imID;
k = 1500;
randWords = randperm(size(kmeans, 1), 2); 


for i = 1:2
        figure,
        match = [];
        show = 0;
        randDataPerm = randperm(numel(siftDir));
        
        for j = randDataPerm
                try
                    load(siftDir(j).name)
                catch e
                    continue;
                end
                %load(siftDir(j).name)
                distMat = dist2(kmeans, descriptors);
                [~, minInd] = min(distMat);
                match = find(minInd == randWords(i));
                
                for k = match
                        show = show + 1;
                        im = imread(imname);
                        
                        %%%%%%DISPLAY%%%%%%%
                        patch = getPatchFromSIFTParameters(positions(k,:), scales(k), orients(k), rgb2gray(im));
                        subplot(5,  5,  show)
                        imshow(patch)
                        if show == 25
                            break;
                        end
                end
                if show == 25
                    break;
                end
        end
end