//
//  FoodRecipeListViewController.swift
//  FoodRecipes
//
//  Created by aldybuana on 03/10/22.
//

import UIKit

class FoodRecipeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var foodRecipe: [FoodRecipe] = [
        FoodRecipe(name: "Egg Benedict", thumbnails: "egg_benedict.jpg", prepTime: "1 hour"),
        FoodRecipe(name: "Mushroom Risotto", thumbnails: "mushroom_risotto.jpg", prepTime: "30 min"),
        FoodRecipe(name: "Full Breakfast", thumbnails: "full_breakfast.jpg", prepTime: "25 min"),
        FoodRecipe(name: "Hamburger", thumbnails: "hamburger.jpg", prepTime: "15 min"),
        FoodRecipe(name: "Ham and Egg Sandwich", thumbnails: "ham_and_egg_sandwich.jpg", prepTime: "20 min"),
        FoodRecipe(name: "Creme Brelee", thumbnails: "creme_brelee.jpg", prepTime: "10 min"),
        FoodRecipe(name: "White Chocolate Donut", thumbnails: "white_chocolate_donut.jpg", prepTime: "1 hour"),
        FoodRecipe(name: "Starbucks Coffee", thumbnails: "starbucks_coffee.jpg", prepTime: "2 hour"),
        FoodRecipe(name: "Vegetable Curry", thumbnails: "vegetable_curry.jpg", prepTime: "50 min"),
        FoodRecipe(name: "Instant Noodle with Egg", thumbnails: "instant_noodle_with_egg.jpg", prepTime: "65 min"),
        FoodRecipe(name: "Noodle with BBQ", thumbnails: "vegetable_curry.jpg", prepTime: "40 min"),
        FoodRecipe(name: "Japanese Noodle", thumbnails: "vegetable_curry.jpg", prepTime: "30 min"),
        FoodRecipe(name: "Green Tea", thumbnails: "green_tea.jpg", prepTime: "25 min"),
        FoodRecipe(name: "Thai Shrimp Cake", thumbnails: "thai_shrimp_cake.jpg", prepTime: "1.5 hour"),
        FoodRecipe(name: "Angry Birds Cake", thumbnails: "angry_birds_cake.jpg", prepTime: "2 hour"),
        FoodRecipe(name: "Ham and Cheese Panini", thumbnails: "ham_and_cheese_panini.jpg", prepTime: "35 min")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodRecipeCellId", for: indexPath) as! FoodRecipeViewCell
        
        let foodRecipes = foodRecipe[indexPath.row]
        
        if let thumbnails = foodRecipes.thumbnails {
            cell.thumbImageView.image = UIImage(named: thumbnails)
        } else {
            cell.thumbImageView.image = UIImage(systemName: "photo")
        }
        
        cell.nameLabel.text = foodRecipes.name
        
        let cellDescription = foodRecipes.prepTime
        cell.descriptionLabel.text = "Prep Time: " + cellDescription!
        
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "FoodRecipe", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "FoodRecipeDetail") as? FoodRecipeDetailViewController {
            
            let foodRecipes = foodRecipe[indexPath.row]
            
            viewController.title = foodRecipes.name!
            
            if let thumbnails = foodRecipes.thumbnails {
                viewController.image = UIImage(named: thumbnails)!
            } else {
                viewController.image = UIImage(systemName: "photo")!
            }
            
            viewController.name = foodRecipes.name!
            viewController.desc = "Prep Time: " + foodRecipes.prepTime!
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
//        viewController?.image = UIImage(named: )
//        viewController?.name = name[indexPath.row]
//
    }
    
    func delete(at indexPath: IndexPath) {
        foodRecipe.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete") { action, view, completion in
            self.delete(at: indexPath)
            completion(true)
        }
        
        let actions = UISwipeActionsConfiguration(actions: [delete])
        actions.performsFirstActionWithFullSwipe = false
        
        return actions
    }
    
}
