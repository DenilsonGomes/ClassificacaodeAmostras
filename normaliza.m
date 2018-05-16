%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Função que padroniza os dados

%função recebe os dados e os retorna com media zero e variança unitaria
function X = normaliza(dados) 
[s,tam] = size(dados); %recebe as dimensoes dos dados
for i=1:tam %para todos os vetores
    for j=1:s %para todos os atributos desse vetor
        X(j,i) = (dados(j,i) - mean(dados(:,i)))/std(dados(:,i)); %normaliza o dado
    end
    %todos os atributos do vetor i foram normalizados
end
%todos os dados foram normalizados
X;%retorna os dados normalizados