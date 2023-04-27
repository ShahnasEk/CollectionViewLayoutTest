//
//  ViewController.swift
//  CollectionViewLayoutTest
//
//  Created by Sayone  on 24/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    var testArray = [TestData]()
    
    let collectionViewItems = CollectionViewItems()
    
    @IBOutlet weak var collectionView: UICollectionView!
    {
        didSet {
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readJSONFile(forName: "TestData")
        collectionView.collectionViewLayout = createLayout()

        // Do any additional setup after loading the view.
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self  else { return nil}
            let section = self.testArray[sectionIndex].type

            switch section {
            case "banner" :
                return self.collectionViewItems.createBannerSection()

            case "slider" :
                return self.collectionViewItems.createSliderSection()

            case "hlist1" :
                return self.collectionViewItems.createHListOneSection()

            case "hlist2" :
                return self.collectionViewItems.createHListTwoSection()

            case "vlist" :
                return self.collectionViewItems.createVListSection()

            default :
                return nil

            }
        }
    }
    
    
   
    
    
    // function to read the JSON Test Data file
    func readJSONFile(forName name: String) {
       do {
       
          // creating a path from the main bundle and getting data object from the path
          if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
             // Decoding the Product type from JSON data using JSONDecoder() class.
             let decodedData = try JSONDecoder().decode([TestData].self, from: jsonData)
             testArray = decodedData
          }
       } catch {
          print(error)
       }
    }

}



extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return testArray.count
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItem = testArray[section].count
        return numberOfItem
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(hue: CGFloat(drand48()), saturation: 1, brightness: 1, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
            header.setup(testArray[indexPath.section].type)
            return header
        default :
            return UICollectionReusableView()
        }
        
//        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
//        let titleIndex = testArray[indexPath.section].type
//
//        switch titleIndex {
//        case "banner" :
//            view.title = titleIndex
//        case "slider" :
//            view.title = titleIndex
//        case "hlist1" :
//            view.title = titleIndex
//        case "hlist2" :
//            view.title = titleIndex
//        case "vlist" :
//            view.title = titleIndex
//        default:
//            view.title = "No title available"
//        }
//
//        return view
    }
    
    
}



