# Utilizando o banco world do pacote poliscidata, fa�a um  
# histograma que tamb�m indique a m�dia  e um boxplot 
# da vari�vel gini10
# Descreva o que voc� pode observar a partir deles.

mundo <- world
ggplot(mundo, aes(gini10)) +
  geom_histogram(binwidth = 2, na.rm = T) +
  geom_vline(aes(xintercept = mean(gini10, na.rm = T))) +
  geom_boxplot(na.rm = T)

Observo nesse gr�fico que a m�dia e a mediana s�o pr�ximas (perto de 40) e que
os segundo e terceiro quartis s�o os menores. Ou seja, a dispers�o dos 
valores n�o � muito grande.
Observo tamb�m que a maioria dos pa�ses tem um ind�cio de Gini abaixo de 50%.
Al�m disso, observo que o m�nimo e o m�ximo observados n�o atingem os valores 
te�ricos m�nimo e m�ximo do ind�cio de Gini (O% e 100%), ainda bem.


# Utilizando as fun��es de manipula��o de dados da aula passada,
# fa�a uma tabela que sumarize a media (fun��o mean), 
# mediana (funcao median) e o desvio padr�o (fundao sd) da 
# renda per capta (vari�vel gdppcap08), agrupada por tipo de regime 
# (vari�vel democ).
# Explique a diferen�a entre valores das m�dias e medianas.
# Ilustre com a explica��o com gr�fico de boxplot.
# Os dados corroboram a hip�tese da rela��o entre democracia
# e desempenho economico?

renda <- mundo %>%
  select(gdppcap08, democ) %>%
  group_by(democ) %>%
  summarise(media = mean(gdppcap08, na.rm = T),
            mediana = median(gdppcap08, na.rm = T),
            desvio = sd(gdppcap08, na.rm = T))


As m�dias e medianas de renda per capita por regime democr�tico ou n�o
s�o muito diferentes. Isso quer dizer que a m�dia n�o � representativa
do n�vel de vida m�dio da popula��o. Isso � comprovado pelo fato que o
desvio padrao � grande. Ou seja, tem poucas pessoas que ganham muito e muitas 
pessoas que ganham pouco. 

ggplot(mundo, aes(gdppcap08)) +
  geom_histogram(bins = 100, na.rm = T) +
  geom_vline(aes(xintercept = mean(gdppcap08, na.rm = T))) +
  geom_boxplot(na.rm = T)

Podemos ver com esse gr�fico boxplot que o terceiro e o quarto quartis 
pegam muito mais valores do que o primeiro e o segundo quartis. 

Os dados corroborem hip�tese da rela��o entre democracia e desempenho 
econ�mico visto que a m�dia em regimes n�o democr�ticos � mais de duas vezes
menor do que a m�dia em regimes democr�ticos e a mediana em regimes 
democr�ticos � um pouco menos de duas vezes menor do que a mediana em regimes
democr�ticos. Por�m, o desvio padr�o semelhante nos dois casosm ou seja, 
desigualdades importantes existem em regime democr�ticos e nao democr�ticos.

# Carregue o banco states que est� no pacote poliscidata 
# Mantenha apenas as vari�veis obama2012, conpct_m, hs_or_more,
# prcapinc, blkpct10, south, religiosity3, state

usa <- states %>%
  select(obama2012, conpct_m, hs_or_more,
          prcapinc, blkpct10, south, religiosity3, state)

# Carregue o banco nes que est� no pacote poliscidata
# Mantenha apenas as vari�veis obama_vote, ftgr_cons, dem_educ3,
# income5, black, south, relig_imp, sample_state

nnes <- nes %>%
  select(obama_vote, ftgr_cons, dem_educ3,
         income5, black, south, relig_imp, sample_state)

# As vari�veis medem os mesmos conceitos, voto no obama em 2012, 
# conservadorismo, educa��o, renda, cor, norte-sul, 
# religiosidade e estado. A diferen�a � que o nes � um banco de
# dados com surveys individuais e o states � um banco de dados
# com informa��es por estado
#
# Fa�a um gr�fico para cada banco representando o n�vel de
# conservadorismo. Comente as conclus�es que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.
# Para ajudar, voc�s podem ter mais informa��es sobre os bancos
# de dados digitando ?states e ?nes, para ter uma descri��o das
# vari�veis

