//
//  CircularProgressView.swift
//  SportEventApp2.0
//
//  Created by borys on 09.09.2024.
//

import Foundation
import UIKit

// MARK: - CircularProgressView

class CircularProgressView: UIView {

    // MARK: - Properties
    
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()

    var progress: CGFloat = 0 {
        didSet {
            shapeLayer.strokeEnd = progress
        }
    }

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    // MARK: - Setup Layers
    
    private func setupLayers() {
        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: bounds.width / 2,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 1.5 * CGFloat.pi,
                                        clockwise: true)

        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = UIColor.gray.cgColor
        layer.addSublayer(trackLayer)

        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        layer.addSublayer(shapeLayer)
    }
}
