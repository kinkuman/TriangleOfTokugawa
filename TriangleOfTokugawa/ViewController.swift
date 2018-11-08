//
//  ViewController.swift
//  TriangleOfTokugawa
//
//  Created by user on 2018/11/08.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView.delegate = self
        
        // ３地点の配列
        var points:[CLLocationCoordinate2D] = []
        // 久能山東照宮
        points.append(CLLocationCoordinate2DMake(34.964836, 138.467619) )
        // 日光東照宮
        points.append(CLLocationCoordinate2DMake(36.758043, 139.598849))
        // 飯縄寺
        points.append(CLLocationCoordinate2DMake(35.31019,140.406475))
        
        // ポリゴン作成
        let polygon = MKPolygon(coordinates: points, count: 3)

        // 出ませんが
        polygon.title = "家康の三角"
        
        mapView.add(polygon)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // MKPolygonの処理だけなので、とくに分岐していません。
        
        let renderer = MKPolygonRenderer(overlay: overlay)
        renderer.lineWidth = 1
        renderer.strokeColor = UIColor.blue.withAlphaComponent(0.7)
        renderer.fillColor = UIColor.yellow.withAlphaComponent(0.3)
        
        return renderer
    }
}

