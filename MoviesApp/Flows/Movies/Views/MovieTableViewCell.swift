//
//  MovieTableViewCell.swift
//  MoviesApp
//
//  Created by Balogh Sandor on 04/07/2024.
//

import UIKit
import Kingfisher

final class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleYearLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
   
    func setup(model: MovieModel?) {
        setupShadow()
        mainImageView.kf.setImage(with: URL(string: Constants.API.baseImageURL(model?.posterPath ?? "")))
        titleYearLabel.text = "\(model?.originalTitle ?? "Unknown title"), \(model?.releaseDate ?? "?")"
        genresLabel.text = model?.genreIDS?.map { String($0) }.joined(separator: ", ")
        if let voteAverage = model?.voteAverage {
            ratingLabel.text = model?.voteAverage == nil ? "No ratings" : "\(model?.voteAverage ?? 0)"
        }
    }
}
