//
//  CaDViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/29.
//

import UIKit

class CaDViewController: UIViewController {

        var DataList : [BGResult] = []

    
    @IBOutlet weak var cateImg: UIImageView!
    @IBOutlet weak var cateName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
            goods().cateDetail(self, cateId: String(ud.integer(forKey: "menu_catedId")))
//        goods().brandDetail(self, cateId: String(ud.integer(forKey: "menu_catedId")))

        // Do any additional setup after loading the view.
        
                cateName.text = ud.string(forKey: "menu_cateName")
        
                let cateUrl = URL(string: ud.string(forKey: "menu_cateUrl")!)
                let data = try! Data(contentsOf: cateUrl!)
                cateImg.image = UIImage(data: data)
                cateImg.layer.cornerRadius = 5
        
                let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
                collectionViewLayout?.sectionInset = sectionInsets
                collectionViewLayout?.invalidateLayout()
        
        
    }
    
}




extension CaDViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return DataList.count
        

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! caDCollectionViewCell

        cell.price.text = DataList[indexPath.row].price
//
//
        cell.content.text = DataList[indexPath.row].title
        let url = URL(string:DataList[indexPath.row].imgUrl)
        let data = try! Data(contentsOf: url!)

        cell.img.image = UIImage(data: data)
        cell.img.layer.cornerRadius = 5


//
        return cell

    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//

        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let itemsPerRow: CGFloat = 3
        let widthPadding = sectionInsets.left * (itemsPerRow)
        let itemsPerColumn: CGFloat = 5
        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
        let cellWidth = (width-(widthPadding)) / 2 - widthPadding
        let cellHeight = (height-heightPadding) / itemsPerColumn

        return CGSize(width: width/3 - 20, height: 220)




    }

    //셀 터치 이벤트 -- 화면이동 추가
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){

        ud.set(DataList[indexPath.row].goodsId, forKey: "goodId")
//        print("굿즈 아이디 ")
//        print(ud.integer(forKey: "goodId"))
//
        let storyboard = UIStoryboard(name: "goodsDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "goodsDetailViewController")

         self.show(vc, sender: self)

    }

}

class caDCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var img: UIImageView!

//
    override func awakeFromNib(){
        super.awakeFromNib()
        price.sizeToFit()
        content.sizeToFit()

    }

}
//
////api setting 함수
//extension GDViewController{
//
//    func didSuccess_brand(_ response: Brandgoods){
//
//        print(response.result[0].title)
//        self.DataList = response.result
//
//        self.collectionView.reloadData()
//
////
//    }
//}
//
extension CaDViewController{

    func didSuccess_cate(_ response: Brandgoods){

        print("카테고리 api 성공")
        print(response.result[0].title)

        self.DataList = response.result
//
        self.collectionView.reloadData()

//
    }
}
////
