//
//  Menu_cateViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/24.
//

import UIKit

class Menu_cateViewController: UIViewController {

    var cateDataList : [cateResult] = []

    
    
    let menu1 = ["스타굿즈","여성가방","피규어/인형","스니커즈","닌텐도/NDS/Will","카메라/DSLR","시계","인테리어","헬스/요가/필라테스","CD/DVD/LP","골프","자전거"]
    let menu2 = ["여성의류","남성의류","신발","가방","시계/쥬얼리","패션 액세서리","디지털/가전","스포츠/레져","차량/오토바이","스타굿즈","키덜트","예술/희귀/수집품","음반/악기","도서/티켓/문구","뷰티/미용","가구/인테리어","생활/가공식품","유아동/출산","반려동물용품","기타","번개나눔","커뮤니티"]
    let menu3 = ["지역 서비스","원룸/함께살아요","구인구직","재능"]

    
    
    let img1 = ["menu_sne","menu_bag","menu_star","menu_doll","menu_sne","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_golf","menu_doll","menu_sne","menu_bag","menu_star","menu_doll","menu_sne","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_golf","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_golf"]
    let img2 = ["menu_doll","menu_doll","menu_bag","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_goods","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll","menu_doll"]
    let img3 = ["menu_doll","menu_doll","menu_doll","menu_doll"]

    
    
    
    
    let menuImg = ["menu_heart","menu_herm","menu_his","menu_bag","menu_feed","menu_sne","menu_phone","menu_goods","menu_loca","menu_camp","menu_friend","menu_golf","menu_whole","menu_doll"]
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        goods().Category(self)
      
        collectionView.delegate = self
        collectionView.dataSource = self
       
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = sectionInsets
        collectionViewLayout?.invalidateLayout()

        // Do any additional setup after loading the view.
    }
//
//    override func viewDidAppear(_ animated: Bool){
//
//        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
//        collectionViewLayout?.sectionInset = sectionInsets
//        collectionViewLayout?.invalidateLayout()
//    }
//
   
    
    
   
}


extension Menu_cateViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 0) {
            
            return cateDataList.count
            
        }
        else if (section == 1) { return 17}
        else { return 4}

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menucell", for: indexPath) as! menu_cateCollectionViewCell
    
            if(indexPath.section == 0){
            cell.labe.text = cateDataList[indexPath.row].categoryName
            cell.img.image = UIImage(named: img1[indexPath.row])
            
        }
        
        else if(indexPath.section == 1){
            cell.labe.text = menu2[indexPath.row]
            cell.img.image = UIImage(named: img2[indexPath.row])

        
        }
        else{
        cell.labe.text = menu3[indexPath.row]
            cell.img.image = UIImage(named: img3[indexPath.row])

        
        }
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 4
        let spacing: CGFloat = 10
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)

        return CGSize(width: itemDimension, height: itemDimension)
    }

   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
   

   

    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind : String, at indexPath: IndexPath) -> UICollectionReusableView{
        var header : menu_cateHeader?
        
        if kind == UICollectionView.elementKindSectionHeader{
            
            header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? menu_cateHeader
        if (indexPath.section == 0) {
            header?.header.text = "인기취향/취미"
        }
       else if (indexPath.section == 1) {
            header?.header.text = "중고거래"
        }
        
       else {
            header?.header.text = "생활"
        }
        
        }
        
        return header!
    }
    
    
    //셀 터치 이벤트 -- 화면이동 추가
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){}
}



class menu_cateCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var labe: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
   
    }
    
}


class menu_cateHeader: UICollectionReusableView {

   
    @IBOutlet weak var header: UILabel!
    override func awakeFromNib(){
        super.awakeFromNib()
        
   
    }
    
}


//api setting 함수
extension Menu_cateViewController{
    
    func didSuccess_category(_ response: category){
        
//        let brandName = response.result[0].brandName
//        self.testlabel.text = brandName
//
        self.cateDataList = response.result
        print("카테고리")
        print(cateDataList.count)
        print(cateDataList[0].categoryName)
        print(cateDataList[2].categoryName)

        self.collectionView.reloadData()

//        self.brandTable.reloadData()
                   
               
//
    }
}
