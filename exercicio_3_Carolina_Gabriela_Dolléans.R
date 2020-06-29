# Utilizando o banco world do pacote poliscidata, faça um  
# histograma que também indique a média  e um boxplot 
# da variável gini10
# Descreva o que você pode observar a partir deles.

mundo <- world
ggplot(mundo, aes(gini10)) +
  geom_histogram(binwidth = 2, na.rm = T) +
  geom_vline(aes(xintercept = mean(gini10, na.rm = T))) +
  geom_boxplot(na.rm = T)

Observo nesse gráfico que a média e a mediana são próximas (perto de 40) e que
os segundo e terceiro quartis são os menores. Ou seja, a dispersão dos 
valores não é muito grande.
Observo também que a maioria dos países tem um indício de Gini abaixo de 50%.
Além disso, observo que o mínimo e o máximo observados não atingem os valores 
teóricos mínimo e máximo do indício de Gini (O% e 100%), ainda bem.


# Utilizando as funções de manipulação de dados da aula passada,
# faça uma tabela que sumarize a media (função mean), 
# mediana (funcao median) e o desvio padrão (fundao sd) da 
# renda per capta (variável gdppcap08), agrupada por tipo de regime 
# (variável democ).
# Explique a diferença entre valores das médias e medianas.
# Ilustre com a explicação com gráfico de boxplot.
# Os dados corroboram a hipótese da relação entre democracia
# e desempenho economico?

renda <- mundo %>%
  select(gdppcap08, democ) %>%
  group_by(democ) %>%
  summarise(media = mean(gdppcap08, na.rm = T),
            mediana = median(gdppcap08, na.rm = T),
            desvio = sd(gdppcap08, na.rm = T))


As médias e medianas de renda per capita por regime democrático ou não
são muito diferentes. Isso quer dizer que a média não é representativa
do nível de vida médio da população. Isso é comprovado pelo fato que o
desvio padrao é grande. Ou seja, tem poucas pessoas que ganham muito e muitas 
pessoas que ganham pouco. 

ggplot(mundo, aes(gdppcap08)) +
  geom_histogram(bins = 100, na.rm = T) +
  geom_vline(aes(xintercept = mean(gdppcap08, na.rm = T))) +
  geom_boxplot(na.rm = T)

Podemos ver com esse gráfico boxplot que o terceiro e o quarto quartis 
pegam muito mais valores do que o primeiro e o segundo quartis. 

Os dados corroborem hipótese da relação entre democracia e desempenho 
econômico visto que a média em regimes não democráticos é mais de duas vezes
menor do que a média em regimes democráticos e a mediana em regimes 
democráticos é um pouco menos de duas vezes menor do que a mediana em regimes
democráticos. Porém, o desvio padrão semelhante nos dois casosm ou seja, 
desigualdades importantes existem em regime democráticos e nao democráticos.

# Carregue o banco states que está no pacote poliscidata 
# Mantenha apenas as variáveis obama2012, conpct_m, hs_or_more,
# prcapinc, blkpct10, south, religiosity3, state

usa <- states %>%
  select(obama2012, conpct_m, hs_or_more,
          prcapinc, blkpct10, south, religiosity3, state)

# Carregue o banco nes que está no pacote poliscidata
# Mantenha apenas as variáveis obama_vote, ftgr_cons, dem_educ3,
# income5, black, south, relig_imp, sample_state

nnes <- nes %>%
  select(obama_vote, ftgr_cons, dem_educ3,
         income5, black, south, relig_imp, sample_state)

# As variáveis medem os mesmos conceitos, voto no obama em 2012, 
# conservadorismo, educação, renda, cor, norte-sul, 
# religiosidade e estado. A diferença é que o nes é um banco de
# dados com surveys individuais e o states é um banco de dados
# com informações por estado
#
# Faça um gráfico para cada banco representando o nível de
# conservadorismo. Comente as conclusões que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.
# Para ajudar, vocês podem ter mais informações sobre os bancos
# de dados digitando ?states e ?nes, para ter uma descrição das
# variáveis

Gráfico para o banco States: 
  
