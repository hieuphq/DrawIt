//
//  Shape.swift
//  DrawIt
//
//  Created by Hieu Phan on 5/31/18.
//  Copyright © 2018 Hieu Phan. All rights reserved.
//

import UIKit

enum ShapeType {
    case line
    case rectangle
}
class Shape: Drawable {
    private var lines: [Line] = []
    private var color: UIColor
    
    var Color: UIColor {
        get {
            return self.color
        }
        set {
            self.color = newValue
        }
    }
    var Lines: [Line] {
        get{
            return self.lines
        }
        set{
            self.lines = newValue
        }
    }
    
    init(lines: [Line], color: UIColor) {
        self.lines = lines
        self.color = color
    }
    
    func remakeShape() {
        
    }
    
    func Draw(_ context: CGContext) {
        for l in self.lines {
            l.Draw(context)
        }
    }
}
