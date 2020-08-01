//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Jagdeep Matharu on 2020-08-01.
//  Copyright © 2020 jmatharu. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func  firstIndex(matching item: Element) -> Int? {
        var index: Int? 
        for i in 0..<self.count where self[i].id == item.id {
             index = i
        }
        return index
    }
}
