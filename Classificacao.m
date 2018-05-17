%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Classificar a base database_pap

clear %limpa as variaveis
clc %limpa o visor

load database_pap.dat %carrega a base de dados

amostras = database_pap'; %amostras recebe os vetores da base
[tam,~] = size(database_pap); %calcula o tamanho da base de dados
classes = zeros(2,tam); %a classe é um vetor coluna, classe 0 = [1 0]T e classe 1 = [0 1]T
classes(1,1:242) = 1; %amostras da classe 0
classes(2,243:tam) = 1; %amostras da classe 1

%leave-one-out
acertos = leaveoneout(amostras, classes); %calcula o numero de acertos
taxa = (acertos/917)*100; %calcula o percentual de acerto sem a normalização

X = normaliza(amostras);%retorna os dados normalizados

%leave-one-out com os dados normalizados
acertos = leaveoneout(X, classes); %calcula o numero de acertos
taxac = (acertos/917)*100;%calcula o percentual de acerto com a normalização
fprintf('Porcentagem de acerto sem a normalização: %.4f\n',taxa);%exibe o percentual de acertos
fprintf('Porcentagem de acerto com a normalização: %.4f\n',taxac);%exibe o percentual de acertos

%knn
for i=1:10 %10 execuções de knn
    [X,Y] = permuta(amostras, classes); %