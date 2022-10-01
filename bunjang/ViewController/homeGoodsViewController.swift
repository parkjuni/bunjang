//
//  homeGoodsViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/27.
//

import UIKit

//var goodsID : [Int] = []
let homeImg = ["1","2","3","4","5","6","7","8","9"]


class homeGoodsViewController: UIViewController {
   

    var DataList : [homegoods] = []

    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        goods().homeList(self)
        collectionView.delegate = self
        collectionView.dataSource = self
       
        // Do any additional setup after loading the view.
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = sectionInsets
        collectionViewLayout?.invalidateLayout()
        
    }

}


extension homeGoodsViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataList.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectCell", for: indexPath) as! goodsCollectionViewCell
            
        cell.price.text = DataList[indexPath.row].price

        cell.content.text = DataList[indexPath.row].title
        cell.content.sizeToFit()
        cell.likes.text = "♥ " + String(DataList[indexPath.row].likes)
        cell.img.layer.cornerRadius = 5

        let url = URL(string:DataList[indexPath.row].imgUrl)
           let data = try! Data(contentsOf: url!)
        cell.img.image = UIImage(data: data)

        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let itemsPerRow: CGFloat = 2
        let widthPadding = sectionInsets.left * (itemsPerRow)
        let itemsPerColumn: CGFloat = 5
        let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
        let cellWidth = (width-(widthPadding)) / 2 - widthPadding
        let cellHeight = (height-heightPadding) / itemsPerColumn

        return CGSize(width: cellWidth, height: 300)


        

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

class goodsCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var region_time: UILabel!
    @IBOutlet weak var likes: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
   
    }
    
}



//api setting 함수
extension homeGoodsViewController{
    
    func didSuccess_homelist(_ response: homelist){
        
        self.DataList = response.result

        print("카테고리")
        print(DataList.count)
        print(DataList[0].title)
        self.collectionView.reloadData()


    }
}
