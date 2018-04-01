//
//  requestHandler.swift
//  HungryBruins
//
//  Created by Haochen Li on 3/31/18.
//  Copyright © 2018 LA_HACKS. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase


class requestHandler {
    init(){}
    var requestedRef: DatabaseReference{
        return Database.database().reference()
    }
    func request(msg: String){
        requestedRef.childByAutoId().setValue(msg)
    }
}
