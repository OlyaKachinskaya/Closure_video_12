//
//  AppDelegate.swift
//  Closure_AppDelegate
//
//  Created by Оля Качинская on 17.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // массив для студентов, имен, фамилий, температуры и давления
    var studentsList: [Student] = []
    var studentsNames = ["Vova", "Kate", "Nikita", "Hanna", "Valera"]
    var studentsLastNames = ["Wilson", "Moore", "Anderson", "Smith", "Moore"]
    var arrayOfTemperature: [Float] = [37.5, 36.6, 39.8, 40.5, 36.3]
    var arrayOfPressure: [Int] = [110, 140, 100, 122, 160]

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //ученик
        let testClosure1 = {
            print("testClosure1")
        }
        testClosure1()
        
        //получает на вход строку
        let testClosure2 = {
            (string: String) in print(string)
        }
        testClosure2("hello")
        
        //получает на вход int и возвращет bool
        let testClosure3 = {
            (valueInt: Int) -> Bool in return valueInt > 3
        }
        let valueBool = testClosure3(5)
        print(valueBool)
        
        //метод, принимающий клоужер
        func displayValueGreaterThan4(listNumbers: [Int], closure:((Int) -> Bool)) {
            for number in listNumbers{
                if closure(number) == true{
                    print(number)
                }
            }
        }
        
        //вызов метода, принимающий клоужер
        displayValueGreaterThan4(listNumbers: [2,4,5,7,3,9], closure:{$0 > 4})


        //студент
        for i in 0...studentsNames.count - 1{
            let student = Student(name: studentsNames[i], lastName: studentsLastNames[i], temp: arrayOfTemperature[i], bloodPressure: arrayOfPressure[i])
            studentsList.append(student)
        }
        
        //сортировка массива и вывод отсортированного массива
        let sortedStudentList = studentsList.sorted {
            (student1: Student, student2: Student) -> Bool in
            return student1.FullName < student2.FullName
        }
        for student in sortedStudentList{
            print(student.FullName)
        }

        //мастер
        let medication = {
            (patient: Student) in
            switch patient.temperature {
            case 37...39:
                print("\(patient.Name) has a temperature below 40! The patient needs to take a pill!")
                patient.takePill()
            case 39...41:
                print("\(patient.Name) has a temperature above 40! The patient needs to get an injection!")
                patient.giveInjection()
            default:
                print("\(patient.Name) hasn't temperature")
            }
            switch patient.bloodPressure {
            case 120...:
                print("\(patient.Name) has hight blood pressure! The patient needs to take a pill!")
                patient.takePill()
            case ...99:
                print("\(patient.Name) has low blood pressure! The patient needs to take a pill!")
                patient.takePill()
            default:
                print("\(patient.Name)'s blood pressure is normal")
            }
        }

        for student in studentsList{
            student.howYouFeel(medication: medication)
        }
        
        //супермен
        for student in studentsList{
            student.closure = medication
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

