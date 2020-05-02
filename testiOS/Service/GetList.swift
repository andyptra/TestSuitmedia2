//
//  GetList.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation

class GetList: Service {
    static let shared =  GetList()
    
    func getListData(page : Int, per_page : Int, completion: @escaping (Data?, Error?) -> Void) {
        let url = baseApiUrl + "users?page=\(page)&per_page=\(per_page)"
        get(url) { (result, error) in
            completion(result, error)
        }
    }
}
