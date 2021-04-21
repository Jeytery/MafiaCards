//
//  Localize.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation

//MARK: - constans
let NEW_DECK_LABEL = "new_deck_label"
let TABLEVIEW_ROLES_LABEL = "tableview_roles_label"
let TABLEVIEW_DECKS_LABEL = "tableview_decks_label"
let NEW_DECK_BUTTON_TITLE = "new_deck_button_title"
let SHUFFLE_BUTTON_TITLE = "shuffle_button_title"

var localizeList = [String: String]()

//MARK: - functions
func localize(id: String) -> String {
    return localizeList[id] ?? "Undefined"
}

public func setAppLanguage() {
    guard let code = Locale.preferredLanguages.first else { return }
    if code.hasPrefix("ru") {
        parse(language: "ru")
    } else if code.hasPrefix("en") {
        parse(language: "en")
    } else {
        parse(language: "en")
    }
}

public func parse(language: String) {
    if let path = Bundle.main.path(forResource:"lang_" + language, ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let test = jsonResult as? [String: String] {
                print(jsonResult)
                localizeList = test
            }
        } catch {}
    }
}


