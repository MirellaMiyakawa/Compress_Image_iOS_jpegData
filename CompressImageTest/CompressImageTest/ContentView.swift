import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            if let image = UIImage(named: "ImgTest") {
                let imagemData = image.compressImage(image, compressionQuality: 0.2)
                
                //mostra o tamanho da imagem após ser compactada
                let imageSizeInKB = Double(imagemData?.count ?? 0) / 1024.0
                Text(String(format: "Image Size: %.2f KB", imageSizeInKB))
                
                .padding()
                
                if let arquivo = imagemData {
                    if let imagemCompactada = UIImage(data: arquivo) {
                        Image(uiImage: imagemCompactada)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(width: 200, height: 200)
                    } else {
                        Text("Erro na transformação da tipagem da foto")
                            .foregroundColor(.red)
                    }

                } else {
                    Text("Erro: Imagem não compactada")
                }
                
            } else {
                Text("Erro: Imagem não encontrada")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension UIImage {
    func compressImage(_ image: UIImage, compressionQuality: CGFloat) -> Data? {
        let compressedData = image.jpegData(compressionQuality: compressionQuality)
        return compressedData
    }
}
