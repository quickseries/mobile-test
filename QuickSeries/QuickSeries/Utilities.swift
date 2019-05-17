//
//  Utilities.swift
//  QuickSeries
//
//  Created by Engineer 144 on 17/05/2019.
//

import Foundation
func underground(work: @escaping () -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
        work()
    }
}

func main(work: @escaping () -> ()) {
    DispatchQueue.main.async {
        work()
    }
}
