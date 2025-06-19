import UIKit

public extension UIWindow {
    
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(with: rootViewController)
        }
        return nil
    }
    
    private static func getVisibleViewControllerFrom(with viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController,
           let visibleController = navigationController.visibleViewController {
            return UIWindow.getVisibleViewControllerFrom(with: visibleController)
        } else if let tabBarController = viewController as? UITabBarController,
                  let selectedTabController = tabBarController.selectedViewController {
            return UIWindow.getVisibleViewControllerFrom(with: selectedTabController)
        } else {
            if let presentedViewController = viewController.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(with: presentedViewController)
            } else {
                return viewController
            }
        }
    }
}
