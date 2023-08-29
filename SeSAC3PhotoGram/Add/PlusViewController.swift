//
//  PlusViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

import UIKit

class PlusViewController: BaseViewController {
    
    let textField2 = {
        let view = UITextField()
        view.placeholder = "오늘 좋니?"
        view.backgroundColor = .lightGray
        return view
    }()
    
    var dataPass: ((String) -> Void)?
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textField2)
    }
    override func setConstraints() {
        textField2.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(250)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Closure - 2
        dataPass?(textField2.text!)
        
        
    }

    
    
    
    
    
    
}


    

