import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    // Esta función se activa cuando seleccionas un ítem del TabBar
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let selectedIndex = tabBar.items?.firstIndex(of: item) {
            // Agregamos un print para ver cuál ítem fue seleccionado
            print("Ítem seleccionado en el TabBar: \(item.title ?? "Sin título"), índice: \(selectedIndex)")
            
            switch selectedIndex {
            case 1: // PLANTS
                reloadPlantsData() // Recargar siempre los datos de plantas
            case 2: // ANIMALS
                reloadAnimalsData() // Recargar siempre los datos de animales
            default:
                break
            }
        }
    }

    // Función para recargar los datos de "Plants" cada vez que se selecciona
    func reloadPlantsData() {
        if let navController = viewControllers?[1] as? UINavigationController,
           let collectionVC = navController.viewControllers.first as? CollectionViewController {
            collectionVC.isAnimalData = false
            collectionVC.loadItemsFromServer() // Recargar datos de plantas
        }
    }

    // Función para recargar los datos de "Animals" cada vez que se selecciona
    func reloadAnimalsData() {
        if let navController = viewControllers?[2] as? UINavigationController,
           let collectionVC = navController.viewControllers.first as? CollectionViewController {
            collectionVC.isAnimalData = true
            collectionVC.loadItemsFromServer() // Recargar datos de animales
        }
    }
}
