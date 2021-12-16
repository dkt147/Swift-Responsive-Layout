//
//  TableCell.swift
//  DBDemoApp
//
//  Created by LinuxPlus on 6/29/21.
//  Copyright © 2021 LinuxPlus. All rights reserved.
//

import Foundation

import UIKit


class UserTable
{
    
    public var id: Int
    public var name: String
    public var email: String
    public var pass: String
    public var depart: String
    
    
    init(id: Int, name:String, email: String, pass: String, depart: String)
    {
        self.id = id
        self.name = name
        self.email = email
        self.pass = pass
        self.depart = depart

        
    }
}


