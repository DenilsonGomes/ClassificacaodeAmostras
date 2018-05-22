%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Classificar a base database_pap

clear %limpa as variaveis
clc %limpa o visor

load database_pap.dat %carrega a base de dados

k = input('Digite o valor de k para o knn: '); %recebemos o valor de k para o knn
amostras = database_pap'; %amostras recebe os vetores da base
[tam,~] = size(database_pap); %calcula o tamanho da base de dados
classes = zeros(2,tam); %a classe é um vetor coluna, classe 0 = [1 0]T e classe 1 = [0 1]T
classes(1,1:242) = 1; %amostras da classe 0
classes(2,243:tam) = 1; %amostras da classe 1

%leave-one-out sem normalizar os dados
taxa = leaveoneout(amostras, classes); %calcula a taxa de acerto sem a normalização

X = normaliza(amostras);%retorna os dados normalizados

%leave-one-out com os dados normalizados
taxac = leaveoneout(X, classes);%calcula a taxa de acerto com a normalização
fprintf('Taxa de acerto do leave-one-out sem a normalização: %.4f\n',taxa);%exibe o percentual de acertos
fprintf('Taxa de acerto do leave-one-out com a normalização: %.4f\n',taxac);%exibe o percentual de acertos

taxa = 0;taxac = 0; %taxa = 0
for i=1:10 %10 execuções de knn
    [X1,Y] = permuta(amostras, classes); %permuta as amostras e as classes
    taxa = taxa + knn(X1,Y,k); %soma a taxa das 10 execuções (knn sem normalizar os dados)
    [X,Y] = permuta(X, classes); %permuta as amostras e as classes
    taxac = taxac + knn(X,Y,k); %soma a taxa das 10 execuções (knn com os dados normalizados)
end
taxa = taxa/10; %taxa media sem a normalização igual a soma das taxas divida por 10
taxac = taxac/10; %taxa media com a normalização igual a soma das taxas divida por 10
fprintf('Taxa de acerto do knn sem a normalização: %.4f\n',taxa);%exibe o percentual de acertos
fprintf('Taxa de acerto do knn com a normalização: %.4f\n',taxac);%exibe o percentual de acertos