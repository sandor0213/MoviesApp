//
//  MovieModelEntity+CoreDataProperties.swift
//  
//
//  Created by Balogh Sandor on 03/07/2024.
//
//

import Foundation
import CoreData


extension MovieModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieModelEntity> {
        return NSFetchRequest<MovieModelEntity>(entityName: "MovieModelEntity")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var genreIDS: String?
    @NSManaged public var id: Int64
    @NSManaged public var originalLanguage: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var video: Bool
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int64

}
