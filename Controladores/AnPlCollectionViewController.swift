//  AnPlCollectionViewController.swift
//  skil
//
//  Created by Usuario on 04/10/24.
//

import UIKit
import Foundation

// MARK: - Protocolo Displayable
protocol Displayable {
    var name: String { get }
    var scientificName: String { get }
    var imageURL: String { get }
    var aboutMe: String { get }
    var environmentalStats: EnvironmentalStats { get }
}

// MARK: - Item (conformando al protocolo Displayable)
class Item: Codable, Displayable {
    let name, scientificName: String
    let imageURL: String
    let type: TypeEnum
    let aboutMe: String
    let environmentalStats: EnvironmentalStats

    enum CodingKeys: String, CodingKey {
        case name
        case scientificName = "scientific_name"
        case imageURL = "image_url"
        case type
        case aboutMe = "about_me"
        case environmentalStats = "environmental_stats"
    }

    init(name: String, scientificName: String, imageURL: String, type: TypeEnum, aboutMe: String, environmentalStats: EnvironmentalStats) {
        self.name = name
        self.scientificName = scientificName
        self.imageURL = imageURL
        self.type = type
        self.aboutMe = aboutMe
        self.environmentalStats = environmentalStats
    }
}

// MARK: - EnvironmentalStats
class EnvironmentalStats: Codable {
    let atmPressure: ATMPressure
    let windFlow: WindFlow
    let temperature: TemperatureEnum
    let humidity: Humidity
    let smokeSensor: SmokeSensor
    let movementSensor: MovementSensor
    let soundSensor: SoundSensor
    let conservationInsights: String

    enum CodingKeys: String, CodingKey {
        case atmPressure = "atm_pressure"
        case windFlow = "wind_flow"
        case temperature, humidity
        case smokeSensor = "smoke_sensor"
        case movementSensor = "movement_sensor"
        case soundSensor = "sound_sensor"
        case conservationInsights = "conservation_insights"
    }

    init(atmPressure: ATMPressure, windFlow: WindFlow, temperature: TemperatureEnum, humidity: Humidity, smokeSensor: SmokeSensor, movementSensor: MovementSensor, soundSensor: SoundSensor, conservationInsights: String) {
        self.atmPressure = atmPressure
        self.windFlow = windFlow
        self.temperature = temperature
        self.humidity = humidity
        self.smokeSensor = smokeSensor
        self.movementSensor = movementSensor
        self.soundSensor = soundSensor
        self.conservationInsights = conservationInsights
    }
}

// Unificar los EnumCases de animales y plantas
enum ATMPressure: String, Codable {
    case atm9001100HPa = "900 - 1100 hPa"
    case atm9501015HPa = "950 - 1015 hPa"
    case atm9501020HPa = "950 - 1020 hPa"
    case atm9501025HPa = "950 - 1025 hPa"
    case atm9601020HPa = "960 - 1020 hPa"
    case atm9801025HPa = "980 - 1025 hPa"
    case atm9701020HPa = "970 - 1020 hPa"
    case atm9701025HPa = "970 - 1025 hPa"
    case atm9601015HPa = "960 - 1015 hPa"
    case atm9901020HPa = "990 - 1020 hPa"
    case atm9901015HPa = "990 - 1015 hPa"
    case atm9401015HPa = "940 - 1015 hPa"
    case atm9801020HPa = "980 - 1020 hPa"
    case atm10001025HPa = "1000 - 1025 hPa"
}

enum WindFlow: String, Codable {
    case wind015KMH = "0 - 15 km/h"
    case wind05KMH = "0 - 5 km/h"
    case wind010KMH = "0 - 10 km/h"
    case wind210KMH = "2 - 10 km/h"
    case wind215KMH = "2 - 15 km/h"
    case wind510KMH = "5 - 10 km/h"
    case wind515KMH = "5 - 15 km/h"
    case wind520KMH = "5 - 20 km/h"
    case wind1025KMH = "10 - 25 km/h"
}

enum TemperatureEnum: String, Codable {
    case minus5C25C = "-5°C - 25°C"
    case temp5C25C = "5°C - 25°C"
    case temp5C30C = "5°C - 30°C"
    case temp0C20C = "0°C - 20°C"
    case temp10C15C = "-10°C - 15°C"
    case temp10C35C = "10°C - 35°C"
    case temp20C35C = "20°C - 35°C"
    case temp15C30C = "15°C - 30°C"
    case temp5C20C = "5°C - 20°C"
    case temp0C25C = "0°C - 25°C"
    case temp10C22C = "10°C - 22°C"
    case temp10C25C = "10°C - 25°C"
    case temp15C25C = "15°C - 25°C"
}

enum Humidity: String, Codable {
    case hum2575 = "25% - 75%"
    case hum3060 = "30% - 60%"
    case hum4070 = "40% - 70%"
    case hum5070 = "50% - 70%"
    case hum5080 = "50% - 80%"
    case hum6090 = "60% - 90%"
    case hum7090 = "70% - 90%"
    case hum6080 = "60% - 80%"
    case hum4060 = "40% - 60%"
}

