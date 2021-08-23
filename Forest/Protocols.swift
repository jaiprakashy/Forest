//
//  Protocols.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import UIKit

protocol Plottable {
    
}

protocol Drawable {
    var color: CGColor { get }
    var emoji: String { get }
}

protocol Moveable {
    var moveDistance: Int { get }
}
