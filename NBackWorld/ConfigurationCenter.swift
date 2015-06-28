//
//  ConfigurationCenter.swift
//  NBackWorld
//
//  Created by Peter Arato on 28/06/2015.
//  Copyright © 2015 Peter Arato. All rights reserved.
//

class ConfigurationCenter {
    
    static var defaultInstance: ConfigurationCenter!
    
    var config: NBackRuleConfiguration
    
    init() {
        self.config = NBackRuleConfiguration()
    }
    
    static func defaultCenter() -> ConfigurationCenter {
        if ConfigurationCenter.defaultInstance == nil {
            ConfigurationCenter.defaultInstance = ConfigurationCenter()
        }
        return ConfigurationCenter.defaultInstance
    }
    
}
