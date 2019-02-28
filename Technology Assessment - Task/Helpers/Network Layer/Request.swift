//
//  Request.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SVProgressHUD

struct APIEndpoints {
    static let baseURL = "http://api.nytimes.com"
    static let mostPopularArticlesApi = "/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key="
}

struct APIKey {
    static let ApiKey = "vptFPfBmXP5abn0o9oPW15GoVMl8hezn"
}

struct Request {
    
    static func requestMostPopularArticleData(url: String, completionHandler: @escaping(_ success: Bool, _ response: JSON?, _ error: Any?) -> Void) {
        
        SVProgressHUD.show()
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON {
            response in
            
           if response.result.isSuccess {
                if let jsonValue = response.result.value {
                    completionHandler(true, JSON(jsonValue), nil)
                }
                
            } else {
                completionHandler(false, nil, response.error?.localizedDescription)
            }
            
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
        
        
    }
    
    
}
