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
}
