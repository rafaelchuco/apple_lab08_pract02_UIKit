//
//  CalculatorControllerViewController.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Jaime Gomez on 4/5/25.
//

import UIKit

class CalculatorController: UIViewController {
    
    @IBOutlet weak var primerNumeroTextField: UITextField?
    @IBOutlet weak var segundoNumeroTextField: UITextField?
    @IBOutlet weak var operacionSegmentedControl: UISegmentedControl?
    @IBOutlet weak var calcularButton: UIButton?
    
    var calculoActual: Calculo?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calculator"
        
        configurarUI()
    }
    
    func configurarUI() {
        // Configurar segmented control
        if operacionSegmentedControl?.numberOfSegments == 0 {
            operacionSegmentedControl?.insertSegment(withTitle: "Addition (+)", at: 0, animated: false)
            operacionSegmentedControl?.insertSegment(withTitle: "Subtraction (-)", at: 1, animated: false)
            operacionSegmentedControl?.insertSegment(withTitle: "Multiplication (×)", at: 2, animated: false)
            operacionSegmentedControl?.selectedSegmentIndex = 0
        }
        
        // Valores por defecto
        primerNumeroTextField?.text = "0"
        segundoNumeroTextField?.text = "0"
    }
    
    @IBAction func calcularTapped(_ sender: UIButton) {
        guard let primerTexto = primerNumeroTextField?.text,
              let segundoTexto = segundoNumeroTextField?.text,
              let primerNum = Double(primerTexto),
              let segundoNum = Double(segundoTexto) else {
            mostrarAlerta(mensaje: "Por favor ingresa números válidos")
            return
        }
        
        let operacionIndex = operacionSegmentedControl?.selectedSegmentIndex ?? 0
        let operacion: Calculo.Operacion
        
        switch operacionIndex {
        case 0:
            operacion = .suma
        case 1:
            operacion = .resta
        case 2:
            operacion = .multiplicacion
        default:
            operacion = .suma
        }
        
        calculoActual = Calculo(primerNumero: primerNum, segundoNumero: segundoNum, operacion: operacion)
        
        mostrarResultados()
    }
    
    func mostrarResultados() {
        guard let calculo = calculoActual else { return }
        
        let resultadoViewController = ResultadoController()
        resultadoViewController.calculo = calculo
        
        navigationController?.pushViewController(resultadoViewController, animated: true)
    }
    
    func mostrarAlerta(mensaje: String) {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default))
        present(alerta, animated: true)
    }

}
