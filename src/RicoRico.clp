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
    (multislot restricción_ingrediente
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
    (slot cohesion
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
    (multislot restricción_ingrediente
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
    (multislot Es_de_estilo                     ; para juntar con bebida
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
        (allowed-symbols TRUE FALSE)
        (create-accessor read-write))
    (slot Textura                               ; para juntar platos en menú
        (type SYMBOL)
        (allowed-symbols CRUJIENTE CREMOSO)
        (create-accessor read-write))
    (slot Caliente?                             ; para juntar platos en menú, hay que ir alternando temperatura y textura
        (type SYMBOL)
        (allowed-symbols TRUE FALSE)
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
    (multislot restricción_ingrediente
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
    (multislot Conjunta_con_estilo
        (type INSTANCE)
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

(definstances nuevos_ingredientes
        ;; Aceites, aliños y especias
        ([Aceite_de_Oliva] of Ingrediente)
        ([Canela] of Ingrediente)
        ([Alcaparras] of Ingrediente)
        ([Rúcula] of Ingrediente)
        ([Vinagre] of Ingrediente)
        ([Albahaca] of Ingrediente)
        ([Sal] of Ingrediente)
        ([Pimienta] of Ingrediente)
        ([Azafrán] of Ingrediente)
        ([Curry] of Ingrediente)
        ([Gengibre] of Ingrediente)
        ([Romero] of Ingrediente)
        ([Hierbas_fin] of Ingrediente)

        ([Maicena] of Ingrediente)
        ([Cacao] of Ingrediente)

        ;; Frutas, verduras y hortalizas
        ([Pepino] of Ingrediente)
        ([Pimiento] of Ingrediente)
        ([Pimiento_verde] of Ingrediente)
        ([Pan_duro] of Ingrediente)
        ([Calabacín] of Ingrediente)     ;; si lo usas en cremas, etc.
        ([Limón] of Ingrediente)
        ([Gamba] of Ingrediente)

        ;; Proteínas y derivados animales
        ([Ternera] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Atún] of Ingrediente 
            (restricción_ingrediente [Vegano])
        )
        ([Jamón_Serrano] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Pollo] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Marisco] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Lubina] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Entrecot] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Mascarpone] of Ingrediente 
            (restricción_ingrediente [Vegano] [Vegetariano])
        )
        ([Yema_de_huevo] of Ingrediente 
            (restricción_ingrediente [Vegano] [Huevo_alergia])
        )
        ([Huevo] of Ingrediente 
            (restricción_ingrediente [Vegano] [Huevo_alergia])
        )

        ;; Lácteos y derivados
        ([Parmesano] of Ingrediente 
            (restricción_ingrediente [Lactosa_intolerante])
        )
        ([Queso_crema] of Ingrediente      
            (restricción_ingrediente [Lactosa_intolerante]) 
        )
        ([Mantequilla] of Ingrediente 
             (restricción_ingrediente [Lactosa_intolerante])
        )
        ([Leche_de_coco] of Ingrediente 
             (restricción_ingrediente [Lactosa_intolerante])
        )

        ;; Harinas, granos y sus elaborados
        ([Arroz] of Ingrediente 
            (restricción_ingrediente [Celiaco])
        )
        ([Pan_tostado] of Ingrediente 
            (restricción_ingrediente [Celiaco])
        )
        ([Galletas] of Ingrediente 
            (restricción_ingrediente [Celiaco])
        )


        ;; Dulces y frutos secos

        ([Nueces] of Ingrediente)

        ;; Otros
        ([Caldo_de_verduras] of Ingrediente)
        ([Caldo_de_caldo] of Ingrediente) ;; si usas distinto caldo
)

