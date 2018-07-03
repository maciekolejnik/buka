//
//  AudiobooksDataSource.swift
//  Buka3
//
//  Created by mzk on 28/05/2017.
//
//

import UIKit

class AudiobooksDataSource {
    
    var categories: [String] = []
    var audiobooks: [[Audiobook]] = []
    
    init() {
        populateData()
    }
    
    func numberOfCategories() -> Int {
        return categories.count
    }
    
    func numberOfAudiobooks(inCategory category: Int) -> Int? {
        if category >= 0 && category < audiobooks.count {
            return audiobooks[category].count
        }
        return nil
    }
    
    func getCategory(atIndex index: Int) -> String? {
        if index >= 0 && index < categories.count {
            return categories[index]
        }
        return nil
    }
    
    func getAudiobook(inCategory category: Int, atIndex index: Int) -> Audiobook? {
        if category >= 0 && category < audiobooks.count &&
            index >= 0 && index < audiobooks[category].count {
            return audiobooks[category][index]
        }
        return nil
    }
    
    private func populateData() {
        let madreBajki = "Mądre bajki"
        let rozsmieszanki = Audiobook(
            title: "Rozśmieszanki, Rozmyślanki, Usypianki",
            cover: UIImage(named: "MB1_Rozsmieszanki"),
            description: "Danuta Wawiłow\n\nczytają: Jerzy Stuhr, Edyta Jungowska, Maciej Stuhr\nmuzyka: Maciej Mulawa\nczas trwania: 49:95\nCD audio\nwiek: 3+",
            category: madreBajki,
            track: "Rozsmieszanki")
        let krainaSpiochow = Audiobook(
            title: "Kraina Śpiochów",
            cover: UIImage(named: "MB2_KrainaSpiochow"),
            description: "Marta Guśniowska\n\nczytają i śpiewają: absolwenci Akademii Teatralnej w Białymstkou\nmuzyka: Piotr Nazaruk\nczas trwania: 45'\nCD audio\nwiek: 5+",
            category: madreBajki,
            track: "KrainaSpiochow")
        let swierszczykoweNutki = Audiobook(
            title: "Świerszczykowe Nutki",
            cover: UIImage(named: "MB3_SwierszczykoweNutki"),
            description: "Czesław Janczarski\n\nczytają: Magdalena Zawadzka i Maciej Stuhr\nmuzyka: Wojciech Błażejczyk\nczas trwania: 50:55\nCD audio\nwiek: 2+",
            category: madreBajki,
            track: "SwierszczykoweNutki")
        let bylSobieKrol = Audiobook(
            title: "Był sobie król",
            cover: UIImage(named: "MB4_BylSobieKrol"),
            description: " \n\nczyta: Jerzy Stuhr\nmuzyka: Maciej Mulawa, Wojciech Błażejczyk\nczas trwania: 55:45\nCD audio\nwiek: 3+",
            category: madreBajki,
            track: "BylSobieKrol")
        let posluchajcieBajeczki = Audiobook(
            title: "Posłuchajcie bajeczki",
            cover: UIImage(named: "MB5_PosluchajcieBajeczki"),
            description: "Czesław Janczarski\n\nczyta: Magdalena Zawadzka\nmuzyka: Wojciech Błażejczyk\nCD audio\nwiek: 2+",
            category: madreBajki,
            track: "PosluchajcieBajeczki")
        let nosorozceWDorozce = Audiobook(
            title: "Nosorożce w dorożce i inne wiersze",
            cover: UIImage(named: "MB6_NosorozceWDorozce"),
            description: "Ludwik Jerzy Kern\n\nczytają: Krzysztof Kowalewski i Agnieszka Suchora\nmuzyka: Maciej Mulawa\nCD audio\nwiek: 3+",
            category: madreBajki,
            track: "NosorozceWDorozce")
        
        
        let mity = "Mity greckie"
        let glowaMeduzy = Audiobook(
            title: "Opowieści z zaczarowanego lasu. Głowa Meduzy",
            cover: UIImage(named: "MITY2_GlowaMeduzy"),
            description: "Nathaniel Hawthorne\n\nczyta: Krzysztof Tyniec\nmuzyka: Maciej Rychły\nczas trwania: 65:22\nksiążka + CD audio\nwiek: 5+\nilustracje: Józef Wilkoń",
            category: mity,
            track: "GlowaMeduzy")
        let zlotodajnaMoc = Audiobook(
            title: "Opowieści z zaczarowanego lasu. Złotodajna moc",
            cover: UIImage(named: "MITY3_ZlotodajnaMoc"),
            description: "Nathaniel Hawthorne\n\nczyta: Krzysztof Tyniec\nmuzyka: Maciej Rychły\nczas trwania: 60:23\nksiążka + CD audio\nwiek: 5+\nilustracje: Józef Wilkoń",
            category: mity,
            track: "ZlotodajnaMoc")
        let trzyZloteJablka = Audiobook(
            title: "Opowieści z zaczarowanego lasu. Trzy złote jabłka",
            cover: UIImage(named: "MITY4_TrzyZloteJablka"),
            description: "Nathaniel Hawthorne\n\nczyta: Krzysztof Tyniec\nmuzyka: Maciej Rychły\nczas trwania: 57:45\nksiążka + CD audio\nwiek: 5+\nilustracje: Józef Wilkoń",
            category: mity,
            track: "TrzyZloteJablka")
        let cudownyDzban = Audiobook(
            title: "Opowieści z zaczarowanego lasu. Cudowny dzban",
            cover: UIImage(named: "MITY5_CudownyDzban"),
            description: "Nathaniel Hawthorne\n\nczyta: Krzysztof Tyniec\nmuzyka: Maciej Rychły\nczas trwania: 53:50\nksiążka + CD audio\nwiek: 5+\nilustracje: Józef Wilkoń",
            category: mity,
            track: "CudownyDzban")
        let chimera = Audiobook(
            title: "Opowieści z zaczarowanego lasu. Chimera",
            cover: UIImage(named: "MITY6_Chimera"),
            description: "Nathaniel Hawthorne\n\nczyta: Krzysztof Tyniec\nmuzyka: Maciej Rychły\nczas trwania: 71:05\nksiążka + CD audio\nwiek: 5+\nilustracje: Józef Wilkoń",
            category: mity,
            track: "Chimera")
        let minotaur = Audiobook(
            title: "Opowieści z zaczarowanego lasu. Minotaur",
            cover: UIImage(named: "MITY7_Minotaur"),
            description: "Nathaniel Hawthorne\n\nczyta: Krzysztof Tyniec\nmuzyka: Maciej Rychły, Mateusz Rychły\nczas trwania: 77:20\nksiążka + CD audio\nwiek: 5+\nilustracje: Józef Wilkoń",
            category: mity,
            track: "Minotaur")
        
        
        let mistrzowieWyobrazni = "Mistrzowie wyobraźni"
        let heweliusz = Audiobook(
            title: "Wędrując po niebie z Janem Heweliuszem",
            cover: UIImage(named: "MW1_Heweliusz"),
            description: "Anna Czerwińska-Rydel\n\nczyta: Jan Englert\n2 CD audio + słownik astronoma\nwiek: 8+",
            category: mistrzowieWyobrazni,
            track: "Heweliusz")
        let sklodowska = Audiobook(
            title: "W poszukiwaniu światła. Opowieść o Marii Skłodowskiej-Curie",
            cover: UIImage(named: "MW2_Sklodowska"),
            description: "Anna Czerwińska-Rydel\n\nczyta: Anna Dymna\nmuzyka: Fryderyk Chopin, Karol Szymanowski\nczas trwania: 2 godz. 31 min\n2 CD audio + książeczka popularnonaukowa\nwiek: 8+",
            category: mistrzowieWyobrazni,
            track: "Sklodowska")
        let korczak = Audiobook(
            title: "Po drugiej stronie okna. Opowieść o Januszu Korczaku",
            cover: UIImage(named: "MW3_Korczak"),
            description: "Anna Czerwińska-Rydel\n\nczyta: Henryk Talar\nmuzyka: Bester Quartet\nczas trwania: 4 godz. 52 min\n4 CD audio + książeczka\nwiek: 8+",
            category: mistrzowieWyobrazni,
            track: "Korczak")
        let fahrenheit = Audiobook(
            title: "Ciepło-zimno. Zagadka Fahrenheita",
            cover: UIImage(named: "MW4_Fahrenheit"),
            description: "Anna Czerwińska-Rydel\n\nczyta: Adam Ferency\nmuzyka: Maciej Mulawa\nczas trwania: 80 min\n2 CD audio + książeczka\nwiek: 8+",
            category: mistrzowieWyobrazni, track: "Fahrenheit")
        let chopin = Audiobook(
            title: "Jaśne Pan Pichon. Rzecz o Fryderyku Chopenie",
            cover: UIImage(named: "MW5_Chopin"),
            description: "Anna Czerwińska-Rydel\n\nczyta: Jan Englert\nmuzyka: Fryderyk Chopin w wyk. Krzysztofa Trzaskowskiego\nczas trwania: 1 godz. 43 min\n2 CD audio + książeczka\nwiek: 7+",
            category: mistrzowieWyobrazni,
            track: "Chopin")
        let czochralski = Audiobook(
            title: "Kryształowe odkrycie. Powieść o Janie Czochralskim",
            cover: UIImage(named: "MW6_Czochralski"),
            description: "Anna Czerwińska-Rydel\n\nczyta: Anna Dymna\nmuzyka: Karol Szymanowski w wyk. Pawła Rydla (fortepian)\nczas trwania: 2 godz. 30 min\n2 CD audio + książeczka\nwiek 8+",
            category: mistrzowieWyobrazni,
            track: "Czochralski")

        
        categories = [madreBajki + " 3+", mity + " 5+", mistrzowieWyobrazni + " 8+"]
        audiobooks = [[rozsmieszanki, krainaSpiochow, swierszczykoweNutki, bylSobieKrol, posluchajcieBajeczki, nosorozceWDorozce], [glowaMeduzy, zlotodajnaMoc, trzyZloteJablka, cudownyDzban, chimera, minotaur], [heweliusz, sklodowska, korczak, fahrenheit, chopin, czochralski]]
    }
}
