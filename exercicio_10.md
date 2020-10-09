Exercício 10
================
Carolina Gabriela Dolléans

### Continuaremos com a utilização dos dados do ESEB2018. Carregue o banco da mesma forma que nos exercicios anteriores

``` r
link <- "https://github.com/MartinsRodrigo/Analise-de-dados/blob/master/04622.sav?raw=true"

download.file(link, "04622.sav", mode = "wb")

banco <- read_spss("04622.sav") 

banco <- banco %>%
  mutate(D10 = as_factor(D10)) %>%
  filter(Q18 < 11,
         D9 < 9999998,
         Q1501 < 11,
         Q12P2_B < 3) %>%
  mutate(Q12P2_B = case_when(Q12P2_B == 1 ~ 0,  # Quem votou em Haddad = 0
                             Q12P2_B == 2 ~ 1)) # Quem votou em Bolsonaro = 1
```

### Crie a mesma variável de religião utilizada no exercício anterior

``` r
Outras <- levels(banco$D10)[-c(3,5,13)]

banco <- banco %>%
  mutate(religiao = case_when(D10 %in% Outras ~ "Outras",
                              D10 == "Católica" ~ "Católica",
                              D10 == "Evangélica" ~ "Evangélica",
                              D10 == "Não tem religião" ~ "Não tem religião"))
```

### Faça uma regressão linear utilizando as mesmas variáveis do exercício 9 - idade(D1A\_ID), educação (D3\_ESCOLA), renda (D9), nota atribuída ao PT (Q1501), auto-atribuição ideológica (Q18), sexo (D2\_SEXO) e religião (variável criada no passo anterior) - explicam o voto em Bolsonaro (Q12P2\_B).

``` r
regressao <- lm(Q12P2_B ~ D1A_ID + D3_ESCOLA + D9 + Q1501 + Q18 + D2_SEXO + religiao, data = banco)
summary(regressao)
```

    ## 
    ## Call:
    ## lm(formula = Q12P2_B ~ D1A_ID + D3_ESCOLA + D9 + Q1501 + Q18 + 
    ##     D2_SEXO + religiao, data = banco)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -1.05532 -0.19854  0.01565  0.16182  0.96682 
    ## 
    ## Coefficients:
    ##                            Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)               7.067e-01  6.469e-02  10.924  < 2e-16 ***
    ## D1A_ID                    1.140e-03  7.539e-04   1.512  0.13074    
    ## D3_ESCOLA                 5.547e-03  5.226e-03   1.061  0.28873    
    ## D9                       -9.837e-07  3.196e-06  -0.308  0.75832    
    ## Q1501                    -7.728e-02  2.799e-03 -27.610  < 2e-16 ***
    ## Q18                       2.651e-02  3.093e-03   8.570  < 2e-16 ***
    ## D2_SEXO                  -5.286e-02  2.089e-02  -2.530  0.01154 *  
    ## religiaoEvangélica        7.684e-02  2.363e-02   3.251  0.00118 ** 
    ## religiaoNão tem religião -2.746e-03  4.238e-02  -0.065  0.94835    
    ## religiaoOutras           -7.263e-02  3.678e-02  -1.975  0.04855 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.3489 on 1138 degrees of freedom
    ## Multiple R-squared:  0.5028, Adjusted R-squared:  0.4989 
    ## F-statistic: 127.9 on 9 and 1138 DF,  p-value: < 2.2e-16

### Interprete o resultado dos coeficientes

Vamos interpretar os resultados dessa regressção com a resalva que os
pressupostos da linearidade, da homocedasticidade e da normalidade não
são respeitados, então os coeficientes são inconsistentes e os
p-valores são alterados. Em outras palavras, não podemos confiar na
interpretação dos resultados dessa regressão.

Primeiramente, podemos ver que os resíduos parecem ter uma repartição
normal: o mínimo e o máximo correspondem mais ou menos a -1 e 1
respectivamente. O primeiro quarto e o terceiro quarto estão próximo de
-0.15 e 0.15 respectivamente. E a média é quase igual a 0.

O intercept corresponde ao valor de Q12P2\_B quando todas as outras
variáveis estão iguais a 0, ou iguais ao valor referência. Então,
corresponde a quando o respondente: tem 16 anos, tem o nível mínino de
educação (analfabeto, nunca frequentou a escola), tem uma renda baixa
(até R$ 954,00 (até 1 salário mínimo)), atribuiu a nota 0 ao PT, se
considera de esquerda, é homem e católico. Nessa situação completamente
hipotética, o respondente teve um resultado de 0.7067, ou seja, está
mais perto de 1 do que de 0, ou seja, mais perto de votar a favor de
Bolsonaro do que de Haddad de maneira significativa (p-valor \< 2e-16).
Porém, visto que Q12P2\_B é uma variável dummy, não podemos interpretar
corretamente esse resultado. Assim, utilizar uma regressão linear com
uma variável dependente dummy é problemático porque rompe com o
pressuposto da linearidade, que é o mais importante. Então, não podemos
interpretar esse resultado (e nem os outros). De qualquer forma, deve
ser difícil achar um tal respondente na realidade, então não vamos
concluir nada com esse intercept.

