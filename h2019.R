# Carga de los paquetes necesarios

library(tidyverse)
library(dlookr)
library(DataExplorer)
library(hrbrthemes)
library(plyr)
library(knitr)
library(plotly)
library(gapminder)
library(GGally)
library(reactable)

# Cargamos la base de datos

data <- read.csv("C:/Users/Jose/Desktop/proyectos/felicidad_mundial/Datos/data.csv", header = TRUE)


# Realizamos un análisis exploratorio inicial


colnames(data) <- c("pais","region","ranking","puntuacion","PIB",
                     "libertades","esperanza_vida","asistencia_social",
                     "percepcion_corrupcion","generosidad")


# Juntamos algunas regiones para facilidad la compresión

data$region <- factor(with(data, 
                            replace(region, 
                                    region %in% c("Southeastern Asia", "Southern Asia", "Eastern Asia"),
                                    "East and North Asia") ) ) 

data$region <- as.character(data$region)
data$region <- factor(with(data, 
                            replace(region, 
                                    region %in% c("Latin America and Caribbean", "North America"),
                                    "North and Latin America") ) ) 


# Vemos si existe algún valor nulo
plot_missing(
  data    = data, 
  title   = "Porcentaje de valores nulos",
  ggtheme = theme_bw(),
  theme_config = list(legend.position = "none")
)

# Vemos la distribución de probabilidad de las variables predictoras

plot_density(
  data    = data %>% select(-c("ranking")),
  ncol    = 2,
  title   = "Distribución variables predictoras",
  ggtheme = theme_bw(),
  theme_config = list(
    plot.title = element_text(size = 14, face = "bold"),
    strip.text = element_text(colour = "black", size = 12, face = 2)
  )
)



# Realizamos el test de shapiro para comprobar la normalidad de las variables

numeric <- select(data, -c("pais","region","ranking"))
st<-Map(function(x)cbind(shapiro.test(x)$statistic,shapiro.test(x)$p.value),numeric)
myout<-ldply(st)
names(myout)<-c("var","W","p.value")
kable(myout)



# Vemos la correlación de las variables

plot_correlation(
  data = data %>% select(-c("ranking")),
  type = "continuous",
  title = "Matriz de correlación variables predictoras",
  theme_config = list(legend.position = "none",
                      plot.title = element_text(size = 12, face = "bold"),
                      axis.title = element_blank(),
                      axis.text.x = element_text(angle = -45, hjust = +0.1)
  )
)



# El usurio puede explorar los datos mediante la siguiente tabla


reac <- data %>%
  select(-c(percepcion_corrupcion,generosidad)) 

reactable(reac, groupBy = "region", searchable = TRUE, 
      columns = list(
            pais = colDef(name = "País", align = "center"),
            region = colDef(name = "Región", align = "center"),
            ranking = colDef(name = "Ranking", align = "center"),
            puntuacion = colDef(name = "Puntuación", align = "center", aggregate = "mean",
                                format = colFormat(digits = 1)),
            PIB = colDef(name = "PIB", align = "center", aggregate = "mean",
                                format = colFormat(digits = 1)),
            asistencia_social = colDef(name = "Asistencia Social", align = "center", aggregate = "mean",
                         format = colFormat(digits = 1)),
            esperanza_vida = colDef(name = "Esperanza de vida", align = "center", aggregate = "mean",
                                format = colFormat(digits = 1)),
            libertades = colDef(name = "Libertades", align = "center", aggregate = "mean",
                                format = colFormat(digits = 1))

))






# Vamos ahora a comparar las diversas variables y ver como se comportan 


sub <- data %>%
  filter(region %in% c("Western Europe", "North and Latin America", "Sub-Saharan Africa"))

sub$region <- revalue(sub$region, c("Western Europe"="W.E", "Sub-Saharan Africa"="Saha.A",
                      "North and Latin America" = "America"))

ggpairs(sub, lower = list(continuous = "smooth"), 
        mapping = aes(color = region), columns = c("puntuacion","PIB","libertades","asistencia_social",
                                                        "region")) +
  
        theme(plot.title = element_text(size = 18, face = "bold"),
           axis.title = element_text(size = 10) 
             
        
)



# Un indicador economico fundamental para ver la progresión de un país es el PIB,
# comparamos el pib con puntuación para ver la tendencia


p <- data %>%
  
  mutate(text = paste("PIB: ", PIB, "\nPuntuación: ", puntuacion, 
                      "\nRegión: ", region, "\nPaís: ", pais, sep = "")) %>%
  
  ggplot( aes(PIB, puntuacion, size = puntuacion, shape = region, color = region, text = text)) +
  geom_point(alpha = 0.7, size = 3) +
  scale_shape_manual(values=c(19,15,3,17,13,18,8)) +
  theme_ipsum() +
  labs(title = "Relación PIB y Felicidad", x = "PIB per cápita", y = "Puntuación") +
  theme(legend.title = element_blank())
  

set.seed(111)
ggplotly(p, tooltip="text")





p2 <- data %>%
  
  mutate(text = paste("Asistencia social: ", asistencia_social, "\nPuntuación: ", puntuacion, 
                      "\nRegión: ", region, "\nPaís: ", pais, sep = "")) %>%
  
  ggplot(aes(asistencia_social,puntuacion,size = puntuacion,shape = region,color = region,text = text)) +
  geom_point(alpha = 0.7, size = 3) +
  scale_shape_manual(values=c(19,15,3,17,13,18,8)) +
  theme_ipsum() +
  labs(title = "Relación PIB y Asistencia social", x = "Asistencia social", y = "Puntuación") +
  theme(legend.title = element_blank())


set.seed(111)
ggplotly(p2, tooltip="text")











# ESTOS SON ALGUNOS EJEMPLOS QUE NO TIENEN QUE VER CON EL TRABAJO PRINCIPAL
        

# Para cargar todos los años y crear una lista con los paises comunes en todos los años:
        
d2015 <- read.csv("C:/Users/Jose/Desktop/proyectos/felicidad_mundial/Datos/2015.csv", header = TRUE)
d2016 <- read.csv("C:/Users/Jose/Desktop/proyectos/felicidad_mundial/Datos/2016.csv", header = TRUE)
d2017 <- read.csv("C:/Users/Jose/Desktop/proyectos/felicidad_mundial/Datos/2017.csv", header = TRUE)
d2018 <- read.csv("C:/Users/Jose/Desktop/proyectos/felicidad_mundial/Datos/2018.csv", header = TRUE)
d2019 <- read.csv("C:/Users/Jose/Desktop/proyectos/felicidad_mundial/Datos/2019.csv", header = TRUE)



list <- Reduce(intersect, list(d2015$Country,d2016$Country,d2017$Country,
                               d2018$Country.or.region,d2019$Country.or.region))

# Cargar los datos con los paises comunes

common_2015 <- d2015 %>%
                  filter(Country %in% list)

common_2016 <- d2016 %>%
                  filter(Country %in% list)

common_2017 <- d2017 %>%
                  filter(Country %in% list)

common_2018 <- d2018 %>%
                  filter(Country.or.region %in% list)

common_2019 <- d2019 %>%
                  filter(Country.or.region %in% list)


esquisse::esquisser()







