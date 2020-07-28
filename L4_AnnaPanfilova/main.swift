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
        print("brand: \(brand), model: \(model), color: \(color), volume: \(volume), buildYear: \(buildYear), trunkSize: \(trunkSize), engineStarted: \(engineStarted), windowOpened: \(windowOpened), trunkSizeUsed: \(trunkSizeUsed)")
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
    
    override func printParams() {
        print("roofHinged: \(roofHinged), nitroSwitchedOn: \(nitroSwitchedOn)")
        super.printParams()
    }
}

class TrunkCar: Car {
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
    
    override func printParams() {
        print("trailerAttached: \(trailerAttached), middleWheelRaised: \(middleWheelRaised)")
        super.printParams()
    }
}


var maz = TrunkCar(brand: "MAZ", model: "456", color: .blue, volume: 6.0, buildYear: 2000, trunkSize: 12.0, engineStarted: false, windowOpened: false, trunkSizeUsed: 6.0, trailerAttached: false, middleWheelRaised: false)

var kamaz = TrunkCar(brand: "KAMAZ", model: "1102", color: .red, volume: 6.5, buildYear: 2005, trunkSize: 16.0, engineStarted: false, windowOpened: false, trunkSizeUsed: 0.0, trailerAttached: true, middleWheelRaised: false)

var lada = SportCar(brand: "VAZ", model: "Kalina Sport", color: .yellow, volume: 2.0, buildYear: 2018, trunkSize: 0.5, engineStarted: true, windowOpened: true, trunkSizeUsed: 0.05, roofHinged: true, nitroSwitchedOn: false)

var ferrari = SportCar(brand: "Ferrari", model: "Portofino", color: .magenta, volume: 5.0, buildYear: 2019, trunkSize: 0.3, engineStarted: true, windowOpened: true, trunkSizeUsed: 0.01, roofHinged: false, nitroSwitchedOn: false)

maz.manipulateCar(manipulation: .attachTrailer)
lada.manipulateCar(manipulation: .hingRoof)
kamaz.manipulateCar(manipulation: .downMiddleWheel)
ferrari.manipulateCar(manipulation: .switchOnNitro)

maz.printParams()
lada.printParams()
kamaz.printParams()
ferrari.printParams()
