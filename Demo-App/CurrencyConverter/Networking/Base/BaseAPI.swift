//
//  BaseAPI.swift
//  Network Layer
//
//  Created by Abdeltwab on 12/20/20
//  Copyright © 2020 Abdeltwab. All rights reserved.
//

import Alamofire
import ObjectMapper

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Mappable>(target: T, responseClass: M.Type, completion:@escaping (M?, String?) -> Void) {
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.path ,parameters: params).response {  response in
            
            guard let statusCode = response.response?.statusCode else {
                completion(nil, response.error.debugDescription)
                return
            }
            if statusCode == 200 {
                guard let jsonResponse = try? response.result.get() else {
                    completion(nil, response.error.debugDescription)
                    return
                }
                do{
                    let jsonString =  try JSONSerialization.jsonObject(with: jsonResponse, options: []) as? [String:AnyObject]
                    guard let model = M(JSON: jsonString ?? [:], context: nil) else {
                        completion(nil,response.error.debugDescription)
                        return
                    }
                    completion(model,nil)
                }catch{
                    completion(nil,response.error.debugDescription)
                }
            } else {
                completion(nil, response.error.debugDescription)
                return
            }
        }
    }
    
    
    private func buildParams(task: Task) -> [String:Any] {
        switch task {
        case .requestParameters(parameters: let parameters):
            return parameters
        }
    }

}


