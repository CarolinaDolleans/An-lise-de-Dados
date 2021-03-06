#
# Suponha que tenhamos o dataframe df abaixo
#
# x     y
# A     5
# A     3
# B     8
# B    12
#
# Complete o c�digo que obt�m o seguinte resultado:
#
#        z
#        7
#
df_1 <- data.frame(x = c("A","A","B","B"), 
                   y = c(5,3,8,12))
df_1 %>%
summarize(z = mean(y))

#######################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# y1    y2    y3    y4
# 8.04  9.14  7.46  6.58
# 6.95  8.14  6.77  5.76
# 7.58  8.74  12.74 7.71
#
# Complete o c�digo que obt�m o seguinte resultado:
#
# y1    
# 8.04  
# 6.95  
# 7.58  

df_2 <- data.frame(y1 = c(8.04, 6.95, 7.58), 
     y2 = c(9.14, 8.14, 8.74),
     y3 = c(7.46, 6.77, 12.74),
     y4 = c(6.58, 5.76, 7.71))

df_2 %>%
select(y1)
  
#######################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#    x  y
#   1  10
#   6  8
#   2  3
#   4  5
#
# Complete o c�digo que obt�m o seguinte resultado, fazendo uma opera��o
# entre x e y
#
#    x  y   z
#   1  10  -9
#   6  8   -2
#   2  3   -1
#   4  5   -1
#
df_3 <- data.frame(x = c(1,6,2,4), y = c(10,8,3,5))

df_3 %>%
transmute(x, y, z = -(y-x)) 
# Tive que colocar um menos na frente para fazer aparecer os n�meros em 
# negativo, � normal?
  
########################################################################

#
# Suponha que tenhamos o dataframe df abaixo
#
#    city sales
# Boston   220
# Boston   125
#    NYC   150
#    NYC   250
#
# Complete o c�digo que obt�m o seguinte resultado:
#
# city   avg_sales
# Boston      172
# NYC         200 

df_4 <- data.frame(city = c("Boston", "Boston", "NYC", "NYC"),
                   sales = c(220, 125, 150, 250))

df_4 %>%
  group_by(city) %>%
  summarise(avg_sales = mean(sales))
  
########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#week   min   max
#  3    55    60
#  2    52    56
#  1    60    63
#  4    65    67
#
# Complete o c�digo que obt�m o seguinte resultado:
#
#week   min   max
#  1    60    63
#  2    52    56
#  3    55    60
#  4    65    67

df_5 <- data.frame(week = c(3,2,1,4), 
                   min = c(55,52,60,65), 
                   max = c(60,56,63,67))

df_5 %>%
  arrange(week)

########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# x_b_1  x_b_2  y_c_1  y_c_2
#  A      2      W1     25
#  A      4      W2     21
#  B      6      W1     26
#  B      8      W2     30
#
# Complete o c�digo que obt�m o seguinte resultado:
#
# y_c_1  y_c_2
#  W1     25
#  W2     21
#  W1     26
#  W2     30

df_6 <- data.frame(x_b_1 = c("A","A","B","B"), 
                   x_b_2 = c(2,4,6,8), 
                   y_c_1 = c("w1","w2","w1","w2"),
                   y_c_2 = c(25,21,26,30)
                   )

df_6 <- data.frame(x_b_1 = c("A","A","B","B"), 
                   x_b_2 = c(2,4,6,8), 
                   y_c_1 = c("w1","w2","w1","w2"),
                   y_c_2 = c(25,21,26,30)
                   ) %>%
        select(c(3,4))

#########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
# Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 78           6.7         3.0          5.0         1.7 versicolor
# 121          6.9         3.2          5.7         2.3  virginica
# 11           5.4         3.7          1.5         0.2     setosa
# 92           6.1         3.0          4.6         1.4 versicolor
# 146          6.7         3.0          5.2         2.3  virginica
# 62           5.9         3.0          4.2         1.5 versicolor
# 50           5.0         3.3          1.4         0.2     setosa
# 17           5.4         3.9          1.3         0.4     setosa
# 69           6.2         2.2          4.5         1.5 versicolor
# 143          5.8         2.7          5.1         1.9  virginica
#
# Complete o c�digo que obt�m o seguinte resultado:
#
#Species      Sepal.Area
#versicolor      20.10
#virginica       22.08
#setosa          19.98
#versicolor      18.30
#virginica       20.10
#versicolor      17.70
#setosa          16.50
#setosa          21.06
#versicolor      13.64
#virginica      15.66


