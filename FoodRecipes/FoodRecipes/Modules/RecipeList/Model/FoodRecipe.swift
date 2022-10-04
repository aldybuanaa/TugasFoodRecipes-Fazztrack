//
//  FoodRecipe.swift
//  FoodRecipes
//
//  Created by aldybuana on 03/10/22.
//

import Foundation

struct FoodRecipe {
    let name: String?
    let thumbnails: String?
    let prepTime: String?
    
    init(name: String?, thumbnails: String?, prepTime: String?) {
            self.name = name
            self.thumbnails = thumbnails
            self.prepTime = prepTime
        }
}
