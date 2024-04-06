//
//  SceneDelegate.swift
//  iTunesApp
//
//  Created by Madeline on 4/6/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemGray6
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        
        let vc1 = ViewController()
        let vc2 = ViewController()
        let vc3 = ViewController()
        let vc4 = ViewController()
        let vc5 = SearchViewController()
    
        vc1.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "book"), selectedImage: UIImage(named: "book.fill"))
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 2, right: 0)
        vc1.tabBarItem.tag = 0
        
        vc2.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller"), selectedImage: UIImage(systemName: "gamecontroller.fill"))
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 2, right: 0)
        vc2.tabBarItem.tag = 1
        
        vc3.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.fill"), selectedImage: UIImage(systemName: "square.stack.fill"))
        vc3.tabBarItem.tag = 2
        
        vc4.tabBarItem = UITabBarItem(title: "아케이드", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        vc4.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 2, right: 0)
        vc4.tabBarItem.tag = 3
        
        vc5.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        vc5.tabBarItem.imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: 2, right: 0)
        vc5.tabBarItem.tag = 4
        
        tabBarController.viewControllers = [vc1, vc2, vc3, vc4, vc5].map { UINavigationController(rootViewController: $0) }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

