//
//  ResourcesDetailViewModel.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import Foundation

protocol ResourcesDetailVMProtocol {
    
    var resource: Resource! { get }
}

class ResourcesDetailViewModel: ResourcesDetailVMProtocol {
    
    var resource: Resource!
    
    init(with resource: Resource) {
        self.resource = resource
    }
    
}
