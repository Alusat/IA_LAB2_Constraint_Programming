;;; ---------------------------------------------------------
;;; prototipobasiquisimo.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology urn_webprotege_ontology_fed57acf-a204-49bd-8589-abdc3b43448e.ttl
;;; :Date 15/05/2025 19:21:28

(defclass Tipo_evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Paises
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Estación
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Menu
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Ingrediente_restricción
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Menu/plato_bebida
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Primero
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Segundo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Postre
        (type INSTANCE)
        (create-accessor read-write))
    (slot Precio
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Es_evento_de_tipo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Ingrediente_restricción
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Ocurre_en_epoca
        (type INSTANCE)
        (create-accessor read-write))
    (slot Cantidad_comensales
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Estilo_comida
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Plato
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Pais_de_procedencia
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Es_de_estilo
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Menu/plato_bebida
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Plato_ingrediente
        (type INSTANCE)
        (create-accessor read-write))
    (slot Precio
        (type SYMBOL)
        (create-accessor read-write))
    (slot Complejo?
        (type SYMBOL)
        (create-accessor read-write))
    (slot Caliente?
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Ingrediente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot Ingrediente_restricción
        (type INSTANCE)
        (create-accessor read-write))
    (multislot Disponible_durante
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Restricciones
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
)

(defclass Bebida
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Precio
        (type SYMBOL)
        (create-accessor read-write))
    (slot Alcohol?
        (type SYMBOL)
        (create-accessor read-write))
)

(definstances instances
    ([Agua] of Bebida
         (Alcohol?  "true")
    )

    ([Carne] of Ingrediente
         (Ingrediente_restricción  [Vegano] [Vegetariano])
    )

    ([Vegano] of Restricciones
    )

    ([Yogurt_La_Fageda] of Plato
         (Precio  2)
    )

    ([Menu_manicomio] of Menu
         (Primero  [Macarrones_tomatico])
         (Postre  [Yogurt_La_Fageda])
         (Precio  7)
    )

    ([Macarrones_tomatico] of Plato
         (Plato_ingrediente  [Carne])
         (Precio  5)
         (Complejo? "false")
         (Caliente? "true")
    )

    ([Ensalada_Cesar] of Plato
        (Plato_ingrediente [Lechuga] [Pollo] [Queso_parmesano] [Pan_tostado])
        (Pais_de_procedencia [Italia] [Estados_Unidos])
        (Es_de_estilo [Mediterraneo])
        (Precio 8)
        (Complejo? "false")
        (Caliente? "false")
    )

    ([Pollo] of Ingrediente
        (Ingrediente_restricción [Vegetariano] [Vegano])
    )

    ([Lechuga] of Ingrediente
        (Disponible_durante [Verano] [Primavera])
    )

    ([Queso_parmesano] of Ingrediente
        (Ingrediente_restricción [Vegano] [Lactosa_intolerante])
    )

    ([Pan_tostado] of Ingrediente
        (Ingrediente_restricción [Celiaco])
    )

    ([Sopa_de_tomate] of Plato
        (Plato_ingrediente [Tomate] [Cebolla] [Ajo])
        (Precio 6)
        (Complejo? "false")
        (Caliente? "true")
    )

    ([Tomate] of Ingrediente
        (Disponible_durante [Verano] [Otoño])
    )

    ([Coca_Cola] of Bebida
        (Alcohol? "false")
        (Precio 3)
    )

    ([Vino_tinto] of Bebida
        (Alcohol? "true")
        (Precio 15)
    )

    ([Vegetariano] of Restricciones
    )

    ([Lactosa_intolerante] of Restricciones
    )

    ([Celiaco] of Restricciones
    )

    ([Italia] of Paises
    )

    ([Estados_Unidos] of Paises
    )

    ([Verano] of Estación
    )

    ([Primavera] of Estación
    )

    ([Otoño] of Estación
    )

    ([Mediterraneo] of Estilo_comida
    )

    
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MODULO MAIN ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmodule MAIN "main"
    (export ?ALL)
)

;para guardar las caracteristicas que tendrá que tener el menú
;se cambiaran segun las preguntas que le hagamos al cliente
(deftemplate MAIN::preferencias-del-cliente
    (multislot restriccionesDeIngredientes (type INSTANCE));restrictivo en cuanto al menú
)

