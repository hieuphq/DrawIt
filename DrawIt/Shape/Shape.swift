//
//  Shape.swift
//  DrawIt
//
//  Created by Hieu Phan on 5/31/18.
//  Copyright © 2018 Hieu Phan. All rights reserved.
//

import Foundation

class Shape: Drawable {
    private var line: [Line] = []
    
    func Draw() {
        print("Draw a shape")
    }
}
