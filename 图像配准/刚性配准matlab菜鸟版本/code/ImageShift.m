function I = ImageShift(filename,x,y)
% Author��lajipeng
% Date: 2019/11/2
% Fuction: ImageShift for image registration
OldImage = imread(filename);
figure(1)
imshow(OldImage);
[nrows,ncols] = size(OldImage);
width = nrows;
height = ncols;
NewImage = uint8(zeros(width,height));
T = [1,0,0;0,1,0;x,y,1];
tform = maketform('affine',T);

tx = zeros(width,height);
ty = zeros(width,height);

for i = 1:width
    for j = 1:height
        tx(i,j) = i;
    end
end

for i = 1:width
    for j = 1:height
        ty(i,j) = j;
    end
end

[w,z] = tforminv(tform,tx,ty);

for i = 1:width
    for j = 1:height
        source_x = w(i,j);
        source_y = z(i,j);
        if(source_x>=width-1||source_y>=height-1||double(uint8(source_x))<=0||double(uint8(source_y))<=0)
            NewImage(i,j) = 0;
        else
            if(source_x/double(uint16(source_x))==1.0&&source_y/double(uint16(source_y))==1.0)
                NewImage(i,j) = OldImage(int16(source_x),int16(source_y));
            else
                a = double(uint8(source_x));
                b = double(uint8(source_y));
                x11 = double(OldImage(a,b));
                x12 = double(OldImage(a,b+1));
                x21 = double(OldImage(a+1,b));
                x22 = double(OldImage(a+1,b+1));
                NewImage(i,j) = uint8((b+1-source_y)*((source_x-a)*x21+(a+1-source_x)*x11)+(source_y-b)*((source_x-a)*x22+(a+1-source_x)*x12));
            end
        end
    end
end
I = NewImage; 
figure(2)
imshow(I);
end

