//
//  TodoItem.swift
//  IosCours3
//
//  Created by epita on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class ToDoItem {
    var itemName:String
    var completed:Bool
    var creationDate:Date
    var color : UIColor?
    init(itemName:String, color:UIColor) {
        self.itemName = itemName
        completed = false
        creationDate = Date()
        self.color = color
    } }