enum SmokeSensor: String, Codable {
    case low = "Low"
    case normal = "Normal"
}

enum MovementSensor: String, Codable {
    case frequent = "Frequent"
    case moderate = "Moderate"
    case low = "Low"
}

enum SoundSensor: String, Codable {
    case lowToModerate = "Low to moderate"
    case moderateToHigh = "Moderate to high"
    case moderate = "Moderate"
    case high = "High"
    case low = "Low"
}

enum TypeEnum: String, Codable {
    case animal = "Animal"
    case insect = "Insect"
    case plant = "Plant"
    case tree = "Tree"
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var items: [Displayable] = []
    var isAnimalData: Bool = true // Control para cambiar entre animales y plantas

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout.invalidateLayout()
        print("viewDidLoad de CollectionViewController ejecutado")
    }

    func loadItemsFromServer() {
        let urlString = isAnimalData
            ? "http://martinmolina.com.mx/martinmolina.com.mx/reto_skiliket/Equipo2/animals.json"
            : "http://martinmolina.com.mx/martinmolina.com.mx/reto_skiliket/Equipo2/plantsFixed.json"
        
        print("Intentando cargar datos desde la URL: \(urlString)")

        DispatchQueue.main.async {
            self.items.removeAll() // Limpiar items antes de cargar nuevos datos
            self.collectionView.reloadData() // Recargar la vista vacía
            print("Items limpiados antes de la nueva carga")
        }
        
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error al obtener datos del servidor: \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Código de respuesta HTTP: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("Datos vacíos")
                return
            }

            do {
                let decoder = JSONDecoder()

                if self.isAnimalData {
                    let animalsData = try decoder.decode([String: [Item]].self, from: data)
                    if let animals = animalsData["animals"] {
                        DispatchQueue.main.async {
                            self.items = animals
                            self.collectionView.reloadData() // Recargar datos de animales
                            print("Animales cargados: \(self.items.count) elementos")
                        }
                    } else {
                        print("No se encontraron animales en el JSON.")
                    }
                } else {
                    let plantsData = try decoder.decode([String: [Item]].self, from: data)
                    if let plants = plantsData["plants"] {
                        DispatchQueue.main.async {
                            self.items = plants
                            self.collectionView.reloadData() // Recargar datos de plantas
                            print("Plantas cargadas: \(self.items.count) elementos")
                        }
                    } else {
                        print("No se encontraron plantas en el JSON.")
                    }
                }
            } catch {
                print("Error al decodificar el archivo JSON: \(error)")
            }
        }
        task.resume()
    }

    // Métodos del UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Número de ítems en la sección: \(items.count)")
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collectionView:cellForItemAt llamada para \(isAnimalData ? "Animals" : "Plants") en índice \(indexPath.row)")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        
        // Limpiar el contenido anterior antes de reutilizar la celda
        cell.itemImageView.image = UIImage(named: "placeholder_image")
        cell.itemNameLabel.text = ""

        let item = items[indexPath.row]
        
        cell.itemNameLabel.text = item.name
        print("Configurando celda con el nombre: \(item.name)")

        // Cargar la imagen de forma asíncrona
        if let imageUrl = URL(string: item.imageURL) {
            print("Intentando cargar imagen desde la URL: \(item.imageURL)")
            DispatchQueue.global().async {
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    DispatchQueue.main.async {
                        if let image = UIImage(data: imageData) {
                            cell.itemImageView.image = image
                            print("Imagen configurada para: \(item.name)")
                        } else {
                            print("Error: no se pudo crear la imagen desde los datos obtenidos para: \(item.name)")
                            cell.itemImageView.image = UIImage(named: "placeholder_image")
                        }
                    }
                } catch {
                    print("Error al cargar la imagen desde la URL: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        cell.itemImageView.image = UIImage(named: "placeholder_image")
                    }
                }
            }
        } else {
            print("URL de imagen inválida para: \(item.name)")
            cell.itemImageView.image = UIImage(named: "placeholder_image")
        }

        // Imprimir detalles adicionales de la celda
        print("Detalles de la celda en índice \(indexPath.row): \(item.name), scientificName: \(item.scientificName), Imagen cargada: \(cell.itemImageView.image == nil ? "No" : "Sí")")
        
        return cell
    }

    // Métodos adicionales para layout y espaciado
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 5
        let collectionViewSize = collectionView.frame.width - padding * 4
        let cellSize = collectionViewSize / 3
        return CGSize(width: cellSize, height: cellSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    // Método didSelectItemAt para manejar la selección de celdas
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Cuando se selecciona un elemento, se ejecuta el segue
        performSegue(withIdentifier: "showDetail", sender: self)
    }

    // Preparar el segue para pasar el item seleccionado al siguiente ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let destinationVC = segue.destination as? DetailViewController,
               let indexPath = collectionView.indexPathsForSelectedItems?.first {
                destinationVC.item = items[indexPath.row]
                print("Segue activado, pasando el ítem: \(items[indexPath.row].name)")
            }
        }
    }
}

// Clase personalizada para la celda
class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
}
