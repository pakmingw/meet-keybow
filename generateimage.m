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
freq = 0.1;

# generate x matrix,
max = 60/freq;
x = 0:1:max;

# amplitude, map to max value of pixel
a = 255; 

# run functions

# offsets to make lights not in sync
f1offset = 100;
f2offset = 200;
f3offset = 300;

# standard sinusoidal function, with a base to not fade out
# strong light 
#f1 = uint8(floor(a/4 * sin((x - f1offset) * 2 * pi / max) + (a / 2) + (a / 4)));
#f2 = uint8(floor(a/4 * sin((x - f2offset) * 2 * pi / max) + (a / 2) + (a / 4)));
#f3 = uint8(floor(a/4 * sin((x - f3offset) * 2 * pi / max) + (a / 2) + (a / 4)));

# slightly less light
f1 = uint8(floor(a/4 * sin((x - f1offset) * 2 * pi / max) + (a / 2) ));
f2 = uint8(floor(a/4 * sin((x - f2offset) * 2 * pi / max) + (a / 2) ));
f3 = uint8(floor(a/4 * sin((x - f3offset) * 2 * pi / max) + (a / 2) ));

# check with plot
# plot(x, f);

# transpose image to be vertical
f1 = f1';
f2 = f2';
f3 = f3';

# build image

# zero matrix
zeroMatrix = zeros(size(f));

# color shifter, if you want the colors to move slightly
# a/15 makes a smaller variation
rshift = uint8(floor(a/15 * sin((x - f1offset) * 2 * pi / max) ));
gshift = uint8(floor(a/15 * sin((x - f2offset) * 2 * pi / max) ));
bshift = uint8(floor(a/15 * sin((x - f3offset) * 2 * pi / max) ));

rshift = rshift';
gshift = gshift';
bshift = bshift';

# build image, each column is a key on the keybow, comment out the one you don't want to use

# pure RGB
#outputRed = [f1 zeroMatrix zeroMatrix];
#outputGreen = [zeroMatrix f2 zeroMatrix];
#outputBlue = [zeroMatrix zeroMatrix f3];

# RGB with shift
outputRed = [f1 gshift bshift];
outputGreen = [rshift f2 bshift];
outputBlue = [rshift gshift f3];

# save image
#[test,testmap] = rgb2ind(outputRed,outputGreen,outputBlue);
#imwrite(test, testmap,'output.png');

# other try
test = cat(3, outputRed, outputGreen, outputBlue);
imwrite(test, 'output.png');