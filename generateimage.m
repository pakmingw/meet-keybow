# Script to generate moving image

# load existing image provided by Pimoroni to determine format
#img = imread('default.png');
#imshow(img)
# dimensions
#size(img) # overall dimensions
#size(img(1,:))  #first row

# output format for keybow mini, 3 keys
# 9 columns of r,g,b values (0-255) that correspond to keys 0, 1, 2
# cycling frequency is 60Hz

# f = frequency of colour cycling, in Hz
f = 0.25;

# generate x matrix,
max = 60/f;
x = 0:1:max;

# amplitude, map to max value of pixel
a = 255; 

# run functions

# standard sinusoidal function, with a base to not fade out
f = uint8(floor(a/4 * sin(x * 2 * pi / max) + a));

# check with plot
# plot(x, f);

# transpose image to be vertical
f = f';

# zero matrix
zeroMatrix = zeros(size(f));

# build image, each column is a key on the keybow
outputRed = [f zeroMatrix zeroMatrix];
outputGreen = [zeroMatrix f zeroMatrix];
outputBlue = [zeroMatrix zeroMatrix f];

# save image
#[test,testmap] = rgb2ind(outputRed,outputGreen,outputBlue);
#imwrite(test, testmap,'output.png');

# other try
test = cat(3, outputRed, outputGreen, outputBlue);
imwrite(test, 'output.png');