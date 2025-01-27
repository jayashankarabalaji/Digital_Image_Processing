% Read the image (replace with your actual image file)
img = imread('daylily-flower-and-buds-sharp.jpg'); 

% Check if the image is a color image
if size(img, 3) == 3
    % Convert the color image to grayscale
    img = rgb2gray(img);
end

% Ensure the image is in 8-bit unsigned integer format
img = im2uint8(img);

% Get the size of the image
[rows, cols] = size(img);

% Initialize an array to hold bit planes
bit_planes = zeros(rows, cols, 8, 'uint8');

% Create a single figure to display the images
figure;

% Display the original image
subplot(3, 3, 1); % Arrange in a 3x3 grid
imshow(img);
title('Original Image');

% Extract and display each bit-plane
for k = 1:8
    % Extract the k-th bit plane
    bit_planes(:,:,k) = bitget(img, k);
    
    % Display the bit plane
    subplot(3, 3, k + 1); % Bit planes follow the original image
    imshow(logical(bit_planes(:,:,k))); % Show binary version (logical for better contrast)
    title(['Bit Plane ', num2str(k)]);
end
