//
//  addEventVC.swift
//  SportEventApp2.0
//
//  Created by borys on 15.09.2024.
//

import Foundation
import UIKit
import SnapKit

// MARK: - AddEventVC

class AddEventVC: UIViewController {
    
    // MARK: - Properties
    
    let eventNameTF = UITextField()
    let descriptionTextView = UITextView()
    let dateTextField = UITextField()
    private var imageCollectionView: UICollectionView!
    private var selectedImages: [UIImage] = []
    
    private var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTapGesture()
        
        
    }
}

// MARK: - Setup Methods

extension AddEventVC {
    
    private func setupView() {
        
        // MARK: - View Configuration
        view.backgroundColor = .systemGray2
        
        // MARK: - Header Label
        
        let headerLabel = UILabel()
        headerLabel.text = "Add Event"
        headerLabel.textColor = .black
        headerLabel.font = .boldSystemFont(ofSize: 32)
        view.addSubview(headerLabel)
        
        // MARK: - Event Name TextField
        
        eventNameTF.placeholder = "Event Title"
        eventNameTF.backgroundColor = .systemGray5
        eventNameTF.borderStyle = .roundedRect
        eventNameTF.textColor = .black
        eventNameTF.layer.borderColor = UIColor.lightGray.cgColor
        eventNameTF.layer.cornerRadius = 8
        view.addSubview(eventNameTF)
        
        // MARK: - Description TextView
        
        descriptionTextView.backgroundColor = .systemGray5
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.text = "Enter description here..."
        descriptionTextView.textColor = .lightGray
        descriptionTextView.delegate = self
        view.addSubview(descriptionTextView)
        
        // MARK: - Date TextField
        
        dateTextField.placeholder = "Select Date"
        dateTextField.backgroundColor = .systemGray5
        dateTextField.layer.borderColor = UIColor.gray.cgColor
        dateTextField.layer.cornerRadius = 8
        dateTextField.borderStyle = .roundedRect
        dateTextField.addTarget(self, action: #selector(showDatePicker(_:)), for: .editingDidBegin)
        dateTextField.tag = 100
        view.addSubview(dateTextField)
        
        // MARK: - Add Image Button
        
        let addImageButton = UIButton(type: .system)
        addImageButton.setTitle("Add Image", for: .normal)
        addImageButton.backgroundColor = .systemBlue
        addImageButton.setTitleColor(.white, for: .normal)
        addImageButton.layer.cornerRadius = 8
        addImageButton.addTarget(self, action: #selector(addImageTap), for: .touchUpInside)
        view.addSubview(addImageButton)
        
        // MARK: - Save Event Button
        
        let saveEventButton = UIButton(type: .system)
        saveEventButton.setTitle("Save Event", for: .normal)
        saveEventButton.backgroundColor = .systemGreen
        saveEventButton.setTitleColor(.white, for: .normal)
        saveEventButton.layer.cornerRadius = 8
        saveEventButton.addTarget(self, action: #selector(saveEventTap), for: .touchUpInside)
        view.addSubview(saveEventButton)
        
        // MARK: - Image Collection View
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.backgroundColor = .clear
        imageCollectionView.showsHorizontalScrollIndicator = false
        view.addSubview(imageCollectionView)
        
        // MARK: - Constraints Setup
        
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        eventNameTF.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(50)
        }
        
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(eventNameTF.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(120)
        }
        
        dateTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        imageCollectionView.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(0)
        }
        
        addImageButton.snp.makeConstraints {
            $0.top.equalTo(imageCollectionView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        saveEventButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-60)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
    }
    //MARK: - SetupCD()
    private func setupCD() {
        let service = CoreDataService()
        
        guard let name = eventNameTF.text, !name.isEmpty,
              let descriptionn = descriptionTextView.text, !descriptionn.isEmpty,
              let date = dateTextField.text, !date.isEmpty else {
            return
        }
        let imageDataArray = selectedImages.compactMap { $0.pngData() }
        
        service.saveNewEvent(name: name, descriptionn: descriptionn, date: Date(), images: imageDataArray)
        
        print("-------------😀---------------")
        service.getEvents().forEach { print($0) } //service.context.delete
        print("-------------😀---------------")
    }
    
    // MARK: - Setup Methods
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOutside))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func didTapOutside() {
        view.endEditing(true)
    }
    
    // MARK: - Image Handling Methods
    
    @objc private func addImageTap() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func updateImageCollectionView() {
        UIView.animate(withDuration: 0.3) {
            self.imageCollectionView.snp.updateConstraints {
                $0.height.equalTo(self.selectedImages.isEmpty ? 0 : 150)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Date Picker Methods
    
    @objc private func showDatePicker(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        sender.inputView = datePicker
    }
    
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        if let dateTextField = view.viewWithTag(100) as? UITextField {
            dateTextField.text = dateFormatter.string(from: sender.date)
        }
        
        selectedDate = sender.date
    }
    
    @objc private func saveEventTap() {
        setupCD()
    }
}

// MARK: - UITextViewDelegate

extension AddEventVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Enter description here..." {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter description here..."
            textView.textColor = .lightGray
        }
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension AddEventVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            selectedImages.append(selectedImage)
            updateImageCollectionView()
            imageCollectionView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension AddEventVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.imageView.image = selectedImages[indexPath.item]
        
        cell.onDelete = { [weak self] in
            self?.selectedImages.remove(at: indexPath.item)
            self?.imageCollectionView.reloadData()
            self?.updateImageCollectionView()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
}

// MARK: - ImageCell Class

class ImageCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemRed
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    var onDelete: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(deleteButton)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-8)
            $0.trailing.equalToSuperview().offset(8)
            $0.width.height.equalTo(24)
        }
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    @objc private func deleteButtonTapped() {
        onDelete?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
