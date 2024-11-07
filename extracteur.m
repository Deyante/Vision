clear all;
close all;
%17/10/24 Anant KASHID
%essaie de creer des images à partir d'une video

v=VideoReader('LancerFris1.mp4'); %import la video
 %On veut maintenant toutes les images de cette video
n=1;
while hasFrame(v)
    img=readFrame(v);
    imwrite(img, strcat('image_',num2str(n),'.png')); %enrengistre les images sous le nom image_n.png
    n=n+1;
end
I=f_normal(imread("image_1.png")); %je vais juste essayer de travailler avec la premiere

