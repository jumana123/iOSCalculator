//
//  Calculator.swift
//  NewCalculator
//
//  Created by Tahminur Rahman on 9/29/20.
//  Copyright © 2020 Jumana Rahman. All rights reserved.
//

import Foundation


class Calculator {
    
    var numShown: Double = 0
    var numStored: Double = 0
    var decimalClicked: Bool = false
    var decimalPlaceValue: Double = 10
    
    var opClicked = false
    var equalClicked = false
    var opToDo = ""
    
    
    func chooseNumber(num:Int) -> String{
        
        if opClicked {
            numShown = 0
            decimalPlaceValue = 10
            opClicked = false
            decimalClicked = false
        }
        if equalClicked {
            clear()
            numShown = 0
            numStored = 0
            decimalPlaceValue = 10
            decimalClicked = false
            opClicked = false
            opToDo = ""
        }
        if num != 19 && 0 < num && num < 11 && numShown.isInteger && !decimalClicked {
            numShown = numShown*10
            numShown += Double(num-1)
        }
        if num == 19 && numShown.isInteger{
            decimalClicked = !decimalClicked
        }
        if num != 19 && (!numShown.isInteger || decimalClicked){
            numShown = numShown + Double(num-1)/decimalPlaceValue
            decimalPlaceValue *= 10
        }
        return display()
    }

    func display() -> String {

        if decimalClicked {
            return "\(numShown)"
        } else {
            return "\(Int(numShown))"
        }
       
    }
    func chooseOperation(choose: Int) -> String {
        opClicked = true
        
        calculation()
        numStored = numShown
        if choose == 17 {
            opToDo = "+"
        }
        if choose == 16 {
            //numStored = numShown
            opToDo = "-"
        }
        if choose == 15 {
            //numStored = numShown
            opToDo = "x"
        }
        if choose == 14 {
            //numStored = numShown
            opToDo = "/"
        }
     
        return display()
    }
    func calculation() {
        
        if opToDo == "+" {
            add()
        }
        if opToDo == "-" {
            subtract()
        }
        if opToDo == "x" {
            multiply()
        }
        if opToDo == "/" {
            division()
        }
    }
    
    func add(){
        numShown = numShown + numStored
        numStored = numShown
    }
    func subtract(){
        if numStored != 0 {
            numShown = numStored - numShown
            numStored = numShown
        } else {
            numStored = numShown
        }
    }

    func division(){
        if numStored != 0 {
            numShown = numStored / numShown
            numStored = numShown
        } else {
            numStored = numShown
        }
    }

    func multiply(){
        if numStored != 0 {
            numShown = numShown * numStored
            numStored = numShown
        } else {
            numStored = numShown
        }
    }
    
    func clear() -> String {
        numShown = 0
        numStored = 0
        decimalPlaceValue = 10
        decimalClicked = false
        opClicked = false
        equalClicked = false
        opToDo = ""
        
        return display()
    }
    
    func invert() -> String {
        numShown = numShown * -1
        return display()
    }
    func percentify() -> String {
        numShown = numShown / 100.0
        if !numShown.isInteger {
            decimalClicked = true
        }
        print(numShown)
        return display()
    }
    
    func equal() -> String{
        equalClicked = true
        calculation()
        return display()
    }
    
}

extension FloatingPoint {
  var isInteger: Bool { return rounded() == self }
}
