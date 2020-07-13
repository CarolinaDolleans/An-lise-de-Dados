
## Fa?a todos os gr?ficos utilizando um tema que voc? ache mais adequado
## e nomeie os eixos x e y da maneira adequada

## Carregue o banco world do pacote poliscidata

library(poliscidata)

banco <- world

## Observe o banco de dados com as fun??es adequadas
str(banco)

library(tidyverse)
glimpse(banco)

summary(banco)
head(banco)
tail(banco)

## A vari?vel democ_regime08 indica se um pa?s ? democr?tico.
## Usando as ferramentas de manipulacao de bancos de dados, verifique
## quantos paises sao democraticos ou nao, e apresente esta vari?vel 
## graficamente

banco %>%
  count(democ_regime08)

ggplot(banco, aes(democ_regime08)) +
  geom_bar() + 
  theme_minimal() +
  labs(title = "Figura 1",
       subtitle = "Países democráticos ou não",
       x = "Democracia",
       y = "Quantidade")


## Teste a rela??o entre a vari?vel democ_regime08 e a vari?vel
## muslim (que indica se um pa?s ? mu?ulmano ou n?o). E represente
## visualmente as vari?veis para visualizar se esta religi?o
## aumenta ou diminui a chance de um pa?s ser democr?tico
## Qual seria sua conclus?o com rela??o a associa??o destas duas
## vari?veis?

banco %>%
  count(democ_regime08, muslim)

library(ggthemes)

ggplot(banco, aes(democ_regime08, fill = muslim)) +
  geom_bar(position = "fill") + 
  theme_minimal() +
  labs(title = "Figura 2",
       subtitle = "Democracia e religião muçulmana",
       x = "Democracia",
       y = "Religião Muçulmana")

Observamos que existem mais regimes não democráticos e muçulmanos 
do que regimes democráticos muçulmanos. Então um regime muçulmano
tem mais probabilidade de ser não democrático. 

## A vari?vel gdppcap08 possui informa??o sobre o PIB per capta
## dos pa?ses. Fa?a uma representa??o gr?fica desta vari?vel

banco %>%
  count(country, gdppcap08)

ggplot(banco, aes(gdppcap08)) +
  geom_density() +
  theme_minimal() +
  labs(title = "Figura 3",
       subtitle = "PIB per capita dos países",
       x = "PIB per capita",
       y = "Densidade")
  

Podemos ver, nesse gráfico, que tem muitos países cuja renda per capita é muito
baixa e pouco países cuja renda per capita é muito alta.

ggplot(banco aes(country, fill = gdppcap08)) +
  geom_bar(position = "fill")

---> eu queria saber, professor, eu tentei fazer esse gráfico dessa forma
pensando que ia representar o gpd per capita por país. Cada barra 
representando um país com seu nome em baixo. Porém, o rstudio me devolveu 
essa mensagem: 
  
>   geom_bar(position = "fill")
geom_bar: width = NULL, na.rm = FALSE, orientation = NA
stat_count: width = NULL, na.rm = FALSE, orientation = NA
position_fill 

Porquê? Eu entendo que são muitos países, até imaginei que o gráfico não
fosse ficar muito vísivel, mas mesmo assim, eu pensava que era possível 
fazê-lo.

## Fa?a um sumario com a m?dia, mediana e desvio padr?o do pib per capta
## para cada tipo de regime politico, represente a associa??o destas
## vari?veis graficamente, e fa?a o teste estat?stico adequado para
## chegar a uma conclus?o. Existe associa??o entre as vari?veis?

Criação do banco:
  
banco_1 <- banco %>%
  select(gdppcap08, democ) %>%
  filter(!is.na(gdppcap08),
         !is.na(democ)) %>%
  group_by(democ) %>%
  summarise(media = mean(gdppcap08),
            mediana = median(gdppcap08),
            desvio = sd(gdppcap08),
            n = n())

Gráfico:

ggplot(banco, aes(gdppcap08, democ)) +
  geom_boxplot(na.rm = T) +
  geom_vline(aes(xintercept = mean(gdppcap08, na.rm = T))) +
  theme_minimal() + 
  labs( title = "Figura 4",
        subtitle = "PIB per capita em função da democracia",
        x = "PIB per capita",
        y = "Democracia")

Já com o gráfico podemos ver que os países democráticos geralmente têm
um gdppcapita mais alto que os países que não são democráticos.

Professor, eu tenho uma dúvida sobre esse gráfico. Eu quis colocar 
duas médias, a média du PIB per capita dos países democráticos e a média
do PIB per capita dos países não democráticos. Porém, não consegui, e nem
sei como fazer. Tentei com group_by, pensei no filter também, enfim...
Como é que eu poderia fazer isso?

Teste-t (porque é uma variável categórica com uma variável numérica)  

t.test(gdppcap08 ~ democ, data = banco)

Resultados:
  
Welch Two Sample t-test

data:  gdppcap08 by democ
t = -2.8947, df = 136.93, p-value = 0.004418
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
  -11963.338  -2252.264
sample estimates:
  mean in group No mean in group Yes 
