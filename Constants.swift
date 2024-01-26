//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Manas on 02/12/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

struct k {
    static let appname = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registersegue = "RegisterToChat"
    static let loginsegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