ggplot(usa, aes(conpct_m)) +
  geom_histogram(binwidth = 1) +
  geom_vline(aes(xintercept = mean(conpct_m, na.rm = T))) +
  geom_boxplot()

Podemos observar nesse gráfico que nenhum estado atinge 50% de conservadores.
A média e a mediana são próximas, o que indica que todos os estados têm uma
porcentagem estável de conservadores, particularmente entre 30 e um pouco
menos de 40%.
           

Gráfico para o banco Nes:        
  
ggplot(nnes, aes(ftgr_cons)) +
  geom_histogram(binwidth = 10, na.rm = T) +
  geom_vline(aes(xintercept = mean(ftgr_cons, na.rm = T))) +
  geom_boxplot(na.rm = T)
             
Com esse gráfico entendemos que a maioria dos indivíduos são em parte 
conservadores. O boxplot não está aparecendo bem, mas se não me engano, está
mostrando que o segundo e o terceiro quartis se situam entre mais ou menos 40%
e mais ou menos 70 %. Ou seja, a população americana é mais conservadora que 
os seus votos mostram. Isso nos faz indagar sobre o conservadorismo do partido
dos Democratas, pois, já foi mostrado na literatura que a "esquerda" americana
nao é muito de esquerda quando comparada com partidos de esquerda de outros 
países.


# Qual é o tipo de gráfico apropriado para descrever a variável
# de voto em obama nos dois bancos de dados?
# Justifique e elabore os gráficos

No banco nnes:
  No banco nnes, a variavél obama_vote é binária. A maneira mais intelígivel 
de exibí-la é com um gráfico em barras que mostra a quantidade de "Yes" e de
"No".

ggplot(nnes, aes(obama_vote)) +
  geom_bar()
  

No banco usa:
  No banco usa, a variavél conpct_m é uma porcentagem, ou seja, é mais 
pertinente elaborar um gráfico com um histograma por estado (binwidth = 1) que 
permite ver a porcentagem de cada estado. Achei relevante também acrescentar 
uma curva de densidade para ver a repartição mais geral dessas porcentagens de 
votos.

ggplot(usa, aes(conpct_m)) +
  geom_histogram(aes(y =..density..), binwidth = 1) +
  geom_density()
  
  
# Crie dois bancos de dados a partir do banco nes, um apenas com
# respondentes negros e outro com não-negros. A partir disso, faça
# dois gráficos com a proporção de votos no obama.
# O que você pode afirmar a partir dos gráficos?
# Você diria que existe uma relação entre voto em Obama e cor?


nes_negros <- nes %>%
  filter(black == "Yes")


ggplot(nes_negros, aes(x = obama_vote)) +
  geom_density(na.rm = T)
  
Podemos ver nesse gráfico que a grande maioria de negros votaram em Obama, e
alguns, raros, não votaram nele.

nes_nao_negros <- nes %>%
  filter(black == "No")

ggplot(nes_nao_negros, aes(x = obama_vote)) +
  geom_density(na.rm = T)

Podemos ver nesse gráfico que tem um pouco mais de não negros que votaram em 
Obama do que não votaram.

Comparando esse dois gráficos, fica muito claro que existe uma relação entre o
voto para Obama e a cor da pele. Assim, a grande maioria dos negros que 
votaram, votaram para Obama, enquanto o voto dos não nergos é muito mais
dividido, mesmo com uma maioria que votou para Obama.


# A partir do banco de dados states, faça uma comparação semelhante.
# Faça um gráfico com as porcentagens de votos em Obama para estados
# que estão acima da mediana da porcentagem de população negra nos estados,
# e outro gráfico com as porcentagens de votos em Obama para os estados
# que estão abaixo da mediana de população negra.
# O que você pode afirmar a partir dos gráficos?
# Podemos chegar a mesma conclusão anterior?


# Estados onde a porcentagem de negros esta acima da mediana:

states_above_median <- states %>%
  select(obama2012, blkpct10) %>%
  filter(blkpct10 > median(blkpct10))

ggplot(states_above_median, aes(obama2012)) +
  geom_density()
  
