clear all;
close all;
%deuxieme essaie 03/11/24 Anant KASHID

%d'abord normaliser, puis seuiller pour essayer de ne detecter que le
%frisbee, on peut essayer de creer autour du frisbee une zone ou on
%augmente l'intensité des pixels et on diminue ce qui n'est pas autour
%on essaye ouuuuu
%On essaye sur la premiere image
Icouleur=imread("image_1.png");
I=f_normal(rgb2gray(Icouleur));
s=size(I);
for i=1:s(1) %je seuil l'image
    for j=1:s(2)
        if I(i,j)<0.7 %seuil a 0.7 on detecte bien le frisbee
            I(i,j)=0;
        else
            I(i,j)=1;
        end
    end
end
figure, imshow(I), axis on
%On demande ensuite ou se situe le frisbee, pour initialiser la recherche
prompt="Où se situe le frisbee?";
x=input(prompt); %on indique dans un tableau a peu pres le milieu du frisbee (coordonnees x,y)
%Je suppose que le frisbee fait a peu près 120 de hauteur et 150 de largeur
%On va rendre toute l'image noire sauf le frisbee
for h=1:x(1)
    for l=1:x(2)
        if (h<x(1)-60 && l<x(2)-75) || (h>x(1)+60 && l<x(2)-75) || (h<x(1)-60 && l>x(2)-75) || (h>x(1)+60 && l>x(2)-75)
            I(h,l)=0;
        end
    end
end
figure, imshow(I)

%après on va faire de proche en proche pour detecter le frisbee

%Idee bonne ou mauvaise : Pourquoi pas faire une photo du sol sans personne puis ensuite ramener les
%gens et le frisbee? Comme ca on sait deja ou est la lumiere etc
%faire differences des deux et on voit ce qui a change