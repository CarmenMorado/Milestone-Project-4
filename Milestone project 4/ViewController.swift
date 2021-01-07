//
//  ViewController.swift
//  Milestone project 4
//
//  Created by Carmen Morado on 1/5/21.
//

import UIKit

class ViewController:  UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var pictures = [Image]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewImage))
        
        self.navigationItem.title = "Captions"
        
        let defaults = UserDefaults.standard

        if let savedPictures = defaults.object(forKey: "pictures") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                pictures = try jsonDecoder.decode([Image].self, from: savedPictures)
            } catch {
                print("Failed to load picrures.")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let picture = pictures[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Caption", for: indexPath)
        let caption = picture.caption
        cell.textLabel?.text = caption
        return cell
    }
    
    @objc func addNewImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.sourceType = .camera 
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
        
        let ac = UIAlertController(title: "Add a caption", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self, weak ac] _ in
            var picture: Image
            if let name = ac?.textFields?[0].text {
                picture = Image(caption: name, image: imageName)
                self?.save()
            } else {
                picture = Image(caption: "Unknown", image: imageName)
                self?.save()
            }
            
            self?.pictures.append(picture)
            self?.save()
            self?.tableView.reloadData()
        }))
               
        present(ac, animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            let path = getDocumentsDirectory().appendingPathComponent(pictures[indexPath.row].image)
            vc.imagePath = path.path
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(pictures) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "pictures")
        } else {
            print("Failed to save the pictures.")
        }
    }


}

