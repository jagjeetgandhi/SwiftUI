//
//  ContactInfo.swift
//  FirstUI
//
//  Created by jagjeet on 15/07/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import SwiftUI

struct ContactInfo: View {
    let icon:String
    let phno:String
    var body: some View {
        RoundedRectangle(cornerRadius: 25).frame(height: 50).foregroundColor(.white).overlay(HStack {
            Image(systemName: icon).foregroundColor(.green)
            Text(phno)
        } ).padding(.all)
    }
}


struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfo(icon: "pencil.slash", phno: "5564").previewLayout(.sizeThatFits)
    }
}
