//
//  SearchViewController.swift
//  bunjang
//
//  Created by JUNI on 2022/09/22.
//

import UIKit

class SearchViewController: UIViewController {

    var brandDataList : [brandResult] = []
    var cateDataList : [cateResult] = []
    var popuDataList : [poResult] = []


    @IBAction func all_brand(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Menu2", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        vc.modalPresentationStyle = .fullScreen
//        self.segmentedControl.selectedSegmentIndex = 0

         self.present(vc, animated: true, completion: nil)
        
    }
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    
    
    
    @IBOutlet weak var brandTable: UITableView!
    @IBOutlet weak var recent_SearchView: UIView!
    
    @IBOutlet weak var catecollectionView: UICollectionView!
    
    @IBOutlet weak var popuCollectionView: UICollectionView!
    
    @IBAction func homeButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        recent_SearchView.isHidden = true
        brandTable.delegate = self
        brandTable.dataSource = self
        brandTable.rowHeight = 70
        
    
        catecollectionView.delegate = self
        catecollectionView.dataSource = self
        let collectionViewLayout = catecollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = sectionInsets
        collectionViewLayout?.invalidateLayout()
        // Do any additional setup after loading the view.
        let pocollectionViewLayout = popuCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        pocollectionViewLayout?.sectionInset = sectionInsets
        setNavigationBar()

        goods().recoBrands(self)
        goods().popuCategory(self)
        userRequest().searchPopular(self)
        
    }
    
    func setNavigationBar(){
       
        let gohomeButtonImage = UIImage(systemName: "house")!
        let gohomeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
               
        gohomeButton.tintColor = .black
        gohomeButton.setImage(gohomeButtonImage, for: .normal)
               
        let gohomeBarButton = UIBarButtonItem(customView: gohomeButton)
        

        self.navigationItem.rightBarButtonItems = [gohomeBarButton]
        
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        gohomeButton.configuration = configuration

     
        gohomeButton.addTarget(self, action: #selector(gohomeButtonAction), for: .touchUpInside)

        
    }
   
    
    
    
    @objc func gohomeButtonAction(sender: UIButton!) {

        self.navigationController?.popToRootViewController(animated: true)
        
           }
    
    
  

}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(brandDataList.count)
        return brandDataList.count
//        return 5
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! searchTableViewCell
        
        cell.brandName.text = brandDataList[indexPath.row].brandName
        cell.eng_num.text = brandDataList[indexPath.row].brandEngName + " ?? "+String(brandDataList[indexPath.row].counting)+"???"
        let url = URL(string:brandDataList[indexPath.row].imgUrl)
        let data = try! Data(contentsOf: url!)
        cell.brandImg.image = UIImage(data: data)

        return cell

    }

}

class searchTableViewCell: UITableViewCell {


    @IBOutlet weak var eng_num: UILabel!
    @IBOutlet weak var brandImg: UIImageView!
   @IBOutlet weak var brandName: UILabel!
   
    @IBOutlet weak var follow: UIButton!
    override func awakeFromNib() {

        super.awakeFromNib()

        // Initialization code

    }


    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }


}



extension SearchViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
        
    if collectionView == popuCollectionView {
//            return ????????????
        return popuDataList.count
        }
        else {return 12}

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popuCollectionView {
    //            return ????????????
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popuCell", for: indexPath) as! popuCollectionViewCell
        
//            cell.name.text = cateDataList[indexPath.row].categoryName
            
            cell.num.text = "0" + String(indexPath.row + 1)
//            cell.num.text =  String(popuDataList[indexPath.row].searchId)
            cell.text.text = popuDataList[indexPath.row].content
            return cell
        }
        
        else{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectcell", for: indexPath) as! searcheCollectionViewCell
    
        cell.name.text = cateDataList[indexPath.row].categoryName

        
        let url = URL(string:cateDataList[indexPath.row].imgUrl)
        let data = try! Data(contentsOf: url!)
        cell.img.image = UIImage(data: data)

        
            return cell}
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == catecollectionView {
        let width = collectionView.frame.width
        let numberOfItemsPerRow: CGFloat = 4
        let spacing: CGFloat = 10
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)

        return CGSize(width: itemDimension, height: itemDimension)
        }
         return CGSize(width: 150, height: 50)
    }

    //??? ?????? ????????? -- ???????????? ??????
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){}
}



class searcheCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib(){
        super.awakeFromNib()
        name.sizeToFit()

   
    }
    
}




//api setting ??????
extension SearchViewController{

    //?????? ???????????? ????????? ??? ??????
    func didSuccess_poca(_ response: category){

        self.cateDataList = response.result
        print("????????????")
        print(cateDataList.count)
        print(cateDataList[0].categoryName)
        print(cateDataList[2].categoryName)

        self.catecollectionView.reloadData()
               

    }



    //?????? ????????? ???????????? ??????
    func didSuccess_recobrand(_ response: brand){

        self.brandDataList = response.result
        self.brandTable.reloadData()

    }

    //?????? ?????????
    func didSuccess_poSearch(_ response: search_Popular){


        self.popuDataList = response.result
        self.popuCollectionView.reloadData()

//
    }

    //?????? ?????????
    func didSuccess_searchRecent(_ response: search_Recent){


    }
    
}


// ?????? ????????? cell

class popuCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var num: UILabel!
    override func awakeFromNib(){
        super.awakeFromNib()
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray5.cgColor
   
    }
    
}
