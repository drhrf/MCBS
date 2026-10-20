# Metodologia científica e Bioestatística

Livro de acesso aberto sobre metodologia científica e bioestatística aplicadas às ciências da saúde e da vida, com exemplos reproduzíveis em R e Python.

<img src="images/MCBS_capa.png" alt="Capa do livro Metodologia científica e Bioestatística" width="300">

## Acesso

- Versão *online*: <https://drhrf.github.io/MCBS/>
- PDF: [docs/MCBSbook.pdf](docs/MCBSbook.pdf)
- EPUB: [docs/MCBSbook.epub](docs/MCBSbook.epub)

## Edição

1ª edição, Cabo Frio, RJ, 2026. Edição do autor.

**Autor**: Hércules Rezende Freitas, Universidade do Estado do Rio de Janeiro (UERJ), Faculdade de Ciências Médicas, Laboratório de Informática em Saúde (LabInfoS). ORCID: [0000-0003-1584-9157](https://orcid.org/0000-0003-1584-9157).

## Conteúdo

1. Introdução à metodologia científica
2. Formulação de problemas e hipóteses
3. Desenhos de pesquisa
4. Bioestatística descritiva
5. Bioestatística inferencial
6. Relações entre variáveis
7. Uso de *softwares* estatísticos
8. Comunicação científica
9. Ética e boas práticas em pesquisa
10. Aplicações práticas e estudos de caso
11. Tópicos avançados em bioestatística
12. Recursos adicionais

Referências

## Como compilar

Pré-requisitos:

- R (versão 4.x) e, de preferência, o RStudio;
- pacotes R: `bookdown`, `knitr`, `rmarkdown`, `ggplot2`, `ggpubr`, `kableExtra`, `plotly`, `sf`, `rnaturalearth`, `gapminder`, `gganimate`, `shiny`, `readxl`, `cluster`, `MASS`, `nlme` e `survival`;
- para o PDF, uma distribuição LaTeX com XeLaTeX, como o TinyTeX (`tinytex::install_tinytex()`), com o pacote `fvextra` (`tinytex::tlmgr_install("fvextra")`).

Na raiz do projeto, no R, com o locale em UTF-8:

```r
bookdown::clean_book(TRUE)
bookdown::render_book("index.Rmd", "bookdown::gitbook")
bookdown::render_book("index.Rmd", "bookdown::pdf_book")
bookdown::render_book("index.Rmd", "bookdown::epub_book")
```

Os arquivos gerados ficam na pasta `docs/`.

## Estrutura do repositório

- `index.Rmd` e `01_Intro.Rmd` a `13_Referencias.Rmd`: índice e capítulos do livro;
- `book.bib` e `packages.bib`: referências bibliográficas;
- `_bookdown.yml` e `_output.yml`: configuração da compilação;
- `latex/`: capa e folha de rosto do PDF, ajustes de código e de caracteres;
- `frontmatter/`: ficha técnica das versões HTML e EPUB;
- `capa/capa.R`: gera a imagem da capa a partir do conjunto de Mandelbrot;
- `images/`: figuras usadas no texto;
- `docs/`: site publicado no GitHub Pages, com o PDF e o EPUB.

## Como contribuir

Correções, revisões e novos conteúdos são bem-vindos, por meio de *issues* e *pull requests* neste repositório ou pelo e-mail <hercules.freitas@uerj.br>. Quem contribuir com conteúdo é reconhecido como coautor das seções correspondentes.

## Como citar

Freitas HR. Metodologia científica e Bioestatística [livro eletrônico]. 1. ed. Cabo Frio, RJ: edição do autor; 2026. Disponível em: https://drhrf.github.io/MCBS/.

## Uso de inteligência artificial

Na preparação desta edição, o autor utilizou uma ferramenta de inteligência artificial generativa (Claude, da Anthropic) como apoio à edição de texto, à escrita e à revisão dos códigos em R e Python. Todo o conteúdo foi revisado pelo autor, que é o responsável pelo texto, pelos exemplos, pelos códigos e pelas referências. Os exemplos numéricos e os códigos em R são executados a cada compilação do livro, e os resultados citados no texto são gerados a partir deles. Por ser uma obra de acesso aberto, em permanente aprimoramento, este livro convida leitores, revisores e editores a apontar erros e a propor melhorias, conforme descrito na seção *Como contribuir*.

## Licença

© 2026 Hércules Rezende Freitas. Esta obra está licenciada sob a licença Creative Commons Atribuição 4.0 Internacional ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)). O texto completo está no arquivo [LICENSE](LICENSE).

## Agradecimentos

Agradecemos a todos os colaboradores que dedicam seu tempo e conhecimento para tornar este recurso mais completo e útil para a comunidade científica.
