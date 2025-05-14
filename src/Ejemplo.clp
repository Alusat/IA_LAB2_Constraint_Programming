; Definición del template persona
(deftemplate persona
   (slot nombre (type STRING))
   (slot edad (type INTEGER))
   (slot ocupacion (type SYMBOL))
)

; Creación de hechos
(deffacts personas-iniciales
   (persona (nombre "Juan") (edad 30) (ocupacion ingeniero))
   (persona (nombre "María") (edad 25) (ocupacion doctora))
   (persona (nombre "Pedro") (edad 17) (ocupacion estudiante))
)

; Regla para identificar personas mayores de edad
(defrule es-mayor-de-edad
   ?persona <- (persona (nombre ?n) (edad ?e&:(>= ?e 18)))
   =>
   (printout t ?n " es mayor de edad." crlf)
)

; Regla para sugerir carnet de conducir
(defrule sugerir-carnet
   (persona (nombre ?n) (edad ?e&:(>= ?e 18)) (ocupacion ~estudiante))
   =>
   (printout t "Sugerencia: " ?n " podría sacarse el carnet de conducir." crlf)
)

; Inicializar y ejecutar
(reset)
(run)