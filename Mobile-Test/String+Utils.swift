//
//  String+Utils.swift
//  Mobile-Test
//
//  Created by Chris Comeau on 2020-05-20.
//  Copyright © 2020 Skyriser Media. All rights reserved.
//

import Foundation

extension String {
	
	public func stripHTML() -> String {
		return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
	}
}
