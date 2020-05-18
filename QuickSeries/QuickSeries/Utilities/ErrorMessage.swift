//
//  ErrorMessage.swift
//  QuickSeries
//
//  Created by Parth Patel on 14/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidRequest    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
