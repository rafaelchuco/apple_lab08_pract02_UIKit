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
    @IBOutlet weak var compartirButton: UIButton?
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
        compartirButton?.setTitle("Share", for: .normal)
        nuevoCalculoButton?.setTitle("New Calculation", for: .normal)
    }
    
    @IBAction func compartirTapped(_ sender: UIButton) {
        guard let calculo = calculo else { return }
        
        let mensaje = "\(Int(calculo.primerNumero)) \(obtenerSimbolo(calculo.operacion)) \(Int(calculo.segundoNumero)) = \(Int(calculo.resultado))"
        
        let actividadViewController = UIActivityViewController(activityItems: [mensaje], applicationActivities: nil)
        present(actividadViewController, animated: true)
    }
    
    @IBAction func nuevoCalculoTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func obtenerSimbolo(_ operacion: Calculo.Operacion) -> String {
        switch operacion {
        case .suma:
            return "+"
        case .resta:
            return "-"
        case .multiplicacion:
            return "×"
        }
    }
}
