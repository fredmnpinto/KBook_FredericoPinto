//
//  BookDetail.swift
//  KBook_FredericoP
//
//  Created by Alexander on 13/08/20.
//

import UIKit


class BookDetail: UIViewController {
    static var bookArray : [Response?] = []
    @IBAction func btnPress(_ sender: Any) {
        
    }
    
    @IBOutlet weak var Fav_lbl: UILabel!
    @IBOutlet weak var Description_lbl: UILabel!
    @IBOutlet weak var Editor_lbl: UILabel!
    @IBOutlet weak var Author_lbl: UILabel!
    @IBOutlet weak var Title_lbl: UILabel!
    @IBOutlet weak var Cover_img: UIImageView!
    
/*    @IBAction func favBtn(_ sender: Any) {
        var fav = bookArray[currentBook]?.favorite
        if fav == false {
            Fav_lbl.text = "Favoritado"
            fav = true
        }
        else {
            Fav_lbl.text = "Não é um favorito"
            fav = false
        }
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    let url = ["https://www.googleapis.com/books/v1/volumes/x6qjAwAAQBAJ",
               "https://www.googleapis.com/books/v1/volumes/4IG_CwAAQBAJ",
               "https://www.googleapis.com/books/v1/volumes/mmx3CgAAQBAJ",
               "https://www.googleapis.com/books/v1/volumes/bi6roOTgYK8C",
               "https://www.googleapis.com/books/v1/volumes/P3aE0pgSFfcC",
               "https://www.googleapis.com/books/v1/volumes/a09NMFdA6m0C",
               "https://www.googleapis.com/books/v1/volumes/_yU1XDHBAF8C",
               "https://www.googleapis.com/books/v1/volumes/C4EQySE9iL4C",
               "https://www.googleapis.com/books/v1/volumes/ymJIyHcVbfsC",
               "https://www.googleapis.com/books/v1/volumes/A6eZFLXGrUwC",
               "https://www.googleapis.com/books/v1/volumes/rj45JvYuOdIC",
               "https://www.googleapis.com/books/v1/volumes/Bd0pYCqRcssC",
               "https://www.googleapis.com/books/v1/volumes/0ses_ButxJUC",
               "https://www.googleapis.com/books/v1/volumes/mUsZBwAAQBAJ",
               "https://www.googleapis.com/books/v1/volumes/grPI8RnEqX0C",
               "https://www.googleapis.com/books/v1/volumes/wTaJjotNVMEC",
               "https://www.googleapis.com/books/v1/volumes/XzZ8y-Cz_BsC",
               "https://www.googleapis.com/books/v1/volumes/IWRh2HQFWucC",
               "https://www.googleapis.com/books/v1/volumes/cevlBQAAQBAJ",
               "https://www.googleapis.com/books/v1/volumes/Jea8AQAAQBAJ",]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentBook: Int = 0
        func setup() {
           print("Well, what can i say..", BookDetail.bookArray[0]?.volumeInfo.title as Any)
           let book = BookDetail.bookArray[0]?.volumeInfo
           
           var authors : String = ""
           for i in (book?.authors.startIndex)!...((book?.authors.endIndex)! - 1) - 1{
               if i == 0{
                   authors = (book?.authors[i])!
               }
               else{
               authors = authors + ", \(book?.authors[i] ?? "Couldn't read the authors name")"
                   print(authors)
               }
               
           }
           
           let imageUrlString = (book?.imageLinks?.thumbnail)!

           let imageUrl = URL(string: imageUrlString)!

           let imageData = try! Data(contentsOf: imageUrl)

           let image = UIImage(data: imageData)
           BookDetail().Cover_img.image = image
            
           BookDetail().Author_lbl.text = authors
           BookDetail().Title_lbl.text = book?.title
           BookDetail().Description_lbl.text = book?.volumeInfoDescription
           // Author_lbl.text = bookArray[currentBook]?.volumeInfo.authors
       }
        
        for link in url{
            
            
            get_data(from: link)
            
        }
        
        print("bookArray.count = \(BookDetail.bookArray.count)")
        
        setup()
        
        // Do any additional setup after loading the view.
    }
    private func get_data(from url: String){      // ERROR: Por algum motivo quando ele puxa os dados da api e armazena no array de structs, os dados                                                     estão todos lá, mas assim que sai da função, o array se torna novamente vazio
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
            print(BookDetail.bookArray.endIndex)
             print(json.volumeInfo.title as Any)
             print(json.volumeInfo.authors as Any)
             print(json.volumeInfo.subtitle as Any)
            BookDetail.bookArray.append(json)
            
            print(BookDetail.bookArray[BookDetail.bookArray.endIndex - 1]?.volumeInfo.title as Any)
            print(BookDetail.bookArray[BookDetail.bookArray.endIndex - 1]?.volumeInfo.authors as Any)
            print(BookDetail.bookArray[BookDetail.bookArray.endIndex - 1]?.volumeInfo.subtitle as Any)
            
            
         })
         task.resume()
         
         
     }
    
     
    
}