Gr�fico para o banco States: 
  
ggplot(usa, aes(conpct_m)) +
  geom_histogram(binwidth = 1) +
  geom_vline(aes(xintercept = mean(conpct_m, na.rm = T))) +
  geom_boxplot()

Podemos observar nesse gr�fico que nenhum estado atinge 50% de conservadores.
A m�dia e a mediana s�o pr�ximas, o que indica que todos os estados t�m uma
porcentagem est�vel de conservadores, particularmente entre 30 e um pouco
menos de 40%.
           

Gr�fico para o banco Nes:        
  
ggplot(nnes, aes(ftgr_cons)) +
  geom_histogram(binwidth = 10, na.rm = T) +
  geom_vline(aes(xintercept = mean(ftgr_cons, na.rm = T))) +
  geom_boxplot(na.rm = T)
             
Com esse gr�fico entendemos que a maioria dos indiv�duos s�o em parte 
conservadores. O boxplot n�o est� aparecendo bem, mas se n�o me engano, est�
mostrando que o segundo e o terceiro quartis se situam entre mais ou menos 40%
e mais ou menos 70 %. Ou seja, a popula��o americana � mais conservadora que 
os seus votos mostram. Isso nos faz indagar sobre o conservadorismo do partido
dos Democratas, pois, j� foi mostrado na literatura que a "esquerda" americana
nao � muito de esquerda quando comparada com partidos de esquerda de outros 
pa�ses.


# Qual � o tipo de gr�fico apropriado para descrever a vari�vel
# de voto em obama nos dois bancos de dados?
# Justifique e elabore os gr�ficos

No banco nnes:
  No banco nnes, a variav�l obama_vote � bin�ria. A maneira mais intel�givel 
de exib�-la � com um gr�fico em barras que mostra a quantidade de "Yes" e de
"No".

ggplot(nnes, aes(obama_vote)) +
  geom_bar()
  

No banco usa:
  No banco usa, a variav�l conpct_m � uma porcentagem, ou seja, � mais 
pertinente elaborar um gr�fico com um histograma por estado (binwidth = 1) que 
permite ver a porcentagem de cada estado. Achei relevante tamb�m acrescentar 
uma curva de densidade para ver a reparti��o mais geral dessas porcentagens de 
votos.

ggplot(usa, aes(conpct_m)) +
  geom_histogram(aes(y =..density..), binwidth = 1) +
  geom_density()
  
  
# Crie dois bancos de dados a partir do banco nes, um apenas com
# respondentes negros e outro com n�o-negros. A partir disso, fa�a
# dois gr�ficos com a propor��o de votos no obama.
# O que voc� pode afirmar a partir dos gr�ficos?
# Voc� diria que existe uma rela��o entre voto em Obama e cor?


nes_negros <- nes %>%
  filter(black == "Yes")


ggplot(nes_negros, aes(x = obama_vote)) +
  geom_density(na.rm = T)
  
Podemos ver nesse gr�fico que a grande maioria de negros votaram em Obama, e
alguns, raros, n�o votaram nele.

nes_nao_negros <- nes %>%
  filter(black == "No")

ggplot(nes_nao_negros, aes(x = obama_vote)) +
  geom_density(na.rm = T)

Podemos ver nesse gr�fico que tem um pouco mais de n�o negros que votaram em 
Obama do que n�o votaram.

Comparando esse dois gr�ficos, fica muito claro que existe uma rela��o entre o
voto para Obama e a cor da pele. Assim, a grande maioria dos negros que 
votaram, votaram para Obama, enquanto o voto dos n�o nergos � muito mais
dividido, mesmo com uma maioria que votou para Obama.


# A partir do banco de dados states, fa�a uma compara��o semelhante.
# Fa�a um gr�fico com as porcentagens de votos em Obama para estados
# que est�o acima da mediana da porcentagem de popula��o negra nos estados,
# e outro gr�fico com as porcentagens de votos em Obama para os estados
# que est�o abaixo da mediana de popula��o negra.
# O que voc� pode afirmar a partir dos gr�ficos?
# Podemos chegar a mesma conclus�o anterior?


# Estados onde a porcentagem de negros esta acima da mediana:

states_above_median <- states %>%
  select(obama2012, blkpct10) %>%
  filter(blkpct10 > median(blkpct10))

