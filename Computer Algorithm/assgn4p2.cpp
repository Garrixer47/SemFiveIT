#include <opencv2/opencv.hpp>
#include <chrono>
#include <iostream>
#include <vector>
#include <thread>
void retrieveAndDecompressImage(const std::string& compressedImageFile, const std::string&
outputImageFile) {
// Load the compressed image directly
cv::Mat retrievedImage = cv::imread(compressedImageFile, cv::IMREAD_UNCHANGED);
if (retrievedImage.empty()) {
std::cerr << "Error: Unable to load the compressed image." << std::endl;
return;
}
// Save the retrieved image
cv::imwrite(outputImageFile, retrievedImage);
std::cout << "Image retrieval complete." << std::endl;
}
int main() {
// Compressed image file sent by Arati (from Phase 1)
std::string compressedImageFile = "compressed_image.jpg";
// Output file for the retrieved image
std::string outputImageFile = "retrieved_image.jpg";
// Start measuring time
auto start_time = std::chrono::high_resolution_clock::now();
// Number of threads for parallel processing (adjust as needed)
int num_threads = std::thread::hardware_concurrency();
// Create a vector of threads
std::vector<std::thread> threads;
for (int i = 0; i < num_threads; ++i) {
// Distribute the work among threads
threads.emplace_back(retrieveAndDecompressImage, compressedImageFile, outputImageFile);
}
// Join the threads
for (auto& thread : threads) {
thread.join();
}
// Stop measuring time
auto end_time = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end_time - start_time);
// Display performance snapshot
std::cout << "Image retrieval completed in " << duration.count() << " milliseconds." << std::endl;
return 0;
}