(definstances instances
    ([Agua] of Bebida
         (Alcohol?  "false")
         (Precio 1)
         (Conjunta_con_estilo [Clásico] [Sibarita] [Moderno])
    )

    ([Carne] of Ingrediente
         (restricción_ingrediente  [Vegano] [Vegetariano])
    )

    ([Vegano] of Restricciones
    )

    ([Yogurt_La_Fageda] of Plato
         (Precio  2)
         (Complejo? FALSE)
         (Textura CREMOSO)
         (Caliente? FALSE)
         (Posicion_menu 3)
    )

    ([Macarrones_tomatico] of Plato
         (Plato_ingrediente  [Carne])
         (Precio  5)
         (Complejo? FALSE)
         (Textura CREMOSO)
         (Caliente? TRUE)
         (Posicion_menu 2)
    )

    ([Ensalada_Cesar] of Plato
        (Plato_ingrediente [Lechuga] [Pollo] [Queso_parmesano] [Pan_tostado])
        (Pais_de_procedencia [Italia] [Estados_Unidos])
        (Es_de_estilo [Clásico])
        (Precio 8)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
    )



    ([Lechuga] of Ingrediente
        (Disponible_durante [Verano] [Primavera])
    )

    ([Queso_parmesano] of Ingrediente
        (restricción_ingrediente [Vegano] [Lactosa_intolerante])
    )

    ([Pan_tostado] of Ingrediente
        (restricción_ingrediente [Celiaco])
    )

    ([Sopa_de_tomate] of Plato
        (Plato_ingrediente [Tomate] [Cebolla] [Ajo])
        (Precio 6)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
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
        (Conjunta_con_estilo [Moderno])
    )

    ([Vino_tinto] of Bebida
        (Alcohol? "true")
        (Precio 15)
        (Conjunta_con_estilo [Clásico] [Sibarita])
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

    ([Moderno] of Estilo_comida
    )

    ;; Bebidas adicionales
    ([Cerveza] of Bebida
        (Alcohol? "true")
        (Precio 4)
        (Conjunta_con_estilo [Clásico])
    )
    
    ([Zumo_Naranja] of Bebida
        (Alcohol? "false")
        (Precio 3)
        (Conjunta_con_estilo [Moderno])
    )
    
    ([Té] of Bebida
        (Alcohol? "false")
        (Precio 2)
        (Conjunta_con_estilo [Clásico] [Sibarita] )
    )
    
    ([Sangria] of Bebida
        (Alcohol? "true")
        (Precio 8)
        (Conjunta_con_estilo [Clásico] [Moderno])
    )

    ;; Ingredientes adicionales
    ([Pasta] of Ingrediente
        (restricción_ingrediente [Celiaco])
    )
    
    
    ([Pescado] of Ingrediente
        (restricción_ingrediente [Vegetariano] [Vegano])
    )
    
    ([Patata] of Ingrediente
        (Disponible_durante [Invierno] [Otoño])
    )
    
    ([Chocolate] of Ingrediente
        (restricción_ingrediente [Vegano]) ; Algunos chocolates contienen leche
    )

    ;; Platos principales adicionales

    ([Salmorejo] of Plato
            (Plato_ingrediente [Tomate] [Huevo] [Ajo])
            (Pais_de_procedencia [España])
            (Es_de_estilo [Clásico])
            (Precio 6)
            (Complejo? FALSE)
            (Textura CREMOSO)
            (Caliente? FALSE)
            (Posicion_menu 1)
    )

    ([Paella] of Plato
        (Plato_ingrediente [Arroz] [Pollo] [Pescado] [Tomate])
        (Pais_de_procedencia [España])
        (Es_de_estilo [Clásico])
        (Precio 12)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
    )

    ([Churros] of Plato
        (Plato_ingrediente [Harina] [Mantequilla] [Azúcar])
        (Pais_de_procedencia [España])
        (Es_de_estilo [Clásico])
        (Precio 4)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
    )
    
    ([Hamburguesa_Vegana] of Plato
        (Plato_ingrediente [Lechuga] [Tomate] [Pan_tostado])
        (Precio 9)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
    )
    
    ([Risotto] of Plato
        (Plato_ingrediente [Arroz] [Queso_parmesano] [Cebolla])
        (Pais_de_procedencia [Italia])
        (Es_de_estilo [Sibarita])
        (Precio 10)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
    )

    ;; Primeros platos adicionales
    ([Crema_Calabacin] of Plato
        (Plato_ingrediente [Calabacin] [Cebolla] [Ajo])
        (Precio 7)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
    )
    
    ([Ensaladilla_Rusa] of Plato
        (Plato_ingrediente [Patata] [Zanahoria] [Huevo] [Mayonesa])
        (Precio 6)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
    )

    ;; Postres adicionales
    ([Tarta_Chocolate] of Plato
        (Plato_ingrediente [Chocolate] [Huevo] [Azúcar])
        (Precio 5)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
    )
    
    ([Flan] of Plato
        (Plato_ingrediente [Huevo] [Leche] [Azúcar])
        (Precio 4)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
    )
    
    ([Fruta_Fresca] of Plato
        (Plato_ingrediente [Manzana] [Pera] [Platano])
        (Precio 3)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
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

    ([Harina] of Ingrediente
    )

    ([Azúcar] of Ingrediente
    )



    
    ([Zanahoria] of Ingrediente
    )
    
    ([Mayonesa] of Ingrediente
        (restricción_ingrediente [Vegano] [Huevo_alergia])
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
        (restricción_ingrediente [Vegano] [Lactosa_intolerante])
    )

    ;; Nuevas restricciones
    ([Huevo_alergia] of Restricciones
    )

    ;; Nuevas estaciones
    ([Invierno] of Estación
    )

    ;; Nuevos estilos
    ([Sibarita] of Estilo_comida
    )
    
    ([Clásico] of Estilo_comida
    )

    
    ;; Instancias mejoradas: 100 platos con estilo, país y estación
    ([Brownie_de_chocolate_1] of Plato
        (Plato_ingrediente [Huevo] [Chocolate] [Azúcar])
        (Precio 26)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Lubina_a_la_sal_2] of Plato
        (Plato_ingrediente [Sal] [Lubina] [Aceite_de_Oliva] [Hierbas_fin])
        (Precio 37)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Entrecot_a_la_plancha_3] of Plato
        (Plato_ingrediente [Entrecot] [Pimienta])
        (Precio 11)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        
    )

    ([Tarta_de_queso_4] of Plato
        (Plato_ingrediente [Queso_crema] [Mantequilla] [Galletas])
        (Precio 19)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Brownie_de_chocolate_5] of Plato
        (Plato_ingrediente [Huevo] [Azúcar] [Mantequilla])
        (Precio 23)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Paella_marinera_6] of Plato
        (Plato_ingrediente [Marisco] [Azafrán] [Gamba])
        (Precio 28)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Francia])
        
    )

    ([Salmorejo_7] of Plato
        (Plato_ingrediente [Jamón_Serrano] [Pan_duro] [Tomate])
        (Precio 31)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Italia])
        
    )

    ([Coulant_de_chocolate_8] of Plato
        (Plato_ingrediente [Harina] [Huevo] [Mantequilla])
        (Precio 5)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Coulant_de_chocolate_9] of Plato
        (Plato_ingrediente [Harina] [Mantequilla] [Huevo] [Chocolate])
        (Precio 33)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        
    )

    ([Carpaccio_de_ternera_10] of Plato
        (Plato_ingrediente [Parmesano] [Limón] [Rúcula] [Aceite_de_Oliva])
        (Precio 34)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        
    )

    ([Pollo_al_curry_11] of Plato
        (Plato_ingrediente [Pollo]  [Leche_de_coco])
        (Precio 16)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Moderno])
        
    )

    ([Tarta_de_queso_12] of Plato
        (Plato_ingrediente [Azúcar] [Galletas] [Queso_crema])
        (Precio 7)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Lubina_a_la_sal_13] of Plato
        (Plato_ingrediente [Sal] [Hierbas_fin] [Limón])
        (Precio 12)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        
    )

    ([Natillas_14] of Plato
        (Plato_ingrediente [Canela] [Yema_de_huevo] [Leche] [Maicena])
        (Precio 14)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Italia])
        
    )

    ([Gazpacho_andaluz_15] of Plato
        (Plato_ingrediente [Tomate] [Pepino] [Ajo] [Aceite_de_Oliva] [Pimiento_verde])
        (Precio 36)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_16] of Plato
        (Plato_ingrediente [Rúcula] [Limón] [Aceite_de_Oliva])
        (Precio 23)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        
    )

    ([Carpaccio_de_ternera_17] of Plato
        (Plato_ingrediente [Parmesano] [Ternera] [Aceite_de_Oliva])
        (Precio 21)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Entrecot_a_la_plancha_18] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Pimienta] [Entrecot])
        (Precio 23)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Italia])
        
    )

    ([Natillas_19] of Plato
        (Plato_ingrediente [Canela] [Yema_de_huevo] [Leche] [Maicena])
        (Precio 35)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        
    )

    ([Natillas_20] of Plato
        (Plato_ingrediente [Canela] [Azúcar] [Leche] [Maicena])
        (Precio 25)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Italia])
        
    )

    ([Gazpacho_andaluz_21] of Plato
        (Plato_ingrediente [Tomate] [Pan_duro] [Pepino] [Aceite_de_Oliva])
        (Precio 27)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Paella_marinera_22] of Plato
        (Plato_ingrediente [Marisco] [Arroz])
        (Precio 36)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Carpaccio_de_ternera_23] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Ternera] [Parmesano] [Rúcula] [Limón])
        (Precio 39)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Brownie_de_chocolate_24] of Plato
        (Plato_ingrediente [Mantequilla] [Harina] [Nueces])
        (Precio 18)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Ensalada_de_tomate_25] of Plato
        (Plato_ingrediente [Vinagre] [Tomate] [Albahaca] [Pimienta] [Aceite_de_Oliva])
        (Precio 36)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        
    )

    ([Carpaccio_de_ternera_26] of Plato
        (Plato_ingrediente [Limón] [Rúcula] [Ternera] [Parmesano])
        (Precio 40)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Italia])
        
    )

    ([Natillas_27] of Plato
        (Plato_ingrediente [Azúcar] [Maicena] [Leche])
        (Precio 12)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Francia])
        
    )

    ([Coulant_de_chocolate_28] of Plato
        (Plato_ingrediente [Azúcar] [Chocolate] [Huevo] [Harina] [Mantequilla])
        (Precio 25)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Ensalada_de_tomate_29] of Plato
        (Plato_ingrediente [Pimienta] [Tomate] [Vinagre] [Sal])
        (Precio 31)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_30] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Ternera] [Rúcula] [Limón])
        (Precio 14)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Natillas_31] of Plato
        (Plato_ingrediente [Maicena] [Canela] [Azúcar])
        (Precio 32)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [España])
        
    )

    ([Tarta_de_queso_32] of Plato
        (Plato_ingrediente [Mantequilla] [Azúcar] [Galletas] [Huevo])
        (Precio 9)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Brownie_de_chocolate_33] of Plato
        (Plato_ingrediente [Huevo] [Mantequilla] [Nueces] [Chocolate])
        (Precio 40)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [España])
        
    )

    ([Brownie_de_chocolate_34] of Plato
        (Plato_ingrediente [Azúcar] [Mantequilla] [Chocolate])
        (Precio 20)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        
    )

    ([Pollo_al_curry_35] of Plato
        (Plato_ingrediente [Leche_de_coco] [Pollo] [Curry] )
        (Precio 34)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        
    )

    ([Coulant_de_chocolate_36] of Plato
        (Plato_ingrediente [Azúcar] [Mantequilla] [Chocolate])
        (Precio 11)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Italia])
        
    )

    ([Gazpacho_andaluz_37] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Pimiento_verde] [Pan_duro])
        (Precio 15)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        
    )

    ([Solomillo_de_ternera_38] of Plato
        (Plato_ingrediente [Pimienta] [Mantequilla])
        (Precio 34)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_39] of Plato
        (Plato_ingrediente [Parmesano] [Limón] [Ternera])
        (Precio 5)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        
    )

    ([Tarta_de_queso_40] of Plato
        (Plato_ingrediente [Huevo] [Queso_crema] [Mantequilla] [Azúcar] [Galletas])
        (Precio 5)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        
    )

    ([Gazpacho_andaluz_41] of Plato
        (Plato_ingrediente [Ajo] [Pan_duro] [Pepino] [Pimiento_verde] [Aceite_de_Oliva])
        (Precio 6)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        
    )

    ([Tiramisú_42] of Plato
        (Plato_ingrediente [Mascarpone] [Huevo] [Cacao])
        (Precio 38)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Coulant_de_chocolate_43] of Plato
        (Plato_ingrediente [Huevo] [Azúcar] [Harina] [Chocolate])
        (Precio 25)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Tartar_de_atún_44] of Plato
        (Plato_ingrediente [Cebolla] [Alcaparras] [Aceite_de_Oliva] [Atún] [Yema_de_huevo])
        (Precio 30)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        
    )

    ([Tartar_de_atún_45] of Plato
        (Plato_ingrediente [Cebolla] [Aceite_de_Oliva] [Alcaparras] [Yema_de_huevo])
        (Precio 25)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Natillas_46] of Plato
        (Plato_ingrediente [Canela] [Yema_de_huevo] [Leche] [Azúcar])
        (Precio 19)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        
    )

    ([Gazpacho_andaluz_47] of Plato
        (Plato_ingrediente [Pepino] [Pimiento_verde] [Pan_duro] [Aceite_de_Oliva] [Ajo])
        (Precio 7)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Pollo_al_curry_48] of Plato
        (Plato_ingrediente [Pollo]  [Curry] [Cebolla])
        (Precio 21)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Italia])
        
    )

    ([Ensalada_de_tomate_49] of Plato
        (Plato_ingrediente [Tomate] [Albahaca] [Aceite_de_Oliva])
        (Precio 24)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_50] of Plato
        (Plato_ingrediente [Parmesano] [Rúcula] [Limón] [Ternera])
        (Precio 9)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Francia])
        
    )

    ([Solomillo_de_ternera_51] of Plato
        (Plato_ingrediente [Ternera] [Mantequilla] [Pimienta])
        (Precio 40)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Pollo_al_curry_52] of Plato
        (Plato_ingrediente [Leche_de_coco]  [Curry])
        (Precio 28)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Italia])
        
    )

    ([Gazpacho_andaluz_53] of Plato
        (Plato_ingrediente [Pimiento_verde] [Ajo] [Pan_duro])
        (Precio 19)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        
    )

    ([Ensalada_de_tomate_54] of Plato
        (Plato_ingrediente [Sal] [Vinagre] [Tomate] [Pimienta])
        (Precio 11)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        
    )

    ([Lubina_a_la_sal_55] of Plato
        (Plato_ingrediente [Limón] [Sal] [Lubina] [Hierbas_fin] [Aceite_de_Oliva])
        (Precio 21)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        
    )

    ([Solomillo_de_ternera_56] of Plato
        (Plato_ingrediente [Sal] [Mantequilla] [Romero])
        (Precio 7)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        
    )

    ([Gazpacho_andaluz_57] of Plato
        (Plato_ingrediente [Tomate] [Pepino] [Ajo])
        (Precio 39)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Italia])
        
    )

    ([Tarta_de_queso_58] of Plato
        (Plato_ingrediente [Huevo] [Queso_crema] [Mantequilla])
        (Precio 37)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Tartar_de_atún_59] of Plato
        (Plato_ingrediente [Yema_de_huevo] [Aceite_de_Oliva] [Atún] [Cebolla])
        (Precio 35)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [España])
        
    )

    ([Tiramisú_60] of Plato
        (Plato_ingrediente  [Cacao] [Mascarpone] [Huevo])
        (Precio 12)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [España])
        
    )

    ([Brownie_de_chocolate_61] of Plato
        (Plato_ingrediente [Chocolate] [Huevo] [Harina] [Mantequilla])
        (Precio 10)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Solomillo_de_ternera_62] of Plato
        (Plato_ingrediente [Pimienta] [Romero] [Ternera])
        (Precio 16)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Francia])
        
    )

    ([Salmorejo_63] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Jamón_Serrano] [Pan_duro] [Ajo])
        (Precio 20)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Salmorejo_64] of Plato
        (Plato_ingrediente [Ajo] [Jamón_Serrano] [Tomate] [Pan_duro])
        (Precio 21)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Lubina_a_la_sal_65] of Plato
        (Plato_ingrediente [Lubina] [Aceite_de_Oliva] [Hierbas_fin] [Sal] [Limón])
        (Precio 19)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        
    )

    ([Gazpacho_andaluz_66] of Plato
        (Plato_ingrediente [Pimiento_verde] [Ajo] [Aceite_de_Oliva])
        (Precio 25)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Francia])
        
    )

    ([Tiramisú_67] of Plato
        (Plato_ingrediente [Cacao] [Huevo] )
        (Precio 9)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Tiramisú_68] of Plato
        (Plato_ingrediente [Mascarpone] [Cacao] [Huevo])
        (Precio 8)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        
    )

    ([Gazpacho_andaluz_69] of Plato
        (Plato_ingrediente [Ajo] [Pepino] [Tomate])
        (Precio 7)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        
    )

    ([Solomillo_de_ternera_70] of Plato
        (Plato_ingrediente [Romero] [Ternera] [Mantequilla] [Pimienta])
        (Precio 30)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Brownie_de_chocolate_71] of Plato
        (Plato_ingrediente [Nueces] [Chocolate] [Azúcar] [Harina] [Huevo])
        (Precio 9)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Italia])
        
    )

    ([Natillas_72] of Plato
        (Plato_ingrediente [Leche] [Canela] [Azúcar] [Yema_de_huevo])
        (Precio 40)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        
    )

    ([Tartar_de_atún_73] of Plato
        (Plato_ingrediente [Alcaparras] [Yema_de_huevo] [Cebolla])
        (Precio 38)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Carpaccio_de_ternera_74] of Plato
        (Plato_ingrediente [Parmesano] [Rúcula] [Limón] [Ternera])
        (Precio 30)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        
    )

    ([Tartar_de_atún_75] of Plato
        (Plato_ingrediente [Alcaparras] [Aceite_de_Oliva] [Yema_de_huevo] [Atún])
        (Precio 6)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Italia])
        
    )

    ([Tarta_de_queso_76] of Plato
        (Plato_ingrediente [Galletas] [Queso_crema] [Huevo] [Mantequilla])
        (Precio 38)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [España])
        
    )

    ([Entrecot_a_la_plancha_77] of Plato
        (Plato_ingrediente [Pimienta] [Entrecot])
        (Precio 32)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Moderno])
        
    )

    ([Lubina_a_la_sal_78] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Lubina] [Hierbas_fin] [Sal] [Limón])
        (Precio 22)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        
    )

    ([Salmorejo_79] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Ajo] [Tomate] [Pan_duro] [Jamón_Serrano])
        (Precio 32)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_80] of Plato
        (Plato_ingrediente [Parmesano] [Ternera] [Limón])
        (Precio 29)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_81] of Plato
        (Plato_ingrediente [Limón] [Rúcula] [Parmesano] [Aceite_de_Oliva])
        (Precio 29)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        
    )

    ([Natillas_82] of Plato
        (Plato_ingrediente [Maicena] [Azúcar] [Canela] [Yema_de_huevo] [Leche])
        (Precio 32)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Italia])
        
    )

    ([Salmorejo_83] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Ajo] [Jamón_Serrano] [Pan_duro] [Tomate])
        (Precio 15)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Solomillo_de_ternera_84] of Plato
        (Plato_ingrediente [Mantequilla] [Sal])
        (Precio 16)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        
    )

    ([Carpaccio_de_ternera_85] of Plato
        (Plato_ingrediente [Rúcula] [Parmesano] [Limón])
        (Precio 11)
        (Complejo? TRUE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Paella_marinera_86] of Plato
        (Plato_ingrediente [Arroz] [Marisco] [Azafrán] [Pimiento])
        (Precio 22)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Pollo_al_curry_87] of Plato
        (Plato_ingrediente  [Curry] [Leche_de_coco] [Cebolla] [Pollo])
        (Precio 8)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Brownie_de_chocolate_88] of Plato
        (Plato_ingrediente [Harina] [Nueces] [Huevo] [Azúcar] [Mantequilla])
        (Precio 29)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Clásico])
        
    )

    ([Entrecot_a_la_plancha_89] of Plato
        (Plato_ingrediente [Pimienta] [Aceite_de_Oliva])
        (Precio 21)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [España])
        
    )

    ([Tartar_de_atún_90] of Plato
        (Plato_ingrediente [Yema_de_huevo] [Alcaparras] [Cebolla])
        (Precio 8)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Paella_marinera_91] of Plato
        (Plato_ingrediente [Marisco] [Gamba] )
        (Precio 24)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 2)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [España])
        
    )

    ([Lubina_a_la_sal_92] of Plato
        (Plato_ingrediente [Lubina] [Hierbas_fin] [Sal])
        (Precio 23)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Francia])
        
    )

    ([Carpaccio_de_ternera_93] of Plato
        (Plato_ingrediente [Aceite_de_Oliva] [Rúcula] [Limón] [Ternera] [Parmesano])
        (Precio 25)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        (Pais_de_procedencia [Francia])
        
    )

    ([Lubina_a_la_sal_94] of Plato
        (Plato_ingrediente [Hierbas_fin] [Aceite_de_Oliva] [Sal])
        (Precio 13)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 2)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [España])
        
    )

    ([Salmorejo_95] of Plato
        (Plato_ingrediente [Pan_duro] [Ajo] [Jamón_Serrano] [Tomate])
        (Precio 17)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Sibarita])
        (Pais_de_procedencia [Italia])
        
    )

    ([Coulant_de_chocolate_96] of Plato
        (Plato_ingrediente [Azúcar] [Mantequilla] [Harina])
        (Precio 19)
        (Complejo? FALSE)
        (Textura CREMOSO)
        (Caliente? FALSE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        
    )

    ([Ensalada_de_tomate_97] of Plato
        (Plato_ingrediente [Sal] [Tomate] [Albahaca] [Vinagre] [Aceite_de_Oliva])
        (Precio 37)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Estados_Unidos])
        
    )

    ([Gazpacho_andaluz_98] of Plato
        (Plato_ingrediente [Pimiento_verde] [Pepino] [Aceite_de_Oliva])
        (Precio 16)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? FALSE)
        (Posicion_menu 1)
        (Es_de_estilo [Moderno])
        
    )

    ([Ensalada_de_tomate_99] of Plato
        (Plato_ingrediente [Vinagre] [Aceite_de_Oliva] [Tomate])
        (Precio 34)
        (Complejo? TRUE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 1)
        (Es_de_estilo [Clásico])
        
    )

    ([Tarta_de_queso_100] of Plato
        (Plato_ingrediente [Huevo] [Mantequilla] [Galletas] [Queso_crema] [Azúcar])
        (Precio 38)
        (Complejo? FALSE)
        (Textura CRUJIENTE)
        (Caliente? TRUE)
        (Posicion_menu 3)
        (Es_de_estilo [Moderno])
        (Pais_de_procedencia [Italia])
        
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
    (multislot estacion (type INSTANCE)) ;HAY QUE CAMBIARLO LUEGO!, CUANDO MODIFIQUE LA FUNCIÓN DE PREGUNTAR LISTA (PONER SLOT EN VEZ DE MULTI, DEJAR QUE EL USUARIO PONGA VARIAS ESTACIONES ES COMO RARO)
    (multislot paises (type INSTANCE))
    (multislot estilosComida (type INSTANCE))
    (slot bebidasAlcoholicas (type INTEGER) (default 1));1 significa que puede haber
    (slot numeroComensales (type INTEGER) (default 10)) ; numero comensales
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
    (slot cohesion (type INTEGER))
)

