%4 a
figure;
a = rand(50);
b = sort(a,'descend')
plot(b);

%4b 
figure;
histogram(a,10);

%4c
figure;
c = a(1:25, 25:end);
plot(c);
imagesc(c);

%4d
figure;
j = mean(a);
s = a - j;
imagesc(s);

%4 e
figure;
t = mean(a); 
Y = zeros(50, 50, 3);
imshow(Y);
if (Y(Y > t))
    Y(50, 50, 1) = [255, 0, 0];
        imshow(Y);
    else
    Y(50, 50, 2) = [0, 0, 0];
        imshow(Y);
end




