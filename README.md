# Image Cleansing (Pattern and Uniformity Enhancement)
### Making the illumination Uniform
### Extracting hidden Pattern

Input image:

![input](https://github.com/bishwa221/image_cleansing/assets/94813630/01bd9862-7865-49c6-86fc-cc7f527c4082)


Output images:

![with_uniform_illumination](https://github.com/bishwa221/image_cleansing/assets/94813630/d19315e0-6f77-47dd-a078-fad97365f547)


![pattern](https://github.com/bishwa221/image_cleansing/assets/94813630/529d67bd-3ae4-4b10-acdf-cbde59e9663c)


Steps it uses is summarized as:

1. Image loading
2. Gaussian filtering
3. Logarithmic transformation
4. Compute a 2D FFT
5. Create an amplitude mask
6. Gaussian filtering of the amplitude mask
7. Define a Gaussian function for illumination correction
8. Image enhancement with uniform illumination
9. Multiply the amplitude mask with the FFT of the enhanced image
10. Reconstruct the final pattern image
11. Display the input image
12. Display the image with uniform illumination
13. Display the pattern image
