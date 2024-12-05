//
//  ContentView.swift
//  SQLiteTrainig
//
//  Created by Doğukan Akyüz on 5.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SQLite")
            .onAppear {
                copyDB()
                let cdao = ContactsDao()
                //cdao.addContact(name: "Mehmet", phone: "6756")
                //cdao.updateContact(id: 1, name: "Alican", phone: "2345")
                //cdao.deleteContact(id: 5)
                //cdao.allContacts()
                //cdao.getContact(id: 2)
                //cdao.searchContact(word: "e")
                cdao.controlContact(name: "Ece")
            }
    }

    func copyDB() {
        let bundle = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")

        let dbase = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

        let destination = URL(filePath: dbase).appendingPathComponent("rehber.sqlite")

        let fm = FileManager.default

        if fm.fileExists(atPath: destination.path) {
            print("DB already exists")
        } else {
            do {
                try fm.copyItem(atPath: bundle!, toPath: destination.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
