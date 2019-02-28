//
//  MostPopularArticlesModel.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MostPopularArticlesModel {
    private struct SerializationKeys {
        static let title = "title"
        static let desc = "abstract"
        static let date = "published_date"
        static let media = "media"
        static let imageMetaData = "media-metadata"
        static let imageUrl = "url"
        static let imageFormat = "format"
        static let imageHeight = "height"
        static let imageWidth = "width"
        static let author = "byline"
    }
    
    struct Image {
        var url: String
        var format: String
        var height: Int
        var width: Int
        
        init(json: JSON) {
            url = json[SerializationKeys.imageUrl].stringValue
            format = json[SerializationKeys.imageFormat].stringValue
            height = json[SerializationKeys.imageHeight].intValue
            width = json[SerializationKeys.imageWidth].intValue
        }
    }
    
    var title: String
    var desc: String
    var date: String
    var author: String
    var images: [Image] = []
    
    init(json: JSON) {
        title = json[SerializationKeys.title].stringValue
        desc = json[SerializationKeys.desc].stringValue
        date = json[SerializationKeys.date].stringValue
        author = json[SerializationKeys.author].stringValue
        
        if let items = json[SerializationKeys.media][0][SerializationKeys.imageMetaData].array {
            images = items.map {Image(json: $0)}
        }
        
        
        
    }
    
}

