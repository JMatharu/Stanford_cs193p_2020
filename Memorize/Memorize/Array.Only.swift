//
//  Array.Only.swift
//  Memorize
//
//  Created by Jagdeep Matharu on 2020-08-01.
//  Copyright © 2020 jmatharu. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
