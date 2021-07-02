//
//  File.swift
//  
//
//  Created by 이영우 on 2021/07/02.
//
import Fluent

struct CreateProjectItem: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("projectItems")
            .id()
            .field("title", .string, .required)
            .field("content", .string, .required)
            .field("deadlineDate", .date, .required)
            .field("progress", .string, .required)
            .field("isDeleted", .bool, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("projectItems").delete()
    }
}
