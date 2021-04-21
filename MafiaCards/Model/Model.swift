//
//  Model.swift
//  MafiaCards
//
//  Created by user on 3/15/21.
//  Copyright © 2021 Epsillent. All rights reserved.
//

import Foundation

class Model {
    
    static let shared = Model()
    
    static let decksIdentifier = "decks"
    
    static let rolesIdentifier = "roles"
    
    public var decks = [Deck]()

    public var roles = [Role]()
    
    //MARK: - public funcs
    public func saveDecks(decks: [Deck]) {
        self.decks = decks
        do {
            let temp = try JSONEncoder().encode(decks)
            UserDefaults
                .standard
                .set(temp, forKey: Model.decksIdentifier)
        } catch {
            print("Model: Can't save decks")
        }
    }
    
    public func getDecks() -> [Deck] {
        guard let data = UserDefaults.standard.data(forKey: Model.decksIdentifier) else { return [Deck]() }
        var decks = [Deck]()
        do {
            decks = try JSONDecoder().decode([Deck].self, from: data)
            self.decks = decks
        } catch {
            print("Model: Can't load decks")
        }
        return decks
    }
    
    public func saveRoles(roles: [Role]) {
        self.roles = roles
        do {
            let temp = try JSONEncoder().encode(roles)
            UserDefaults
                .standard
                .set(temp, forKey: Model.rolesIdentifier)
        } catch {
            print("Model: Can't save roles")
        }
    }
    
    public func getRoles() -> [Role] {
        guard let data = UserDefaults.standard.data(forKey: Model.rolesIdentifier) else { return [Role]() }
        var roles = [Role]()
        do {
            roles = try JSONDecoder().decode([Role].self, from: data)
            self.roles = roles
        } catch {
            print("Model: Can't load roles")
        }
        return [Role]()
    }
    
    public func saveDeck(deck: Deck) {
        var decks = getDecks()
        decks.append(deck)
        saveDecks(decks: decks)
    }
    
    public func saveRole(role: Role) {
        var roles = getRoles()
        roles.append(role)
        saveRoles(roles: roles)
    }
}
