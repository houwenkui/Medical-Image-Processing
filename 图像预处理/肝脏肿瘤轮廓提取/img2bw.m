function [img_bw] = img2bw(img)
%-- Author��Wang, Peng. Fudan University 
%-- Date��2019/8/22
%-- Fuction��Transform the tumor image to a binary image for extract its
%   contour
dim = size(img);
for i = 1:dim(1)
    for j= 1:dim(2)
        if img(i,j) <= 864
            img(i,j) = 0;
        else
            img(i,j) = 1;
        end
    end
end
img_bw = im2bw(img);
end

