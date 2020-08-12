//
//  GenreButtonScreen.swift
//  KBook_FredericoP
//
//  Created by Zephyr on 08/08/20.
//

import UIKit


/*struct Response: Decodable{
    let books: Book
}*/

struct Response : Decodable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
}

struct AccessInfo: Decodable{
    let country, viewability, embeddable, textToSpeechPermission : String
    let publicDomain: Bool
    let epub: Epub
    let pdf: Pdf
    let webReaderLink: String
    let accessViewStatus: String
    let quoteSharingAllowed: Bool
}

struct Pdf: Decodable{
    let isAvailable: Bool
}

struct Epub: Decodable{
    let isAvailable: Bool
}

struct SaleInfo: Decodable{
    let country: String
    let saleability: String
    let isEbook: String
}

struct VolumeInfo: Decodable{
    let title: String
    let subtitle: String
    let authors: Array<String>
    let publisher: String
    let publishedDate: String
    let description: String
    let industryIdentifiers: Array<IndustryIdentifiers>
    let readingModes: Array<ReadingModes>
    let pageCount: Int
    let printedPageCount: Int
    let printType: String
    let categories: Array<String>
    let maturityRating: String
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks
    let language :String
    let previewLink : String
    let infoLink: String
    let canonicalVolumeLink: String
}

struct ImageLinks: Decodable{
    let smallThumbnail, thumbnail, small, medium, large, extraLarge: String
}

struct PanelizationSummary: Decodable{
    let containsEpubBubbles: Bool
    let containsImageBubbles: Bool
}

struct ReadingModes: Decodable{
    let text: Bool
    let image: Bool
}

struct IndustryIdentifiers: Decodable{
    let type: String
    let identifier: String
}

/*
 {
   "kind": "books#volumes",
   "totalItems": 354,
   "items": [
     {
       "kind": "books#volume",
       "id": "x6qjAwAAQBAJ",
       "etag": "+mZUWkY60Tw",
       "selfLink": "https://www.googleapis.com/books/v1/volumes/x6qjAwAAQBAJ",
       "volumeInfo": {
         "title": "Aprendendo Programação iOS",
         "subtitle": "Do Xcode à App Store",
         "authors": [
           "Alasdair Allan"
         ],
         "publisher": "Novatec Editora",
         "publishedDate": "2013-07-01",
         "description": "Tenha acesso a uma rápida introdução à programação para iPhone, iPad e iPod touch. Com este guia fácil de acompanhar, você aprenderá a desenvolver seu primeiro aplicativo iOS comercializável, da abertura do Xcode ao envio de seu produto para a App Store. Quer você seja um desenvolvedor iniciante em programação para Mac ou um desenvolvedor experiente no Mac, pronto para trabalhar com o iOS, este é o seu livro. Você aprenderá na prática a utilizar a Objective-C e seus principais frameworks, escrevendo vários aplicativos iOS de exemplo, dando a você as habilidades básicas para a construção de seus próprios aplicativos de forma independente. Recheado de exemplos de código, este livro foi reformulado e atualizado para o iOS 6 e o Xcode 4. - Descubra as vantagens da construção de aplicativos iOS nativos. - Dê seus primeiros passos com a Objective-C e os frameworks Cocoa Touch. - Aprofunde-se nas classes de visão de tabela para construção de interfaces de usuário. - Manipule a entrada de dados, processe documentos XML e JSON e armazene dados no SQLite. - Utilize sensores iOS, incluindo o acelerômetro, o magnetômetro, a câmera e o GPS. - Construa aplicativos que utilizam os frameworks Core Location e MapKit. - Integre o serviço iCloud da Apple em seus aplicativos. - Percorra o processo de distribuição de seu aplicativo na App Store. \"O livro Aprendendo programação iOS aborda tudo que um programador iOS aspirante necessita saber para dar seus primeiros passos nessa plataforma. Um livro completo e de leitura muito agradável. Recomendado!\" — Fraser Speirs, Diretor da Connected Flow, Ltd. e criador do FlickrExport",
         "industryIdentifiers": [
           {
             "type": "ISBN_13",
             "identifier": "9788575223635"
           },
           {
             "type": "ISBN_10",
             "identifier": "8575223631"
           }
         ],
         "readingModes": {
           "text": false,
           "image": true
         },
         "pageCount": 448,
         "printType": "BOOK",
         "categories": [
           "Computers"
         ],
         "maturityRating": "NOT_MATURE",
         "allowAnonLogging": false,
         "contentVersion": "preview-1.0.0",
         "panelizationSummary": {
           "containsEpubBubbles": false,
           "containsImageBubbles": false
         },
         "imageLinks": {
           "smallThumbnail": "http://books.google.com/books/contentid=x6qjAwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
           "thumbnail": "http://books.google.com/books/contentid=x6qjAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
         },
         "language": "pt",
         "previewLink": "http://books.google.pt/booksid=x6qjAwAAQBAJ&pg=PA25&dq=ios&hl=&cd=1&source=gbs_api",
         "infoLink": "http://books.google.pt/booksid=x6qjAwAAQBAJ&dq=ios&hl=&source=gbs_api",
         "canonicalVolumeLink": "https://books.google.com/books/about/Aprendendo_Programa%C3%A7%C3%A3o_iOS.htmlhl=&id=x6qjAwAAQBAJ"
       },
       "saleInfo": {
         "country": "PT",
         "saleability": "NOT_FOR_SALE",
         "isEbook": false
       },
       "accessInfo": {
         "country": "PT",
         "viewability": "PARTIAL",
         "embeddable": true,
         "publicDomain": false,
         "textToSpeechPermission": "ALLOWED",
         "epub": {
           "isAvailable": false
         },
         "pdf": {
           "isAvailable": false
         },
         "webReaderLink": "http://play.google.com/books/readerid=x6qjAwAAQBAJ&hl=&printsec=frontcover&source=gbs_api",
         "accessViewStatus": "SAMPLE",
         "quoteSharingAllowed": false
       },
       "searchInfo": {
         "textSnippet": "No entanto, se isso acontecer com você, o passo final do registro como um \u003cbr\u003e\ndesenvolver \u003cb\u003eiOS\u003c/b\u003e será verificar seu endereço de email. Ainda que esse email \u003cbr\u003e\nseja, na maioria dos casos, enviado de forma razoavelmente rápida (dentro de \u003cbr\u003e\numa ou&nbsp;..."
       }
     }
 */






class GenreButtonScreen: UIViewController {
    var current_book = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://www.googleapis.com/books/v1/volumes/x6qjAwAAQBAJ"
        
         get_data(from: url)
        // Do any additional setup after loading the view.
    }
   
    
    private func get_data(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            var book: Response?
            do {
                book = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = book else {
                return
            }
            
            print(json.volumeInfo.title)
        })
        task.resume()
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
