//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/30.
//

import Foundation

class APIService {
    
    private init() { }
    
    static let shared = APIService() //인스턴스 생성 방지
    
    func callRequeset() {
        
        let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080")
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let value = String(data: data!, encoding: .utf8)
            print(value)
            print(data)
            print(response)
            print(error)
        }.resume()
        
    }
}
