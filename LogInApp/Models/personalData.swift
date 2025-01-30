//
//  personalData.swift
//  LogInApp
//
//  Created by Дима Монид on 29.01.25.
//

struct User{
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User{
        User(
            userName: "User",
            password: "12345",
            person: Person.getPerson()
        )
    }
}

struct Person{
    let name: String
    let surname: String
    let company: String
    let department: String
    let position: String
    let bio: String
    let photo: String
    
    var fullName: String{
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person{
        Person(
            name: "Дмитрий",
            surname: "Монид",
            company: "Гарант",
            department: "ЦОТИС",
            position: "Радиомонтер",
            bio: "Я родился в 1998 году в г.п. Большая Берестовица. Детство провел там же. Окончил Большеберестовицкую среднюю школу в 2013 году. В том же году поступил в Гродненский политехнический колледж на специальность Вычислительные машины системы и сети. После окончания колледжа поступил в Белорусский Государсвенный университет радиоэлектроники на специальность Информационные технологии и управление в технических системах. На данный момент хочу освоить курс Swift и развиваться в этом направлении",
            photo: "DimaMonid"
            
        )
    }
}
