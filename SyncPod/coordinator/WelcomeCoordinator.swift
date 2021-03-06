//
//  WelcomeCoordinator.swift
//  SyncPod
//
//  Created by 森篤史 on 2018/05/20.
//  Copyright © 2018年 Cyder. All rights reserved.
//

import UIKit

class WelcomeCoordinator: BaseCoordinator {
    private let window: UIWindow
    private let storyboard: UIStoryboard
    private var nowViewController: UIViewController

    init(window: UIWindow) {
        self.window = window
        self.storyboard = UIStoryboard(name: "Welcome", bundle: nil)
        self.nowViewController = storyboard.instantiateViewController(withIdentifier: "WelcomeView")
        if let welcomeVC = nowViewController as? WelcomeViewConstoller {
            let viewModel = WelcomeViewModel()
            viewModel.coordinator = self
            welcomeVC.viewModel = viewModel
        }
    }

    func start() {
        window.rootViewController = nowViewController
    }

    func navigateToSignIn() {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInView")
        nowViewController.present(viewController, animated: true, completion: nil)
        nowViewController = viewController
    }

    func navigateToSignUp() {
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignUpView")
        nowViewController.present(viewController, animated: true, completion: nil)
        nowViewController = viewController
    }
}
