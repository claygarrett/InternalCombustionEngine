//
//  ContentView.swift
//  CombustibleEngine
//
//  Created by Clay Garrett on 6/8/19.
//  Copyright © 2019 Clay Garrett. All rights reserved.
//

import SwiftUI

struct Engine {
    var noise: String
}

struct ContentView : View {
    @ObjectBinding var assembler: Assembler
    
    var body: some View {
     
        VStack {
            Text("Crankshaft").font(.caption).foregroundColor(.gray)
            Text("Flywheel").font(.caption).foregroundColor(.gray)
            ZStack {
                Image("flywheel").rotationEffect(Angle(degrees: assembler.crankshaft.rotation))
                Image("crankshaft").rotationEffect(Angle(degrees: assembler.flywheel.rotation))
            }
            HStack {
                Group {
                    VStack {
                        Text("Intake Camshaft").font(.caption).foregroundColor(.gray)
                        ZStack {
                            Image("camshaft").rotationEffect(Angle(degrees: assembler.intakeCam.rotation))
                            Image("cam-lobe-1").rotationEffect(Angle(degrees: assembler.intakeCam.cams[0].rotation))
                            Image("cam-lobe-2").rotationEffect(Angle(degrees: assembler.intakeCam.cams[1].rotation))
                            Image("cam-lobe-3").rotationEffect(Angle(degrees: assembler.intakeCam.cams[2].rotation))
                            Image("cam-lobe-4").rotationEffect(Angle(degrees: assembler.intakeCam.cams[3].rotation))
                        }
                    }
                    VStack {
                        Text("Exhaust Camshaft").font(.caption).foregroundColor(.gray)
                        ZStack {
                            Image("camshaft").rotationEffect(Angle(degrees: assembler.exhaustCam.rotation))
                            Image("cam-lobe-1").rotationEffect(Angle(degrees: assembler.exhaustCam.cams[0].rotation))
                            Image("cam-lobe-2").rotationEffect(Angle(degrees: assembler.exhaustCam.cams[1].rotation))
                            Image("cam-lobe-3").rotationEffect(Angle(degrees: assembler.exhaustCam.cams[2].rotation))
                            Image("cam-lobe-4").rotationEffect(Angle(degrees: assembler.exhaustCam.cams[3].rotation))
                        }
                    }
                }.padding()
            }
            HStack {
                VStack {
                    Text("Intake Valves").font(.caption).foregroundColor(.gray)
                    HStack {
                        Image("valve-\(assembler.intakeCam.cams[0].valve!.getValveState().getName())")
                        Image("valve-\(assembler.intakeCam.cams[1].valve!.getValveState().getName())")
                        Image("valve-\(assembler.intakeCam.cams[2].valve!.getValveState().getName())")
                        Image("valve-\(assembler.intakeCam.cams[3].valve!.getValveState().getName())")
                        }.padding()
                }.padding()
                
                VStack {
                    Text("Intake Valves").font(.caption).foregroundColor(.gray)
                    HStack {
                        Image("valve-\(assembler.exhaustCam.cams[0].valve!.getValveState().getName())")
                        Image("valve-\(assembler.exhaustCam.cams[1].valve!.getValveState().getName())")
                        Image("valve-\(assembler.exhaustCam.cams[2].valve!.getValveState().getName())")
                        Image("valve-\(assembler.exhaustCam.cams[3].valve!.getValveState().getName())")
                        }.padding()
                }.padding()
            }
        }.padding(EdgeInsets(top: 200, leading: 50, bottom: 200, trailing: 50)).background(Color.black)
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(assembler: Assembler())
    }
    
}
#endif

// data flow through swiftui

struct CrankshaftView : View {
    
    @State var crankshaft: Crankshaft
    
    var body: some View {
        return Text(crankshaft.name)
    }
}
