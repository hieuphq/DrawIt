//
//  Line.swift
//  DrawIt
//
//  Created by Hieu Phan on 5/31/18.
//  Copyright © 2018 Hieu Phan. All rights reserved.
//

import Foundation
import UIKit

class Line: Drawable {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    var startX: CGFloat {
        get {
            return start.x
        }
    }
    
    var startY: CGFloat {
        get {
            return start.y
        }
    }
    
    var endX: CGFloat {
        get {
            return end.x
        }
    }
    
    var endY: CGFloat {
        get {
            return end.y
        }
    }
    
    init(start _start: CGPoint, end _end: CGPoint, color _color: UIColor) {
        start = _start
        end = _end
        color = _color
    }
    
    func Draw() {
        print("Draw a line")
    }
}
