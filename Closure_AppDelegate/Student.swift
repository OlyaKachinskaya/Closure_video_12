//
//  Student.swift
//  Closure_AppDelegate
//
//  Created by Оля Качинская on 17.03.2021.
//
import UIKit

class Student: NSObject {
    let Name: String
    let LastName: String
    let temperature: Float
    let bloodPressure: Int
    
    var closure: (Student) -> ()
    
    var FullName: String {
        return LastName + " " + Name
    }
    
    init(name: String, lastName: String, temp: Float, bloodPressure: Int) {
        self.Name = name
        self.LastName = lastName
        self.temperature = temp
        self.bloodPressure = bloodPressure
        
        self.closure = {
            (student: Student) in
            print("клоужер не реализован")
        }

        //задать задержку
        super.init()
        perform(#selector(howYouFeelSuperman), with: nil, afterDelay: Double.random(in: 5..<15))
    }
    
    //метод для задания мастер
   @objc func howYouFeel(medication: (Student) -> () ) {
    if self.temperature > 37 || self.bloodPressure > 120 {
        print("\(self.Name) feels bad!")
        medication(self)
    }
    else{
        print("\(self.Name) fells good!")
    }
}
    //метод для задания супермен
    @objc func howYouFeelSuperman() {
        if self.temperature > 37 || self.bloodPressure > 120 {
            print("\(self.Name) feels bad!")
            closure(self)
        }
        else{
            print("\(self.Name) fells good!")
        }
    }
    
    func takePill(){
        print("\(self.Name) drank a pill")
    }
    
    func giveInjection() {
        print("\(self.Name) got an injection")
    }
}
