% Desenvolvido por Gleice Medeiros- UFERSA
% Orientador: Leiva Casemiro e Coorientador: Leandro Souza
close all
clear all
%=========================================================================%
%==================APLICANDO FILTROS======================================%



 x = imread('1-fig_1_h2o2.jpg');
 y = imread('2-fig_1_pbs.jpg');
 z = imread('3-fig_1_hipo.jpg');


b = y + 80; % Brilho com aumento de 80%

limiar = 180; 
c = double(y)/limiar; % Contraste
bx = c.^2;
bn = uint8(bx*limiar); % Binarizacao

       se = strel('line',10,30); % length = 10 e angulo = 30
       e = imerode (y,se); % erosão 
       d = imdilate(y,se); % dilatação 
       
       % percorrendo a imagem completa
  for i=1:length(y(1,:)),
      aux(i)  = mean (b(:,i));
      aux_1(i)  = mean (c(:,i));
      aux_2(i)  = mean (bn(:,i));
      aux_3(i)  = mean (d(:,i));
      aux_4(i)  = mean (e(:,i));
    pixel (i) = i;
%     angulo(i) = -0.0070*i+72.765;
 end
%  pixel = angulo;
 
 figure, plot (pixel(1:1280),aux(1:1280)./max(aux(1:1280)), pixel(1:1280), aux_1(1:1280)./max(aux_1(1:1280)), pixel(1:1280),aux_2(1:1280)./max(aux_2(1:1280)), pixel(1:1280),aux_3(1:1280)./max(aux_3(1:1280)),pixel(1:1280),aux_4(1:1280)./max(aux_3(1:1280)))
 
   