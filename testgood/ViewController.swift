//
//  ViewController.swift
//  testgood
//
//  Created by jcyangzh on 2023/10/7.
//

import UIKit

class ViewControllerB: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Presenting view controller is: \(String(describing: presentingViewController))")
    }
}

class ViewControllerA: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Present", style: .plain, target: self, action: #selector(presentAnotherViewController))
    }

    @objc func presentAnotherViewController() {
        let viewControllerB = ViewControllerB()
        let navigationControllerB = UINavigationController(rootViewController: viewControllerB)
        present(navigationControllerB, animated: true, completion: nil)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 设置背景颜色
        // 创建 ViewControllerA 实例
        let viewControllerA = ViewControllerA()
        
        // 创建 UINavigationController 实例并设置其根视图控制器为 viewControllerA
        let navigationControllerA = UINavigationController(rootViewController: viewControllerA)
        
        // 添加 navigationControllerA 作为子视图控制器
        addChild(navigationControllerA)
        
        // 将 navigationControllerA 的视图添加到当前视图
        view.addSubview(navigationControllerA.view)
        
        // 设置 navigationControllerA.view 的大小和位置（此处设置为与父视图相同）
        navigationControllerA.view.frame = view.bounds
        
        // 完成子视图控制器的添加
        navigationControllerA.didMove(toParent: self)
    }
}

