import SwiftUI
import GoogleMaps

struct MapSearchScene: View {
    
    @State var markerNow : GMSMarker?
    @State var markerTapped : Bool = false
    @StateObject private var dataFetchManager = DataFetchManager()
    @State private var tags = [String]()
    @State private var tagTextField = ""
    @State private var firstLoadedMap = false
    
    
    
    var body: some View {

        
        NavigationView {
            ZStack{
                VStack{
                    //MARK: - Area de busqueda por tags
                    HStack{
                        TextField("Busqueda por nombre de edificos", text: $tagTextField).padding()
                        Spacer()
                        Button("Buscar"){
                            if tagTextField == "" {return}
                            tags.append(tagTextField)
                            tagTextField = ""
                            print(tags)
                        }.padding().frame(alignment: .leading)
                    }.frame(maxHeight:50.0)
                    // MARK: - Llamada a MapView
                    MainMapView(markerNow: $markerNow, markerTapped: $markerTapped)
                        .environmentObject(dataFetchManager)
                    
                    // MARK: - Tags de busqueda
                    HStack{
                        if tags.isEmpty {
                            Text("Coloca algunos filtros :)")
                                .foregroundColor(Color.gray)
                        }else{
                            ScrollView(.horizontal){
                                HStack(spacing: 10.0){
                                    ForEach(tags,id: \.self) { tag in
                                        TagView(tag){
                                            if let index = tags.firstIndex(of: tag) {
                                                tags.remove(at: index)
                                            }
                                        }
                                    }
                                }
                            }.padding()
                        }
                    }.frame(maxWidth: .infinity,maxHeight: 50.0)
                    
                    //MARK: - Boton filtros
                    NavigationLink(destination: {TagView("dasdasd"){print("ADADADAD")}
                    }, label: {
                        Text("Filtros")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    })
                    .padding()
                    .background(Color(UIColor(.orange)))
                    .ignoresSafeArea(edges: .bottom)
                }
                .disabled(markerTapped)
                // MARK: Config toolbar
                .navigationTitle("C A M M P")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    NavigationLink {
                        TagView("dasdasd"){
                            print("ADADADAD")
                        }
                    } label: {
                        Label {
                            Text("")
                        } icon: {
                            Image("Image")
                                .resizable()
                                .frame(width: 30.0, height: 30.0)
                        }
                        
                    }
                    .frame(alignment: .trailing)
                    .padding()
                }
                
                if markerTapped {
                    PreviewBuilding()
                }
            }
            
        }
    }
}




extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
