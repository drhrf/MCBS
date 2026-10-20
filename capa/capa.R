# Capa do livro "Metodologia científica e Bioestatística"
# Fractal de Mandelbrot com coloração cíclica (faixas repetitivas).
# Execute a partir da pasta do projeto: source("capa/capa.R")
# Gera images/MCBS_capa.png (proporção A4, 1654 x 2339 pixels, 200 dpi).

largura <- 1654
altura  <- 2339
max_iter <- 600

# Região do conjunto de Mandelbrot ("vale dos cavalos-marinhos")
centro <- complex(real = -0.7453, imaginary = 0.1127)
meia_largura <- 0.004
meia_altura  <- meia_largura * altura / largura

re <- seq(Re(centro) - meia_largura, Re(centro) + meia_largura, length.out = largura)
im <- seq(Im(centro) + meia_altura,  Im(centro) - meia_altura,  length.out = altura)
c_grid <- outer(im * 1i, re, "+")          # matriz altura x largura de números complexos

z <- matrix(0 + 0i, altura, largura)
iter <- matrix(NA_real_, altura, largura)   # iteração de escape (suavizada)
ativo <- matrix(TRUE, altura, largura)
for (k in seq_len(max_iter)) {
  z[ativo] <- z[ativo]^2 + c_grid[ativo]
  escapou <- ativo & (Mod(z) > 4)
  # contagem suavizada (normalized iteration count), evita faixas serrilhadas
  iter[escapou] <- k + 1 - log(log(Mod(z[escapou]))) / log(2)
  ativo[escapou] <- FALSE
  if (!any(ativo)) break
}

# Coloração cíclica: a paleta se repete ao longo do número de iterações
paleta <- grDevices::colorRampPalette(c("#1B0C41", "#4A0C6B", "#A52C60", "#ED6925",
                                        "#FBB61A", "#F2F27D", "#5DC863", "#21908C",
                                        "#3B528B", "#1B0C41"))(256)
ciclo <- 24                                  # iterações por volta completa da paleta
indice <- floor(((iter %% ciclo) / ciclo) * 255) + 1
cores <- matrix(paleta[indice], altura, largura)
cores[is.na(iter)] <- "#0B0B12"              # pontos do conjunto: quase preto

png("images/MCBS_capa.png", width = largura, height = altura, res = 200)
par(mar = c(0, 0, 0, 0))
plot.new()
plot.window(xlim = c(0, 1), ylim = c(0, 1), xaxs = "i", yaxs = "i")
rasterImage(as.raster(cores), 0, 0, 1, 1, interpolate = FALSE)

# Faixa para o título
rect(0, 0.70, 1, 0.92, col = grDevices::adjustcolor("#0B0B12", alpha.f = 0.78), border = NA)
text(0.5, 0.855, "Metodologia científica", col = "white", cex = 3.3, font = 2)
text(0.5, 0.785, "e Bioestatística", col = "white", cex = 3.3, font = 2)
segments(0.30, 0.735, 0.70, 0.735, col = "#FBB61A", lwd = 4)

# Faixa para autor e edição
rect(0, 0.04, 1, 0.15, col = grDevices::adjustcolor("#0B0B12", alpha.f = 0.78), border = NA)
text(0.5, 0.115, "Hércules Rezende Freitas", col = "white", cex = 2.1, font = 2)
text(0.5, 0.068, "1ª edição  ·  Cabo Frio, RJ  ·  2026", col = "white", cex = 1.4)
dev.off()
