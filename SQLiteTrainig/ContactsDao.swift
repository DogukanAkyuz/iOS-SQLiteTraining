//
//  ContactsDao.swift
//  SQLiteTrainig
//
//  Created by Doğukan Akyüz on 5.12.2024.
//

import Foundation

class ContactsDao {
    let db : FMDatabase?
    
    init() {
        let dbase = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destination = URL(filePath: dbase).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: destination.path)
    }
    func allContacts(){
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler",values: nil)
            while result.next(){
                let contact_id = Int(result.string(forColumn: "kisi_id"))!
                let contact_name = result.string(forColumn: "kisi_ad")!
                let contact_phone = result.string(forColumn: "kisi_tel")!
                print("---------------------")
                print("\(contact_id) - \(contact_name) - \(contact_phone)")
            }
            
        
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    func addContact(name: String, phone: String){
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?,?)", values: [name, phone])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    func updateContact(id: Int, name: String, phone: String){
        db?.open()
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [name, phone, id])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    func deleteContact(id: Int){
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [id])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
}
