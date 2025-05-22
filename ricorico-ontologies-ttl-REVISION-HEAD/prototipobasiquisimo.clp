;;;---------------------------------------------------------
;;;Translated by owl2clips
;;;Translated to CLIPS from ontology urn_webprotege_ontology_fed57acf-a204-49bd-8589-abdc3b43448e.ttl

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
        (type INTEGER)
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
        (type INTEGER)
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
        (type INTEGER)
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
         (Alcohol?  "false")
         (Precio 1)
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
        (Posicion_menu 2)
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

    ;; Bebidas adicionales
    ([Cerveza] of Bebida
        (Alcohol? "true")
        (Precio 4)
    )
    
    ([Zumo_Naranja] of Bebida
        (Alcohol? "false")
        (Precio 3)
    )
    
    ([Té] of Bebida
        (Alcohol? "false")
        (Precio 2)
    )
    
    ([Sangria] of Bebida
        (Alcohol? "true")
        (Precio 8)
    )

    ;; Ingredientes adicionales
    ([Pasta] of Ingrediente
        (Ingrediente_restricción [Celiaco])
    )
    
    ([Arroz] of Ingrediente
    )
    
    ([Huevo] of Ingrediente
        (Ingrediente_restricción [Vegano])
    )
    
    ([Pescado] of Ingrediente
        (Ingrediente_restricción [Vegetariano] [Vegano])
    )
    
    ([Patata] of Ingrediente
        (Disponible_durante [Invierno] [Otoño])
    )
    
    ([Chocolate] of Ingrediente
        (Ingrediente_restricción [Vegano]) ; Algunos chocolates contienen leche
    )

    ;; Platos principales adicionales
    ([Paella] of Plato
        (Plato_ingrediente [Arroz] [Pollo] [Pescado] [Tomate])
        (Pais_de_procedencia [España])
        (Es_de_estilo [Mediterraneo])
        (Precio 12)
        (Complejo? "true")
        (Caliente? "true")
        (Posicion_menu 2)
    )
    
    ([Hamburguesa_Vegana] of Plato
        (Plato_ingrediente [Lechuga] [Tomate] [Pan_tostado])
        (Precio 9)
        (Complejo? "false")
        (Caliente? "true")
        (Posicion_menu 2)
    )
    
    ([Risotto] of Plato
        (Plato_ingrediente [Arroz] [Queso_parmesano] [Cebolla])
        (Pais_de_procedencia [Italia])
        (Es_de_estilo [Italiano])
        (Precio 10)
        (Complejo? "true")
        (Caliente? "true")
        (Posicion_menu 2)
    )

    ;; Primeros platos adicionales
    ([Crema_Calabacin] of Plato
        (Plato_ingrediente [Calabacin] [Cebolla] [Ajo])
        (Precio 7)
        (Complejo? "false")
        (Caliente? "true")
        (Posicion_menu 1)
    )
    
    ([Ensaladilla_Rusa] of Plato
        (Plato_ingrediente [Patata] [Zanahoria] [Huevo] [Mayonesa])
        (Precio 6)
        (Complejo? "false")
        (Caliente? "false")
        (Posicion_menu 1)
    )

    ;; Postres adicionales
    ([Tarta_Chocolate] of Plato
        (Plato_ingrediente [Chocolate] [Huevo])
        (Precio 5)
        (Complejo? "true")
        (Caliente? "false")
        (Posicion_menu 3)
    )
    
    ([Flan] of Plato
        (Plato_ingrediente [Huevo] [Leche])
        (Precio 4)
        (Complejo? "false")
        (Caliente? "false")
        (Posicion_menu 3)
    )
    
    ([Fruta_Fresca] of Plato
        (Plato_ingrediente [Manzana] [Pera] [Platano])
        (Precio 3)
        (Complejo? "false")
        (Caliente? "false")
        (Posicion_menu 3)
    )

    ;; Nuevos países
    ([España] of Paises
    )
    
    ([Francia] of Paises
    )

    ;; Nuevos ingredientes
    ([Calabacin] of Ingrediente
        (Disponible_durante [Verano] [Otoño])
    )
    
    ([Zanahoria] of Ingrediente
    )
    
    ([Mayonesa] of Ingrediente
        (Ingrediente_restricción [Vegano] [Huevo_alergia])
    )
    
    ([Manzana] of Ingrediente
        (Disponible_durante [Otoño] [Invierno])
    )
    
    ([Pera] of Ingrediente
        (Disponible_durante [Verano] [Otoño])
    )
    
    ([Platano] of Ingrediente
    )
    
    ([Leche] of Ingrediente
        (Ingrediente_restricción [Vegano] [Lactosa_intolerante])
    )

    ;; Nuevas restricciones
    ([Huevo_alergia] of Restricciones
    )

    ;; Nuevas estaciones
    ([Invierno] of Estación
    )

    ;; Nuevos estilos
    ([Italiano] of Estilo_comida
    )
    
    ([Americano] of Estilo_comida
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
    (slot bebidasAlcoholicas (type INTEGER) (default 1));1 significa que puede haber
    (slot precioMax (type INTEGER) (default 9999));ibai llanos
    (slot precioMin (type INTEGER) (default 1))
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
(deffunction MAIN::preguntar_lista (?pregunta ?lista)
     (printout t "PREGUNTANDO LISTA" crlf)
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

(deffunction MAIN::preguntar (?pregunta) "Pregunta de un unico valor"
    (printout t crlf ?pregunta crlf)
    (return (read))
)

;mensaje inicial, redirije a pillar datos
(defrule MAIN::inicio "Regla con la que inicia el programa"
    (declare (salience 100)) ;mucho para que sea primero
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
    (setBebidasAlcoholicas)
    (setMaxPrecio)
    (setMinPrecio)
)

;preguntamos en cuanto a las posibles restricciones
;se muestran todas las posibles y se almacena en el multislot
;restricciones de ingredientes los que se respondan
(defrule obtener_informacion::preguntar_restricciones
    (declare (salience 10))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setRestricciones)
    =>
     (printout t "PREGUNTANDO RESTRICCIONES" crlf)
        (bind $?nombre_todas_las_restricciones (create$))
        (bind $?lista_todas_las_restricciones (find-all-instances ((?restriccion Restricciones)) TRUE))

        (loop-for-count (?i 1 (length$ $?lista_todas_las_restricciones)) do
            (bind ?j (nth$ ?i $?lista_todas_las_restricciones))
            (bind ?nombre_restriccion (instance-name-to-symbol (instance-name ?j)))
            (bind $?nombre_todas_las_restricciones (insert$ $?nombre_todas_las_restricciones (+ (length$ $?nombre_todas_las_restricciones) 1) ?nombre_restriccion))
        )
        (bind $?numero_restricciones_escogidas (preguntar_lista "Escoge restricciones en los alimentos" $?nombre_todas_las_restricciones))   

        (bind $?restricciones_escogidas (create$))
        (loop-for-count (?i 1 (length$ $?numero_restricciones_escogidas)) do
            (bind ?j (nth$ ?i $?numero_restricciones_escogidas))
            (bind ?restriccion_escogida (nth$ ?j $?lista_todas_las_restricciones))
            (bind $?restricciones_escogidas (insert$ $?restricciones_escogidas (+ (length$ $?restricciones_escogidas) 1) ?restriccion_escogida))
        )
        (modify ?preferencias (restriccionesDeIngredientes $?restricciones_escogidas))
    (retract ?fact)
)

(defrule obtener_informacion::preguntar_alcohol "Pregunta sobre si se permite alcohol"
    (declare (salience 9))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setBebidasAlcoholicas)
    =>
    (printout t "PREGUNTANDO ALCOHOL" crlf)
    (bind ?finish FALSE)
    (while (eq ?finish FALSE)
        (bind ?respuesta (preguntar "Quieres bebidas alcoholicas en el evento? ||| No(0) ||| Si(1) |||"))
        (switch ?respuesta
            (case 0 then
                (modify ?preferencias (bebidasAlcoholicas 0))
                (bind ?finish TRUE)
            )
            (case 1 then
                (modify ?preferencias (bebidasAlcoholicas 1))
                (bind ?finish TRUE)
            )
            (default
                (printout t "Opcion " ?respuesta " no valida. Introduce 0 o 1." crlf)
            )
        )
    )
    (retract ?fact)
)

