;;;====================================================
;;; DEFINICIÓN DE CLASES
;;;====================================================

; Definición de la clase Paises
(defclass Pais (is-a USER)
  (slot nombre (type STRING))
)

; Definición de la clase Estilo_comida
(defclass Estilo_comida (is-a USER)
  (slot nombre (type STRING))
)

; Definición de la clase Restricciones
(defclass Restriccion (is-a USER)
  (slot nombre (type STRING))
)

; Definición de la clase Ingrediente
(defclass Ingrediente (is-a USER)
  (slot nombre (type STRING))
  (multislot disponible_durante (type INSTANCE) (allowed-classes Estacion))
  (multislot restriccion (type INSTANCE) (allowed-classes Restriccion)) ; CAMBIADO: de slot a multislot y eliminado default ?NONE
)

; Definición de la clase Estación
(defclass Estacion (is-a USER)
  (slot nombre (type STRING))
)

; Definición de la clase Plato
(defclass Plato (is-a USER)
  (slot nombre (type STRING))
  (slot precio (type INTEGER))
  (slot caliente (type SYMBOL) (allowed-values TRUE FALSE))
  (slot complejo (type SYMBOL) (allowed-values TRUE FALSE))
  (slot pais_de_procedencia (type INSTANCE) (allowed-classes Pais))
  (slot estilo (type INSTANCE) (allowed-classes Estilo_comida))
  (multislot ingredientes (type INSTANCE) (allowed-classes Ingrediente))
  (slot tipo (type SYMBOL) (allowed-values primero segundo postre))
)

; Definición de la clase Bebida
(defclass Bebida (is-a USER)
  (slot nombre (type STRING))
  (slot precio (type INTEGER))
  (slot alcohol (type SYMBOL) (allowed-values TRUE FALSE))
)

; Definición de la clase Menu
(defclass Menu (is-a USER)
  (slot nombre (type STRING))
  (slot precio (type INTEGER))
  (slot primero (type INSTANCE) (allowed-classes Plato))
  (slot segundo (type INSTANCE) (allowed-classes Plato))
  (slot postre (type INSTANCE) (allowed-classes Plato))
  (multislot bebidas (type INSTANCE) (allowed-classes Bebida))
)

; Definición de la clase Tipo_evento
(defclass Tipo_evento (is-a USER)
  (slot nombre (type STRING))
)

; Definición de la clase Evento
(defclass Evento (is-a USER)
  (slot nombre (type STRING))
  (slot cantidad_comensales (type INTEGER))
  (slot tipo_evento (type INSTANCE) (allowed-classes Tipo_evento))
  (multislot ocurre_en_epoca (type INSTANCE) (allowed-classes Estacion))
  (multislot restricciones (type INSTANCE) (allowed-classes Restriccion))
)

;;;====================================================
;;; FUNCIONES AUXILIARES
;;;====================================================

; Función para verificar si un plato es vegano
(deffunction plato-es-vegano (?plato)
   (bind ?ingredientes (send ?plato get-ingredientes))
   (bind ?es-vegano TRUE)
   
   (foreach ?ingrediente ?ingredientes
      (bind ?restricciones (send ?ingrediente get-restriccion)) ; CAMBIADO: ahora es plural
      (foreach ?restriccion ?restricciones                   ; AÑADIDO: iteramos sobre todas las restricciones
         (if (eq (send ?restriccion get-nombre) "Vegano")
            then (bind ?es-vegano FALSE))
      )
   )
   
   (return ?es-vegano)
)

;;;====================================================
;;; REGLAS
;;;====================================================

; Regla para imprimir platos veganos
(defrule imprimir-platos-veganos
   (initial-fact)
   =>
   (printout t "===== PLATOS VEGANOS =====" crlf)
   (do-for-all-instances ((?p Plato)) (plato-es-vegano ?p)
      (printout t "Plato vegano: " (send ?p get-nombre) 
                " - País: " (send (send ?p get-pais_de_procedencia) get-nombre)
                " - Tipo: " (send ?p get-tipo) crlf)
   )
   (printout t crlf)
)

; Regla para imprimir bebidas con alcohol
(defrule imprimir-bebidas-con-alcohol
   (initial-fact)
   =>
   (printout t "===== BEBIDAS CON ALCOHOL =====" crlf)
   (do-for-all-instances ((?b Bebida)) (eq (send ?b get-alcohol) TRUE)
      (printout t "Bebida con alcohol: " (send ?b get-nombre) 
                " - Precio: " (send ?b get-precio) "€" crlf)
   )
   (printout t crlf)
)

;;;====================================================
;;; INICIALIZACIÓN DE HECHOS
;;;====================================================

