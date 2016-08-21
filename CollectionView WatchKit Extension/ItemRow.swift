//
//  ItemRow.swift
//  CollectionView
//
//  Created by Shrief Nasr on 8/21/16.
//  Copyright © 2016 Shrief Nasr. All rights reserved.
//

import Foundation
import WatchKit

class ItemRow : NSObject{


    @IBOutlet var item: WKInterfaceLabel!

    @IBOutlet var border: WKInterfaceGroup!

    var cellIndex : Int?
    
    
}