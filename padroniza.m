%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computa��o
%Intelig�ncia Computacional - Dr. Jarbas Joaci
%Fun��o que padroniza os dados

%fun��o recebe os dados e os retorna com media zero e varian�a unitaria
function X = normaliza(dados) 
[s,tam] = size(dados); %recebe as dimensoes dos dados
for i=1:tam:
    for i=1:s:
        X(s,i) = (dados(s,i) .- mean(mean(dados)))/var(var(dados);
    end