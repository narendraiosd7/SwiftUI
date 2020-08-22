//
//  Config.swift
//  LoginPage
//
//  Created by Vadde Narendra on 8/21/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import Foundation
import UIKit

enum Mode: String {
    case Dark = "1"
    case Light = "2"
    
    func keyboardAppearence() -> UIKeyboardAppearance {
        switch self {
        case .Dark:
            return UIKeyboardAppearance.dark
        default:
            return UIKeyboardAppearance.light
        }
    }
    
    func statusBarStyle() -> UIStatusBarStyle {
        switch self {
        case .Dark:
            return .lightContent
        case .Light:
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                return .default
            }
        }
    }
}

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let isIpad = UIDevice.current.model.hasPrefix("iPad")

class Config {
    static let shared = Config()
    
    var strings: StaticData = StaticData()
    var fontStyles: Font = Font()
    var colors: Theme = Theme()
    var images: ImageNames = ImageNames()
    var keys: Key = Key()
    
    var mode = Mode.Dark
    
    init() {
        updateMode(mode: Mode.Light)
    }
    
    func updateMode(mode: Mode) {
        self.mode = mode
        colors.updateColors(mode: mode)
        images.updateImageNames(mode: mode)
    }
    
    func updateStrings(_ translation: Translation) {
        strings = StaticData.init(translation: translation)
        xmsNotification.postNotification(info: [xmsNotification.eventKey: NotificationType.languageGotUpdated.rawValue])
    }
}

class StaticData {
    
    init() {
        if let data = DocumentsAdapter.getData(path: DocumentPath.translation.rawValue) {
            do {
                let translation = try JSONDecoder().decode(Translation.self, from: data)
                update(translation: translation)
            }
        }
    }
    
    init(translation: Translation) {
        storeData(translation)
        update(translation: translation)
    }
    
    func update(translation: Translation) {
        
    }
    
    func storeData(_ translation: Translation) {
        do {
            let data = try JSONEncoder().encode(translation)
            DocumentsAdapter.saveFile(data, path: DocumentPath.translation.rawValue)
        } catch {
            
        }
    }
}

class Font {
    
}

class Theme {
    
    func updateColors(mode: Mode) {
        switch mode {
        case .Dark:
            print("Dark mode enabled")
        case .Light:
            print("Light mode enabled")
        }
    }
}

class ImageNames {
    
    func updateImageNames(mode: Mode) {
        switch mode {
        case .Dark:
            print("Dark mode enabled")
        case .Light:
            print("Light mode enabled")
        }
    }
}

class Key {
    
}

class Translation: Codable {
    
}
