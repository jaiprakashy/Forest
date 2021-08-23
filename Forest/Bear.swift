//
//  Bear.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import UIKit

struct Bear: Plottable, Drawable, Moveable {
    var color: CGColor = UIColor.bearColor.cgColor
    var emoji: String = "🧸"
    var moveDistance = 6
}