df_7 <- subset(iris)[c(78,121,11,92,146,62,50,17,69,143),] %>%
        summarize(Species = Species,
                  Sepal.Area = Sepal.Length*Sepal.Width)



########################################################################

# Suponha que tenhamos o dataframe df abaixo
#
#name         start       end         party     
#Eisenhower   1953-01-20  1961-01-20  Republican
#Kennedy      1961-01-20  1963-11-22  Democratic
#Johnson      1963-11-22  1969-01-20  Democratic
#Nixon        1969-01-20  1974-08-09  Republican
#Ford         1974-08-09  1977-01-20  Republican
#Carter       1977-01-20  1981-01-20  Democratic
#Reagan       1981-01-20  1989-01-20  Republican
#Bush         1989-01-20  1993-01-20  Republican
#Clinton      1993-01-20  2001-01-20  Democratic
#Bush         2001-01-20  2009-01-20  Republican
#Obama        2009-01-20  2017-01-20  Democratic
#
#Crie um c�digo abaixo para que se altere a vari�vel party
#deixando apenas a primeira letra dos partidos

df_9 <- data.frame(name = c("Eisenhower", "Kennedy", "Johnson", 
                            "Nixon", "Ford", "Carter", "Reagan",
                            "Bush", "Clinton","Bush", "Obama"),
                   
                   start = c("1953-01-20", "1961-01-20", "1963-11-22",
                             "1969-01-20", "1974-08-09", " 1977-01-20",
                             "1981-01-20", "1989-01-20", "1993-01-20",
                             "2001-01-20", " 2009-01-20"),
                   
                   end = c("1961-01-20", "1963-11-22", "1969-01-20",
                           "1974-08-09", "1977-01-20", "1981-01-20",
                           "1989-01-20", "1993-01-20", "2001-01-20",
                           "2009-01-20", "2017-01-20"),
                   
                   party = c("Republican", "Democratic", "Democratic",
                             "Republican", "Republican", "Democratic",
                             "Republican", "Republican", "Democratic",
                             "Republican", "Democratic")
                   ) %>%
   
   mutate(party = recode(party,
                         Republican ="R",
                         Democratic = "D"))
 

###############################################################################

# No pacote poliscidata existe um banco de dados chamado nes, com informa��es 
# do American National Election Survey. Para os exer�cicios a seguir, instale 
# o pacote poliscidata e tidyverse, carregue-os e crie um objeto chamado
# df com os dados do nes. 

df_10 <- nes 

# Fa�a uma primeira explora��o do banco de dados com todos os comandos
# passados at� aqui que possuem esse objetivo

glimpse(df_10)
str(df_10)
head(df_10)
summary(df_10)

# Quantos respondentes possui na pesquisa?
Tem 5916 respondentes na pesquisa

# Caso queiram ter mais informa��es sobre as vari�veis do nes, basta rodar
# o c�digo `?nes`, que no canto inferior direito aparecer� uma descri��o.
# Como temos muitas vari�veis, deixe apenas as colunas
# ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote
# income5, gender.

df_11 <- df_10 %>%
   select(ftgr_cons, dem_raceeth, voted2012, 
          science_use, preknow3, obama_vote,
          income5, gender)


# Se quisermos ter informa��es apenas de pessoas que votaram na
# elei��o de 2012, podemos usar a vari�vel voted2012. Tire do banco
# os respondentes que n�o votaram

df_12 <- df_11 %>%
   filter(voted2012 == "Voted")

# Quantos respondentes sobraram?

str(df_12)

Sobraram 4404 respondentes.


# Crie uma vari�vel chamada white que indica se o respondente � branco
# ou n�o a partir da vari�vel dem_raceeth, crie a vari�vel ideology a
# partir da vari�vel ftgr_cons (0-33 como liberal, 34 a 66 como centro,
# e 67 a 100 como conservador), ao mesmo tempo em que muda
# a vari�vel obama_vote para trocar o 1 por "Sim" e 0 por "n�o"

