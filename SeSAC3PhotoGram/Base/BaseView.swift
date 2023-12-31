//
//  BaseView.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        setConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() { }
    
    func setConstraints() { }
    
    
    
}
