//
//  Course.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Alcoceba Gutiérrez de León on 15/2/22.
//

import Foundation

struct Course: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var image: String
    var type: String
    var priceLevel: Int
    var visited: Bool = false
    
    
    // Constructor que crea un curso a partir de los parametros necesarios
    init(name: String, description: String, image: String, type: String, priceLevel: Int){
    self.name = name
    self.description = description
    self.image = image
    self.type = type
    self.priceLevel = priceLevel
    self.visited = false
    }
    
    // Creamos un curso vacío
    init(){
        self.init(name: "", description: "", image: "", type: "", priceLevel: 0)
    }
}

#if DEBUG // Sólo aparecera cuando estemos en el entorno de desarrollo
// Llamamos al constructor para crear el modelo de datos
var courses: [Course] = [
    
    Course(name: "Curso de fotografía para principiantes",
           description: "En estecurso aprenderás todo lo necesario para iniciarte en el mundo de la fotografía.",
           image: "cursoFotografia",
           type: "Habilidades",
           priceLevel: 2),
    Course(name: "Curso de video para principiantes",
           description: "",
           image: "cursoVideo",
           type: "Habilidades",
           priceLevel: 1),
    Course(name: "Curso de sonido para principiantes",
           description: "",
           image: "cursoSonido",
           type: "Habilidades",
           priceLevel: 4),
    Course(name: "Curso de fauna marina",
           description: "",
           image: "cursoMar",
           type: "Naturaleza",
           priceLevel: 3),
    Course(name: "Curso de fauna selvática",
           description: "",
           image: "cursoSelva",
           type: "Naturaleza",
           priceLevel: 2),
    Course(name: "Curso de fauna sabánica",
           description: "",
           image: "cursoSabana",
           type: "Naturaleza",
          priceLevel: 2)
]

#endif // Manera de finalizar el modelo de datos para desarrollo
