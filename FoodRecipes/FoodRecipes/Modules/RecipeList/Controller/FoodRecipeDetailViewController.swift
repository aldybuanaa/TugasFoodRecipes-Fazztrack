//
//  FoodRecipeDetailViewController.swift
//  FoodRecipes
//
//  Created by aldybuana on 03/10/22.
//

import UIKit

class FoodRecipeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailNavigationItem: UINavigationItem!
    @IBOutlet weak var detailThumb: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailDesc: UILabel!
    
    var image = UIImage()
    var name = ""
    var desc = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        detailThumb.image = image
        detailName.text = name
        detailDesc.text = desc
        
        
    }
    

}
