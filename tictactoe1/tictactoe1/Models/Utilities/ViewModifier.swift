//
//  ViewModifier.swift
//  tictactoe1
//
//  Created by admin on 2/15/23.
//

import Foundation

struct NavStackContainer: ViewModifier{
    func body(content: Content) -> some View {
        if #available(iOS 16, *){
            //what does teh # mean?
            //what does the * mean? - since we arent specifying .1 or .2 its just a general answer
            NavigationStack{
                content
            }
            } else {
                NavigationView{
                    content
                    //whats the difference between {} and ()
                }//end navigation view
                .navigationViewStyle(.stack)
            }//end else
        }//end func
    }//end structure
extension View{
    public func inNavigationStack()-> some View{
        return self.modifier(NavStackContainer())
        // does the spaces matter like whether or not there is one before the ->
    }
    //public is global
    //private is just for this file
}
    

