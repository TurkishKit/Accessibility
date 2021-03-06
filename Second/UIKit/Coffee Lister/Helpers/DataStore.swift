//
//  DataStore.swift
//  Coffee Lister
//
//  Created by Can Balkaya on 3/6/21.
//

import SwiftUI

class DataStore {
    
    // MARK: - Properties
    static let shared = DataStore()
    private let dataSourceURL: URL
    private var allCoffees: [Coffee] {
        get {
            do {
                let decoder = PropertyListDecoder()
                let data = try Data(contentsOf: dataSourceURL)
                let decodedNotes = try! decoder.decode([Coffee].self, from: data)
                
                return decodedNotes
            } catch {
                return []
            }
        }
        set {
            do {
                let encoder = PropertyListEncoder()
                let data = try encoder.encode(newValue)
                try data.write(to: dataSourceURL)
            } catch {
                
            }
        }
    }
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    
    // MARK: - Life Cycle
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let notesPath = documentsPath.appendingPathComponent("coffees").appendingPathExtension("json")
        dataSourceURL = notesPath
        
        if isFirstLaunch {
            saveDefaultCoffees()
            isFirstLaunch = false
        }
    }
    
    // MARK: - Methods
    func getAllCoffees() -> [Coffee] {
        return allCoffees
    }
    
    func create(coffee: Coffee) {
        allCoffees.insert(coffee, at: 0)
    }
    
    func saveDefaultCoffees() {
        if let localData = self.readLocalFile(forName: "coffees", of: "json") {
            self.parse(jsonData: localData)
        }
    }
    
    private func readLocalFile(forName name: String, of type: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: type),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([Coffee].self, from: jsonData)
            allCoffees = decodedData
        } catch {
            print("decode error")
        }
    }
}
