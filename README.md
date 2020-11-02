# Ranking mundial de la felicidad

El Informe sobre la Felicidad Mundial es un estudio histórico en el que se clasifican 155 países por sus niveles de felicidad. Se dio a conocer en las Naciones Unidas en un acto de celebración del Día Internacional de la Felicidad el 20 de marzo.

El informe sigue ganando reconocimiento mundial a medida que los gobiernos, las organizaciones y la sociedad civil utilizan cada vez más los indicadores de felicidad para fundamentar sus decisiones de política. Destacados expertos en diversos campos - economía, psicología, análisis de encuestas, estadísticas nacionales, salud, política pública y otros - describen cómo las mediciones del bienestar pueden utilizarse eficazmente para evaluar el progreso de las naciones. Los informes examinan el estado de la felicidad en el mundo actual y muestran cómo la nueva ciencia de la felicidad explica las variaciones personales y nacionales de la felicidad.

La base de datos ha sido extraída de Kaggle, utilizando la base de datos de Gallup World Poll. Las puntuaciones proceden de muestras representativas a nivel nacional y utilizan los pesos de Gallup para que las estimaciones sean representativas. Las diferentes variables utilizadas usan estos pesos. Para más información sobre la base de datos y el estudio puede consultar el siguiente enlace https://www.kaggle.com/unsdsn/world-happiness

A raíz de este estudio y sus resultados, vamos a usar R para realizar un análisis completo de los ratios usados para puntuar a cada país, veremos que ranking tiene cada país, que relación existen entre las variables usadas y realizaremos predicciones sobre la puntuación dada a cada país, esto significará comparar varios modelos para ver cual nos arroja una mejor estimación.

## EDA y visualizaciones

En esta primera parte vamos a centrarnos en explorar la base de datos, esto incluye un limpiado inicial de datos (focalizado en el tipo de datos y valores nulos), un análisis de la distribución de las variables, así como la correlación entre ellas, y finalmente visualizaciones para un entendimiento inicial.

Esto lo podras encontrar en el archivo 1.EDA.Rmd

¿Existe relación entre la felicidad y el PIB per cápita? A priori, un país con un PIB per cápita mayor debería mostrar un mayor nivel de calidad de vida (social-económico), por lo que tendría sentido que existiera una fuerte relación entre felicidad y PIB. Y si observamos la gráfica, ¡Así es! Los países del norte de Europa, con las cifras mayores de PIB per cápita son más felices, ocurriendo justo lo contrario en los paises de Africa sub-sahariana. Dentro del archivo o mediante el enlance a Rpubs podemos interactuar con el gráfico {INSERTAR ENLANCE GITHUB}

Claro que el indicador de felicidad puede venir relacionado con una gran de cantidad de variable. El gráfico de correlaciones así nos lo muestra:
{INSERTAR CORRELACIONES ENTRE LAS VARIABLES}



{EN PROGRESO}
