%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Função que padroniza os dados

%função recebe os dados e os retorna com media zero e variança unitaria
function X = normaliza(dados) 
[s,tam] = size(dados); %recebe as dimensoes dos dados
for i=1:tam:
    for i=1:s:
        X(s,i) = (dados(s,i) .- mean(mean(dados)))/var(var(dados);
    end