//
//  File.swift
//  
//
//  Created by vijay on 2021-11-12.
//

import Foundation
import Fluent
import FluentPostgresDriver


struct CreateActor: Migration {

    // up migration
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("actors") // table name
            .id()
            .field("name", .string) // column name
            .create()
    }

    // undo of the migration
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("actors").delete() // drop the table
    }
}
