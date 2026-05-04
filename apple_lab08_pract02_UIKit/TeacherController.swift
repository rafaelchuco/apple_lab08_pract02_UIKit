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
            Profesor(nombre: "John Doe", departamento: "Mathematics", iniciales: "JD", color: UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)),
            Profesor(nombre: "Anna Smith", departamento: "Physics", iniciales: "AS", color: UIColor(red: 1.0, green: 0.84, blue: 0.6, alpha: 1.0)),
            Profesor(nombre: "Robert Johnson", departamento: "Chemistry", iniciales: "RJ", color: UIColor(red: 0.8, green: 1.0, blue: 0.8, alpha: 1.0)),
            Profesor(nombre: "Maria Brown", departamento: "Biology", iniciales: "MB", color: UIColor(red: 0.9, green: 0.85, blue: 1.0, alpha: 1.0)),
            Profesor(nombre: "David Wilson", departamento: "History", iniciales: "DW", color: UIColor(red: 1.0, green: 0.8, blue: 0.85, alpha: 1.0)),
            Profesor(nombre: "Emily Garcia", departamento: "English", iniciales: "EG", color: UIColor(red: 0.9, green: 0.85, blue: 1.0, alpha: 1.0)),
            Profesor(nombre: "Thomas Martinez", departamento: "Computer Science", iniciales: "TM", color: UIColor(red: 0.8, green: 1.0, blue: 1.0, alpha: 1.0)),
            Profesor(nombre: "Laura Taylor", departamento: "Art", iniciales: "LT", color: UIColor(red: 1.0, green: 0.9, blue: 0.7, alpha: 1.0))
        ]
    }
    
    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profesores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let profesor = profesores[indexPath.row]
        
        cell.textLabel?.text = profesor.nombre
        cell.detailTextLabel?.text = profesor.departamento
        
        return cell
    }

}

