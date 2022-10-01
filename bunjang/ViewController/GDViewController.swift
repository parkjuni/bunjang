//
//  GDViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/29.
//

import UIKit

class GDViewController: UIViewController {

    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
   
    var DataList : [BGResult] = []

    @IBOutlet weak var brandImg: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var engName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goods().brandDetail(self, brandId: String(ud.integer(forKey: "menu_brandId")))
        // Do any additional setup after loading the view.

        
        brandName.text = ud.string(forKey: "menu_brandName")
        engName.text = ud.string(forKey: "menu_brandEng")
        
        let brandUrl = URL(string: ud.string(forKey: "menu_brandUrl")!)
        let data = try! Data(contentsOf: brandUrl!)
        brandImg.image = UIImage(data: data)
        brandImg.layer.cornerRadius = 5

        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = sectionInsets
        collectionViewLayout?.invalidateLayout()

//        collectionView.collectionViewLayout = CollectionViewLeftAlignFlowLayout()

    }
    

  

}


extension GDViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataList.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! gdCollectionViewCell
    
        cell.price.text = DataList[indexPath.row].price
        
        
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
        print("굿즈 아이디 ")
        print(ud.integer(forKey: "goodId"))

        let storyboard = UIStoryboard(name: "goodsDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "goodsDetailViewController")

         self.show(vc, sender: self)
        
    }

}

class gdCollectionViewCell: UICollectionViewCell {

   
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

//api setting 함수
extension GDViewController{
    
    func didSuccess_brand(_ response: Brandgoods){
        
        print(response.result[0].title)
        self.DataList = response.result
        
        self.collectionView.reloadData()

//
    }
}

extension GDViewController{
    
    func didSuccess_cate(_ response: Brandgoods){
        
        print("카테고리 api 성공")
        print(response.result[0].title)

    }
}
