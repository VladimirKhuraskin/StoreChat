
import UIKit
import Firebase

class TabBarController: UITabBarController, UITabBarControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    self.delegate = self

    FirebaseApp.configure()

    UITabBar.appearance().tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let firstTab = CatalogViewController()
    firstTab.tabBarItem = UITabBarItem(title: "Catalog", image: UIImage(named: "shop"), tag: 0)
    
    let secondTab = ProfileViewController()
    secondTab.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user_male"), tag: 1)

    guard let user = Auth.auth().currentUser else { return }
    
    let thirdTab = NavigationController(ChannelsViewController(currentUser: user))
    thirdTab.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(named: "speech_buble"), tag: 2)

    let fourthTab = CartViewController()
    fourthTab.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(named: "shopping_cart"), tag: 3)

    self.viewControllers = [firstTab, secondTab, thirdTab, fourthTab]
  }

  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    print("Selected \(viewController.title!)")
  }

}