;para cuando se tenga que preguntar de una lista de opciones
(deffunction MAIN::preguntar_lista (?pregunta ?lista ?num)
     (while TRUE do 
        (printout t " (Escoge las opciones que quieras, puedes no responder nada)" crlf)
        (loop-for-count (?i 1 (length$ $?lista)) do
            (printout t "    " ?i "-" (nth$ ?i $?lista) crlf)
        )
        (bind ?linea (readline))
        (bind $?respuestas (explode$ ?linea))
        (bind $?numeros_escogidos (create$))
        (bind ?correct TRUE)
        (loop-for-count (?i 1 (length$ $?respuestas)) do
            (bind ?respuesta (nth$ ?i $?respuestas))
            (if (not (and(>= ?respuesta 1)(<= ?respuesta (length$ $?lista)))) then 
                (bind ?correct FALSE)
                (printout t "El valor " ?respuesta " no es valido" crlf)
            else
                (if (not (member$ ?respuesta $?numeros_escogidos)) then
                    (bind $?numeros_escogidos (insert$ $?numeros_escogidos (+ (length$ $?numeros_escogidos) 1) ?respuesta))
                )
            )
        )
        (if (eq ?correct TRUE) then (return $?numeros_escogidos))
    )
)


;mensaje inicial, redirije a pillar datos
(defrule MAIN::inicio "Regla con la que inicia el programa"
    (declare (salience 80)) ; mucho para que sea primero
	=>
	(printout t crlf "Responde las siguientes preguntas por favor:" crlf)
	(focus obtener_informacion)
)

(defmodule obtener_informacion "pregunta al cliente"
    (import MAIN ?ALL)
    (export ?ALL)
)

;hechos iniciales que nos serviran para hacer las preguntas
(deffacts MAIN::hechos-iniciales
    ;hacemos los facts necesarios para hacer las preguntas
    (preferencias-del-cliente) 
    (setRestricciones)
)

;preguntamos en cuanto a las posibles restricciones
;se muestran todas las posibles y se almacena en el multislot
;restricciones de ingredientes los que se respondan

;USO: responder nada, numero y si se quieren responder varios
;se han de poner todos los numeros en la misma linea
;viendo los facts se puede ver lo que se ha guardado 
;en preferencas del cietne
(defrule obtener_informacion::preguntar_restricciones
    (declare (salience 2))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setRestricciones)
    =>
        (bind $?nombre_todas_las_restricciones (create$))
        (bind $?lista_todas_las_restricciones (find-all-instances ((?restriccion Restricciones)) TRUE))

        (loop-for-count (?i 1 (length$ $?lista_todas_las_restricciones)) do 
            (bind ?j (nth$ ?i $?lista_todas_las_restricciones))
            (bind ?nombre_restriccion (instance-name-to-symbol (instance-name ?j)));el nombre no es un atributo en si, si no el nombre de la instancia
            (bind $?nombre_todas_las_restricciones (insert$ $?nombre_todas_las_restricciones (+ (length$ $?nombre_todas_las_restricciones) 1) ?nombre_restriccion))
        )
        (bind $?numero_restricciones_escogidas (preguntar_lista "Escoge restricciones en los alimentos" $?nombre_todas_las_restricciones 9))
        ;liimte de 9 restricciones, aunque bueno eso no sirve de mucho ahra mismo pero para posteriori cambiarlo para que no se puedan poner
        ;todas las posibles y que no salga anada

        (bind $?restricciones_escogidas (create$))
        (loop-for-count (?i 1 (length$ $?numero_restricciones_escogidas)) do
            (bind ?j (nth$ ?i $?numero_restricciones_escogidas))
            (bind ?restriccion_escogida (nth$ ?j $?lista_todas_las_restricciones))
            (bind $?restricciones_escogidas (insert$ $?restricciones_escogidas (+ (length$ $?restricciones_escogidas) 1) ?restriccion_escogida))
        )
        (modify ?preferencias (restriccionesDeIngredientes $?restricciones_escogidas));guardamos seleccion
    (retract ?fact)
) 

;automatiza la ejecucion, se puede quitar obviamente
(reset)
(run)