(deftemplate MAIN::combinacionMenuCompatible
    (slot primero (type INSTANCE))
    (slot segundo (type INSTANCE))
    (slot postre (type INSTANCE))
    (slot cohesion (type INTEGER))

)

(deftemplate MAIN::menuCorrecto
    (slot primero (type INSTANCE))
    (slot segundo (type INSTANCE))
    (slot postre (type INSTANCE))
    (slot bebida (type INSTANCE))
    (slot cohesion (type INTEGER))

)

;para cuando se tenga que preguntar de una lista de opciones
;NOTA MÍA (SAMBHAV) TENDRÍA QUE AÑADIR PARÁMETRO DE ENTRADA QUE SEA UN BOOL PARA SABER SI DEBE DE HABER SOLO 1 O VARIOS PARÁMETROS DE ENTRADA
(deffunction MAIN::preguntar_lista (?pregunta ?lista)
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

;HEYNAU
(deffunction MAIN::imprimir_menu (?menu_actual ?i ?nComensales)
    (bind $?bebidas (send ?menu_actual get-Menu/plato_bebida))
    (bind $?primeros (send ?menu_actual get-Primero))
    (bind $?segundos (send ?menu_actual get-Segundo))
    (bind $?postres (send ?menu_actual get-Postre))
    (bind ?precio (send ?menu_actual get-Precio))
    (bind ?cohesion (send ?menu_actual get-cohesion))

    (bind ?precioTotal (* ?precio ?nComensales))

    (printout t crlf "--- MENU " ?i " ---" crlf)
    (if (> (length$ $?bebidas) 0)
        then
        (bind ?bebida_menu (nth$ 1 $?bebidas))
        (printout t "Bebida: " (instance-name ?bebida_menu) crlf)
    )
    (if (> (length$ $?primeros) 0)
        then
        (bind ?plato_primero (nth$ 1 $?primeros))
        (printout t "Primero: " (instance-name ?plato_primero) crlf)
    )
    (if (> (length$ $?segundos) 0)
        then
        (bind ?plato_segundo (nth$ 1 $?segundos))
        (printout t "Segundo: " (instance-name ?plato_segundo) crlf)
    )
    (if (> (length$ $?postres) 0)
        then
        (bind ?plato_postre (nth$ 1 $?postres))
        (printout t "Postre: " (instance-name ?plato_postre) crlf)
    )
    (printout t "Precio: " ?precio " euros" crlf)
    (printout t "Cohesion: " ?cohesion crlf)
    (printout t "-------------------" crlf)
    (printout t "Precio Total: " ?precioTotal " euros" crlf)
    (printout t "-------------------" crlf)
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
    (setRestricciones) ; los sets estos son flags, para no ejecutar lo mismo una y otra vez
    (setEstacion)
    (setPaises)
    (setEstilosComida)
    (setBebidasAlcoholicas)
    (setNumeroComensales)
    (setMaxPrecio)
    (setMinPrecio)
)

;preguntamos en cuanto a las posibles restricciones
;se muestran todas las posibles y se almacena en el multislot
;restricciones de ingredientes los que se respondan
(defrule obtener_informacion::preguntar_restricciones
    (declare (salience 16))
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

(defrule obtener_informacion::preguntar_preferencias
    (declare (salience 14))
    ?preferencias <- (preferencias-del-cliente)
    ?fact1 <- (setEstacion)
    ?fact2 <- (setPaises)
    ?fact3 <- (setEstilosComida)
    =>
    ;PREGUNTAMOS ESTACIÓN ==========================================================================================================
    (bind $?nombre_todas_las_estaciones (create$))
    (bind $?lista_todas_las_estaciones (find-all-instances ((?estacion Estación)) TRUE))

    (loop-for-count (?i 1 (length$ $?lista_todas_las_estaciones)) do
        (bind ?j (nth$ ?i $?lista_todas_las_estaciones))
        (bind ?nombre_estacion (instance-name-to-symbol (instance-name ?j)))
        (bind $?nombre_todas_las_estaciones (insert$ $?nombre_todas_las_estaciones (+ (length$ $?nombre_todas_las_estaciones) 1) ?nombre_estacion))
    )
    (bind $?numero_estaciones_escogidas (preguntar_lista "Escoge la estacion en la que harás el evento" $?nombre_todas_las_estaciones))   

    (bind $?estaciones_escogidas (create$))
    (loop-for-count (?i 1 (length$ $?numero_estaciones_escogidas)) do
        (bind ?j (nth$ ?i $?numero_estaciones_escogidas))
        (bind ?estacion_escogida (nth$ ?j $?lista_todas_las_estaciones))
        (bind $?estaciones_escogidas (insert$ $?estaciones_escogidas (+ (length$ $?estaciones_escogidas) 1) ?estacion_escogida))
    )        

    ;PREGUNTAMOS PAISES ==========================================================================================================
    (bind $?nombre_todos_los_paises (create$))
    (bind $?lista_todos_los_paises (find-all-instances ((?pais Paises)) TRUE))

    (loop-for-count (?i 1 (length$ $?lista_todos_los_paises)) do
        (bind ?j (nth$ ?i $?lista_todos_los_paises))
        (bind ?nombre_pais (instance-name-to-symbol (instance-name ?j)))
        (bind $?nombre_todos_los_paises (insert$ $?nombre_todos_los_paises (+ (length$ $?nombre_todos_los_paises) 1) ?nombre_pais))
    )
    (bind $?numero_paises_escogidos (preguntar_lista "¿De qué paises quieres que sean típicos los platos?" $?nombre_todos_los_paises))   

    (bind $?paises_escogidos (create$))
    (loop-for-count (?i 1 (length$ $?numero_paises_escogidos)) do
        (bind ?j (nth$ ?i $?numero_paises_escogidos))
        (bind ?pais_escogido (nth$ ?j $?lista_todos_los_paises))
        (bind $?paises_escogidos (insert$ $?paises_escogidos (+ (length$ $?paises_escogidos) 1) ?pais_escogido))
    )
        

    ;PREGUNTAMOS ESTILOS ==========================================================================================================
    (bind $?nombre_todos_los_estilos (create$))
    (bind $?lista_todos_los_estilos (find-all-instances ((?estilo Estilo_comida)) TRUE))

    (loop-for-count (?i 1 (length$ $?lista_todos_los_estilos)) do
        (bind ?j (nth$ ?i $?lista_todos_los_estilos))
        (bind ?nombre_estilo (instance-name-to-symbol (instance-name ?j)))
        (bind $?nombre_todos_los_estilos (insert$ $?nombre_todos_los_estilos (+ (length$ $?nombre_todos_los_estilos) 1) ?nombre_estilo))
    )
    (bind $?numero_estilos_escogidos (preguntar_lista "Escoge los estilos que más te gustan " $?nombre_todos_los_estilos))   

    (bind $?estilos_escogidos (create$))
    (loop-for-count (?i 1 (length$ $?numero_estilos_escogidos)) do
        (bind ?j (nth$ ?i $?numero_estilos_escogidos))
        (bind ?estilo_escogido (nth$ ?j $?lista_todos_los_estilos))
        (bind $?estilos_escogidos (insert$ $?estilos_escogidos (+ (length$ $?estilos_escogidos) 1) ?estilo_escogido))
    )    

    (modify ?preferencias
        (estacion                      $?estaciones_escogidas)
        (paises                        $?paises_escogidos)
        (estilosComida                 $?estilos_escogidos))

    (retract ?fact1 ?fact2 ?fact3) 
)

(defrule obtener_informacion::preguntar_alcohol "Pregunta sobre si se permite alcohol"
    (declare (salience 12))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setBebidasAlcoholicas)
    =>
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

(defrule obtener_informacion::preguntar_numero_comensales "Pregunta sobre el numero aproximado de comensales"
    (declare (salience 9))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setNumeroComensales)
    =>
    (bind ?finish FALSE)
    (while (eq ?finish FALSE)
        (bind ?respuesta (preguntar "¿Cuántos comensales asistiran al evento? Danos una cifra aproximada."))
        (if (and (> ?respuesta 0) (integerp ?respuesta)) then
            (modify ?preferencias (numeroComensales ?respuesta))
            (bind ?finish TRUE)
        else
            (printout t crlf) ; salto de linea
            (printout t "Cifra '" ?respuesta "' no válida. Introduce un entero estrictamente positivo. (Número sin decimales y mayor que zero, por ejemplo 10)" crlf)
        )
    )
    (retract ?fact)
)

(defrule obtener_informacion::preguntar_setMaxPrecio "Establece el maximo precio por menu del evento preguntandolo al usuario"
    (declare (salience 8))
    ?preferencias <- (preferencias-del-cliente)
    ?fact <- (setMaxPrecio)
    =>
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

;(bind ?minGlobal 0)
(defrule obtener_informacion::preguntar_setMinPrecio "Establece el minimo precio por menu del evento preguntandolo al usuario"
    (declare (salience 7))
    ?preferencias <- (preferencias-del-cliente (precioMax ?precioMax))
    ?fact <- (setMinPrecio)
    =>
	(bind ?finish FALSE)
	(while (eq ?finish FALSE)
		(bind ?min (preguntar "Indica el minimo precio (euros) que estas dispuesto a pagar por menu"))
		(if (and (numberp ?min) (>= ?min 1)) then
			(if (> ?min ?precioMax) then
				(printout t "El precio minimo ha de ser menor o igual al precio maximo escogido (" ?precioMax ")" crlf)
			else 
				(modify ?preferencias (precioMin ?min))
                ;(bind ?minGlobal 0)
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
    (printout t "Hechos presentes:" crlf)
    (facts)
)

(defrule obtener_informacion::todas_las_preguntas_hechas "cambiamos de modulo"
    (declare(salience -1))
    =>
    (printout t "Todas las preguntas completadas, procesando información..." crlf)
    (focus tratar_informacion)
)


(defrule tratar_informacion::podar_platos "Hace instancias de los platos que cumplen las preferencias del cliente"
    (declare(salience 15))

    (preferencias-del-cliente (restriccionesDeIngredientes $?restriccionesDeIngredientes) 
                              (estacion $?estaciones_cliente)
                              (paises $?paises_cliente)
                              (estilosComida $?estilos_comida_clientes)
                              (numeroComensales ?numeroComensales))

    

    ?plato <- (object (is-a Plato))
    (not (instancias_plato_hecha (plato ?plato))) ;para que no vuelva a ejecutarse
        =>
    (bind ?cumple_condiciones TRUE)

    ;RESTRICCIONES
    ;Obtenemos ingrdientes
    (bind $?ingredientes_plato (send ?plato get-Plato_ingrediente))

    (if (> (length $?restriccionesDeIngredientes) 0) then ;si el cliente no nos dice ninguna restrición es que no tiene
        ;Miramos las restricciones de cada uno
        (progn$ (?ingrediente $?ingredientes_plato)
            (bind $?restricciones_ingrediente (send ?ingrediente get-restricción_ingrediente))
            ;Alguna esta prohibida por el cliente?
            (progn$ (?restriccion $?restricciones_ingrediente)
                (if (member$ ?restriccion $?restriccionesDeIngredientes) then
                    (bind ?cumple_condiciones FALSE)
                    (break)
                )
            )
            (if (eq ?cumple_condiciones FALSE) then (break))
        )
    )

    ;ESTACION

    ;Miramos las estacione de cada uno

    
    (if (> (length $?estaciones_cliente) 0) then ;si el cliente no nos dice ninguna estación ess que le da igual
        (progn$ (?ingrediente $?ingredientes_plato)
            (bind $?estaciones_ingrediente (send ?ingrediente get-Disponible_durante))
            

            (if (> (length $?estaciones_ingrediente) 0) then ; si un ingrediente tiene el atributo de la lista de estaciones vacía entonces está disponible siempre
                
                ; Miramos is está la estacion que queremos
                (bind ?esta_la_estacion_preferente FALSE)
                (progn$ (?estacion $?estaciones_ingrediente) ;luego cambiarlo para hacer solo 1 estacion (si vamos mal de tiempo nos inventamos que el usuario puede poner varias estaciones xD, rollo que por gusto quiere que haya comida de verano e invierno, o tratamos como lista pero solo hay 1)
                    (if (member$ ?estacion $?estaciones_cliente) then
                        (bind ?esta_la_estacion_preferente TRUE)
                        (break)
                    )
                )
                (if (eq ?esta_la_estacion_preferente FALSE) then 
                    (bind ?cumple_condiciones FALSE)
                    (break)   
                )
            )
            (if (eq ?cumple_condiciones FALSE) then (break))
        )
    )

    ;PAISES

    

    (if (> (length $?paises_cliente) 0) then ;si el cliente no nos dice ningun pais ess que le da igual

        (bind ?esta_uno_de_los_paises_cliente FALSE)

        (bind $?paises_plato (send ?plato get-Pais_de_procedencia))
        (progn$ (?pais $?paises_plato)

            

            (if (member$ ?pais $?paises_cliente) then
                (bind ?esta_uno_de_los_paises_cliente TRUE)
                (break)
            )

        )

        (if (eq ?esta_uno_de_los_paises_cliente FALSE) then 
            (bind ?cumple_condiciones FALSE) 
        )
    )

    ;ESTILOS COMIDA

    (if (> (length $?estilos_comida_clientes) 0) then ;si el cliente no nos dice ningun estilo ess que le da igual

        (bind ?esta_uno_de_los_estilos_cliente FALSE)

        (bind $?estilos_plato (send ?plato get-Es_de_estilo))
        (progn$ (?estilo $?estilos_plato)

            

            (if (member$ ?estilo $?estilos_comida_clientes) then
                (bind ?esta_uno_de_los_estilos_cliente TRUE)
                (break)
            )

        )

        (if (eq ?esta_uno_de_los_estilos_cliente FALSE) then 
            (bind ?cumple_condiciones FALSE) 
        )
    )



    ;NUMERO COMENSALES -> PLATOS COMPLEJOS O NO
    ;Obtenemos complejidad
    (bind ?esComplejo (send ?plato get-Complejo?))

    (if (eq ?esComplejo TRUE) then
        (if (> ?numeroComensales 40) then
            (bind ?cumple_condiciones FALSE)
        )
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
    (declare (salience 25)) ;retocar la prio cuando hayan mas cosas para que cuadre
    =>
    (printout t "Creando menus..." crlf)
    (bind ?bebidas (create$))
    (assert (posiblesBebidas (bebidas ?bebidas)))
)

(defrule generar_menu::crear_lista_bebidas "creamos lista con posibles bebidas"
    (declare (salience 18));retocar la prio cuando hayan mas cosas para que cuadre
    ?bebida_candidata <- (object (is-a Bebida)(Alcohol? ?esAlcholica))
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    (not (bebida_considerada (bebida ?bebida_candidata))) ;para no repetir
    (preferencias-del-cliente (bebidasAlcoholicas ?permitir_alcohol))
    =>    
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
        (bind $?bebidas (insert$ $?bebidas (+ (length$ $?bebidas) 1) ?bebida_candidata))
        (modify ?lista_bebidas_candidatas(bebidas $?bebidas))
    
    )
    
    (assert (bebida_considerada (bebida ?bebida_candidata)))
)

;generamos las posibles combinaciones de platos y bebidas
(defrule generar_menu::crear_combinaciones "Generamos las posibles combinaciones de platos y bebidas"
    (declare (salience 15));retocar la prio cuando hayan mas cosas para que cuadre
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    =>
    (bind $?platos (find-all-instances ((?inst Plato_candidato)) TRUE))

    

    (progn$ (?primero $?platos)
        (if (eq 1 (send (send ?primero get-plato) get-Posicion_menu)) then
            (progn$ (?segundo $?platos)
                (if (eq 2 (send (send ?segundo get-plato) get-Posicion_menu)) then

                    (bind ?cohesion_12 0) ; Cohesion entre primero y segundo

                    ; Si la textura entre el primero y el segundo es distinta sumar 1 a la cohesión del menú
                    (bind ?textura_primero (send (send ?primero get-plato) get-Textura))
                    (bind ?textura_segundo (send (send ?segundo get-plato) get-Textura))


                    (if (not (eq ?textura_primero ?textura_segundo)) then
                        (bind ?cohesion_12 (+ ?cohesion_12 1)) ; ++cohesion_menu básicamente
                    )

                    ; Si la temperatura entre el primero y el segundo es distinta sumar 1 a la cohesión del menú
                    (bind ?es_caliente_primero (send (send ?primero get-plato) get-Caliente?))
                    (bind ?es_caliente_segundo (send (send ?segundo get-plato) get-Caliente?))

                    (if (not (eq ?es_caliente_primero ?es_caliente_segundo)) then
                        (bind ?cohesion_12 (+ ?cohesion_12 1)) ; ++cohesion_menu
                    )


                    ; Si tienen un estilo que coincide
                    (bind $?estilos_primero (send (send ?primero get-plato) get-Es_de_estilo))
                    (bind $?estilos_segundo (send (send ?segundo get-plato) get-Es_de_estilo))

                    (progn$ (?estilo $?estilos_primero)
                        (if (member ?estilo $?estilos_segundo) then
                            (bind ?cohesion_12 (+ ?cohesion_12 1)) ; ++cohesion_menu
                            (break)
                        )
                    )

                    (progn$ (?postre $?platos)
                        (if (eq 3 (send (send ?postre get-plato) get-Posicion_menu)) then
                            ; Si la textura entre el postre y el segundo es distinta sumar 1 a la cohesión del menú
                            (bind ?textura_primero (send (send ?primero get-plato) get-Textura))
                            (bind ?textura_segundo (send (send ?segundo get-plato) get-Textura))
                            (bind ?textura_postre (send (send ?postre get-plato) get-Textura))

                            (bind ?cohesion_23_y_31 0) ; Cohesion entre segundo y postre + cohesion entre postre y primero

                            (if (not (eq ?textura_postre ?textura_segundo)) then
                                (bind ?cohesion_23_y_31 (+ ?cohesion_23_y_31 1)) ; ++cohesion_menu básicamente
                            )

                            (if (not (eq ?textura_postre ?textura_primero)) then
                                (bind ?cohesion_23_y_31 (+ ?cohesion_23_y_31 1)) ; ++cohesion_menu
                            )

                            ; Si la temperatura entre el postre y el segundo es distinta sumar 1 a la cohesión del menú
                            (bind ?es_caliente_primero (send (send ?primero get-plato) get-Caliente?))
                            (bind ?es_caliente_segundo (send (send ?segundo get-plato) get-Caliente?))
                            (bind ?es_caliente_postre (send (send ?postre get-plato) get-Caliente?))

                            (if (not (eq ?es_caliente_postre ?es_caliente_segundo)) then
                                (bind ?cohesion_23_y_31 (+ ?cohesion_23_y_31 1)) ; ++cohesion_menu
                            )

                            (if (not (eq ?es_caliente_postre ?es_caliente_primero)) then
                                (bind ?cohesion_23_y_31 (+ ?cohesion_23_y_31 1)) ; ++cohesion_menu
                            )

                            ; Si tienen un estilo que coincide
                            (bind $?estilos_primero (send (send ?primero get-plato) get-Es_de_estilo))
                            (bind $?estilos_segundo (send (send ?segundo get-plato) get-Es_de_estilo))
                            (bind $?estilos_postre (send (send ?postre get-plato) get-Es_de_estilo))

                            (progn$ (?estilo $?estilos_postre)
                                (if (member ?estilo ?estilos_segundo) then
                                    (bind ?cohesion_23_y_31 (+ ?cohesion_23_y_31 1)) ; ++cohesion_menu
                                    (break)
                                )
                            )

                            (progn$ (?estilo $?estilos_postre)
                                (if (member ?estilo ?estilos_primero) then
                                    (bind ?cohesion_23_y_31 (+ ?cohesion_23_y_31 1)) ; ++cohesion_menu
                                    (break)
                                )
                            )

                            (bind ?cohesion_menu (+ ?cohesion_12 ?cohesion_23_y_31))


                            (assert (combinacionMenu (primero ?primero) (segundo ?segundo) (postre ?postre) (cohesion ?cohesion_menu)))
                        )
                    )
                )
            )
        )
    )
)

(defrule generar_menu::comprobar_incompatibilidades "Comprueba las incompatibilidades de los platos"
    (declare (salience 12))
    ?fact <- (combinacionMenu (primero ?primero) (segundo ?segundo) (postre ?postre) (cohesion ?cohesion_menu))
    =>
    ;para cada uno de los componentes del menú mirar si son incompatibles con alguno de los demás
    (assert (combinacionMenuCompatible (primero ?primero) (segundo ?segundo) (postre ?postre) (cohesion ?cohesion_menu)))
    (retract ?fact);tanto si si como si no borramos la combinacion que acabamos de mirar
)

(defrule generar_menu::comprobar_bebidas "Para cada bebida miramos si es compatible con todos los elementos de un menú" 
    (declare (salience 10))
    ?lista_bebidas_candidatas <- (posiblesBebidas (bebidas $?bebidas))
    ?fact <- (combinacionMenuCompatible (primero ?primero) (segundo ?segundo) (postre ?postre) (cohesion ?cohesion_menu))
    =>
    (progn$ (?bebida $?bebidas) ;NEW STUFF
        (bind ?bebida_compatible_primero FALSE)
        (bind ?bebida_compatible_segundo FALSE)
        (bind ?bebida_compatible_postre FALSE)
        (bind $?estilos_bebida (send ?bebida get-Conjunta_con_estilo))

        (bind $?estilos_primero (send (send ?primero get-plato) get-Es_de_estilo))
        
        (if (eq (length$ $?estilos_primero) 0) then
            (bind ?bebida_compatible_primero TRUE)
        )
        
        (progn$ (?estilo $?estilos_bebida)
            (if (member ?estilo $?estilos_primero) then
                (bind ?bebida_compatible_primero TRUE)
                (break)
            )
            
        )


        (bind $?estilos_segundo (send (send ?segundo get-plato) get-Es_de_estilo))
        
        (if (eq (length$ $?estilos_segundo) 0) then
            (bind ?bebida_compatible_segundo TRUE)
        )

        (progn$ (?estilo $?estilos_bebida)
            (if (member ?estilo $?estilos_segundo) then
                (bind ?bebida_compatible_segundo TRUE)
                (break)
            )
            
        )


        (bind $?estilos_postre (send (send ?postre get-plato) get-Es_de_estilo))
        
        (if (eq (length$ $?estilos_postre) 0) then
            (bind ?bebida_compatible_postre TRUE)
        )

        (progn$ (?estilo $?estilos_bebida)
            (if (member ?estilo $?estilos_postre) then
                (bind ?bebida_compatible_postre TRUE)
                (break)
            )
            
        )

        (if (and ?bebida_compatible_postre (and ?bebida_compatible_primero ?bebida_compatible_segundo)) then 
            (assert (menuCorrecto (primero ?primero) (segundo ?segundo) (postre ?postre) (bebida ?bebida) (cohesion ?cohesion_menu)))
            )
        
    )
    (retract ?fact)
)


(defrule generar_menu::comprobar_precio "Comprobamos que se cumpla la restriccion de precio"
    (declare (salience 7))
    ?fact <- (menuCorrecto (primero ?primero) (segundo ?segundo) (postre ?postre) (bebida ?bebida) (cohesion ?cohesion_menu))
    (preferencias-del-cliente (precioMin ?precioMin) (precioMax ?precioMax))
    =>
    (bind ?precio_primero (send (send ?primero get-plato) get-Precio))
    (bind ?precio_segundo (send (send ?segundo get-plato) get-Precio))
    (bind ?precio_postre (send (send ?postre get-plato) get-Precio))
    (bind ?precio_bebida (send ?bebida get-Precio))

    (bind ?precioTotal (+ ?precio_primero (+ ?precio_segundo (+ ?precio_postre ?precio_bebida))))
    
    ;mirar si entramos en presupuesto
    (if (and (>= ?precioTotal ?precioMin) (<= ?precioTotal ?precioMax)) then
        (make-instance (gensym) of Menu 
            (Menu/plato_bebida ?bebida)
            (Primero (send ?primero get-plato))
            (Segundo (send ?segundo get-plato))
            (Postre (send ?postre get-plato))
            (Precio ?precioTotal)
            (cohesion ?cohesion_menu)
        )
    else
    )

    (retract ?fact)
)

(defrule generar_menu::finalizar "Hemos acabado, cambiamos a modulo mostrar menus"
    (declare (salience -1)) ;lo ultimo que se hace
    =>
    (focus mostrar_soluciones)
)

(defrule mostrar_soluciones::imprimir_menus "Imprime las soluciones encontradas"
    (preferencias-del-cliente (precioMax ?precioMax) (precioMin ?precioMin) (numeroComensales ?nComensales))
    =>
    (printout t "Los menus resultantes son los siguientes:" crlf)
    (bind $?todos_los_menus (find-all-instances ((?menu Menu)) TRUE))
    
    (if (eq (length$ $?todos_los_menus) 0)
        then
        (printout t "No se encontraron menús que cumplan los criterios." crlf)
        (return)
    )

    (bind ?intervalo 0)
    (bind ?precio_intermedio1 0)
    (bind ?precio_intermedio2 0)
    (bind ?diferencia (- ?precioMax ?precioMin))
    

    (if (>= ?diferencia 3) then
        
        (bind ?intervalo (/ ?diferencia 3))

        (bind ?precio_intermedio1 (+ ?precioMin ?intervalo))
        (bind ?precio_intermedio2 (+ ?precio_intermedio1 ?intervalo))
    )


    (bind ?menu_barato nil) 
    (bind ?menu_medio nil) 
    (bind ?menu_caro nil)

    (bind ?menu_1 nil)  ; SI NO ENCUENTRO MENU BARATO MEDIO Y CARO
    (bind ?menu_2 nil) 
    (bind ?menu_3 nil)

    (bind ?bebida1 nil)
    (bind ?primero1 nil)
    (bind ?segundo1 nil)
    (bind ?postre1 nil)

    (bind ?bebida2 nil)
    (bind ?primero2 nil)
    (bind ?segundo2 nil)
    (bind ?postre2 nil)


    (bind ?menu2_distinto_a_1 FALSE)
    (bind ?menu3_distinto_a_2 FALSE)
    
    (bind ?cohesion_buscada 9)
    (while (>= ?cohesion_buscada 0) do ; uso un while porque con el loop for count no puedes decrementar, sus muertos
        (bind $?menus_con_cohesion_actual (create$))

      

        (loop-for-count (?idx_menu 1 (length$ $?todos_los_menus)) do
            (bind ?menu_actual (nth$ ?idx_menu $?todos_los_menus))
            (bind ?cohesion_del_menu (send ?menu_actual get-cohesion))
            (if (eq ?cohesion_del_menu ?cohesion_buscada)
                then
                ;(bind $?menus_con_cohesion_actual (insert$ $?menus_con_cohesion_actual (+ (length$ $?menus_con_cohesion_actual) 1) ?menu_actual))

                (bind ?precio_del_menu (send ?menu_actual get-Precio))

                (if (and (eq ?menu_3 nil) (not (eq ?menu_2 nil))) then
                    (bind ?menu_3 ?menu_actual)
                    
                )

                
                (if (and (eq ?menu_2 nil) (not (eq ?menu_1 nil))) then
                    (bind ?menu_2 ?menu_actual)

                    (bind ?bebida2 (send ?menu_2 get-Menu/plato_bebida))
                    (bind ?primero2 (send ?menu_2 get-Primero))
                    (bind ?segundo2 (send ?menu_2 get-Segundo))
                    (bind ?postre2 (send ?menu_2 get-Postre))
                )

                (if (eq ?menu_1 nil) then
                    (bind ?menu_1 ?menu_actual)

                    (bind ?bebida1 (send ?menu_1 get-Menu/plato_bebida))
                    (bind ?primero1 (send ?menu_1 get-Primero))
                    (bind ?segundo1 (send ?menu_1 get-Segundo))
                    (bind ?postre1 (send ?menu_1 get-Postre))
                )
                

                (if (and (eq ?menu2_distinto_a_1 FALSE) (not (eq ?menu_2 nil))) then ; si el actual es distinto al 1, lo asignamos al 2
                    (bind ?bebida_act (send ?menu_actual get-Menu/plato_bebida))
                    (bind ?primero_act (send ?menu_actual get-Primero))
                    (bind ?segundo_act (send ?menu_actual get-Segundo))
                    (bind ?postre_act (send ?menu_actual get-Postre))



                    
                    (bind ?num_diferencias 0)

                    (if (not (eq ?bebida_act ?bebida1)) then (bind ?num_diferencias (+ ?num_diferencias 1)))
                    (if (not (eq ?primero_act ?primero1)) then (bind ?num_diferencias (+ ?num_diferencias 1)))
                    (if (not (eq ?segundo_act ?segundo1)) then (bind ?num_diferencias (+ ?num_diferencias 1)))
                    (if (not (eq ?postre_act ?postre1)) then (bind ?num_diferencias (+ ?num_diferencias 1)))

                    (if (eq ?num_diferencias 4) then
                        (bind ?menu2_distinto_a_1 TRUE)


                        (bind ?menu_2 ?menu_actual)

                        (bind ?bebida2 (send ?menu_2 get-Menu/plato_bebida))
                        (bind ?primero2 (send ?menu_2 get-Primero))
                        (bind ?segundo2 (send ?menu_2 get-Segundo))
                        (bind ?postre2 (send ?menu_2 get-Postre))
                    )


                )

                (if (and (eq ?menu3_distinto_a_2 FALSE) (not (eq ?menu_3 nil))) then ; si el actual es distinto al 2, lo asignamos al 3
                    (bind ?bebida_act (send ?menu_actual get-Menu/plato_bebida))
                    (bind ?primero_act (send ?menu_actual get-Primero))
                    (bind ?segundo_act (send ?menu_actual get-Segundo))
                    (bind ?postre_act (send ?menu_actual get-Postre))


                    
                    
                    (bind ?num_diferencias 0)

                    (if (and (not (eq ?bebida_act ?bebida2)) (not (eq ?bebida_act ?bebida1)) ) then (bind ?num_diferencias (+ ?num_diferencias 1)))
                    (if (not (eq ?primero_act ?primero2)) then (bind ?num_diferencias (+ ?num_diferencias 1)))
                    (if (not (eq ?segundo_act ?segundo2)) then (bind ?num_diferencias (+ ?num_diferencias 1)))
                    (if (not (eq ?postre_act ?postre2)) then (bind ?num_diferencias (+ ?num_diferencias 1)))



                    (if (eq ?num_diferencias 4) then


                    
                        (bind ?menu3_distinto_a_2 TRUE)

                        (bind ?menu_3 ?menu_actual)
                    )


                )
                
                                
                ; ASIGNAMOS MENU BARATO MEDIO Y CARO
                (if (not (eq ?intervalo 0)) then 
                    (if (and (eq ?menu_caro nil) (> ?precio_del_menu ?precio_intermedio2)) then
                        (bind ?menu_caro ?menu_actual)
                    
                    else 
                        (if (and (eq ?menu_medio nil) (<= ?precio_del_menu ?precio_intermedio1)) then
                            (bind ?menu_medio ?menu_actual)
                        else
                            (if (eq ?menu_barato nil) then
                                (bind ?menu_barato ?menu_actual) 
                            )
                        )
                    )
                )
                    
        

                (if (not (or (eq ?menu_barato nil) (eq ?menu_medio nil) (eq ?menu_caro nil))) then (break) )
            )
        )
        
        (bind ?cohesion_buscada (- ?cohesion_buscada 1))
        
    )

    (if (or (eq ?menu_barato nil) (eq ?menu_caro nil) (eq ?menu_medio nil) ) then
       (imprimir_menu ?menu_1 "1" ?nComensales)
        (if (eq ?menu2_distinto_a_1 TRUE) then (imprimir_menu ?menu_2 "2" ?nComensales)) ; no he encontrado menus en los 3 rangos
        (if (eq ?menu3_distinto_a_2 TRUE) then (imprimir_menu ?menu_3 "3" ?nComensales))
    else
        (imprimir_menu ?menu_barato "Barato" ?nComensales)
        (imprimir_menu ?menu_medio "Medio" ?nComensales)
        (imprimir_menu ?menu_caro "Caro" ?nComensales)
    )
)

(reset)
(run)