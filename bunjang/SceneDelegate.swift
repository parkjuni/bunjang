//
//  SceneDelegate.swift
//  bunjang
//
//  Created by JUNI on 2022/09/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var isLogin :Bool = false

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
               let storyboard = UIStoryboard(name: "Onboarding", bundle: nil) // onboarding.storyboard 가져오기
               
               if isLogin == false {
                   // 로그인 안된 상태
                   guard let loginVC = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as? OnboardingViewController else { return }
                   window?.rootViewController = loginVC
               } else {
                   // 로그인 된 상태
                   guard let mainVC = storyboard.instantiateViewController(withIdentifier: "Main") as? MainViewController else { return }
                   window?.rootViewController = mainVC
               }


        guard let _ = (scene as? UIWindowScene) else { return }
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

//
//extension SceneDelegate {
//    private func setRootViewController(_ scene: UIScene){
//        if Storage.isFirstTime() {
//            setRootViewController(scene, name: "Onboarding",
//                                  identifier: "OnboardingViewController")
//        } else {
//            setRootViewController(scene, name: "Main",
//                                  identifier: "TodoViewController")
//        }
//    
//        setRootViewController(scene, name: "Onboarding",
//                                         identifier: "OnboardingViewController")
//    }
//
//}

