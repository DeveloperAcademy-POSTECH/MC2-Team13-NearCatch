import PhotosUI
import SwiftUI

struct ImagePicker: View {
    
    private let threeColumnGrid = [
        GridItem(.flexible(minimum: 40), spacing: 2),
        GridItem(.flexible(minimum: 40), spacing: 2),
        GridItem(.flexible(minimum: 40), spacing: 2),
    ]
    
    @Binding var profileImage: UIImage?
    @Binding var show: Bool
    @State var tempImage: Img?
    @State var disabled = true
    @State var grid : [Img] = []
    @State var startNoImageView: Bool = false
    @State var loadingState : Bool = true
    
    var body: some View {
        ZStack {
            VStack {
                // 만약 선택된 사진들이 있다면?
                if !self.grid.isEmpty{
                    HStack{
                        Button(action: {
                            self.show.toggle()
                        }){
                            Text("취소")
                        }.padding()
                        Spacer()
                    }
                    
                    // 앨범에서 선택한 사진들이 들어갈 스크롤 뷰
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: threeColumnGrid, alignment: .leading, spacing: 2) {
                            ForEach(0..<self.grid.count, id: \.self) { i in
                                Rectangle()
                                    .fill(.black)
                                    .aspectRatio(1, contentMode: .fit)
                                    .overlay{
                                        Image(uiImage: grid[i].image)
                                            .resizable()
                                            .scaledToFill()
                                    }
                                    .clipped()
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if self.tempImage != nil {
                                            self.profileImage = grid[i].image
                                        }
                                        self.show.toggle()
                                    }
                            }
                        }
                    }
                }
                else {
                    // 설정이 deny 되었을때
                    if self.disabled{
                        VStack{
                            Text("권한을 허용하지 않으면 프로필 이미지를 등록할 수 없어요!")
                                .font(.custom("온글잎 의연체", size: 20))
                            Text("Setting에서 권한 설정을 변경해주세요")
                                .font(.custom("온글잎 의연체", size: 30))
                            
                            ImagePermissionInfoView()
                            //                            .scaledToFit()
                                .frame(height: UIScreen.main.bounds.height * 2 / 4)
                            Button {
                                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(Color.PrimaryColor)
                                        .frame(maxWidth: .infinity).frame(height: 50)
                                    
                                    Text("설정 바로가기")
                                        .foregroundColor(.black)
                                        .font(.custom("온글잎 의연체", size: 28))
                                }
                            }
                            .padding(.top,30)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        }.onAppear{
                            if self.loadingState == true {
                                self.loadingState = false
                            }
                        }
                    }
                    // 권한 accept 했다면?
                    else {
                        // 선택된 사진이 한장도 없을때!
                        if self.grid.count == 0{
                            if startNoImageView{
                                VStack{
                                    Text("선택된 사진이 없습니다.")
                                        .font(.custom("온글잎 의연체", size: 30))
                                    Text("사진을 추가해 주세요!")
                                        .font(.custom("온글잎 의연체", size: 20))
                                    NoImageInfoView()
                                    //                            .scaledToFit()
                                        .frame(height: UIScreen.main.bounds.height * 2 / 4)
                                    Button {
                                        if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                                        }
                                    } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                .fill(Color.PrimaryColor)
                                                .frame(maxWidth: .infinity).frame(height: 50)
                                            
                                            Text("설정 바로가기")
                                                .foregroundColor(.black)
                                                .font(.custom("온글잎 의연체", size: 28))
                                        }
                                    }
                                    .padding(.top,30)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                }
                            }
                            else{
                                VStack{}
                                    .onAppear{
                                        DispatchQueue.main.asyncAfter(deadline: .now()+0.2){
                                            print("asdsadasd")
                                            self.startNoImageView = true
                                        }
                                    }
                            }
                        }
                    }
                    
                }
            }
            
            if self.loadingState {
                ImageLoadingView()
            }
            
        }
        .onAppear{
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    self.getAllImages()
                    self.disabled = false
                }
                else {
                    print("디나이")
                    self.disabled = true
                }
            }
        }
    }
    
    func getAllImages(){
        if self.loadingState == false{
            self.loadingState = true
        }
        let opt = PHFetchOptions()
        opt.includeHiddenAssets = false
        
        let req = PHAsset.fetchAssets(with: .image, options: .none)
        
        DispatchQueue.global(qos: .background).async {
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            
            var iteration : [Img] = []
            for i in stride(from: 0, to: req.count, by: 1) {
                if i < req.count {
                    // 원본 화질로 하면, 보기는 좋지만 로딩되는 시간때문에 체크가 풀린다.
                    PHCachingImageManager.default().requestImage(for: req[i], targetSize: CGSize(width: 150, height: 150), contentMode: .default, options: options) { (image,_) in
                        let data = Img(image: image!, selected: false, asset: req[i])
                        iteration.append(data)
                    }
                }
                print(iteration.count)
                self.grid = iteration
            }
            self.loadingState = false
        }
    }
}
