 # KreamCloneCoding

패션 한정판 거래 플랫폼인 "크림(Kream)" 앱의 UI와 주요 기능을 학습하기 위해 클론코딩 방식으로 제작한 프로젝트입니다.
## ⚒️ Tech Stack

- **Framework**
  - SwiftUI
    
- **Architecture**
  - MVVM

- **Remote Backend**
  - **Firebase** (Auth, Firestore, Storage)
  
- **Library**
  - Kingfisher-Imageloading
        <details>
        <summary>라이브러리 사용 이유</summary>

    🖼️ **Kingfisher**

     - 비동기 이미지 로딩과 캐싱 처리를 쉽게 구현하기 위해 사용하였습니다.  
     </details>

- **Dependency Management**
  - Swift Package Manager



## 🚀 주요 기능

- **회원 인증 & 로그인**  
  - Firebase Authentication을 활용한 이메일·비밀번호 로그인 및 소셜 로그인 지원

- **스타일 피드 & 댓글**  
  - PinterestView 기반으로 사용자들이 올린 스타일 착용 사진을 그리드 피드 형식으로 표시 
  - 각 사진에 실시간 댓글 작성 기능 지원 (Firestore snapshot 리스너)

- **상품 목록 & 카테고리 필터**  
  - 판매 중인 상품 아이템을 Grid 형태로 보여줌  
  - 브랜드·카테고리·가격대·사이즈별 필터링 기능 제공

- **이미지 업로드**  
  - 카메라/사진 라이브러리 선택 후 Firebase Storage에 이미지 업로드  
  - Kingfisher 기반 캐싱으로 빠른 이미지 로딩

- **관심있는 아이템 저장**  
  - 판매 아이템 정보와 이미지 URL을 Firestore에 저장

- **프로필 관리**  
  - 프로필 사진 선택 및 변경 기능  
  - 반원 마스크 오버레이 UI와 토스트 팝업을 통한 피드백 제공


## 📱 앱 동작 화면
<details>
 <summary>
  시연 영상 보기
 </summary> <br/>
 
   * 회원가입/로그인
  
 ![Image](https://github.com/user-attachments/assets/d6dd0796-6d23-4d65-bffc-fbb792d7d24c) 
 
 ![Image](https://github.com/user-attachments/assets/ee48e148-888d-4eb3-9851-d05a5e3b491b)

   * 프로파일 정보 업데이트
    
 ![Image](https://github.com/user-attachments/assets/f2e2f8a5-ba33-4b30-9ed4-356f3b2a86b0)
 
 ![Image](https://github.com/user-attachments/assets/d9c40e0c-9d03-4789-85b2-d03146fde33d)
    
   * 홈화면 배너&검색
    
 ![Image](https://github.com/user-attachments/assets/33a861cb-85a3-45c2-8c4a-58debc766661)

   * 스타일뷰 포스트 업로드
     
![Image](https://github.com/user-attachments/assets/bdb5a58c-52ea-4ad2-8e94-51415454b8b8)

   * 스타일디테일 뷰 댓글작성 & 좋아요 기능

![Image](https://github.com/user-attachments/assets/3cc1be73-95b2-406e-b7fd-27e9cf7e09ec)

 * ShopView & SavedView
   
![Image](https://github.com/user-attachments/assets/446ddf28-99e6-4a5d-a0f0-d6aa3e3da91f)
 
</details>



# 💡 트러블슈팅

##  ♻️ 중복 코드 제거 및 재사용성 강화를 위한 리팩토링
<details>
  
<summary>코드예시</summary> <br/> 

- 프로필 이미지에 동일한 modifier들이 반복되어 코드가 길어지고 가독성이 떨어졌습니다.
- ViewModifier를 별도로 만들어 반복 코드를 분리하고, 공통된 스타일과 로직을 모듈화했습니다.
- 이를 통해 코드의 재사용성, 가독성, 유지 보수성을 모두 향상시킬 수 있었습니다.

```swift
struct ProfileEditImage: View {
    @ObservedObject var viewModel : ProfileViewModel
    @State var selectedImage: UIImage?
    @State private var imagePickerPresented = false
    @Binding var showPopup : Bool
    var body: some View {
        if viewModel.user?.profileImageUrl == nil {
            
            Image("editdefaultprofile")
                .resizable()
                .profileEditImageModifier(viewModel: viewModel, showpopup: $showPopup)
            
        }  else if let profileImageUrl = viewModel.user?.profileImageUrl {
            KFImage(URL(string: profileImageUrl))
                .resizable()
                .profileEditImageModifier(viewModel: viewModel, showpopup: $showPopup)
        }
    }
}

struct ProfileEditImageModifier: ViewModifier {
    @ObservedObject var viewModel : ProfileViewModel
    @State var selectedImage: UIImage?
    @State private var imagePickerPresented = false
    @Binding var showPopup : Bool
 
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 80, height: 80)
            .overlay {
                Rectangle()
                    .fill(Color.black.opacity(0.6))
                    .frame(height: 25)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .overlay {
                Text("편집")
                    .font(.caption)
                    .foregroundColor(.white)
                    .bold()
                    .offset(y: 25)
            }
            .clipShape(Circle())
            .onTapGesture {
                imagePickerPresented.toggle()
                }.sheet(isPresented: $imagePickerPresented) {
                ImagePicker(image: $selectedImage)
            }.onChange(of: selectedImage) { _, newValue in
                viewModel.updateProfileImage(image: selectedImage , type: .profile)
                                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    showPopup = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    showPopup = false
                }
            }
    }
}


extension View {
    func profileEditImageModifier(viewModel: ProfileViewModel, showpopup: Binding<Bool>) -> some View {
        return ModifiedContent(content: self, modifier: ProfileEditImageModifier(viewModel: viewModel, showPopup: showpopup))
    }
}

```

*	상품 저장 버튼을 여러 화면(상품 상세화면, 상품 전체 목록, 저장한 아이템 목록 등)에서 공통으로 사용해야 했습니다.
*	하나의 ProductSaveButton 컴포넌트를 만들어 각 뷰에서 손쉽게 재사용할 수 있도록 설계했습니다.
*	이를 통해 중복 코드를 제거 하면서, 일관된 로직을 유지했습니다.

```swift

struct ProductSaveButton: View {
    let width: CGFloat
    let height: CGFloat
    
    @StateObject var viewModel: ProductViewModel
    
    init(product:Product, width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        self._viewModel = StateObject(wrappedValue: ProductViewModel(product: product))
    }
    
    var isSaved: Bool {
        viewModel.product.isSaved ?? false
    }
    var body: some View {
        Button(action: {
            isSaved ? viewModel.unsaved() : viewModel.saved()
                 }) {
                     Image(isSaved ? "bookmark.fill" : "bookmark")
                         .resizable()
                         .frame(width: width, height: height)
        }
    }
}
```
</details>

