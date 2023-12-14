#include <iostream>
#include <vector>
#include <omp.h>
#include <chrono>

using namespace std;
using namespace cv;

int main() {
    // Load the chessboard image using OpenCV
    Mat chessboardImage = imread("chessboard.jpg", IMREAD_GRAYSCALE);

    // Define variables for chessboard dimensions, segment size, etc.
    int chessboardRows = 8;
    int chessboardCols = 8;
    int segmentSize = chessboardImage.cols / chessboardCols;

    // Split the chessboard image into segments
    vector<Mat> imageSegments;
    for (int i = 0; i < chessboardRows; ++i) {
        for (int j = 0; j < chessboardCols; ++j) {
            Rect segmentRect(j * segmentSize, i * segmentSize, segmentSize, segmentSize);
            Mat segment = chessboardImage(segmentRect);
            imageSegments.push_back(segment);
        }
    }

    // Encoding: Apply transformations and generate code-vector
    vector<int> codeVector;
    auto start = chrono::high_resolution_clock::now();
    #pragma omp parallel for
    for (size_t i = 0; i < imageSegments.size(); ++i) {
        // Apply transformations and encode segment
        // Example: Encoding each segment as a unique number
        int encodedValue = i + 1;
        #pragma omp critical
        codeVector.push_back(encodedValue);
    }
    auto end = chrono::high_resolution_clock::now();
    double encodingTime = chrono::duration<double>(end - start).count();

    // Calculate compression ratio
    double originalSize = chessboardImage.cols * chessboardImage.rows;
    double compressedSize = codeVector.size() * sizeof(int);
    double compressionRatio = originalSize / compressedSize;

    // Output results
    cout << "Code-Vector: ";
    for (int value : codeVector) {
        cout << value << " ";
    }
    cout << endl;
    cout << "Compression Ratio: " << compressionRatio << endl;
    cout << "Time Required for Encoding: " << encodingTime << " seconds" << endl;

    return 0;
}