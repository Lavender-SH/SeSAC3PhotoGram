//
//  DateViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {
    
    
    let mainView = DateView()
    
    //Protocol  값 전달 2.
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Protocol  값 전달 3.
        delegate?.receiveData(date: mainView.picker.date)
        
    }
    
    
    
}