ggplot(states_above_median, aes(obama2012)) +
  geom_density()
  
ggplot(states_above_median, aes(obama2012)) +
  geom_boxplot() +
  geom_vline(aes(xintercept = mean(obama2012, na.rm = T)))

Professor, eu fiz dois gr�ficos aqui porque o boxplot fica escondendo a curva 
de densidade. Acho a curva de densidade legal para ter uma primeira ideia 
da reparti��o, mas acho o boxplot necess�rio para entender mais precisamente
o que est� acontecendo. Por�m, eu n�o sei porque esse boxplot aparece t�o 
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

Incr�vel ! Observo que os estados onde existem mais negros votaram menos 
para Obama ! Eu realmente n�o esperava isso...

Enfim, os estados que est�o acima da mediana da popula��o de negros t�m uma 
m�dia e mediana quase confundidas a mais ou menos 48%.
Os estados que est�o abaixo da mediana votaram em m�dia um pouco mais do que 
48% e a mediana est� localizada a 51%. Podemos ver que o terceiro quartil est� 
localizado entre 52% e 56%, est� muito menor do que o segundo localizado entre
39% e 52%. Ou seja, tem mais estados que votaram a favor de Obama nos estados
abaixo da mediana.

Do outro lado, o segundo e terceiro quartis dos estados que t�m uma popula��o
de negros acima da mediana s�o semelhantes: o segundo vai de mais ou menos 41%/
42% at� mais ou menos 48% e o terceiro vai de 48% at� 54%. Ou seja, Obama n�o 
teve maioria t�o claramente como nos estados abaixo da mediana.

Ent�o, os estados que votaram mais para Obama s�o os estados onde a popula��o
de negros est� abaixo da mediana. Por�m, escapando da an�lise, Obama
provavelmente n�o teria conseguido se eleger sem o voto dos negros que ele
mobilizou.

# A partir da var�avel X do banco df abaixo
df <- data.frame(x = cos(seq(-50,50,0.5)))
# Fa�a os tipos de gr�ficos que representem esse tipo de vari�vel
# comentando as diferen�as entre elas e qual seria a mais adequada

ggplot(df, aes(x)) +
  geom_density()

ggplot(df, aes(x)) +
  geom_histogram(bins = 30)

ggplot(df, aes(x)) +
  geom_boxplot()

ggplot(df, aes("", y = x)) +
  geom_beeswarm()

  
O gr�fico mais adaptado � o gr�fico de densidade. Assim, o gr�fico de boxplot e
o gr�fico de beeswarm s�o bonitos mas n�o trazem muita informa��o, apenas 
indicam que reparti��o dos valores de cosinus � regular e repetitiva. Por isso, 
o gr�fico de densidade � muito mais relevante para entender a evolu��o da fun��o 
consinus.
O gr�fico com histogramas tamb�m serve, mas o gr�fico de densidade � mais
esclarecedor porque ele nos d� a vis�o com valores cont�nuos, o que o gr�fico
com histogramas n�o permite.

# responsa as quest�es te�ricas abaixo

# Observar a figura 1.2 do livro Fundamentals of Political Research e
# fazer o mesmo esquema para o trabalho final de voc�s.

Obs: Eu finalmente fui ler o livro de Barry Ames com aten��o aos detalhes
metodol�gicos. Me ajudou a definir que as pessoas que vou estudar v�o ser 
os candidatos a deputado federal em 2018.

Vari�vel Independente 
= pertencer ou n�o �    ---- teoria causal= ---------------------> Vari�vel dependente =
nova direita            Os candidatos a deputado federal        a distribui��o de votos
      |                 nos partidos da nova direita em 2018                  |
      |                 t�m uma distribui��o de votos diferente               |
      |                 dos deputados da velha direita porque eles            |
      |                 t�m perfis socio-demogr�ficos e objetivos             |
      |                 diferentes e porque o contexto econ�mico e            |
      |                 pol�tico mudou.                                       |
Operacionaliza��o                                                     Operacionaliza��o
      |                                                                       |
      |                                                                       |
      |                                                                       |
      |                                                                       |
      V                                                                       V
Vari�vel Independente                                               Vari�vel dependente
Medida = 0 se n�o ------------------ Hip�tese = ------------------>   Medida = **
pertence a um partido          Se os candidatos deputados eleitos                     
da nova direita,              pertecem a nova direita, ent�o eles 
1 se pertence                 t�m uma distribui��o de votos 
                              diferente de concentrada dominante