(defrule obtener_informacion::preguntar_setMaxPrecio "Establece el maximo precio por menu del evento preguntandolo al usuario"
    (declare (salience 8))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setMaxPrecio)
    =>
    (printout t "PREGUNTANDO PRECIO MÁXIMO" crlf)
	(bind ?finish FALSE)
	(while (eq ?finish FALSE)
		(bind ?max (preguntar "Indica el maximo precio (euros) que estas dispuesto a pagar por menu"))
		(if (and (numberp ?max) (>= ?max 1)) then
			(modify ?preferencias (precioMax ?max))
			(bind ?finish TRUE)
		else
			(printout t "El precio maximo debe ser un numero mayor o igual a 1" crlf)
        )
    )
    (retract ?fact)
)

(defrule obtener_informacion::preguntar_setMinPrecio "Establece el minimo precio por menu del evento preguntandolo al usuario"
    (declare (salience 7))
    ?preferencias <- (preferencias-del-cliente (precioMax ?precioMax))
    ?fact <- (setMinPrecio)
    =>
    (printout t "PREGUNTANDO PRECIO MÍNIMO" crlf)
	(bind ?finish FALSE)
	(while (eq ?finish FALSE)
		(bind ?min (preguntar "Indica el minimo precio (euros) que estas dispuesto a pagar por menu"))
		(if (and (numberp ?min) (>= ?min 1)) then
			(if (> ?min ?precioMax) then
				(printout t "El precio minimo ha de ser menor o igual al precio maximo escogido (" ?precioMax ")" crlf)
			else 
				(modify ?preferencias (precioMin ?min))
				(bind ?finish TRUE)
            )
		else
			(printout t "El precio minimo debe ser un numero mayor o igual a 1" crlf)
        )
    )
    (retract ?fact)
)

