# 1000 filmes mais populares de 2006 a 2016 segundo o IMDB

Este repositório contém uma breve análise dos 1000 filmes mais populares de 2006 a 2016 do IMDB, utilizando a linguagem R.

Na pasta `rmd`, há um arquivo [R Markdown](https://rmarkdown.rstudio.com/) que responde as seguintes perguntas sobre a base de dados:

1. Qual diretor tem a maior e a menor nota média do público? E da crítica? E considerando ambos?
2. Quais os diretores que também atuaram nos filmes que dirigiram?
3. Quais os 5 filmes com maiores notas do público e menores arrecadações? E os 5 filmes com menores notas do público e maiores arrecadações?
4. Existe algum ator/atriz mais propício a atuar num determinado gênero de filme? Ou com um determinado diretor? Se sim, quem?
5. Há alguma correlação entre a nota do público e a nota da crítica? E entre outras variáveis quaisquer?
6. Há como prever a arrecadação do filme a partir de outras variáveis? E a nota do público?

Na pasta `shiny-app`, há uma aplicação [Shiny](https://shiny.rstudio.com/) extrapolando a primeira pergunta da lista acima. Nesta aplicação, é possível personalizar diversos parâmetros, como o ano de lançamento do filme, ou o número mínimo de filmes necessário para calcular a nota, entre outros. É possível acessar essa aplicação em https://brunobastosg.shinyapps.io/best-and-worst-directors/.