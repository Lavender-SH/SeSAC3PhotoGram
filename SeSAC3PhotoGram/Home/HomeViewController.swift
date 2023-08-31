//
//  HomeViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/31.
//
import UIKit

class HomeViewController: BaseViewController {
    override func loadView() {
        let view = HomeView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self,#function)
        

    }
    deinit {
        print(self,#function)
    }


}

extension HomeViewController: HomeViewProtocol {
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        print("popped")
        navigationController?.popViewController(animated: true)
    }
}

