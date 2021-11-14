import Fluent
import FluentPostgresDriver
import Foundation



struct CreateMovie: Migration {

    // up migration
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies") // table name
            .id()
            .field("title", .string, .required) // column name
            .create()
    }

    // undo of the migration
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("movies").delete() // drop the table
    }
}