(definstances hechos-iniciales

   ; Restricciones alimentarias
   (vegano of Restriccion (nombre "Vegano"))
   (vegetariano of Restriccion (nombre "Vegetariano"))
   (sin_gluten of Restriccion (nombre "Sin gluten"))
   (sin_lactosa of Restriccion (nombre "Sin lactosa"))
   
   ; Estaciones
   (primavera of Estacion (nombre "Primavera"))
   (verano of Estacion (nombre "Verano"))
   (otono of Estacion (nombre "Otoño"))
   (invierno of Estacion (nombre "Invierno"))
   
   ; Países
   (espana of Pais (nombre "España"))
   (italia of Pais (nombre "Italia"))
   (francia of Pais (nombre "Francia"))
   (mexico of Pais (nombre "México"))
   (japon of Pais (nombre "Japón"))
   (china of Pais (nombre "China"))
   (india of Pais (nombre "India"))
   
   ; Estilos de comida
   (mediterranea of Estilo_comida (nombre "Mediterránea"))
   (asiatica of Estilo_comida (nombre "Asiática"))
   (americana of Estilo_comida (nombre "Americana"))
   (fusion of Estilo_comida (nombre "Fusión"))
   (tradicional of Estilo_comida (nombre "Tradicional"))
   
   ; Ingredientes
   (tomate of Ingrediente (nombre "Tomate") (disponible_durante [primavera] [verano]))
   (carne of Ingrediente (nombre "Carne") (restriccion [vegano]))
   (pasta of Ingrediente (nombre "Pasta") (restriccion [sin_gluten]))
   (leche of Ingrediente (nombre "Leche") (restriccion [vegano] [sin_lactosa]))
   (arroz of Ingrediente (nombre "Arroz"))
   (soja of Ingrediente (nombre "Soja"))
   (queso of Ingrediente (nombre "Queso") (restriccion [vegano] [sin_lactosa]))
   (pescado of Ingrediente (nombre "Pescado") (restriccion [vegano] [vegetariano]))
   (legumbres of Ingrediente (nombre "Legumbres"))
   (patata of Ingrediente (nombre "Patata"))
   (yogurt of Ingrediente (nombre "Yogurt") (restriccion [vegano] [sin_lactosa]))
   (verduras of Ingrediente (nombre "Verduras"))
   (huevo of Ingrediente (nombre "Huevo") (restriccion [vegano]))
   (frutas of Ingrediente (nombre "Frutas"))
   
   ; Platos
   (macarrones_tomatico of Plato
      (nombre "Macarrones con tomate")
      (precio 5)
      (caliente TRUE)
      (complejo FALSE)
      (pais_de_procedencia [italia])
      (estilo [mediterranea])
      (ingredientes [pasta] [tomate])
      (tipo primero)
   )
   
   (yogurt_fageda of Plato
      (nombre "Yogurt La Fageda")
      (precio 2)
      (caliente FALSE)
      (complejo FALSE)
      (pais_de_procedencia [espana])
      (estilo [tradicional])
      (ingredientes [yogurt])
      (tipo postre)
   )
   
   (paella of Plato
      (nombre "Paella valenciana")
      (precio 15)
      (caliente TRUE)
      (complejo TRUE)
      (pais_de_procedencia [espana])
      (estilo [mediterranea])
      (ingredientes [arroz] [pescado] [verduras])
      (tipo segundo)
   )
   
   (risotto_verduras of Plato
      (nombre "Risotto de verduras")
      (precio 12)
      (caliente TRUE)
      (complejo TRUE)
      (pais_de_procedencia [italia])
      (estilo [mediterranea])
      (ingredientes [arroz] [verduras])
      (tipo segundo)
   )
   
   (ensalada_tomate of Plato
      (nombre "Ensalada de tomate")
      (precio 7)
      (caliente FALSE)
      (complejo FALSE)
      (pais_de_procedencia [espana])
      (estilo [mediterranea])
      (ingredientes [tomate] [verduras])
      (tipo primero)
   )
   
   (lentejas of Plato
      (nombre "Lentejas estofadas")
      (precio 8)
      (caliente TRUE)
      (complejo FALSE)
      (pais_de_procedencia [espana])
      (estilo [tradicional])
      (ingredientes [legumbres] [verduras])
      (tipo primero)
   )
   
   (tofu_verduras of Plato
      (nombre "Tofu con verduras")
      (precio 10)
      (caliente TRUE)
      (complejo FALSE)
      (pais_de_procedencia [china])
      (estilo [asiatica])
      (ingredientes [soja] [verduras])
      (tipo segundo)
   )
   
   (macedonia of Plato
      (nombre "Macedonia de frutas")
      (precio 6)
      (caliente FALSE)
      (complejo FALSE)
      (pais_de_procedencia [francia])
      (estilo [tradicional])
      (ingredientes [frutas])
      (tipo postre)
   )
   
   ; Bebidas
   (agua of Bebida
      (nombre "Agua mineral")
      (precio 1)
      (alcohol FALSE)
   )
   
   (vino_tinto of Bebida
      (nombre "Vino tinto")
      (precio 3)
      (alcohol TRUE)
   )
   
   (cerveza of Bebida
      (nombre "Cerveza")
      (precio 2)
      (alcohol TRUE)
   )
   
   (refresco of Bebida
      (nombre "Refresco")
      (precio 2)
      (alcohol FALSE)
   )
   
   (zumo of Bebida
      (nombre "Zumo de naranja")
      (precio 2)
      (alcohol FALSE)
   )
   
   (sake of Bebida
      (nombre "Sake")
      (precio 4)
      (alcohol TRUE)
   )
   
   ; Menús
   (menu_manicomio of Menu
      (nombre "Menú del manicomio")
      (precio 7)
      (primero [macarrones_tomatico])
      (postre [yogurt_fageda])
   )
   
   (menu_completo of Menu
      (nombre "Menú completo")
      (precio 20)
      (primero [ensalada_tomate])
      (segundo [paella])
      (postre [macedonia])
      (bebidas [agua] [vino_tinto])
   )
   
   (menu_vegano of Menu
      (nombre "Menú vegano")
      (precio 18)
      (primero [lentejas])
      (segundo [tofu_verduras])
      (postre [macedonia])
      (bebidas [agua] [zumo])
   )
)

;;;====================================================
;;; EJECUCIÓN DEL PROGRAMA
;;;====================================================

; Ejecutar el programa
(reset)
(run)