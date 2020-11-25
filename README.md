# Ranking mundial de la felicidad

### ¿Qué es el informe sobre Felicidad Mundial?

El Informe sobre la Felicidad Mundial es un estudio histórico en el que se clasifican 155 países por sus niveles de felicidad. Se dio a conocer en las Naciones Unidas en un acto de celebración del Día Internacional de la Felicidad el 20 de marzo.

El informe sigue ganando reconocimiento mundial a medida que los gobiernos, las organizaciones y la sociedad civil utilizan cada vez más los indicadores de felicidad para fundamentar sus decisiones de política. Destacados expertos en diversos campos - economía, psicología, análisis de encuestas, estadísticas nacionales, salud, política pública y otros - describen cómo las mediciones del bienestar pueden utilizarse eficazmente para evaluar el progreso de las naciones. Los informes examinan el estado de la felicidad en el mundo actual y muestran cómo la nueva ciencia de la felicidad explica las variaciones personales y nacionales de la felicidad.

### ¿Cómo se puntúan los países?

Los puntajes y clasificaciones de felicidad utilizan datos de la Encuesta Mundial de Gallup. Las puntuaciones se basan en las respuestas a la principal pregunta de evaluación de la vida hecha en la encuesta. Esta pregunta, conocida como la escalera Cantril, pide a los encuestados que piensen en una escalera en la que la mejor vida posible para ellos sea un 10 y la peor vida posible sea un 0 y que califiquen sus propias vidas actuales en esa escala. Las puntuaciones proceden de muestras representativas a nivel nacional y utilizan los pesos de Gallup para que las estimaciones sean representativas.

### ¿Qué significa cada variable del estudio?

- **PIB per cápita:** Es un indicador macroeconómico de productividad y desarrollo económico, usado para entregar una visión respecto al rendimiento de las condiciones económicas y sociales de un país.

- **Asistencia social:** Se refiere al apoyo social que tienen las personas sobre su familia o amigos en momentos de adversidad o crisis.

- **Libertades:** Entendemos libertades como todos los derechos propios de un estado libre y democrático, ya sea por la configuración de un estado no autoritario y diversos derechos sobre la ciudadanía.

- **Esperanza de vida:** Cuanto se estima que viva una persona en el momento de su nacimiento si este sigue una vida sana.

- **Percepción de corrupción:** El Índice de Percepción de la Corrupción (IPC) es un índice publicado anualmente por Transparencia Internacional desde 1995 que clasifica a los países “según sus niveles percibidos de corrupción en el sector público, determinados por evaluaciones de expertos y encuestas de opinión”.

- **Generosidad:** Propiamente tratada como la cualidad de ser generoso y amable con los demás.

A raíz de este estudio y sus resultados, vamos a usar R para realizar un análisis completo de los ratios usados para puntuar a cada país para el año 2019, veremos que ranking tiene cada país, que relación existen entre las variables usadas. **¿Qué determinará que un país sea más feliz que otro? ¿Podrán las variables escogidas explicar que hace que un país sea más feliz que otro y por tanto en última instancia, saber que indicadores macroeconómicos y sociales mejorar? Todo esto lo veremos en este estudio.**

## EDA y visualizaciones

El enfoque de este pequeño estudio consiste en una exploración de la base de datos para el año 2019, esto incluye un limpiado inicial de datos (focalizado en el tipo de datos y valores nulos), un análisis de la distribución de las variables, así como la correlación entre ellas, y finalmente visualizaciones para un entendimiento inicial.

Esto lo podras encontrar en el archivo **happiness_ranking.Rmd**

La distribución de probabilidad de nuestras variables es muy importante para conocer cómo se comportan dichas variables y cuál es su distribución, si se ajusta a una normal, polinómica, logarítmica, etc.

![Captura](https://user-images.githubusercontent.com/54073772/98517654-8d760100-226e-11eb-88ef-4aa92eb83076.PNG)


**¿Existe relación entre la felicidad y el PIB per cápita?** A priori, un país con un PIB per cápita mayor debería mostrar un mayor nivel de calidad de vida (social-económico), por lo que tendría sentido que existiera una fuerte relación entre felicidad y PIB. 

Y si observamos la gráfica, ¡Así es! Los países del norte de Europa, con las cifras mayores de PIB per cápita son más felices, ocurriendo justo lo contrario en los paises de Africa sub-sahariana. Dentro del archivo o mediante el enlance a Rpubs podemos interactuar con el gráfico https://rpubs.com/JLCC/hapiness_ranking

Claro que el indicador de felicidad puede venir relacionado con una gran de cantidad de variable. El gráfico de correlaciones así nos lo muestra:

![ScreenRecorderProject2](https://user-images.githubusercontent.com/54073772/100219419-45193d00-2f16-11eb-87ff-291cd96cf95e.gif)