** Para medir essa vari�vel, eu finalemente fui ver o que Barry Ames fez. 
Existem dois par�metros para medir a distribui��o de votos: a concentra��o
e a domin�ncia. 

Primeiro � necess�rio definir V_ix que corresponde a porcentagem de votos 
do candidato i no munic�pio x. V_ix � utilizado em seguinte para calcular D_i
que corresponde � domin�ncia m�dia (a porcentagem de votos, eu acho)
do candidato em todos os munic�pios proporcionalmente � porcentagem do total
de votos do candidato que cada munic�pio contribui.
D_i seria entao a m�dia das multiplica��es dos votos de um candidato i no 
munic�pio x pelo peso desse munic�pio no seu resultado final.
Quando o D_i � grande, o candidato i domina suas municipalidades chaves.
Quando D_i � baixo, o candidato i compartilha suas municipalidades chaves com
outros candidatos.

A concentra��o utiliza V_ix e o instrumento estat�stico Moran s I que ajuda a
obter a distribui��o espacial dos votos nos munic�pios onde o candidato se d� 
bem. Para entender como funciona esse instrumento, preciso ler mais 
literatura... No entanto, eu vou querer agendar com voc� sexta-feira se for 
poss�vel porque meu namorado me explicou que esse instrumento Moran s I tinha 
alguma coisa a ver com regress�es...


# Qual � a disponibilidade de dados para sua pesquisa? J� existem
# bancos de dados prontos? Voc� tem acesso a eles? Caso a �ltima
# pergunta seja positiva, responda o exer�cio 4 do cap�tulo 5.

For 1978 and 1982, the electoral results came from PRODASEN, the Senate's 
data-processing arm. 
--> tem que ver se existe melhores hoje. Tem que ver os dados do TSE.

4. Download a codebook for a political science data set in which you are
interested.
(a) Describe the data set and the purpose for which it was assembled.
Os banco de dados que vou estudar s�o feitos pelo TSE com objetivo de 
transpar�ncia do processo eleitoral com a popula�ao. 
Esses reposit�rios cont�m dados das elei�oes para governadores, deputados 
estaduais, federais e senadores.

(b) What are the time and space dimensions of the data set?
Existem dados para elei�oes indo de 1945 at� 2018. Eu vou estudar as elei��es 
para deputado federeal de 2018.
  
  Read the details of how one of the variables in which you are interested was
coded. Write your answers to the following questions:
  (c) Does this seem like a reliable method of operationalizing this variable?
  How might the reliability of this operationalization be improved?
  
Dos bancos de dados do TSE eu vou utilizar os votos totais dos candidatos e 
o seus votos por munic�pio. Ainda n�o achei onde o TSE detalha a colheta desses
dados, por�m, acredito que s�o confi�veis pelo prest�gio e pela perman�ncia 
da insititui��o.
  
  (d) Assess the various elements of the validity for this variable operationalization.
How might the validity of this operationalization be improved?
  
Considerar que o fato de medir votos para medir prefer�ncias eleitorais � uma
quest�o que iria muito al�m dos meus objetivos nesse estudo. Ent�o vou 
considerar que essa vari�vel � v�lida no contexto da minha pesquisa.


# A partir dos exerc�cios anteriores, escreva sobre a confiabilidade e
# validade de suas vari�veis.

Acredito que a maneira de calculca D_i � bastante confi�vel, � uma opera��o
simples baseada em dados certos.

No entanto, ainda nao sei como operacionalizar a concentra��o...

Acredito que minhas variav�is terao um alto grau de confiabilidade, pois, vou
basear meus calculos em dados do TSE.

Sobre a validade de D_i: acredito que a domin�ncia de um candidato n�o pode 
ser medida apenas com uma elei��o e que essa domin�ncia depende muito do
seu partido tamb�m. Por�m, como os candidatos da nova direita s�o provavelmente
e frequentemente novos no jogo pol�tico e que a relev�ncia desses partidos 
tamb�m �, ent�o, acredito que D_i, na forma que foi definido � suficiente para 
esse estudo.

# Qual seria a forma ideal e mais adequada de operacionalizar suas
# vari�veis para testar sua hip�tese?
  Respondi a essa pergunta acima.