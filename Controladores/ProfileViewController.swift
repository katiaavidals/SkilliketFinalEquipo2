//
//  ProfileViewController.swift
//  skil
//
//  Created by Usuario on 30/09/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Aquí podrías cargar la información del usuario desde una base de datos o servicio
        loadUserProfile()
    }
    
    func loadUserProfile() {
        // Simulación de carga de datos. Reemplaza estos valores con los datos reales del usuario.
        nameLabel.text = "Alfonso Reyes Olmos"
        emailLabel.text = "alfonso.reyes@gmail.com"
        passwordLabel.text = "********"
        addressLabel.text = "Carlota 26. Avenida del Imán"
        profileImageView.image = UIImage(named: "default_profile_image") // Reemplaza con la imagen real del usuario
    }
    
    @IBAction func changePasswordTapped(_ sender: Any) {

    }
    @IBAction func changeCityTapped(_ sender: Any) {

    }

    @IBAction func logoutTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
