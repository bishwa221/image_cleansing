% Taking the image from user input
img = imread(input('Enter image path:', 's'));

figure
imshow(img)
title('Input Image')

% Applying Gaussian filtering
img1 = imgaussfilt(img, 2);
img1 = log(1 + im2double(img1));

% Create a mesh grid for image processing
[X, Y] = meshgrid(1:size(img,2), 1:size(img,1));

% 2D Fast Fourier Transform (FFT) of the pre-processed image
imgfft = fftshift(fft2(img1));


% Initialization an amplitude matrix
A = zeros(size(imgfft, 1), size(imgfft, 2));

% Defining peak positions. Localized with the help of frequency image
peakY = [205 182 191 196 214 219 228];
peakX = [273 275 267 282 264 279 271];

% Looping through peaks to create an amplitude mask
for i = 1:7
    % Compute the magnitude of the frequency components
    fmag = sqrt(((X-peakX(i)).^2 + (Y-peakY(i)).^2));
    A(fmag <= 3) = 1;
end

% Applying Gaussian filtering to the amplitude mask
A = mat2gray(ifftshift(imgaussfilt(A, 1)));

% Defining a Gaussian function for illumination correction
sigma = 4;
bel = (X - size(img, 2)/2).^2 + (Y - size(img, 1)/2).^2;
h1 = fftshift(1 - exp(-bel./(2*sigma.^2)));

% Performing an image enhancement with uniform illumination
img2 = real(ifft2(h1.*fft2(img)));
clean_image = uint8(mat2gray(img2) * 255);

% Multiplying the amplitude mask with the FFT of the enhanced image
iff_img = A .* fft2(clean_image);

% Reconstructing the final pattern image
pattern = uint8(mat2gray(real(ifft2(iff_img))) * 255);


figure
imshow(img)
title('Input Image')


figure
imshow(clean_image)
title('With Uniform Illumination')


figure
imshow(pattern)
title('Pattern')