9243.377         16351.178 

Eu não entendi os resultados de esse teste. Eu não entendo porque o 
t e o intervalo de confiança estão com valores negativos...
Se eu entendi bem o teste t, o intervalo de confiança nos dá os valores
que uma nova amostra poderia ter. Porém, nenhum país tem PIB per capita
negativo... Admitindo que esse intervalo seja positivo, isso quer dizer que
se a gente pegasse uma nova amostra de países, o PIB per capita estaria entre
2252.264 e 11963.338, o que é muito baixo. Então, podemos supor que existem
muitos países com PIB per capita baixo e poucos paises com PIB per capita alto.
A Figura 4 (os boxplot) mostra exatamente isso.

Além disso, o intervalo nao contém 0, entao podemos supor que existe de fato
uma relação entre o PIB per capita e o fato de um país ser democrático ou não.
Da mesma forma, o p-valor é inferior a 0.005 segundo esse valor de t, então
podemos rejeitar a hipótese nula.

Acredito que o resultado ficou tão esquisito porque as duas amostras
(países democráticos e países não democráticos) são muito diferentes.

## Por fim, ao inv?s de utilizar uma vari?vel bin?ria de democracia,
## utilize a vari?vel dem_score14 para avaliar se existe uma associa??o
## entre regime pol?tico e desenvolvimento econ?mico. Represente
## a associa??o graficamente, fa?a o teste estat?stico e explica sua
## conclus?o

Criação do banco:
  
banco_2 <- banco %>%
  select(country, gdppcap08, dem_score14) %>%
  filter(!is.na(gdppcap08), 
         !is.na(dem_score14)) 

Gráfico:

ggplot(banco_2, aes(x = dem_score14, y = gdppcap08))+
  geom_point(alpha = 0.3)
  labs( title = "Figura 5",
        subtitle = "PIB per capita em função da democracia",
        x = "PIB per capita",
        y = "Nivel de Democracia")
  
Teste de correlação:
cor.test(banco_2$dem_score14, banco_2$gdppcap08)

Pearson''s product-moment correlation

data:  banco_2$dem_score14 and banco_2$gdppcap08
t = 7.1713, df = 150, p-value = 3.159e-11
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.3763618 0.6150148
sample estimates:
      cor 
0.5052872 

O valor da correlação é de mais ou menos 0.5, o que nos dá uma segurança média 
de que existe uma correlação. 
Se existe, essa correlação é positiva: quando o grau de democracia aumenta, 
o PIB per capita aumenta. 
Porém, acredito que esse teste é para relações lineares. No entanto, como
podemos ver no gráfico, essa relação não é linear. Até um pouco mais do que 6
no nível de democracia, o PIB per capita é quase constante, depois de 6, o PIB
per capita aumenta de maneira linear e positiva (provavelmente um coeficiente 
de 1 inclusive). Para achar uma relação interessante, seria melhor, então, 
apenas considerar os países com um grau de democracia acima de 6. 


## Teste a associa??o entre renda perca capta e religiao (com a vari?vel
## muslim) e represente graficamente. Qual ? sua conclus?o? 

banco_3 <- banco %>%
  select(gdppcap08, muslim) %>%
  filter(!is.na(gdppcap08),
         !is.na(muslim)) %>%
  group_by(muslim) %>%
  summarise(media = mean(gdppcap08, na.rm = T),
            mediana = median(gdppcap08, na.rm = T),
            desvio = sd(gdppcap08, na.rm = T),
            n = n())

Gráfico:
  
ggplot(banco, aes(gdppcap08, muslim)) +
  geom_boxplot(na.rm = T) +
  geom_vline(aes(xintercept = mean(gdppcap08, na.rm = T))) +
  labs( title = "Figura 6",
        subtitle = "PIB per capita em função da religião muçulmana",
        x = "PIB per capita",
        y = "Religão muçulmana")

Esse gráfico mostra que países muçulmanos têm um PIB per capita inferior
aos países não muçulmanos.

## Comparando suas conclus?es anteriores, ? poss?vel afirmar qual
## das duas vari?veis possui maior impacto no desenvolvimento economico?
## Por que? 

Confrontando minhas conclusões anteriores, eu consigo afirmar quais das duas 
variáveis, democracia ou religiao muçulmana, tem um maior impacto no 
desenvovlimento econômico.

Os gráficos de PIB per capita em relação à religião e à democracia são 
muito parecidos (Figura 4 e Figura 6), só que invertidos.
Porém, a Figura 2 mostra que existem muitos países que não são muçulmanos
e que não são democracias também. Por isso, podemos afirmar que a variável que 
possui maior impacto é a variável democracia. 


##########################################################################

## Exerc?cio te?rico
## Levando em considera??o as vari?veis de seu trabalho final,
## qual dos 3 testes estat?sticos utilizados seria adequado utilizar?

Sabendo que minhas variáveis são as seguintes: 
  
X = distribuição de votos (mix de duas variáveis contínuas)
Y = pertencer à nova-direita ou não (variável categórica)

O teste mais adequado seria o teste t de Pearson.


