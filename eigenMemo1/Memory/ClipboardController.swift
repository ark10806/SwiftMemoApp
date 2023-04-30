//
//  ClipboardController.swift
//  eigenMemo1
//
//  Created by eigen.vector on 2023/04/30.
//

import Foundation
import Cocoa

class ClipboardController: NSViewController {
    let pboard = NSPasteboard.general
    
    override func viewDidLoad() {
        let pboardTypes = [NSPasteboard.PasteboardType.string]
        
        pboard.declareTypes(pboardTypes, owner: self)
        
        DispatchQueue.global(qos: .background).async {
            while true {
                self.pboard.waitForNewContents(in: .general)
                
                guard let string = self.pboard.string(forType: .string) else { continue }
                
            }
        }
    }
    
}
