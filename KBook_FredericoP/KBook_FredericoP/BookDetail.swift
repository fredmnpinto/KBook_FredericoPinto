//
//  BookDetail.swift
//  KBook_FredericoP
//
//  Created by Alexander on 13/08/20.
//

import UIKit


class BookDetail: UIViewController {
    

    @IBOutlet weak var Fav_lbl: UILabel!
    @IBOutlet weak var Description_lbl: UILabel!
    @IBOutlet weak var Editor_lbl: UILabel!
    @IBOutlet weak var Author_lbl: UILabel!
    @IBOutlet weak var Title_lbl: UILabel!
    @IBOutlet weak var Cover_img: UIImageView!
    
    @IBAction func favBtn(_ sender: Any) {
        var fav = bookArray[currentBook]?.favorite
        if fav == false {
            Fav_lbl.text = "Favoritado"
            fav = true
        }
        else {
            Fav_lbl.text = "Não é um favorito"
            fav = false
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}

public var currentBook: Int = 0
public func setup() {
    print("Well, what can i say..", bookArray[0]?.volumeInfo.title! as Any)
    let book = bookArray[0]?.volumeInfo
    
    var authors : String = ""
    for i in 0...(book?.authors.count)! - 1{
        if i == 0{
            authors = (book?.authors[i])!
        }
        else{
        authors = authors + ", \(book?.authors[i] ?? "ERROR")"
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
