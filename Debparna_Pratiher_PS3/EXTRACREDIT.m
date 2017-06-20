function [stopwords,out] = tfidf(hist)
 
%%%%down-weights the very frequent or called stop-words

var1 = size(hist, 1);
var2 = size(hist, 2);

c = 1;


stopwords = zeros(10, var2);

FINALH = zeros(var1,1);


for i = 1 : var1
    
    H = hist(i, :);    
    sumhist = sum( H );
    
    
    if sumhist == 0
        hist(i, :) = 0;
    else
        
        hist(i, :) = H / sum(H);
    end
end

FINAL = zeros(var1, 1);
 

for j = 1 : var1
    
    
    nonezero = hulia( hist(:, j) );
    FINALH(j,1) = sum(hist(:, j));
    if FINALH > 4000;
        stopwords(c,:) = hist(j,:);
        c = c+1;
    end
    if nonezero
        FINAL(j) = log( var2 / nonezero );
    end
    
end
 

for j = 1 : var2
    hist(:, j) = hist(:, j)* FINAL(j);
end
 
out = hist;
 
end