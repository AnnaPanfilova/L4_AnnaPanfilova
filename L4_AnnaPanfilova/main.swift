//
//  main.swift
//  L4_AnnaPanfilova
//
//  Created by Anna on 28.07.2020.
//  Copyright © 2020 Anna. All rights reserved.
//

import Foundation

enum Color {
    case red, blue, pink, magenta, yellow, violet
}

enum CarManipulations {
    case srartEngine, stopEngine, openWindow, closeWindow, putToTrunk(volume: Double), getFromTrunk(volume: Double), changeColor(color: Color), hingRoof, unhingRoof, switchOnNitro, switchOffNitro, attachTrailer, detachTrailer, raiseMiddleWheel, downMiddleWheel
}

class Car {
    let brand: String
    let model: String
    var color: Color
    let volume: Double
    let buildYear: Int
    let trunkSize: Double
    var engineStarted: Bool
    var windowOpened: Bool
    var trunkSizeUsed: Double
    
    init(brand: String, model: String, color: Color, volume: Double, buildYear: Int, trunkSize: Double, engineStarted: Bool, windowOpened: Bool, trunkSizeUsed: Double) {

        self.brand = brand
        self.model = model
        self.color = color
        self.volume = volume
        self.buildYear = buildYear
        self.trunkSize = trunkSize
        self.engineStarted = engineStarted
        self.windowOpened = windowOpened
        self.trunkSizeUsed = trunkSizeUsed

    }

    func manipulateCar(manipulation: CarManipulations) {
    }
    
    func printParams() {
        print(self)
    }
}


class SportCar: Car {
    var roofHinged: Bool
    var nitroSwitchedOn: Bool
    
    init(brand: String, model: String, color: Color, volume: Double, buildYear: Int, trunkSize: Double, engineStarted: Bool, windowOpened: Bool, trunkSizeUsed: Double, roofHinged: Bool, nitroSwitchedOn: Bool) {
        
        self.roofHinged = roofHinged
        self.nitroSwitchedOn = nitroSwitchedOn
        
        super.init(brand: brand, model: model, color: color, volume: volume, buildYear: buildYear, trunkSize: trunkSize, engineStarted: engineStarted, windowOpened: windowOpened, trunkSizeUsed: trunkSizeUsed)
        

    }
}

class TrackCar: Car {
    var trailerAttached: Bool
    var middleWheelRaised: Bool
    
     init(brand: String, model: String, color: Color, volume: Double, buildYear: Int, trunkSize: Double, engineStarted: Bool, windowOpened: Bool, trunkSizeUsed: Double, trailerAttached: Bool, middleWheelRaised: Bool) {

         self.trailerAttached = trailerAttached
         self.middleWheelRaised = middleWheelRaised
        
         super.init(brand: brand, model: model, color: color, volume: volume, buildYear: buildYear, trunkSize: trunkSize, engineStarted: engineStarted, windowOpened: windowOpened, trunkSizeUsed: trunkSizeUsed)
         

     }
    
    override func manipulateCar(manipulation: CarManipulations) {
        
        switch manipulation {
            
        case .srartEngine:
            engineStarted = true
        case .stopEngine:
            engineStarted = false
        case .openWindow:
            windowOpened = true
        case .closeWindow:
            windowOpened = false
        case .putToTrunk(volume: let volume):
            if trunkSize <= trunkSizeUsed + volume {
                trunkSizeUsed += volume
            }
        case .getFromTrunk(volume: let volume):
            if trunkSizeUsed >= volume {
                trunkSizeUsed -= volume
            }
        case .changeColor(color: let color):
            self.color = color
        case .attachTrailer:
            trailerAttached = true
        case .detachTrailer:
            trailerAttached = false
        case .raiseMiddleWheel:
            middleWheelRaised = true
        case .downMiddleWheel:
            middleWheelRaised = false
        default:
            break;
        }
    }
}
