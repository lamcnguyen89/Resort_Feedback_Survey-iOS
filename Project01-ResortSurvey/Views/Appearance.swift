//
//  Appearance.swift
//  Project01-ResortSurvey
//
//  Created by Lam Nguyen on 5/5/21.
//

// This file contains standardized appearances for objects
import Foundation
import UIKit

// Class to standardize Main View Objects
class MyMainView : UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // MyMainView.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        MyMainView.appearance().backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
}



// Class to standardize Primary Button Objects
class MyButtons : UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // MyButtons.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        MyButtons.appearance().backgroundColor = .systemPurple
        MyButtons.appearance().contentEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        // MyButtons.appearance().tintColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        MyButtons.appearance().tintColor = .label
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
    
    
}

// Class to standardize labels that contain the questions
class MyQuestionLabels : UILabel {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        //MyQuestionLabels.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        MyQuestionLabels.appearance().tintColor = .label
        
    }
}

// Class to style text fields
class MyTextFields : UITextField {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        
    }}


