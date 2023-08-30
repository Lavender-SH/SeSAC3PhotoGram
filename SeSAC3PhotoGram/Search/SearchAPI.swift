//
//  SearchAPI.swift
//  SeSAC3PhotoGram
//
//  Created by 이승현 on 2023/08/30.
//

import Foundation
import Alamofire

struct PhotoURL: Codable {
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Result: Codable {
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case urls
    }
}

struct Urls: Codable {
    let raw: String
    
    enum CodingKeys: String, CodingKey {
        case raw
    }
}

class SearchPhotoAPI {
    
    static let shared = SearchPhotoAPI()
    
    private init() { }
    
    func callRequest(query: String, completionHandler: @escaping ([String]) -> Void) {
        
        let url = "https://api.unsplash.com/search/photos?query=\(query)&client_id=6B9EhgPQrTOKAb-xfd5Ei1G7L9xK017VQcupdvjlmV0"
        
        AF.request(url, method: .get).validate().responseDecodable(of: PhotoURL.self){response in
            switch response.result {
            case .success(let value):
                let rawUrls = value.results.map { $0.urls.raw }
                completionHandler(rawUrls)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}



