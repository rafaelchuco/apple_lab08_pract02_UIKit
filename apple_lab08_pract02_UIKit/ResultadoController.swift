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
        
        // ✅ Símbolo dinámico según la operación
        let simbolo: String
        
        switch calculo.operacion {
        case .suma:
            simbolo = "+"
        case .resta:
            simbolo = "-"
        case .multiplicacion:
            simbolo = "×"
        }
        
        let mensaje = "\(Int(calculo.primerNumero)) \(simbolo) \(Int(calculo.segundoNumero)) = \(Int(calculo.resultado))"
        
        let actividadVC = UIActivityViewController(activityItems: [mensaje], applicationActivities: nil)
        present(actividadVC, animated: true)
    }
    
    @IBAction func nuevoCalculoTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
