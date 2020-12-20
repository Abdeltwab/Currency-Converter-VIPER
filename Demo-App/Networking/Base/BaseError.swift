//
//  Error.swift
//  Demo-App
//
//  Created by Abdeltwab on 12/21/20.
//

import Foundation

public enum BaseError: Error {
    case networkingError(erro: String)
    case test
}
