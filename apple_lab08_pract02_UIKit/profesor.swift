//
//  Profesor.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Rafael on 4/5/26.
//

import UIKit

class Profesor {
    let nombre: String
    let departamento: String
    let iniciales: String
    let color: UIColor
    
    init(nombre: String, departamento: String, iniciales: String, color: UIColor) {
        self.nombre = nombre
        self.departamento = departamento
        self.iniciales = iniciales
        self.color = color
    }
}
