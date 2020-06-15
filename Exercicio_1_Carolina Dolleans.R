# Criando o vetor com o nome dos seis candidatos a presidência

candidatos <- c("Luiz Inácio Lula da Silva", "José Serra", "Anthony Garotinho", 
                "Ciro Gomes", "José Maria de Almeida", "Rui Costa Pimenta")

# Criando um vetor com a sigla do partido de cada candidato

partido <- c("PT","PSDB", "PSB", "PPS", "PSTU", "PCO")

# Criando um vetor com o total de votos de cada candidato

votos_candidatos <- c(39455233, 19705445, 15180097, 10170882, 402236, 38619)

# Criando um objeto calculando a soma do votos dos candidatos no 1o turno

total_votos <- sum(votos_candidatos)

# Criando um vetor com a porcentagem de votos de cada candidato

porcentagem_votos <- ((votos_candidatos / total_votos)*100)


# Criando uma matriz que conste uma coluna com o total de votos de cada candidato
# e outra com a porcentagem dos votos de cada candidato

matriz_votos <- matrix(c(votos_candidatos, porcentagem_votos), nrow=6)

# Nomeando as linhas e as colunas

rownames(matriz_votos) <- candidatos
colnames(matriz_votos) <- c("Votos", "Porcentagem")

# Criando um dataframe com o nome dos candidatos, o partido,
# a quantidade de votos e o percentual

dataframe_eleiçao <- data.frame(candidatos, partido, votos_candidatos, 
                                porcentagem_votos)

#Criando um vetor lógico, indicado TRUE ou FALSE, com a informacao se
# o candidato foi para o segundo turno

vetor_logico <- c(T, T, F, F, F, F)

# Adicionando esta coluna no dataframe

dataframe_eleiçao_linha_extra <- cbind(dataframe_eleiçao, vetor_logico)

# Calculo da soma da porcentagem dos dois candidatos que obtiveram mais votos

sum(porcentagem_votos[1],porcentagem_votos[2])

# Exibiçao das informações do dataframe dos dois candidatos com mais votos

dataframe_eleiçao_linha_extra[1:2,]

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# [1] 24 18 31

q <- c(47, 24, 18, 33, 31, 15)
q[c(2,3,5)]

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# Out Nov
#  24   2

x <- c(5, 4, 24, 2)
y <- c("Ago", "Set", "Out", "Nov")
names(x) <- y

x[c(3,4)]

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# 'data.frame':	2 obs. of  2 variables:
# $ x: Factor w/ 2 levels "d","e": 1 2
# $ y: num  1 4

df <- data.frame(x=factor(c("d", "e")),
                 y = c(1,4))

str(df)


###############################################################################

# Crie a seguinte matriz
#
#       [,1] [,2] [,3]
# [1,]   19   22   25
# [2,]   20   23   26
# [3,]   21   24   27

vector_1 <- c(19, 20, 21)
vector_2 <- c(22, 23, 24)
vector_3 <- c(25, 26, 27)
matriz <- matrix(c(vector_1, vector_2, vector_3), byrow = FALSE, ncol = 3)
print(matriz)

###############################################################################

# Se Z é uma matriz 4 por 4, qual é o resultado de Z[1,4] ?

# O resultado de Z[1,4] é o elemento da primeira linha e da quarta colunam ou 
# seja, o primeiro elemento da quarta coluna.

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
#  W3 W4 W1 W2 
#  20 69  5 88 

y <- c(20, 69, 5, 88)
q <- c("W3", "W4", "W1", "W2")
names(y) <- q
print(y)

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
#       [,1] [,2]
# [1,]    4    6
# [2,]    3    7
# [3,]    1    8


cbind(c(4, 3, 1), c(6, 7, 8))

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#       [,1] [,2] [,3] [,4]
# [1,]    1    3   13   15
# [2,]    2    4   14   16

x <- 1:4
y <- 13:26

matrix(c(x,y[1:4]),
       nrow = 2,
       byrow = FALSE)



###############################################################################

# Crie o seguinte dataframe df
#
# df
#    x  y    z
# 1 17  A  Sep
# 2 37  B  Jul
# 3 12  C  Jun
# 4 48  D  Feb
# 5 19  E  Mar

x <- c(17, 37, 12, 48, 19)
y <- c("A", "B", "C", "D", "E")
z <- c("Sep", "Jul", "Jun", "Feb", "Mar")
df <- data.frame(x, y, z)

# Ainda utilizando o dataframe df,
# qual código produziria o seguinte resultado?
#
#    x  y
# 1 17  A
# 2 37  B
# 3 12  C

df[c(1, 2, 3),c(1, 2)]

###############################################################################

