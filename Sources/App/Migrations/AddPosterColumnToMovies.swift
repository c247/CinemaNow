//
//  File.swift
//  
//
//  Created by vijay on 2021-11-13.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct AddPosterColumnToMovies: Migration {

    // up migration
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies") // table name
            .field("poster", .string) // column name
            .update()
    }

    // undo of the migration
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies")
        .deleteField("poster")
        .delete()
    }
}
