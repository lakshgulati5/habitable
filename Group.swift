//
//  Group.swift
//  Habitable
//
//  Created by Laksh Gulati on 5/28/22.
//

import Foundation

public class Group : Comparable, CustomStringConvertible {
    public var description: String {
        return "\(name) \(members)"
    }
    
    //comparable
    public static func < (lhs: Group, rhs: Group) -> Bool {
        return lhs.name < rhs.name
    }
    
    public static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
    
    
    //all public for sake of testing, adjust later
    public let name : String
    public let bio : String
    public let dateCreated : Date // implement date
    public var members = [User] () //do not include owner in members
    public var tasks = [Task] ()
    public let owner : User
    public let code : Int = Int.random(in: 100000...999999) //need to add a check that a group with this number does not already exist
    public var completedTasks = 0
    public var failedTasks = 0
    
    public init(name : String, owner : User, bio: String)
    {
        self.name = name
        self.owner = owner
        self.bio = bio
        dateCreated = NSDate() as Date //not sure how this works
    }
    
    public func addMember (user : User)
    {
        members.append(user)
        //group will be added to users groups through database in user class
    }

    public func removeMember(user : User)
    {
        if let index = members.firstIndex(of: user)
        {
            members.remove(at: index)
            user.leaveGroup(group: self)
        }

    }
    
    public func assignTask(task : Task)
    {
        for x in members{
            x.assignTask(task: task)
        }h
        tasks.append(task)
    }
    
}
