//
//  User.swift
//  LoginAppM
//
//  Created by Ildar Khabibullin on 19.03.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getInfoAboutPerson() -> User {
        (
            User(
                login: "User",
                password: "Password",
                person: (
                    Person(
                        name: "Ildar",
                        surname: "Khabibullin",
                        personalInfo: "Мне 36. Я инженер. Проектирую дома. Но хочу стать программистом"
                    )
                )
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let personalInfo: String
}

