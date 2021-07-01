//   MIT License
//
// Copyright (c) 2021 Md Ibrahim Hassan
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
