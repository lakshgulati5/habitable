//
//  Task.swift
//  Habitable
//
//  Created by Laksh Gulati on 5/28/22.
//

import Foundation


public struct Task : Comparable, CustomStringConvertible {
    public var description: String {
        return name 
    }
    public init(name : String, quantity : Int?, group : Group?)
    {
        self.name = name
        self.group = group
    }
    
    public static func < (lhs: Task, rhs: Task) -> Bool {
        //return lhs.dueDate < rhs.dueDate
        return lhs.name < rhs.name
    }
    
    //all public for sake of testing, adjust later
    public let name : String
    public var completed: Bool = false
    public var quantity : Int?
    public var group : Group?
//    public var assignedDate : Date //format date correctly for comparison
//    public var dueDate : Date //format date correctly for comparison
}
