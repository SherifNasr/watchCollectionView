//
//  InterfaceController.swift
//  CollectionView WatchKit Extension
//
//  Created by Shrief Nasr on 8/21/16.
//  Copyright © 2016 Shrief Nasr. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var oddTable: WKInterfaceTable!
    
    @IBOutlet var evenTable: WKInterfaceTable!
    
    var items = ["item 1","item 2","item 3","item 4","item 5"];
    var borderColors = [UIColor.blackColor(),UIColor.blackColor(),UIColor.blackColor(),UIColor.blackColor(),UIColor.blackColor()];
    
    var remainingCount : Int!
    var selectedCellIndex : Int!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
      selectedCellIndex = 0 ;
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        setborderColors(selectedCellIndex);
        setupTable();
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    func setborderColors(selected : Int){
        for i in 0 ..< borderColors.count{
            borderColors[i] =  i == selected ?  UIColor.init(red:  CGFloat(0x99) / 255.0 , green: CGFloat(0xA1) / 255.0 , blue: CGFloat(0xFF) / 255.0 , alpha: 1) : UIColor.blackColor();
        }
        
    }
    
    
    
    func setupTable(){
        
        var flag = true ;
        
        remainingCount = ( items.count - (items.count / 2) );
        
        oddTable.setNumberOfRows( remainingCount , withRowType: "ItemRow");
        evenTable.setNumberOfRows( items.count / 2 , withRowType: "ItemRow");
        
        
        
        for i in 0 ..< items.count {
            
            if flag {
                if let row = oddTable.rowControllerAtIndex(i / 2 ) as? ItemRow {
               
                    row.item.setText(items[i]);
                    row.border.setBackgroundColor(borderColors[i]);
                    row.cellIndex = i ;
                
                }
        
            }else{
            
                if let row = evenTable.rowControllerAtIndex(i / 2 ) as? ItemRow {
                    row.item.setText(items[i]);
                    row.border.setBackgroundColor(borderColors[i]);
                    row.cellIndex = i ;
                
                }
            }
         flag = !flag
        }
        
    }
    
    
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        let row = table.rowControllerAtIndex(rowIndex) as! ItemRow ;
        selectedCellIndex = row.cellIndex ;
        setborderColors(selectedCellIndex);
        setupTable();
        
    }
    
}





