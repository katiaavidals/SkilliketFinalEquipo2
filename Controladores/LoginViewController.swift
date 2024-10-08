//
//  LoginViewController.swift
//  skil
//
//  Created by Usuario on 30/09/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
    }
    @IBAction func LoginClick(_ sender: Any) {
        let username = txtUser.text ?? ""
        let password = txtPassword.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            showAlert(message: "Por favor, ingresa tu usuario y contraseña.")
        } else {
            // Lógica para validar el inicio de sesión
            print("Intentando iniciar sesión con Usuario: \(username) y Contraseña: \(password)")
        }
    
    }
    
    // Función auxiliar para mostrar un alerta
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