# Responder o exercício teórico abaixo
#
# elaborar uma explicação causal teórica
# elaborar hipóteses
# pensar em como operacionalizar os conceitos teóricos em variáveis
# empíricas
# estabelecer o tipo de relação entre as variáveis operacionalizadas
#
#
#
# RESPOSTA 1:
#
# Barry Ames developa uma terminologia sobre a repartição 
# dos votos dos partidos na obra "Os entraves da democracia 
# no Brasil" de 2003. A repartiçao de votos podem ser de quatro
# formas diferentes: dispersa-compartilhada ; dispersa-dominante
# ; concentrada-compartilhada ; concentrada-dominante. A concentração
# corresponde à densidade de votos: se os votos são concentrados
# em poucas cidades ou se são mais repartidos em várias cidades.
# Os políticos são dominantes geralmente porque vêm de famílias políticas
# tradicionais ou exerçam cargos locais ou se aliaram com caciques
# locais. Por serem dominantes na sua cena política, essa repartição 
# de votos é marcada por empreguismo e clientelismo entre os políticos
# e os eleitores.Essa repartição de votos é característica da 
# direita conservadora tradicional que tem maior penetração eleitoral 
# nas regiões mais pobres.
# 
# Os políticos do PSL e outros que se aliaram à Bolsonaro e que foram eleitos 
# na eleição de 2018 fazem parte da "nova direita". Foi notado na literatura 
# que essa "nova direita" é diferente da direita tradicional de várias 
# maneiras. Queremos verificar isso.
# 
# Supomos que: 
#    - (a) se os políticos do PSL vêm de famílias políticas tradicionais OU
# tiveram cargos locais OU são aliados de caciques locais
#    - (b) se a repartição dos votos é mais concentrada em uma ou poucas cidades 
#    - (c) se os políticos vêm de partidos politicos que dominam 
# terriotórios eleitorais
#    - (d) se os eleitores vêm de camadas carentes da população
# ENTAO 
# --> (e) os políticos do PSL são semelhantes aos políticos da direita
# conservadora tradicional.
#
# Para testar essa hipótese, teriamos que medir se:
#
#    - uma maioria de políticos de famílias políticas tradicionais OU
# tiveram cargos locais OU são aliados de caciques locais
# ---> operacionalização: medir a quantidade de políticos que correspondem
# as essas características
#
#    - a maioria dos votos é concentrada em uma ou poucas cidades
# --> medir a densidade dos votos
#
#    - a maioria dos políticos vêm de partidos políticos que dominam 
# terriotórios eleitorais
# --> "medir" a alternância política (quantidade de partidos que obtiveram
# cargos importantes nas últimas 5 eleições relativaçente à média
# brasileira por exemplo)
#
#    - a maioria dos eleitores vêm de populações carentes
# --> medir a porcentagem de populações carentes no territórios mais dominados
# por esses políticos e comparar com a porcentagem nacional
#
# OBS: quando falamos "a maioria", não sabemos ainda de qual maioria falamos...
# --> Teríamos que pesquisar como Barry Ames fez e outros estudos e 
# replicar suas análises.
#
# Mais essas medidas serão altas, mais a nova direita será semelhante à
# direita tradicional. O fato de ser exatamente semelhante à direita tradicional
# seria o resultado 1. O fato de ser totalmente diferente da direita tradicional
# daria o resultado 0. 
#
# Temos entao uma relaçao positiva entre (a), (b), (c), (d) e (e). Quando (a),
# (b), (c) e (d) aumentam, então (e) aumenta também.
#
#
# Professor, isso é o pré-projeto do meu namorado que eu tinha falado ao senhor 
# em março. Eu pensava poder desenvolver o projeto dele como artigo durante sua
# aula. Mas agora que escrevi isso tudo, eu realizo que talvez não terei as 
# capacidades teóricas de fazer as regressões necessárias para provar isso, que
# esse projeto daria muito mais do que um artigo e que eu ainda nem sei 
# como teorizar e operacionalizar isso corretamente.
# Eu deixei aqui para o senhor me dizer se eu estou no caminho certo, se esse 
# esboço poderia funcionar, mas eu vou deixar outra resposta para esse 
# exercício, algo de mais simples e mais realizável para mim. 
# Obrigada pela atenção, desculpa pela quantidade de texto.
#
#
#
# RESPOSTA 2:
#
# Explicação Causal:
# Durante uma crise, é fundamental que os governantes definam o problema e suas
# soluções claramente. Quando isso não ocorre, as soluções têm mais dificuldade
# a serem aceitas pelas populações e então implementadas pelos governantes
#
# Durante a crise do coronavírus no Brasil, o presidente se posicionou 
# claramente contra as soluções propostas pela OMS, por seu Ministério da Saude
# e contra uma maioria de governadores e prefeitos. Por essa razão, a solução
# da quarentena horizontal não funcionou no Brasil.
#
# Hipótese: 
# Os discursos de Bolsonaro contra a o isolamento social (X) causam uma 
# diminuição do isolamento social (Y).
#
# Operacionalização:
# Medir a quantidade de discursos de Bolsonaro durante o período de crise do
# coronavírus no Brasil. Estimar o peso relativo de cada intervenção com a 
# repercussão nas redes sociais (quantidade de tweets e retweets, quantidade
# de vizualizações no youtube) e na mídias tradicionaise  alternativas 
# (quantidade de matérias).
# Observar a diminuição do isolamento social após cada intervenção (com os dados
# da startup inloco).
# Comparar com o isolamento social em países onde os poderes públicos 
# foram coerentes sobre a necessidade do isolamento social (como a Nova 
# Zelândia).
#
# Relação:
# Existe uma relação negativa entre X e Y. Quando X aumenta, Y diminui.
#