//
//  DateView.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/29.
//

import UIKit
import SnapKit

class DateView: BaseView {
    
    let picker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
        return view
    }()
    
    
    
    
    override func configureView() {
        addSubview(picker)
    }
 
    
    override func setConstraints() {
        picker.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    
    
    
    
}