A variável D1A\_ID (idade) não deu resultado significativo (p-valor =
0.13074), quer dizer que é uma variável que não pode melhorar o modelo.

A variável D3\_ESCOLA (nível de educação) não deu resultado
significativo (p-valor = 0.28873), quer dizer qu é uma variável que não
pode melhorar o modelo.

A variável D9 (renda) não deu resultado significativo (p-valor =
0.94835), quer dizer que é uma variável que não pode melhorar o modelo.

Controlando as outras variáveis, podemos ver que Q12P2\_B diminui
conforme a nota atribuida ao PT aumenta (Q1501) com um coeficiente de
-7.728e-02, de maneira significativa (p-valor \< 2e-16).

Controlando as outras variáveis, podemos ver que Q12P2\_B aumenta
comforme a auto-atribuição ideológica (Q18) vai aumentando com um
coeficiente de 2.651e-02, de maneira significativa (p-valor \< 2e-16).

Controlando as outras variáveis, podemos ver que Q12P2\_B diminui quando
passamos de um respondente masculino católico a uma respondente feminina
católica (D2\_SEXO) de -5.286e-02, de maneira significativa (p-valor =
0.01154).

Controlando as outras variáveis, podemos ver que Q12P2\_B aumenta quando
passamos de um respondente masculino católico a um respondente masculino
evangélico (religiaoEvangélica) de 7.684e-02, de maneira significativa
(p-valor = 0.00118).

A variável religiaoNão tem religião não deu resultado significativo
(p-valor = 0.75832), quer dizer que é uma variável que não pode melhorar
o modelo.

Controlando as outras variáveis, podemos ver que Q12P2\_B diminui quando
passamos de um respondente masculino católico a um respondente masculino
de uma religião da categoria “Outras” de 7.263e-02, de maneira
significativa (p-valor = 0.04855).

Enfim, podemos ver que o erro do modelo é relativamente grande (0.3489)
e que o poder explicativo do modelo também (a volta de 50%).

### O resultado difere dos encontrados anteriormente, quando a variável dependente era a aprovação de Bolsonaro?

Se consideramos que existe uma proporcionalidade entre Q12P2\_B e Q1607,
podemos dizer que o intercept da regressão com Q12P2\_B é
propocionalmente maior do que com Q1607.

Podemos ver que D1A\_ID e D3\_ESCOLA não deram resultados significativos
no caso da regressão com Q12P2\_B, ao contrário da regressão com Q1607.

Nas duas regressões, as variáveis religiaoNão tem religião e D9 não
deram resultados significativos.

Nas duas regressões, a positividade ou negatividade das relações são as
mesmas e os coeficientes são pequenos em relação à variável dependente.
Nao podemos comparar além disso porque a regressão com Q12P2\_B é
viesada, e temos que insistir no fato que as comparações que fizemos até
agora não demonstram nada, apenas as fizemos para responder à pergunta.

### Faça uma regressão logistica com as mesmas variaveis

``` r
regressao_logistica <- glm(Q12P2_B ~ D1A_ID + D3_ESCOLA + D9 + Q1501 + Q18 + D2_SEXO + religiao, data = banco, family = "binomial")
summary(regressao)
```

    ## 
    ## Call:
    ## lm(formula = Q12P2_B ~ D1A_ID + D3_ESCOLA + D9 + Q1501 + Q18 + 
    ##     D2_SEXO + religiao, data = banco)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -1.05532 -0.19854  0.01565  0.16182  0.96682 
    ## 
    ## Coefficients:
    ##                            Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)               7.067e-01  6.469e-02  10.924  < 2e-16 ***
    ## D1A_ID                    1.140e-03  7.539e-04   1.512  0.13074    
    ## D3_ESCOLA                 5.547e-03  5.226e-03   1.061  0.28873    
    ## D9                       -9.837e-07  3.196e-06  -0.308  0.75832    
    ## Q1501                    -7.728e-02  2.799e-03 -27.610  < 2e-16 ***
    ## Q18                       2.651e-02  3.093e-03   8.570  < 2e-16 ***
    ## D2_SEXO                  -5.286e-02  2.089e-02  -2.530  0.01154 *  
    ## religiaoEvangélica        7.684e-02  2.363e-02   3.251  0.00118 ** 
    ## religiaoNão tem religião -2.746e-03  4.238e-02  -0.065  0.94835    
    ## religiaoOutras           -7.263e-02  3.678e-02  -1.975  0.04855 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.3489 on 1138 degrees of freedom
    ## Multiple R-squared:  0.5028, Adjusted R-squared:  0.4989 
    ## F-statistic: 127.9 on 9 and 1138 DF,  p-value: < 2.2e-16

