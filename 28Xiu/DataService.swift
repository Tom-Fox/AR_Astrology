//
//  DataService.swift
//  28Xiu
//
//  Created by S@mmy on 2025/10/11.
//

import Foundation

struct DataService {
    
    func getXiuData() -> [XiuMansion] {
        
        // We need get file path to Data.json
        // url -> optional
        if let url = Bundle.main.url(forResource: "XiuData", withExtension: "json") {
            
            do {
                // Read the file and turn it into data
                let data = try Data(contentsOf: url)
                
                // Parse(deserialize) data into Swift instance
                let decoder = JSONDecoder()
            
                do {
                    let xiuMansions = try decoder.decode([XiuMansion].self, from: data)
                    return xiuMansions
                }
                catch {
                    print("Couldn't parse the JSON. Error: \(error)")
                }
                
            }
            catch {
                print("Couldn't read the file. Error: \(error)")
            }
        }
        
        return [XiuMansion]()
        
    }
    
    func getlunarMonths() ->[LunarMonth] {
        
        if let url = Bundle.main.url(forResource: "LunarData", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
            
                do {
                    let LunarMonths = try decoder.decode([LunarMonth].self, from: data)
                    return LunarMonths
                }
                catch {
                    print("Couldn't parse the JSON. Error: \(error)")
                }
                
            }
            catch {
                print("Couldn't read the file. Error: \(error)")
            }
        }
        
        return [LunarMonth]()
        
    }
    
    func getFortuneData() -> [Fortune] {
        
        // We need get file path to Data.json
        // url -> optional
        if let url = Bundle.main.url(forResource: "FortuneData", withExtension: "json") {
            
            do {
                // Read the file and turn it into data
                let data = try Data(contentsOf: url)
                
                // Parse(deserialize) data into Swift instance
                let decoder = JSONDecoder()
            
                do {
                    let fortunes = try decoder.decode([Fortune].self, from: data)
                    return fortunes
                }
                catch {
                    print("Couldn't parse the JSON. Error: \(error)")
                }
                
            }
            catch {
                print("Couldn't read the file. Error: \(error)")
            }
        }
        
        return [Fortune]()
    }
}
