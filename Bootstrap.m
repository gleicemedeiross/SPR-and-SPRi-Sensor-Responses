% Desenvolvido por Gleice Medeiros
% Orientação Leiva Casemiro e Leandro Souza

clear all;
close all;

 a = imread('1-fig_1_h2o2.jpg');
 b = imread('2-fig_1_pbs.jpg');
 c = imread('3-fig_1_hipo.jpg');
 
% a = a(:,60:1020);
% b = b(:,60:1020);
% c = c(:,60:1020);

se = strel('line',10,30);     % length = 10 e angulo = 30
        h2o  = imerode(a,se); % Erosão da agua
        pbs  = imerode(b,se); % Erosão do pbs
        hipo = imerode(c,se);  % Erosão do hipo
      
        b_red = a(:,:,1);
 
  %Aplicando o Bootstrap 
  B = 8000;
  alpha = 0.05;
  
  inf = zeros(size(b_red,2),1);
  sup = zeros(size(b_red,2),1);
% 
%   mf = @(x)((mean(x)+median(x))/2); % Media total da media com mediana
 mf = @(b)((mean(b))/2); % Media total da media com mediana
%   mf = @(b)((mean(b)+imgaussfilt(b,1))/2); % Media total da media com gaussiana
  
  for i=1:1:size(b_red,2)
      
    means = bootstrp(B,mf,b_red(:,i));
    m1 = sort(means, 'ascend');
    s  = round(B*(alpha/2));
    z  = round((1-alpha/2)*B);
    inf(i) = m1(s);
    sup(i) = m1(z);
    aux_a(i) = mean(h2o(:,i));
    aux_b(i)  = mean(pbs(:,i));
    aux_c(i)  = mean(hipo(:,i));
    pixel (i) = i;
    angulo(i) = -0.0070*i+72.765;
  
  end
  pixel = angulo;
     
   fprintf('[%.3f %.3f]\n', inf, sup);
%     sup_h2o(i) = m1(i);
%     inf_h2o(i) = m1(s);

figure, plot ( pixel, aux_a, pixel, aux_b, pixel, aux_c); legend('H_2O','PBS','HIPO');
% figure, plot ( pixel, inf, pixel, sup); legend('Curva Inferior H_2O','Curva Inferior PBS');




