//
//  ViewComponent.swift
//  Githup App
//
//  Created by Danang Wijaya on 21/05/21.
//

import Foundation
import SwiftUI
extension View{
    @ViewBuilder func isHidden(_ isHidden:Bool) -> some View{
        if(isHidden){
            self.hidden()
        }
        else{
            self
        }
    }
}
