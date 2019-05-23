//
//  Constants.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation

public struct Constants {
    static let BASE_URL : String = Bundle.main.object(forInfoDictionaryKey: "BASE_URL")! as! String
    static let ATTRIBUTE_URL : String = Bundle.main.object(forInfoDictionaryKey: "ATTRIBUTE_URL")! as! String
    static let END_URL : String = Bundle.main.object(forInfoDictionaryKey: "END_URL")! as! String
    
}
