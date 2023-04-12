//
//  fmdb Helper.swift
//  Exam Local Database
//
//  Created by Choudhary Dipika on 12/04/23.
//

import Foundation

struct Model
{
    var id : Int
    var name : String
}

class FMDB
{
    static var file : FMDatabase!
    
    static func createFile()
    {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My fmdb.db")
        file = FMDatabase(url: x)
        file.open()
        print(x.path)
        print("File Created")
        createTable()
    }
    
    static func createTable()
    {
        var query = "Create Table if not exists Employees (id integer, name text)"
        try? file.executeUpdate(query, values: nil)
        print("Table Created")
    }
    
    static func addData(id:Int,name:String)
    {
        var query = "insert into Employees values (\(id),'\(name)')"
        try? file.executeUpdate(query, values: nil)
        print("Data Added")
    }
    
    static func getData() -> [Model]
    {
        var arr = [Model]()
        var query = "select id,name from Employees"
        if let data = try? file.executeQuery(query, values: nil)
        {
            while data.next()
            {
                let id = data.object(forColumn: "id") as! Int ?? 0
                let name = data.object(forColumn: "name") as! String ?? ""
                let object = Model(id: id, name: name)
                arr.append(object)
            }
        }
        return arr
    }
    
    static func deleteData(id:Int)
    {
        var query = "DELETE FROM Employees WHERE id = \(id)"
        try? file.executeUpdate(query, values: nil)
        print("Data Deleted")
    }
}
