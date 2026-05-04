//
//  Calculo.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Rafael on 4/5/26.
//

import UIKit

class Calculo {
    enum Operacion: String {
        case suma = "Suma (+)"
        case resta = "Resta (-)"
        case multiplicacion = "Multiplicacion (×)"
    }
    
    let primerNumero: Double
    let segundoNumero: Double
    let operacion: Operacion
    var resultado: Double
    
    init(primerNumero: Double, segundoNumero: Double, operacion: Operacion) {
        self.primerNumero = primerNumero
        self.segundoNumero = segundoNumero
        self.operacion = operacion
        
        switch operacion {
        case .suma:
            self.resultado = primerNumero + segundoNumero
        case .resta:
            self.resultado = primerNumero - segundoNumero
        case .multiplicacion:
            self.resultado = primerNumero * segundoNumero
        }
    }
}
