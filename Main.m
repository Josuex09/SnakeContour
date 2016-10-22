Image = imread('nuclei.png');
[x,y] = activeContours2(70, 100, 100, Image,1.0,1.0,1.2);
