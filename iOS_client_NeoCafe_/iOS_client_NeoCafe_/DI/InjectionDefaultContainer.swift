//
//  InjectionDefaultContainer.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 4/2/24.

import Factory

typealias InjectionDefaultContainer = Container
typealias InjectionFactory = Factory
typealias InjectionInjected = Injected

extension InjectionDefaultContainer {
    var networkService: InjectionFactory<NetworkServiceProtocol> {
        self { NetworkService() }
    }
}
