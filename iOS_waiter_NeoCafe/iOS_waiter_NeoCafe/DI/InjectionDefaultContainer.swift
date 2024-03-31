//
//  InjectionDefaultContainer.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Factory

typealias InjectionDefaultContainer = Container
typealias InjectionFactory = Factory
typealias InjectionInjected = Injected

extension InjectionDefaultContainer {
    
    var networkService: InjectionFactory<NetworkServiceProtocol> {
        self { NetworkService() }
    }
}
