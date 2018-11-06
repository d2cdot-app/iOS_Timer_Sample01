//
//  URLSessionGetClient.swift
//  MyTimer
//
//  Created by 山本 沙季 on 2018/11/06.
//  Copyright © 2018年 山本 沙季. All rights reserved.
//

import Foundation
import PlaygroundSupport

class URLSessionGetClient {
    
    func get(url urlString: String, queryItems: [URLQueryItem]? = nil) {
        var compnents = URLComponents(string: urlString)
        compnents?.queryItems = queryItems
        let url = compnents?.url
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data, let response = response {
                print(response)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print("Serialize Error")
                }
            } else {
                print(error ?? "Error")
            }
        }
        
        task.resume()
    }
    
}

