import SwiftUI

struct Triangle: Shape {
    var width: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let p1 = CGPoint(x: 0, y: rect.height) // Bottom-left corner
            let p2 = CGPoint(x: width, y: rect.height) // Bottom-right corner (using fixed width)
            let p3 = CGPoint(x: width, y: 0) // Top-left corner, at the top of the container

            path.move(to: p1) // Move to bottom-left
            path.addLine(to: p2) // Draw line to bottom-right
            path.addLine(to: p3) // Draw line to top-left
            path.closeSubpath() // Close the triangle
        }
    }
        
}

struct PointerTriangle: Shape {
    var frameSize: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let p1 = CGPoint(x: 0, y: 0) // Bottom-left corner
            let p2 = CGPoint(x: frameSize, y: 0) // Bottom-right corner (using fixed width)
            let p3 = CGPoint(x: frameSize/2, y: frameSize) // Top-left corner, at the top of the container

            path.move(to: p1) // Move to bottom-left
            path.addLine(to: p2) // Draw line to bottom-right
            path.addLine(to: p3) // Draw line to top-left
            path.closeSubpath() // Close the triangle
        }
    }
}


struct RightTriangle: View {
    var width: CGFloat
    var color: Color
    
    var body: some View {
        Triangle(width: width)
            .fill(color)
            .frame(width: width)
            
    }
}

struct ContentView: View {
    var body: some View {
        PointerTriangle(frameSize: 20.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

