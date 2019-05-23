//
//  ArtistNavigationController.swift
//  ArtistSearch
//
//  Created by Luis Mejías on 5/21/19.
//  Copyright © 2019 Luis Mejías. All rights reserved.
//

import UIKit

class ArtistNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = GColors.darkTintColor
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: GColors.textColor]
        navigationBar.backItem?.titleView?.tintColor = GColors.lightTintColor
        
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: GColors.textColor]
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
