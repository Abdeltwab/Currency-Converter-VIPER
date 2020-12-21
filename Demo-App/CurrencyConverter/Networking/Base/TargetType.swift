//
//  TargetType.swift
//  Network Layer
//
//  Created by Abdeltwab on 12/20/20
//  Copyright © 2020 Abdeltwab. All rights reserved.
//


enum Task {
    case requestParameters(parameters: [String: Any])
}

protocol TargetType{
    
    var apiKey : String {get}
    
    var baseURL: String { get }
    
    var path: String { get }
        
    var task: Task { get }
}

