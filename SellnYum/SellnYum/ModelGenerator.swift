//
//  ModelGenerator.swift
//  SellAndYum
//
//  Created by Yvan Moté on 11/02/2016.
//  Copyright © 2016 Yvan Moté. All rights reserved.
//

import Foundation

class ModelGenerator {
    class func allTopMeals() -> [Meal] {
        var allMeals = [Meal]()
        
        allMeals.append(Meal(name:"Tartiflette",price: 25.0,description: "Le plat idéal pour les soirées d'hiver"))
        allMeals.append(Meal(name:"Hachis parmentier",price: 20.0,description: "Vous avez de la purée ? Vous avez de la viande hachée ? Et bien vous pouvez faire un hachis parmentier."))
        allMeals.append(Meal(name:"Quiche Lorraine",price: 10.0,description: "Un grand classique"))
        allMeals.append(Meal(name:"Soupe ensoleillée",price: 16.5,description: "Parfait pour reprendre des forces durant l'hiver."))
        allMeals.append(Meal(name:"Salade César",price: 15.0,description: "Salut César. Ceux qui vont manger te saluent."))
        allMeals.append(Meal(name:"Clafoutis aux pommes",price: 7.5,description: "Hum !"))
        allMeals.append(Meal(name:"Lasagnes à la bolognaise",price: 10.0,description: "Bonne comme celle de la mama."))
        allMeals.append(Meal(name:"Boeuf bourguignon",price: 22.0,description: "Du boeuf bourguignon, oui ! Mais avec un bourgogne."))
        allMeals.append(Meal(name:"Cannelés bordelais",price: 5.0,description: "Croustillant à l'extérieur et tendre à l'intérieur."))
        allMeals.append(Meal(name:"Salade Niçoise",price: 19.0,description: "On dirait le sud."))
        
        return allMeals
    }
    
    class func allCategories() -> [Category] {
        var allCategories = [Category]()
        
        //Classique
        var allMeals = [Meal]()
        allMeals.append(Meal(name:"Tartiflette",price: 25.0,description: "Le plat idéal pour les soirées d'hiver"))
        allMeals.append(Meal(name:"Hachis parmentier",price: 20.0,description: "Vous avez de la purée ? Vous avez de la viande hachée ? Et bien vous pouvez faire un hachis parmentier."))
        allMeals.append(Meal(name:"Quiche Lorraine",price: 10.0,description: "Un grand classique"))
        allMeals.append(Meal(name:"Lasagnes à la bolognaise",price: 10.0,description: "Bonne comme celle de la mama."))
        allMeals.append(Meal(name:"Boeuf bourguignon",price: 22.0,description: "Du boeuf bourguignon, oui ! Mais avec un bourgogne."))
        
        allCategories.append(Category(name:"Classique", meals: allMeals))
        
        //Soupe
        allMeals = [Meal]()
        allMeals.append(Meal(name:"Soupe aux choux",price: 12.0,description: "Un incontournable de la culture française."))
        allMeals.append(Meal(name:"Soupe aux orties",price: 5.0,description: "Aïe !"))
        allMeals.append(Meal(name:"Soupe ensoleillée",price: 16.5,description: "Parfait pour reprendre des forces durant l'hiver."))
        
        allCategories.append(Category(name:"Soupe", meals: allMeals))
        
        //Desserts
        allMeals = [Meal]()
        allMeals.append(Meal(name:"Clafoutis aux pommes",price: 7.5,description: "Hum !"))
        allMeals.append(Meal(name:"Beignets",price: 5.0,description: "Prêt pour Mardi-gras."))
        allMeals.append(Meal(name:"Flan pâtissier",price: 5.0,description: "Parfait pour les petits comme les grands."))
        allMeals.append(Meal(name:"Chouquettes",price: 5.0,description: "Vous allez adorer !"))
        allMeals.append(Meal(name:"Cannelés bordelais",price: 5.0,description: "Croustillant à l'extérieur et tendre à l'intérieur."))
        
        allCategories.append(Category(name:"Desserts", meals: allMeals))
        
        //Desserts
        allMeals = [Meal]()
        allMeals.append(Meal(name:"Salade César",price: 15.0,description: "Salut César. Ceux qui vont manger te saluent."))
        allMeals.append(Meal(name:"Salade Grecque",price: 13.0,description: "Envie d'un grec ?"))
        allMeals.append(Meal(name:"Salade Niçoise",price: 19.0,description: "On dirait le sud."))
        allMeals.append(Meal(name:"Salade Thaï",price: 19.0,description: "Un peu d'évasion avec cette succulente salade."))
        
        allCategories.append(Category(name:"Salade", meals: allMeals))

        return allCategories
    }
}