//
//  Localize.swift
//  MafiaCards
//
//  Created by user on 3/11/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation

let NEW_DECK_LABEL = "new_deck_label"
let TABLEVIEW_ROLES_LABEL = "tableview_roles_label"
let TABLEVIEW_CARDS_LABEL = "tableview_cards_label"

var localizeList = [String: String]()

func localize(id: String) -> String {
    return localizeList[id] ?? "Undefined"
}

public func setAppLanguage() {
    guard let code = Locale.current.languageCode else { return }
    parse(language: code)
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


