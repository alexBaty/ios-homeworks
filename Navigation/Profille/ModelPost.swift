//
//  ModelPost.swift
//  Navigation
//
//  Created by Alexander Batyshev on 19.01.2023.
//

import Foundation

struct ModelPost {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let postOne = ModelPost(author: "witchercommunity", description: "In addition to the release on new generation platforms, the PlayStation 4, Xbox One and Nintendo Switch versions of The Witcher 3: Wild Hunt game will also receive an update with numerous changes and improvements, as well as free content inspired by the Witcher series from Netflix.", image: "witcher", likes: 460, views: 560)

let postTwo = ModelPost(author: "netology.ru", description: "Netology is one of the leaders in the online education market. Open classes, intensive courses and interactive courses for learning.", image: "netology", likes: 56, views: 451)

let postThree = ModelPost(author: "News-apple", description: "Apple announces new security and privacy measures amid spike in cyber attacks. Hands on with Apple Music Sing on iPhone, iPad, & Apple TV.", image: "apple", likes: 245, views: 457)

let postFour = ModelPost(author: "Kinomania", description: "The time of prosperity is coming to an end, and the summer, which lasted almost a decade, is fading. A conspiracy is brewing around the center of power of the Seven Kingdoms, the Iron Throne, and at this difficult time the king decides to seek support from a friend of his youth, Eddard Stark. In a world where everyone — from a king to a mercenary — is eager for power, plotting and ready to stab a knife in the back, there is a place for nobility, compassion and love.", image: "gameOfThrones", likes: 23, views: 43)

var dataSource: [ModelPost] = [postOne, postTwo, postThree, postFour]

var photosCollection = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11", "photo12", "photo13", "photo14", "photo15", "photo16", "photo17", "photo18", "photo19", "photo20", "photo21"]
