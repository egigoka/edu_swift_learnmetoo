//
//  Task.swift
//  RealmDemo
//
//  Created by egigoka on 07.09.2025.
//

import Foundation
import RealmSwift

class Task: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = ""
    @Persisted var note = ""
    @Persisted var date = Date()
    @Persisted var isComplete = false
}

class TaskList: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = ""
    @Persisted var date = Date()
    @Persisted var tasks: List<Task>
}
