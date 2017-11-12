//
//  Router.swift
//  ResourceViewer
//
//  Created by Tarang Patel on 2017-11-12.
//  Copyright © 2017 Tarang Patel. All rights reserved.
//

import UIKit

protocol Router {
    func route(
        to routeID: String,
        from context: UIViewController,
        parameters: Any?
    )
}