ggplot(states_above_median, aes(obama2012)) +
  geom_boxplot() +
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))

Professor, eu fiz dois gráficos aqui porque o boxplot fica escondendo a curva 
de densidade. Acho a curva de densidade legal para ter uma primeira ideia 
da repartição, mas acho o boxplot necessário para entender mais precisamente
o que está acontecendo. Porém, eu não sei porque esse boxplot aparece tão 
grande. Sinceramente, esqueci o que o tamanho dele significava...

# Estados onde a porcentagem de negros esta abaixo da mediana:

states_below_median <- states %>%
  select(obama2012, blkpct10) %>%
  filter(blkpct10 < median(blkpct10))

ggplot(states_below_median, aes(obama2012)) +
  geom_density()

ggplot(states_below_median, aes(obama2012)) +
  geom_boxplot() +
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))

Incrível ! Observo que os estados onde existem mais negros votaram menos 
para Obama ! Eu realmente não esperava isso...

Enfim, os estados que estão acima da mediana da população de negros têm uma 
média e mediana quase confundidas a mais ou menos 48%.
Os estados que estão abaixo da mediana votaram em média um pouco mais do que 
48% e a mediana está localizada a 51%. Podemos ver que o terceiro quartil está 
localizado entre 52% e 56%, está muito menor do que o segundo localizado entre
39% e 52%. Ou seja, tem mais estados que votaram a favor de Obama nos estados
abaixo da mediana.

Do outro lado, o segundo e terceiro quartis dos estados que têm uma população
de negros acima da mediana são semelhantes: o segundo vai de mais ou menos 41%/
42% até mais ou menos 48% e o terceiro vai de 48% até 54%. Ou seja, Obama não 
teve maioria tão claramente como nos estados abaixo da mediana.

Então, os estados que votaram mais para Obama são os estados onde a população
de negros está abaixo da mediana. Porém, escapando da análise, Obama
provavelmente não teria conseguido se eleger sem o voto dos negros que ele
mobilizou.

# A partir da varíavel X do banco df abaixo
df <- data.frame(x = cos(seq(-50,50,0.5)))
# Faça os tipos de gráficos que representem esse tipo de variável
# comentando as diferenças entre elas e qual seria a mais adequada

ggplot(df, aes(x)) +
  geom_density()

ggplot(df, aes(x)) +
  geom_histogram(bins = 30)

ggplot(df, aes(x)) +
  geom_boxplot()

ggplot(df, aes("", y = x)) +
  geom_beeswarm()

  
O gráfico mais adaptado é o gráfico de densidade. Assim, o gráfico de boxplot e
o gráfico de beeswarm são bonitos mas não trazem muita informação, apenas 
indicam que repartição dos valores de cosinus é regular e repetitiva. Por isso, 
o gráfico de densidade é muito mais relevante para entender a evolução da função 
consinus.
O gráfico com histogramas também serve, mas o gráfico de densidade é mais
esclarecedor porque ele nos dá a visão com valores contínuos, o que o gráfico
com histogramas não permite.

# responsa as questões teóricas abaixo

# Observar a figura 1.2 do livro Fundamentals of Political Research e
# fazer o mesmo esquema para o trabalho final de vocês.

Obs: Eu finalmente fui ler o livro de Barry Ames com atenção aos detalhes
metodológicos. Me ajudou a definir que as pessoas que vou estudar vão ser 
os candidatos a deputado federal em 2018.

Variável Independente 
= pertencer ou não à    ---- teoria causal= ---------------------> Variável dependente =
nova direita            Os candidatos a deputado federal        a distribuição de votos
      |                 nos partidos da nova direita em 2018                  |
      |                 têm uma distribuição de votos diferente               |
      |                 dos deputados da velha direita porque eles            |
      |                 têm perfis socio-demográficos e objetivos             |
      |                 diferentes e porque o contexto econômico e            |
      |                 político mudou.                                       |
Operacionalização                                                     Operacionalização
      |                                                                       |
      |                                                                       |
      |                                                                       |
      |                                                                       |
      V                                                                       V
