//
//  ImageAnalyser.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 27/06/21.
//

import Cocoa
import Vision
import CoreGraphics

class ImageAnalyser {
    
    func analyseImage(image: NSImage, completion: @escaping (_ text: String) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            // Get the CGImage on which to perform requests.
            guard let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return }
            // Create a new image-request handler.
            let requestHandler = VNImageRequestHandler(cgImage: cgImage)

            // Create a new request to recognize text.
            
            var request = VNRecognizeTextRequest()
            request.recognitionLanguages = ["en"]
            request.recognitionLevel = .accurate
            request.usesLanguageCorrection = false
            
            request = VNRecognizeTextRequest { request, error in
                guard let observations =
                        request.results as? [VNRecognizedTextObservation] else {
                    return
                }
                let recognizedStrings = observations.compactMap { observation in
                    // Return the string of the top VNRecognizedText instance.
                    return observation.topCandidates(1).first?.string
                }
                
                DispatchQueue.main.async {
                    completion(recognizedStrings.joined(separator: "\n"))
                }
                // Process the recognized strings.
            }
            do {
                // Perform the text-recognition request.
                try requestHandler.perform([request])
            } catch {
                print("Unable to perform the requests: \(error).")
            }
        }
    }
    
}