df_13 <- df_12 %>%
   mutate(white = case_when(dem_raceeth == "1. White non-Hispanic" ~ "Yes",
                            dem_raceeth == "2. Black non-Hispanic" ~ "No",
                            dem_raceeth == "3. Hispanic" ~ "No",
                            dem_raceeth == "4. Other non-Hispanic" ~ "No"),
          
          ideology = case_when(ftgr_cons < 34 ~ "Liberal",
                               ftgr_cons > 33 & ftgr_cons < 67 ~ "Centro",
                               ftgr_cons > 66 ~ "Conservador"),
          
          obama_vote = case_when(obama_vote == 1 ~ "N�o",
                                 obama_vote ==0 ~ "Sim"))

# Demonstre como observar a quantidade de pessoas em cada uma das
# categorias de science_use

df_13 %>%
   count(science_use)

# Demonstre como observar a m�dia de conservadorismo (vari�vel 
# ftgr_cons) para cada categoria de science_use

df_14 <- df_13 %>%
   group_by(science_use) %>%
   summarise(mean_cons = mean(ftgr_cons > 66, na.rm = TRUE))


###############################################################################

# Responder as quest�es te�ricas da aula abaixo

# Selecione o principal artigo do campo de estudos relacionado ao seu
# trabalho e responda as seguintes quest�es: 
  
Escolhi estudar o artigo seguinte: ROEDER, Karolina Mattos. Existe uma nova 
direita no Brasil? Uma proposta de classifica��o e an�lise de seu perfil social.
10� Encontro da Associa��o Brasileira de Ci�ncia Pol�tica. Belo Horizonte, 2016.
 
# 1 - Qual � a quest�o da pesquisa? 
   Eu reparei duas perguntas nesse artigo.
  Uma mais geral: 
   Podemos falar de uma nova direita no Brasil?
  Uma mais espec�fica:
   Como evidenciar o crescimento de uma nova direita e de partidos fisiol�gicos
 no Brasil a partir de 1998?
   
#  2 - Qual � a teoria? 
   A direita tradicional perdeu for�a desde de 1998 para a esquerda, 
   notavelmente o PT, e tamb�m no seu proprio campo, para partidos representando
   uma nova direita e outros partidos de direita fisiol�gicos.
 
#  3 - Qual � o desenho de pesquisa? 
   Afim de revelar o surgimento dessa nova direita e partidos fisiol�gicos, 
   a autora come�a definindo os partidos que vai estudar. A seguir, ela analiza
   as quantidade de candidaturas de partidos fisiol�gicos, da nova direita, 
   da direita tradicional, e dos outros partidos de 1998 a 2014.
   Depois, ela analiza a quantidade de deputados federais efetivamente
   eleitos. 
   Enfim, ela analiza a origem socio-demogr�fica dos candidatos a elei��es
   de deputados federais.
     
#  4 - Como o artigo se sai nos 4 quesitos de avalia��o de causalidade? 
   
   x -> Y 
   O surgimento do protagonismo de lideran�as, comunicadores e trabalhadores 
   causa o crescimento de uma nova direita?
     
   O artigo n�o explica realmente porque que surgem tantas candidaturas e 
   deputados da nova direita e de partidos fisiol�gicos.
   Come�a a entrar nesse tema no final do artigo, depois da an�lise das origens
   socio-demogr�ficas do pol�ticos, explica que a velha direita deve ter 
   perdido espa�o pol�tico para a nova direita e os partidos fisiol�gicos
   porque n�o conseguiu absorver as novas lideran�as, religiosas ou outras, de
   comunicadores e pessoas origin�rias das camadas trabalhadoras da popula��o. 
   
   Y -> X
   O surgimento de uma nova direita causa o protagonismo de lideran�as, 
   comunicadores e trabalhadores?
   
   O artigo n�o responde a esse quesito. Por�m, a gente pode imaginar que o
   fato de ver mais lideran�as, comunicadores e trabalhadores conseguir alcan�ar 
   o palco pol�tico, inspira novas pessoas que fazem parte desses grupos a 
   tentar a vida pol�tica e a ingressar nesses partidos da nova direita e
   fisiol�gicos. 

   
   Existe covaria��o entre X e Y ?
   O surgimento do protagnismo de lideran�as, comunicadores, trabalhadores e
   e surgimento de uma nova direita covariam?
   
   O artigo n�o responde a esse quesito. Por�m, podemos imaginar que sim, mas
   teria que medir o protagonismo de lideran�as, comunicadores e trabalhadores
   na sociedade, o que me parece complicado. 
   
   Foi levado em considera��o outras vari�veis Z que podem fazer a
   associa��o entre X e Y desaparecer?
      
   O artigo n�o responde a esse quesito. No entanto, podemos fazer uma 
   liga��o entre esse fen�meno social e o crescimento do n�vel de vida
   decorrente da pol�tica do PT e das tecnologias de informa��o.
   Poder�amos tamb�m atribuir isso � diminui��o de confian�a da popula��o 
   em rela��o aos profissionais da pol�tica que n�o est�o muito presentes
   nessa nova direita e partidos fisiol�gicos.
   
