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
    let state: State
    let age: Int
    
    var emoji: String {
        switch state {
        case .seedling:
            return "🌱"
        case .mature:
            return "🌴"
        case .elder:
            return "🌲"
        }
    }
    
    var color: CGColor {
        switch state {
        case .seedling:
            return UIColor.seedlingColor.cgColor
        case .mature:
            return UIColor.matureTreeColor.cgColor
        case .elder:
            return UIColor.elderTreeColor.cgColor
        }
    }
    
    var seedlingSpawnChance: Float {
        switch state {
        case .seedling:
            return 0
        case .mature:
            return 0.1
        case .elder:
            return 0.2
        }
    }
    
    var wood: Int {
        switch state {
        case .seedling:
            return 0
        case .mature:
            return 1
        case .elder:
            return 2
        }
    }
    
    var shouldSpawnSeedling: Bool {
        let randomSpawn = Float.random(in: 0 ..< 1.0)
        return randomSpawn < seedlingSpawnChance
    }
    
    init() {
        self.age = 18
        self.state = .mature
    }
    
    init(state: State, age: Int) {
        self.state = state
        self.age = age
    }
}
