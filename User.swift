//
//  File.swift
//  Habitable
//
//  Created by Laksh Gulati on 5/28/22.
//

import Foundation
import SwiftUI

public class User : Comparable, CustomStringConvertible {
    public var description: String {
        return userName
    }
    
    
    public static func < (lhs: User, rhs: User) -> Bool {
        return lhs.userName < rhs.userName
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userName == rhs.userName
    }
    
    //all public for sake of testing, adjust later
    public let userName : String
    public var password : String
    public var tasksCompleted = [Task] ()
    public var tasksFailed = [Task] ()
    public var tasks = [Task] ()
    public var groups = [Group] ()
    public var friends = [User] ()
    public var friendRequests = [User] ()
    public var profilePicture : Image?
    
    
    public init(un: String, p : String, pic : Image?)
    {
        userName = un
        password = p
        profilePicture = pic
    }
    
    public func joinGroup(code: Int)
    {
        //get group from database by code and add to groups array
        //group.addMember(user: self) //uncomment this line when group is accessed through database
    }
    
    public func leaveGroup(group : Group)
    {
        if let index = groups.firstIndex(of: group){
            groups.remove(at: index)
            group.removeMember(user: self)
        }
    }
    
    public func assignTask(task : Task)
    {
        tasks.append(task)
    }
    
    public func completeTask(task: Task)
    {
        if let index = tasks.firstIndex(of: task) {
            var moveTask : Task
            moveTask = tasks.remove(at: index)
            moveTask.completed = true
            tasksCompleted.append(moveTask)
            if let group = moveTask.group {
                group.completedTasks+=1
            }
        }
    }
    
    public func failTask(task : Task)
    {
        if let index = tasks.firstIndex(of: task) {
            var moveTask : Task
            moveTask = tasks.remove(at: index)
            tasksFailed.append(moveTask)
            if let group = moveTask.group {
                group.failedTasks+=1
            }
        }
    }
    
    public func addFriend(user : User)
    {
        user.friendRequests.append(self)
    }
    
    public func acceptFriendRequest(user : User)
    {
        if let index = friendRequests.firstIndex(of: user)
        {
            friendRequests.remove(at: index)
            friends.append(user)
            user.friends.append(self)
        }
    }
    
    public func removeFriend(user: User)
    {
        if let index = friends.firstIndex(of: user) {
            friends.remove(at: index)
            user.removeFriend(user: self)
        }
    }
}
