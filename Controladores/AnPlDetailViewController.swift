//
//  AnimalDetailViewController.swift
//  skil
//
//  Created by Usuario on 05/10/24.
//
import UIKit

class DetailViewController: UIViewController {

    // Outlets para los componentes visuales
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var scientificNameLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!

    // Variable para recibir el objeto que conforme a Displayable
    var item: Displayable?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Verificar que el objeto Displayable no es nil antes de asignar los valores
        if let item = item {
            // Cargar la imagen de forma asíncrona
            if let imageUrl = URL(string: item.imageURL) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            self.itemImageView.image = UIImage(data: imageData)
                        }
                    } else {
                        print("Error al cargar la imagen desde la URL.")
                    }
                }
            }

            // Asignar el resto de la información
            itemTypeLabel.text = (item as? Item)?.type.rawValue // Si la entidad tiene un tipo, lo muestra
            itemNameLabel.text = item.name
            scientificNameLabel.text = item.scientificName
            aboutMeLabel.text = item.aboutMe
        }
    }

    // Acción para el botón de estadísticas
    @IBAction func showEnvironmentalStats(_ sender: Any) {
        performSegue(withIdentifier: "showStats", sender: self)
    }

    // Método para preparar el segue y pasar las estadísticas ambientales
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStats" {
            if let destinationVC = segue.destination as? StatsViewController {
                destinationVC.environmentalStats = item?.environmentalStats
                destinationVC.itemName = itemNameLabel.text
                
            }
        }
    }
}
