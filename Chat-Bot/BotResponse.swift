//
//  BotResponse.swift
//  Chat-Bot
//
//  Created by Daval Cato on 11/23/22.
//

import Foundation

// create func that returns a string
func getBotResponse(message: String) -> String {
    // create varible
    let tempMessage =  message.lowercased()
    
    // logic for bot
    if tempMessage.contains("hello") {
        // return the string
        return "Hey there!"
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you?") {
        return "I'm doing great! How about you?"
        
        } else {
            return "That's cool to hear!"
        }
            
}



