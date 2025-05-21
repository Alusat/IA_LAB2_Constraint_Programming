;;; ---------------------------------------------------------
;;; Corrected prototipobasiquisimo.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology urn_webprotege_ontology_fed57acf-a204-49bd-8589-abdc3b43448e.ttl

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
    (slot Posicion_menu
        (type INTEGER)
        (range 1 3)
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

;clase extra para irse guardando los platos candidatos a estar en menú
(defclass Plato_candidato
    (is-a USER)
    (role concrete)
    (slot plato
        (type INSTANCE)
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
         (Posicion_menu 3)
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
         (Posicion_menu 2)
    )

    ([Ensalada_Cesar] of Plato
        (Plato_ingrediente [Lechuga] [Pollo] [Queso_parmesano] [Pan_tostado])
        (Pais_de_procedencia [Italia] [Estados_Unidos])
        (Es_de_estilo [Mediterraneo])
        (Precio 8)
        (Complejo? "false")
        (Caliente? "false")
        (Posicion_menu 1)
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
        (Posicion_menu 1)
    )

    ([Tomate] of Ingrediente
        (Disponible_durante [Verano] [Otoño])
    )

    ([Cebolla] of Ingrediente
    )

    ([Ajo] of Ingrediente
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

(deftemplate MAIN::posiblesBebidas
    (multislot bebidas (type INSTANCE))
)

(deftemplate MAIN::menus_resultado
    (multislot menus_elegidos (type INSTANCE));
)

(deftemplate MAIN::instancias_plato_hecha ;para no repetir
    (slot plato (type INSTANCE))
)

(deftemplate MAIN::bebida_considerada
    (slot bebida (type INSTANCE))
)

(deftemplate MAIN::combinacionMenu
    (slot primero (type INSTANCE))
    (slot segundo (type INSTANCE))
    (slot postre (type INSTANCE))
)

(deftemplate MAIN::combinacionMenuCompatible
    (slot primero (type INSTANCE))
    (slot segundo (type INSTANCE))
    (slot postre (type INSTANCE))
)

(deftemplate MAIN::menuCorrecto
    (slot primero (type INSTANCE))
    (slot segundo (type INSTANCE))
    (slot postre (type INSTANCE))
    (slot bebida (type INSTANCE))
)

;para cuando se tenga que preguntar de una lista de opciones
(deffunction MAIN::preguntar_lista (?pregunta ?lista ?num)
     (while TRUE do
        (printout t ?pregunta crlf)
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

(defmodule tratar_informacion "cocina cosas con la informacion recibida"
    (import MAIN ?ALL)
    (import obtener_informacion deftemplate ?ALL)
    (export ?ALL)
)

(defmodule generar_menu "finamente genera un menu en base a los datos tratados"
    (import MAIN ?ALL)
    (import obtener_informacion deftemplate ?ALL)
    (export ?ALL)
)

(defmodule mostrar_soluciones "muestra el resultado"
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
(defrule obtener_informacion::preguntar_restricciones
    (declare (salience 2))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setRestricciones)
    =>
        (bind $?nombre_todas_las_restricciones (create$))
        (bind $?lista_todas_las_restricciones (find-all-instances ((?restriccion Restricciones)) TRUE))

        (loop-for-count (?i 1 (length$ $?lista_todas_las_restricciones)) do
            (bind ?j (nth$ ?i $?lista_todas_las_restricciones))
            (bind ?nombre_restriccion (instance-name-to-symbol (instance-name ?j)))
            (bind $?nombre_todas_las_restricciones (insert$ $?nombre_todas_las_restricciones (+ (length$ $?nombre_todas_las_restricciones) 1) ?nombre_restriccion))
        )
        (bind $?numero_restricciones_escogidas (preguntar_lista "Escoge restricciones en los alimentos" $?nombre_todas_las_restricciones 0))   

        (bind $?restricciones_escogidas (create$))
        (loop-for-count (?i 1 (length$ $?numero_restricciones_escogidas)) do
            (bind ?j (nth$ ?i $?numero_restricciones_escogidas))
            (bind ?restriccion_escogida (nth$ ?j $?lista_todas_las_restricciones))
            (bind $?restricciones_escogidas (insert$ $?restricciones_escogidas (+ (length$ $?restricciones_escogidas) 1) ?restriccion_escogida))
        )
        (modify ?preferencias (restriccionesDeIngredientes $?restricciones_escogidas))
    (retract ?fact)
    (focus tratar_informacion)
)

(defrule tratar_informacion::podar_platos "Hace instancias de los platos que cumplen las preferencias del ciente"
    (preferencias-del-cliente (restriccionesDeIngredientes $?restriccionesDeIngredientes))
    ?plato <- (object (is-a Plato))
    (not (instancias_plato_hecha (plato ?plato))) ;para que no vuelva a ejecutarse
        =>
    (bind ?cumple_condiciones TRUE)

    ; Obtener ingredientes del plato
    (bind $?ingredientes_plato (send ?plato get-Plato_ingrediente))
    ; Para cada ingrediente, verificar sus restricciones
    (progn$ (?ingrediente $?ingredientes_plato)
        (bind $?restricciones_ingrediente (send ?ingrediente get-Ingrediente_restricción))
        ; Verificar si alguna restricción del ingrediente está en las restricciones del cliente
        (progn$ (?restriccion $?restricciones_ingrediente)
            (if (member$ ?restriccion $?restriccionesDeIngredientes) then
                (bind ?cumple_condiciones FALSE)
                (break)
            )
        )
        (if (eq ?cumple_condiciones FALSE) then (break))
    )

    (if (eq ?cumple_condiciones TRUE) then
        (make-instance (gensym) of Plato_candidato (plato ?plato))
    )

    (assert (instancias_plato_hecha (plato ?plato)))
    (focus generar_menu)
)

(defrule generar_menu::inicializar "Inicializamos estructura para guardar el resultado"
    (declare (salience 20)) ;retocar la prio cuando hayan mas cosas para que cuadre
    =>
    (printout t "Creando menus..." crlf)
    (bind ?bebidas (create$))
    (assert (posiblesBebidas (bebidas ?bebidas)))
)

(defrule generar_menu::crear_lista_bebidas "creamos lista con posibles bebidas"
    (declare (salience 15));retocar la prio cuando hayan mas cosas para que cuadre
    ?bebida_candidata <- (object (is-a Bebida)(Alcohol? ?esAlcholica))
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    (not (bebida_considerada (bebida ?bebida_candidata))) ;para no repetir
    =>
    (bind $?bebidas (insert$ $?bebidas (+ (length$ $?bebidas) 1) ?bebida_candidata))
    (modify ?lista_bebidas_candidatas(bebidas $?bebidas))
    (assert (bebida_considerada (bebida ?bebida_candidata)))
)

;generamos las posibles combinaciones de platos y bebidas
(defrule generar_menu::crear_combinaciones "Generamos las posibles combinaciones de platos y bebidas"
    (declare (salience 10));retocar la prio cuando hayan mas cosas para que cuadre
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    =>
    (bind $?platos (find-all-instances ((?inst Plato_candidato)) TRUE))
    (printout t "Tenemos " (length$ $?platos) " platos adecuados" crlf)
    (printout t "Tenemos " (length$ $?bebidas) " bebidas adecuadas" crlf)
    (progn$ (?primero $?platos)
        (if (eq 1 (send (send ?primero get-plato) get-Posicion_menu)) then
            (progn$ (?segundo $?platos)
                (if (eq 2 (send (send ?segundo get-plato) get-Posicion_menu)) then
                    (progn$ (?postre $?platos)
                        (if (eq 3 (send (send ?postre get-plato) get-Posicion_menu)) then
                            (assert (combinacionMenu (primero ?primero) (segundo ?segundo) (postre ?postre)))
                        )
                    )
                )
            )
        )
    )
)

(defrule generar_menu::comprovar_incompatibilidades "Comprueba las incompatibilidades de los platos"
    (declare (salience 9))
    ?fact <- (combinacionMenu (primero ?primero) (segundo ?segundo) (postre ?postre))
    =>
    ;para cada uno de los componentes del menú mirar si son incompatibles con alguno de los demás
    (assert (combinacionMenuCompatible (primero ?primero) (segundo ?segundo) (postre ?postre)))
    (retract ?fact);tanto si si como si no borramos la combinacion que acabamos de mirar
)

(defrule generar_menu::comprovar_bebidas "Para cada bebida miramos si es compatible con todos los elementos de un menú" 
    (declare (salience 8))
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    ?fact <- (combinacionMenuCompatible (primero ?primero) (segundo ?segundo) (postre ?postre))
    =>
    (progn$ (?bebida $?bebidas)
        (assert (menuCorrecto (primero ?primero) (segundo ?segundo) (postre ?postre) (bebida ?bebida)))
    )
    (retract ?fact)
)

(defrule generar_menu::comprovar_precio "Comprovamos que se cumpla la restriccion de precio"
    (declare (salience 7))
    ?fact <- (menuCorrecto (primero ?primero) (segundo ?segundo) (postre ?postre) (bebida ?bebida))
    =>
    (bind ?precio_primero (send (send ?primero get-plato) get-Precio))
    (bind ?precio_segundo (send (send ?segundo get-plato) get-Precio))
    (bind ?precio_postre (send (send ?postre get-plato) get-Precio))
    (bind ?precio_bebida (send ?bebida get-Precio))
    
    (bind ?precioTotal (+ ?precio_primero (+ ?precio_segundo (+ ?precio_postre ?precio_bebida))))
    
    (make-instance (gensym) of Menu 
        (Primero (send ?primero get-plato))
        (Segundo (send ?segundo get-plato))
        (Postre (send ?postre get-plato))
        (Precio ?precioTotal))

    (retract ?fact)
)

(defrule generar_menu::finalizar "Hemos acabado, cambiamos a modulo mostrar menus"
    (declare (salience 1)) ;lo ultimo que se hace
    =>
    (focus mostrar_soluciones)
)

(defrule mostrar_soluciones::imprimir_menus "Imprime las soluciones encontradas"
    =>
    (printout t "Los menus resultantes son los siguientes:" crlf)

    (bind $?todos_los_menus (find-all-instances ((?menu Menu)) TRUE))

    (loop-for-count (?i 1 (length$ $?todos_los_menus)) do
        (bind ?menu_actual (nth$ ?i $?todos_los_menus))

        (bind $?primeros (send ?menu_actual get-Primero))
        (bind $?segundos (send ?menu_actual get-Segundo))
        (bind $?postres (send ?menu_actual get-Postre))
        (bind ?precio (send ?menu_actual get-Precio))

        (printout t crlf "--- MENU " ?i " ---" crlf)

        (if (> (length$ $?primeros) 0) then
            (bind ?plato_primero (nth$ 1 $?primeros))
            (printout t "Primero: " (instance-name ?plato_primero) crlf)
        )

        (if (> (length$ $?segundos) 0) then
            (bind ?plato_segundo (nth$ 1 $?segundos))
            (printout t "Segundo: " (instance-name ?plato_segundo) crlf)
        )

        (if (> (length$ $?postres) 0) then
            (bind ?plato_postre (nth$ 1 $?postres))
            (printout t "Postre: " (instance-name ?plato_postre) crlf)
        )

        (printout t "Precio: " ?precio " euros" crlf)
        (printout t "-------------------" crlf)
    )
)

(reset)
(run)