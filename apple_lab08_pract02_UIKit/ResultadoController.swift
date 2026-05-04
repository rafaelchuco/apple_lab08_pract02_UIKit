//
//  ResultadoController.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Rafael on 4/5/26.
//

import UIKit

class ResultadoController: UIViewController {
    
    @IBOutlet weak var operacionLabel: UILabel?
    @IBOutlet weak var primerNumeroLabel: UILabel?
    @IBOutlet weak var segundoNumeroLabel: UILabel?
    @IBOutlet weak var resultadoLabel: UILabel?
    @IBOutlet weak var nuevoCalculoButton: UIButton?
    
    var calculo: Calculo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Result"
        
        mostrarResultados()
        configurarBotones()
    }
    
    func mostrarResultados() {
        guard let calculo = calculo else { return }
        
        operacionLabel?.text = calculo.operacion.rawValue
        primerNumeroLabel?.text = String(Int(calculo.primerNumero))
        segundoNumeroLabel?.text = String(Int(calculo.segundoNumero))
        resultadoLabel?.text = String(Int(calculo.resultado))
    }
    
    func configurarBotones() {
        nuevoCalculoButton?.setTitle("New Calculation", for: .normal)
    }
    
    @IBAction func nuevoCalculoTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
