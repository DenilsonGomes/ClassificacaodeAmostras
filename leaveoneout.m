%Autor: Denilson Gomes Vaz da Silva
%Graduando em Engenharia da Computação
%Inteligência Computacional - Dr. Jarbas Joaci
%Função que executa o leave-one-out e retorna o numero de acertos

%função recebe (amostras, classes) e retorna a taxa de acertos
function taxa = leaveoneout(amostras, classes)
[~,tam] = size(amostras); %recebe o tamanho das amostras
acertos = 0; %inicia acertos em 0
for i=1:tam %para todas as amostras
    X = amostras; %X recebe todas as amostras
    X(:,i) = []; %removemos a amostra i para teste
    Y = classes; %Y recebe o rotulo das amostras
    Y(:,i) = []; %retiramos o rotulo da amostra teste
    
    %A = (Y*X')*(X*X')^(-1); %calculo da matriz transformação
    A = (Y*X')/(X*X'); %calculo da matriz transformação
    y = A*(amostras(:,i)); %calculo do vetor saida y
    
    if y(1) > y(2) %se a primeira coordenada for maior
        if classes(1,i) == 1 %e o elemento for da classe 0
            acertos = acertos + 1; %acrescente acertos
        end    
    else %se a segunda coordenada for maior
        if classes(2,i) == 1 %e o elemento for da classe 1
            acertos = acertos + 1; %acrescente acertos
        end    
    end  
end
taxa = acertos*100/tam;%retorna a taxa de acertos