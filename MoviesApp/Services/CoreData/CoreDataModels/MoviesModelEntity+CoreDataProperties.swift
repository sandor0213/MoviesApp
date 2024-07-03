//
//  MoviesModelEntity+CoreDataProperties.swift
//  
//
//  Created by Balogh Sandor on 03/07/2024.
//
//

import Foundation
import CoreData


extension MoviesModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesModelEntity> {
        return NSFetchRequest<MoviesModelEntity>(entityName: "MoviesModelEntity")
    }

    @NSManaged public var page: Int64
    @NSManaged public var totalPages: Int64
    @NSManaged public var totalResults: Int64
    @NSManaged public var results: NSOrderedSet?

}

// MARK: Generated accessors for results
extension MoviesModelEntity {

    @objc(insertObject:inResultsAtIndex:)
    @NSManaged public func insertIntoResults(_ value: MovieModelEntity, at idx: Int)

    @objc(removeObjectFromResultsAtIndex:)
    @NSManaged public func removeFromResults(at idx: Int)

    @objc(insertResults:atIndexes:)
    @NSManaged public func insertIntoResults(_ values: [MovieModelEntity], at indexes: NSIndexSet)

    @objc(removeResultsAtIndexes:)
    @NSManaged public func removeFromResults(at indexes: NSIndexSet)

    @objc(replaceObjectInResultsAtIndex:withObject:)
    @NSManaged public func replaceResults(at idx: Int, with value: MovieModelEntity)

    @objc(replaceResultsAtIndexes:withResults:)
    @NSManaged public func replaceResults(at indexes: NSIndexSet, with values: [MovieModelEntity])

    @objc(addResultsObject:)
    @NSManaged public func addToResults(_ value: MovieModelEntity)

    @objc(removeResultsObject:)
    @NSManaged public func removeFromResults(_ value: MovieModelEntity)

    @objc(addResults:)
    @NSManaged public func addToResults(_ values: NSOrderedSet)

    @objc(removeResults:)
    @NSManaged public func removeFromResults(_ values: NSOrderedSet)

}
