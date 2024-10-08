//
//  StatsAnimalViewController.swift
//  skil
//
//  Created by Usuario on 05/10/24.
//

import UIKit

class StatsViewController: UIViewController {

    // Outlets para las estadísticas
    @IBOutlet weak var atmPressureLabel: UILabel!
    @IBOutlet weak var windFlowLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var smokeSensorLabel: UILabel!
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var soundSensorLabel: UILabel!
    @IBOutlet weak var conservationInsightsLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    // Variables para recibir los datos
        var environmentalStats: EnvironmentalStats?
        var itemName: String?

        override func viewDidLoad() {
            super.viewDidLoad()

            // Asignar el nombre del ítem
            if let name = itemName {
                itemNameLabel.text = name
            }

            // Asegurarse de que environmentalStats no es nil antes de asignar los valores
            if let stats = environmentalStats {
                atmPressureLabel.text = stats.atmPressure.rawValue
                windFlowLabel.text = stats.windFlow.rawValue
                temperatureLabel.text = stats.temperature.rawValue
                humidityLabel.text = stats.humidity.rawValue
                smokeSensorLabel.text = stats.smokeSensor.rawValue
                movementLabel.text = stats.movementSensor.rawValue
                soundSensorLabel.text = stats.soundSensor.rawValue
                conservationInsightsLabel.text = stats.conservationInsights
            }
        }
    }
