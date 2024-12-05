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
        
    }
}
