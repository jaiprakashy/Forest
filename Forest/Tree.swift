//
//  Tree.swift
//  Forest
//
//  Created by Jaiprakash Yadav on 21/08/21.
//

import UIKit

enum State {
    case seedling
    case mature
    case elder
}

struct Tree: Plottable, Drawable {
    var color: CGColor = UIColor.treeColor.cgColor
    let state: State
    let age: Int
    
    init() {
        self.age = 18
        self.state = .mature
    }
    
    init(state: State, age: Int) {
        self.state = state
        self.age = age
    }
}
