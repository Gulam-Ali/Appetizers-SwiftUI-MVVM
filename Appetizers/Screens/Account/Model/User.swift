//
//  User.swift
//  Appetizers
//
//  Created by Gulam Ali on 06/07/24.
//

import Foundation

struct User: Codable {
    var firstname = ""
    var lastname = ""
    var email = ""
    var dateObject = Date()
    var extraNapkinBool = true
    var extraRefills = false
}
