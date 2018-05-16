%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Classificar a base database_pap

clear %limpa as variaveis
clc %limpa o visor

load database_pap.dat %carrega a base de arquivos

amostras = database_pap'; %X recebe os vetores da base
[tam,~] = size(database_pap); %calcula o tamanho da base de dados
classes = zeros(2,tam); %a classe é um vetor coluna, classe 0 = [1 0]T e classe 1 = [0 1]T
classes(1,1:242) = 1; %amostras da classe 0
classes(2,243:tam) = 1; %amostras da classe 1

%leave-one-out
acertos = leaveoneout(amostras, classes);
taxa = (acertos/917)*100;
fprintf('Porcentagem de acertos sem a normalização: %.4f\n',taxa);

%retorna os dados padronizados
X = normaliza(amostras)
