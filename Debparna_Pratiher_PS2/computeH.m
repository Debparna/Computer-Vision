function H = computeH (t1, t2)

[~, n, ~] = size(t1);
A = (zeros(2*n, 9));

j = 1;
for i = 1:n
    x1 = t1(1,i); 
    y1 = t1(2,i);
    x2 = t2(1,i);
    y2 = t2(2,i);
    temp1 = [x1, y1, 1, 0, 0, 0, -x1*x2, -y1*x2, -x2];
    temp2 = [0, 0, 0, x1, y1, 1, -x1*y2, -y1*y2, -y2];
    A(j,:) = temp1;
    A(j+1,:) = temp2;
    j = j + 2;
end

[h,d] = eig(A'*A);
hVec = h(:,1);
H = (reshape(hVec, 3, 3))';

end