#  5 - O que ele conclui? 
   O artigo conclui que diferenciar esses partidos de direita pela ideologia
   n�o foi muito probante. Foi mais interessante observar as origens sociais
   e demogr�ficas dos pol�ticos e candidatos a deputados federais.
   Conclui dizendo que � necess�rio fazer muitas pesquisas emp�ricas
   e metodol�gicas para entender melhor esses partidos fisiol�gicos e da nova
   direta.
     
#  6 - Como a sua pesquisa d� um passo a mais para o desenvolvimento te�rico 
#      presente neste artigo?
  
     Essa pesquisa � um primeiro passo para definir a nova direita e os 
     partidos fisiol�gicos que cresceram recentemente. Acredito que � um 
     estudo mais observacional, por isso que ainda n�o desenvolve muito 
     essas quest�es de causalidades. 
     Nao foi o melhor artigo para escolher...
     
# Elabore qual � a pergunta da sua pesquisa em apenas uma frase
         
  Os deputados federais eleitos em 2018 da nova direita t�m uma distribui��o 
  de votos similar aos deputados da direita tradicional?

# Pense no seu trabalho e avalie em que medida ele passa pelas 4
# avalia��es de rela��o causal, e quais problemas ele pode ter em cada
# uma delas.

Hip�tese: Se os pol�ticos s�o da nova direita, ent�o a distribui��o de votos 
  deles n�o vai ser concentrada-dominante segundo a classifica��o de Ames.
  
  X -> Y
  O fato que os pol�ticos pertecem � nova direita implica que a distribui��o
  de votos deles n�o ser� concentrada-dominante.
  
  A teoria � que existe uma disatisfa��o da popula��o brasileira com
  a "velha pol�tica", ou a pol�tica de maneira geral. 
  No entanto, os partidos da direita tradicional s�o
  compostos de maneira majorit�ria por pol�ticos oriundos de fam�lias pol�ticas,
  s�o aliados de caciques locais ou v�m de cargos locais. Em breve, eles
  representam essa velha pol�tica. Segundo o artigo de Roeder mencionado
  acima e outros trabalhos de Codato, Bolognesi e Roeder (2015), os partidos
  da nova direita apresentam candidatos diferentes, novos na pol�tica. Al�m
  disso, o surgimento da nova-direita � recente. Se baseando nesses fatos, 
  podemos supor que a distribui��o de votos pol�ticos eleitos pela 
  nova-direita n�o seja concetrada-dominante.
  
  Y -> X
  O fato dos pol�ticos terem uma distribui��o de votos diferentes de concetrada
  -dominante quer dizer que eles pertecem � nova-direita.
  
  N�o, n�o faz sentido porque existem tr�s outras distribui��es de votos no 
  modelo de Ames. Ent�o, o fato de n�o ser concentrado-dominante n�o tem
  nada a ver com o fato de pertecer � nova-direita.
  
  
  Existe covaria��o entre X e Y ?
  Isso � o que queremos provar. Ainda nao li toda a literatura relativa a esse
  projeto, entao n�o posso afirmar com certeza que j� n�o existe dados
  mostrando essa covaria��o (mesmo sem utilizar o modelo de Ames).
  
  
  Foi levado em considera��o outras vari�veis Z que podem fazer a
  associa��o entre X e Y desaparecer?

  Se inspirando do artigo de Roeder mencionado acima, a origem social e 
  demogr�fica dos pol�ticos poderia fazer desaparecer essa associa��o entre X e 
  Y.


