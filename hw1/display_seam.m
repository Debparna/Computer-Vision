function [] = display_seam(myImg, seam, seamDirection )

if strcmp(seamDirection,'HORIZONTAL')
    imagesc(myImg);
    hold on;
    plot(seam);

elseif strcmp(seamDirection,'VERTICAL')
    imagesc(myImg);
    hold on;
    plot(seam,1:numel(seam))

end