Variável Independente                                               Variável dependente
Medida = 0 se não ------------------ Hipótese = ------------------>   Medida = **
pertence a um partido          Se os candidatos deputados eleitos                     
da nova direita,              pertecem a nova direita, então eles 
1 se pertence                 têm uma distribuição de votos 
                              diferente de concentrada dominante



** Para medir essa variável, eu finalemente fui ver o que Barry Ames fez. 
Existem dois parâmetros para medir a distribuição de votos: a concentração
e a dominância. 

Primeiro é necessário definir V_ix que corresponde a porcentagem de votos 
do candidato i no município x. V_ix é utilizado em seguinte para calcular D_i
que corresponde à dominância média (a porcentagem de votos, eu acho)
do candidato em todos os municípios proporcionalmente à porcentagem do total
de votos do candidato que cada município contribui.
D_i seria entao a média das multiplicações dos votos de um candidato i no 
município x pelo peso desse município no seu resultado final.
Quando o D_i é grande, o candidato i domina suas municipalidades chaves.
Quando D_i é baixo, o candidato i compartilha suas municipalidades chaves com
outros candidatos.

A concentração utiliza V_ix e o instrumento estatístico Moran s I que ajuda a
obter a distribuição espacial dos votos nos municípios onde o candidato se dá 
bem. Para entender como funciona esse instrumento, preciso ler mais 
literatura... No entanto, eu vou querer agendar com você sexta-feira se for 
possível porque meu namorado me explicou que esse instrumento Moran s I tinha 
alguma coisa a ver com regressões...


# Qual é a disponibilidade de dados para sua pesquisa? Já existem
# bancos de dados prontos? Você tem acesso a eles? Caso a última
# pergunta seja positiva, responda o exerício 4 do capítulo 5.

For 1978 and 1982, the electoral results came from PRODASEN, the Senate's 
data-processing arm. 
--> tem que ver se existe melhores hoje. Tem que ver os dados do TSE.

4. Download a codebook for a political science data set in which you are
interested.
(a) Describe the data set and the purpose for which it was assembled.
Os banco de dados que vou estudar são feitos pelo TSE com objetivo de 
transparência do processo eleitoral com a populaçao. 
Esses repositórios contêm dados das eleiçoes para governadores, deputados 
estaduais, federais e senadores.

(b) What are the time and space dimensions of the data set?
Existem dados para eleiçoes indo de 1945 até 2018. Eu vou estudar as eleições 
para deputado federeal de 2018.
  
  Read the details of how one of the variables in which you are interested was
coded. Write your answers to the following questions:
  (c) Does this seem like a reliable method of operationalizing this variable?
  How might the reliability of this operationalization be improved?
  
Dos bancos de dados do TSE eu vou utilizar os votos totais dos candidatos e 
o seus votos por município. Ainda não achei onde o TSE detalha a colheta desses
dados, porém, acredito que são confiáveis pelo prestígio e pela permanência 
da insitituição.
  
  (d) Assess the various elements of the validity for this variable operationalization.
How might the validity of this operationalization be improved?
  
Considerar que o fato de medir votos para medir preferências eleitorais é uma
questão que iria muito além dos meus objetivos nesse estudo. Então vou 
considerar que essa variável é válida no contexto da minha pesquisa.


# A partir dos exercícios anteriores, escreva sobre a confiabilidade e
# validade de suas variáveis.

Acredito que a maneira de calculca D_i é bastante confiável, é uma operação
simples baseada em dados certos.

No entanto, ainda nao sei como operacionalizar a concentração...

Acredito que minhas variavéis terao um alto grau de confiabilidade, pois, vou
basear meus calculos em dados do TSE.

Sobre a validade de D_i: acredito que a dominância de um candidato não pode 
ser medida apenas com uma eleição e que essa dominância depende muito do
seu partido também. Porém, como os candidatos da nova direita são provavelmente
e frequentemente novos no jogo político e que a relevância desses partidos 
também é, então, acredito que D_i, na forma que foi definido é suficiente para 
esse estudo.

# Qual seria a forma ideal e mais adequada de operacionalizar suas
# variáveis para testar sua hipótese?
  Respondi a essa pergunta acima.