//
//  CamerService.swift
//  Greenroad
//
//  Created by JIN on 5/18/25.
//
import Foundation
import AVFoundation

class CameraService {
    
    var session : AVCaptureSession?
    var delegate : AVCapturePhotoCaptureDelegate?
    
    let output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    

    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping(Error?) -> ()){
        self.delegate = delegate // 권한을 확인하려고함
        checkPermission(completion: completion)
    }
    
    private func checkPermission(completion: @escaping(Error?)->()){
  
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .notDetermined:

            AVCaptureDevice.requestAccess(for: .video){ [weak self] granted in
                guard granted else { return }

                DispatchQueue.main.async {
                    self?.setupCamera(completion: completion)
                }
            }
        case .restricted:
            print("카메라에 대한 접근이 제한되었습니다.")
          break
        case .denied:
            print("위치 정보 접근을 거절했습니다. 설정에 가서 변경하세요.")
            break
        case .authorized:
            setupCamera(completion: completion)
        @unknown default:
            break
        }
    }
    
    
    // 카메라 설정
    private func setupCamera(completion: @escaping(Error?)->()){

        let session = AVCaptureSession()

        if let device = AVCaptureDevice.default(for: .video){
            do{
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input){
                    session.addInput(input)
                 
                }
                
                if session.canAddOutput(output){
                    session.addOutput(output)
                
                }
            
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
       
                DispatchQueue.global().async {
                    session.startRunning()
                    DispatchQueue.main.async {
                    self.session = session
                    completion(nil)
                    }
                }
                
            }catch{
                completion(error)
            }
        }
    }
    

    func capturePhoto(with settings : AVCapturePhotoSettings = AVCapturePhotoSettings()){
        output.capturePhoto(with: settings, delegate: delegate!)
    }
    
}
