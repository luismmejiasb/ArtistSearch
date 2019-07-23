//
//  Constants.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/20/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import Foundation

public struct Constants {
    // swiftlint:disable force_cast
    static let baseUrl : String = Bundle.main.object(forInfoDictionaryKey: "BASE_URL")! as! String
    static let attributeUrl : String = Bundle.main.object(forInfoDictionaryKey: "ATTRIBUTE_URL")! as! String
    static let endUrl : String = Bundle.main.object(forInfoDictionaryKey: "END_URL")! as! String
}