(defrule obtener_informacion::debug_hechos
    (declare (salience 5))
    =>
    (printout t "PARA DEBUGING " crlf)
    (printout t "Hechos presentes:" crlf)
    (facts)
)

(defrule obtener_informacion::todas_las_preguntas_hechas "cambiamos de modulo"
    (declare(salience -1))
    =>
    (printout t "Todas las preguntas completadas, procesando información..." crlf)
    (focus tratar_informacion)
)

(defrule tratar_informacion::podar_platos "Hace instancias de los platos que cumplen las preferencias del ciente"
    (declare(salience 10))
    (preferencias-del-cliente (restriccionesDeIngredientes $?restriccionesDeIngredientes))
    ?plato <- (object (is-a Plato))
    (not (instancias_plato_hecha (plato ?plato))) ;para que no vuelva a ejecutarse
        =>
    (printout t "PODANDO PLATOS" crlf)
    (bind ?cumple_condiciones TRUE)

    ;Obtenemos ingrdientes
    (bind $?ingredientes_plato (send ?plato get-Plato_ingrediente))
    ;Miramos las restricciones de cada uno
    (progn$ (?ingrediente $?ingredientes_plato)
        (bind $?restricciones_ingrediente (send ?ingrediente get-Ingrediente_restricción))
        ;Alguna esta prohibida por el cliente?
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
)

(defrule tratar_informacion::informacion_tratada "ya hemos tratado la informacion. Cambiar  de modulo"
    (declare (salience -1))
    =>
    (printout t "Hemos acabao de procesar datos" crlf)
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
    (preferencias-del-cliente (bebidasAlcoholicas ?permitir_alcohol))
    =>
    (printout t "Evaluando bebida: " (instance-name ?bebida_candidata) " - Alcohol: " ?esAlcholica crlf)
    
    (bind ?incluir_bebida FALSE)
    (if (eq ?permitir_alcohol 1) then
        ;si se permiten bebidas con alcohol incluir todas
        (bind ?incluir_bebida TRUE)
    else
        ;si no, solo incluir las no alcohólicas
        (if (eq ?esAlcholica "false") then
            (bind ?incluir_bebida TRUE)
        )
    )
    
    (if (eq ?incluir_bebida TRUE) then
        (printout t "Añadiendo bebida a lista..." crlf)
        (bind $?bebidas (insert$ $?bebidas (+ (length$ $?bebidas) 1) ?bebida_candidata))
        (modify ?lista_bebidas_candidatas(bebidas $?bebidas))
    else
        (printout t "Bebida excluida por restricciones de alcohol" crlf)
    )
    
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
    (printout t "Generando combinaciones adecuadas" crlf)
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
    (printout t "Comprovando incompatibilidades" crlf)
    ;para cada uno de los componentes del menú mirar si son incompatibles con alguno de los demás
    (assert (combinacionMenuCompatible (primero ?primero) (segundo ?segundo) (postre ?postre)))
    (retract ?fact);tanto si si como si no borramos la combinacion que acabamos de mirar
)

(defrule generar_menu::comprovar_bebidas "Para cada bebida miramos si es compatible con todos los elementos de un menú" 
    (declare (salience 8))
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    ?fact <- (combinacionMenuCompatible (primero ?primero) (segundo ?segundo) (postre ?postre))
    =>
        (printout t "Ahora comprovando bebidas" crlf)
    (progn$ (?bebida $?bebidas)
        (assert (menuCorrecto (primero ?primero) (segundo ?segundo) (postre ?postre) (bebida ?bebida)))
    )
    (retract ?fact)
)

(defrule generar_menu::comprovar_precio "Comprovamos que se cumpla la restriccion de precio"
    (declare (salience 7))
    ?fact <- (menuCorrecto (primero ?primero) (segundo ?segundo) (postre ?postre) (bebida ?bebida))
    (preferencias-del-cliente (precioMin ?precioMin) (precioMax ?precioMax))
    =>
    (printout t "Comprovando precio" crlf)
    (bind ?precio_primero (send (send ?primero get-plato) get-Precio))
    (bind ?precio_segundo (send (send ?segundo get-plato) get-Precio))
    (bind ?precio_postre (send (send ?postre get-plato) get-Precio))
    (bind ?precio_bebida (send ?bebida get-Precio))
    (printout t "PRECIO PRIMERO ---------- " ?precio_primero crlf)

    (bind ?precioTotal (+ ?precio_primero (+ ?precio_segundo (+ ?precio_postre ?precio_bebida))))
    
    ;mirar si entramos en presupuesto
    (if (and (>= ?precioTotal ?precioMin) (<= ?precioTotal ?precioMax)) then
        (printout t "Menú dentro del rango de precio: " ?precioTotal " euros" crlf)
        (make-instance (gensym) of Menu 
            (Menu/plato_bebida ?bebida)
            (Primero (send ?primero get-plato))
            (Segundo (send ?segundo get-plato))
            (Postre (send ?postre get-plato))
            (Precio ?precioTotal))
    else
        (printout t "Menú fuera del rango de precio: " ?precioTotal " euros (rango: " ?precioMin "-" ?precioMax ")" crlf)
    )

    (retract ?fact)
)

(defrule generar_menu::finalizar "Hemos acabado, cambiamos a modulo mostrar menus"
    (declare (salience -1)) ;lo ultimo que se hace
    =>
    (focus mostrar_soluciones)
)

(defrule mostrar_soluciones::imprimir_menus "Imprime las soluciones encontradas"
    =>
    (printout t "Los menus resultantes son los siguientes:" crlf)

    (bind $?todos_los_menus (find-all-instances ((?menu Menu)) TRUE))

    (loop-for-count (?i 1 (length$ $?todos_los_menus)) do
        (bind ?menu_actual (nth$ ?i $?todos_los_menus))

        (bind ?bebidas (send ?menu_actual get-Menu/plato_bebida))
        (bind $?primeros (send ?menu_actual get-Primero))
        (bind $?segundos (send ?menu_actual get-Segundo))
        (bind $?postres (send ?menu_actual get-Postre))
        (bind ?precio (send ?menu_actual get-Precio))

        (printout t crlf "--- MENU " ?i " ---" crlf)

        (if (> (length$ $?bebidas) 0) then
            (bind ?bebida_menu (nth$ 1 $?bebidas))
            (printout t "Bebida: " (instance-name ?bebida_menu) crlf)
        )

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