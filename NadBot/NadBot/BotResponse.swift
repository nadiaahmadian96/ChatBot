//
//  BotResponse.swift
//  NadBot
//
//  Created by Nadia Ahmadian on 2022-02-19.
//

import Foundation

func getBotResponse(message : String) -> String{
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey there, what's up?"
    }else if tempMessage.contains("bye"){
        return "TTYL!"
    }else if tempMessage.contains("how are you?"){
        return "Awesome! and a lil bit shitty :/ can't really decide though"
    }else if tempMessage.contains("ok later"){
        return "Bye MF! just leave me alone... Like I don't matter at all"
    }
    else{
        return "That's cool"
    }
}
