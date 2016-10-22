Image = imread('nuclei.png');
[Cont2,Curv2] = activeContours2(20, 200, 100, Image,0.25,0.25,0.55);

%Image = imread('moneda.PNG');
%[Cont,Curv] = activeContours2(47,100,50,Image,0.35,0.35,0.35);

%[x,y] = InitialContour(20, 30,50,50);
%[Cont,Curv] = snake(1,Image, x, y, 1.0, 1.0, 1.2, [60.0, 0.15], 3, ceil(0.5 * size(x)), sqrt(2));


