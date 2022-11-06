//
//  PartialColorUtils.swift
//  NearCatch
//
//  Created by Wonhyuk Choi on 2022/06/22.
//

import Foundation
import SwiftUI

class PartialColor {
    static func partialColorString(allString: String,allStringColor: Color ,partialString: String, partialStringColor: Color ) -> AttributedString {
        var string = AttributedString(localized: String.LocalizationValue(allString))
        string.foregroundColor = allStringColor
        
        if let range = string.range(of: LocalizedStringKey(partialString).toString()) {
            string[range].foregroundColor = partialStringColor
        }
        return string
    }
}

extension String {
    
    func partialColor(basicColor: Color = .primary, _ partials: [String], _ color: Color) -> AttributedString {
        var string = AttributedString(localized: String.LocalizationValue(self))
        string.foregroundColor = basicColor
        
        for partial in partials {
            if let range = string.range(of: LocalizedStringKey(partial).toString()) {
                string[range].foregroundColor = color
            }
        }
        
        return string
    }
}

// ref : https://stackoverflow.com/questions/64429554/how-to-get-string-value-from-localizedstringkey

extension LocalizedStringKey {

    public func toString() -> String {
        //use reflection
        let mirror = Mirror(reflecting: self)
        
        //try to find 'key' attribute value
        let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
            let (label, _) = arg0
            if(label == "key"){
                return true;
            }
            return false;
        }
        
        if(attributeLabelAndValue != nil) {
            //ask for localization of found key via NSLocalizedString
            return String.localizedStringWithFormat(NSLocalizedString(attributeLabelAndValue!.value as! String, comment: ""));
        }
        else {
            return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
        }
    }
}
