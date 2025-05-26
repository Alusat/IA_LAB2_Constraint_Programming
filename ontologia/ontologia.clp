;;; ---------------------------------------------------------
;;; ontologia.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology urn_webprotege_ontology_fed57acf-a204-49bd-8589-abdc3b43448e.ttl
;;; :Date 26/05/2025 22:12:25

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
    (multislot Cohesion
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Evento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
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
    (slot Textura
        (type SYMBOL)
        (create-accessor read-write))
    (slot Caliente?
        (type SYMBOL)
        (create-accessor read-write))
    (slot Posicion_menu
        (type INTEGER)
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
    (multislot Conjunta_con_estilo
        (type INSTANCE)
        (create-accessor read-write))
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
         (Ingrediente_restricción  [Vegano])
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
    )

)
