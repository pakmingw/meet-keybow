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

# standard sinusoidal function
f = uint8(floor(a/2 * sin(x * 2 * pi / max) + a/2));

# check with plot
# plot(x, f);

# transpose image to be vertical
f = f';

# build image, each column is a key on the keybow
outputRed = [f f f];
outputGreen = [f f f];
outputBlue = [f f f];

# save image
[test,testmap] = rgb2ind(outputRed,outputGreen,outputBlue);
imwrite(test, testmap,'output.png');