import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //    let defaults = UserDefaults.standard
    let imagePicker = UIImagePickerController()
    var imageArray: [Any] = []
    //        didSet {
    //            defaults.set(imageArray, forKey: "picture")
    //        }
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        //        if let imageDisplay = defaults.object(forKey: "picture") as? [Any]{
        //            imageArray = imageDisplay
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    private func saveImages(){
        
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.imageView.image = imageArray[indexPath.item] as? UIImage
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    //    override func collectionView(_ collectionView: UICollectionView, canEditRowAt indexPath: IndexPath) -> Bool {
    //        // Return false if you do not want the specified item to be editable.
    //        return true
    //    }
    
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
        }
        else
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
        self.collectionView.reloadData()
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageArray.append(info[UIImagePickerController.InfoKey.originalImage] as? UIImage!)
        
        picker.dismiss(animated: true, completion: nil)
        self.collectionView.reloadData()
        
    }
    
    @IBAction func uploadPhoto(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        collectionView.reloadData()
        
    }
}

