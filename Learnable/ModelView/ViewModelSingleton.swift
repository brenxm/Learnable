//
//  ViewModelSingleton.swift
//  Learnable
//
//  Created by Bryan Mina on 7/7/24.
//

import Foundation

protocol SingletonViewModel {
    associatedtype ModelType: SingletonViewModel
    static var shared: ModelType { get set }
    
    // loadData
    // saveData
}
