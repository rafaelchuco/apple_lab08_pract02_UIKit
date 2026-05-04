//
//  ViewController.swift
//  apple_lab08_pract02_UIKit
//
//  Created by Jaime Gomez on 4/5/25.
//

import UIKit

class TeacherController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView?
    
    var profesores: [Profesor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teachers"
        
        cargarProfesores()
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    func cargarProfesores() {
        profesores = [
            Profesor(nombre: "Elliot Garamendi"),
            Profesor(nombre: "Hugo Torrico"),
            Profesor(nombre: "Jaime Farfan" ),
            Profesor(nombre: "Juan Leon"),
            Profesor(nombre: "Jaime Farfan"),
            Profesor(nombre: "Silvia Montoya"),
            Profesor(nombre: "Edwin Humberto"),
            Profesor(nombre: "Theobaldo Dias")
        ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profesores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let profesor = profesores[indexPath.row]
        
        cell.textLabel?.text = profesor.nombre
        
        return cell
    }

}