### Transforme os coeficientes estimados em probabilidade

``` r
library(margins)

margins(regressao_logistica)
```

    ##    D1A_ID D3_ESCOLA         D9    Q1501     Q18 D2_SEXO religiaoEvangélica
    ##  0.001171  0.006589 -5.421e-07 -0.05471 0.02622 -0.0526            0.07346
    ##  religiaoNão tem religião religiaoOutras
    ##                 -0.002521       -0.08172

``` r
summary(margins(regressao_logistica))
```

    ##                    factor     AME     SE        z      p   lower   upper
    ##                    D1A_ID  0.0012 0.0007   1.5849 0.1130 -0.0003  0.0026
    ##                   D2_SEXO -0.0526 0.0202  -2.6078 0.0091 -0.0921 -0.0131
    ##                 D3_ESCOLA  0.0066 0.0051   1.2949 0.1953 -0.0034  0.0166
    ##                        D9 -0.0000 0.0000  -0.1935 0.8466 -0.0000  0.0000
    ##                     Q1501 -0.0547 0.0009 -57.9079 0.0000 -0.0566 -0.0529
    ##                       Q18  0.0262 0.0030   8.8434 0.0000  0.0204  0.0320
    ##        religiaoEvangélica  0.0735 0.0235   3.1280 0.0018  0.0274  0.1195
    ##  religiaoNão tem religião -0.0025 0.0417  -0.0605 0.9517 -0.0842  0.0791
    ##            religiaoOutras -0.0817 0.0379  -2.1574 0.0310 -0.1560 -0.0075

Primeiramente, podemos ver que todas as probabilidades não são
significativas. Assim, a idade (D1A\_ID), o nível de escolaridade
(D3\_ESCOLA), a renda (D9), e a religião Não tem religião não são
probabilidades significativas.

De reste, podemos dizer o seguinte:

Passar de um respondente masculina a uma respondente feminino (D2\_SEXO)
diminui de 5.26% a probabilidade dessa respondente ter votado para
Bolsonaro.

Quando a nota atribuida ao PT (Q1501) aumenta de um, a probabilidade
desse respondete ter votado em Bolsonaro diminui de 5.47%.

Quando a escala de auto-atribuição ideológica (Q18) aumenta de um (indo
da esquerda pra direita), a probabilidade desse respondente ter votade
em Bolsonaro aumenta de 2.62%.

Quando passamos que um respondente católico homem a um respondete
evangêlico homem (religiaoEvangélica), a probabilidade de votar para
Bolsonaro aumenta de 7.35%.

Quando passamos que um respondente catolico homem a um respondete homem
de outras religioes (religiaoOutras), a probabilidade de votar para
Bolsonaro diminui de 8.17%.

### Quais foram as diferenças no resultado entre usar a regressão linear e a logistica?

Primeiramente, podemos observar que as mesmas variáveis não deram
resultados significativos nas duas regressões: idade (D1A\_ID),
escolaridade (D3\_ESCOLA), renda (D9), e “Não tem religião”.

Além disso, podemos observar que a positividade ou negatividade das
relações são as mesmas.

Enfim, os resultados das variáveis que deram significativo são parecidos
em ambas as regressões. São valores pequenos e até numericamente
próximos dos seus equivalentes na outra regressão. Por exemplo: a
variável de gênero (D2\_SEXO) deu -5.286e-02 na regressão linear e
-5.26% na regressão logística.

### Verifique a quantidade de classificações corretas da regressao logistica e avalie o resultado

``` r
predicted_prob <- predict(regressao_logistica, type = "response")


1 - misClassError(banco$Q12P2_B, 
                  predicted_prob, 
                  threshold = 0.5566875)
```

    ## [1] 0.8362

``` r
opt_cutoff <- optimalCutoff(banco$Q12P2_B, 
                            predicted_prob)

print(opt_cutoff )
```

    ## [1] 0.5566875

Alteramos o valor do threshold em função do valor calculado pela função
optimalCutoff. Podemos ver que o nível de acerto dessa regressão
logística é de 83.62%.

``` r
confusionMatrix(banco$Q12P2_B, 
              predicted_prob, 
              threshold = opt_cutoff)
```

    ##     0   1
    ## 0 393 105
    ## 1  83 567

``` r
prop.table(confusionMatrix(banco$Q12P2_B, 
                predicted_prob, 
                threshold = opt_cutoff))
```

    ##            0          1
    ## 0 0.34233449 0.09146341
    ## 1 0.07229965 0.49390244

Essa tabela nos mostra que o modelo acertou 34.23% dos votos para Haddad
e errou 7.2% deles. Além disso, o modelo acertou 49.93% dos votos para
Bolsonaro e errou 9.15% deles.
