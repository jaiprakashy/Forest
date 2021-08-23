//
//  Woodcutter.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import UIKit

struct Woodcutter: Plottable, Drawable, Moveable {
    var color: CGColor = UIColor.woodcutterColor.cgColor
    var emoji: String = "🧑🏼‍🚒"
    var moveDistance = 3
}
