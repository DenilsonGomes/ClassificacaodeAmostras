%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Função que executa o KNN

%função recebe (dados, numeros de vizinhos) e retorna o numero de acertos
function taxa = knn(amostras, classes, k)
[s,tam] = size(amostras);%tam recebe o numero de amostras e s o numero de atributos
a = ceil(tam*30/100);%a é o numero que separa a amostra em 30% e 70%
acertos = 0;

for i=1:a %para os 30% das asmostras (Testes)
    for j=a+1:tam %para os 70% das asmostras (Treinamento)
        d=0; %reseta d para a distancia de um novo vetor
        for p=1:s %para todos os atributos das amostras
            %d é a soma dos quadrados das diferencas das coordenadas da amostra i para a amostra j
            d = d + (amostras(p,i) - amostras(p,j))^2; 
        end
        %dist(j) é a raiz quadrada da soma dos quadrados das coordenadas (distancia euclidiana)
        dist(j-a) = sqrt(d);
    end
    
    for m=1:k %para os k-vizinhos mais perto da amostra i
        [~,indice] = min(dist); %pegamos o indice do vizinho mais proximo
        knn(m) = classes(1,indice); %colocamos a classe desta amostra em knn (trabalhando com uma coordenada no caso)
        dist(indice) = []; %removemos esta amostra
    end
    
    %agora com as classes das amostras mais proximas em knn, verificamos qual classe ocorre em maior numero
    if(mode(knn) == classes(1,i)) %se a classe que ocorreu mais for a classe da amostra i
        acertos = acertos + 1; %acrescentamos acertos
    end
end
taxa = acertos*100/a; %retorna a taxa de acertos