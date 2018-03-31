//
//  user.swift
//  hungrybruin
//
//  Created by Haochen Li on 3/30/18.
//  Copyright © 2018 Haochen Li. All rights reserved.
//

import Foundation

struct locR{
    var Loc:String
    var menue:[String]
}

struct request{
    var start:String
    var dest:String
    var food:String
    var ser:Bool
    var cus:Bool
}

class restaurant{
    var menueA:[String] = ["hamburger", "frenchfries", "milktea"] //Akerman
    var menueB:[String] = ["beef rice", "chicken rice"] //Northern Light
    var menueC:[String] = ["pasta", "pizza"] //Southern Light
    
    
    init(){}
    
    func show(loca:String)->Bool{
        let locRA = locR(Loc: "Akerman", menue: menueA)
        let locRB = locR(Loc:  "Northern Light", menue:menueB)
        let locRC = locR(Loc:  "Southern Light", menue:menueC)
        let loc:[locR] = [locRA,locRB,locRC]
        
        for location in loc {
            if loca == location.Loc{
                for food in location.menue{
                  print(food)
                }
              return true
            }
        }
        return false
    }
    func valid_food(food:String, loca:String)->Bool{
        let locRA = locR(Loc: "Akerman", menue: menueA)
        let locRB = locR(Loc:  "Northern Light", menue:menueB)
        let locRC = locR(Loc:  "Southern Light", menue:menueC)
        let loc:[locR] = [locRA,locRB,locRC]
        for location in loc {
            if loca == location.Loc{
                for fod in location.menue{
                    if food == fod{
                        return true
                    }
                }
            }
        }
        return false
    }
}

class user{
    var point: Int
    var name: String
    var location: String
    init(name: String, location: String, point:Int){
        self.name = name
        self.location = location
        self.point = point
    }
    func setName(name:String){
        self.name = name
    }
    func setloc(loc:String){
        self.location = loc
    }
    func task(){
    
    }
    func deduct(){
        point = point - 5
    }
    func add(){
       point = point + 10
    }
}

class server : user{
    var complete: Bool
    var failed: Bool
    init(name: String){
        failed = false
        complete = false
        super.init(name: name, location: "default", point: 0)
    }
       override func task() {
        while !complete || !failed{
            print("please confirm your service is delivered in the destination")
        }
        if complete{
            add()
        }
        else{
           deduct()
        }
    }
}

class customer : user{
    var complete: Bool
    var failed: Bool
    init(name: String){
        failed = false
        complete = false
        super.init(name: name, location: "default", point: 0)
    }
    func request1 (loc: String)-> String{
        let rest = restaurant.init()
        if rest.show(loca: loc) {
            return loc
        }
        return "default"
    }
    
    func request2 (food: String, loc:String)->request{
        let rest = restaurant.init()
        if rest.valid_food(food: food, loca: loc){
            return request(start:loc,dest:self.location,food:food,ser:false, cus:false)
        }
        self.failed = true
        return request(start:loc,dest:self.location,food:food, ser:false, cus:false)
    }

    override func task(){
        
        while !complete || !failed{
            print("please confirm your service is delivered in the destination")
        }
        if complete{
            deduct()};
    }
}

class account{
    var ser: server
    var cus: customer
    private var password: Int
    var mode: Bool
    var point: Int
    init(name : String, password: Int){
        mode = false
        ser = server.init(name: name)
        cus = customer.init(name: name)
        self.password = password
        self.point = 0
    }
    func setPoint(){
        if ser.point != cus.point{
            if mode == false{
            point = cus.point
            ser.point = cus.point
            }
            else{
            point = cus.point
            cus.point = ser.point
            }
        }
    }
    func setPass(pas: Int){
        password = pas
    }
    
}
