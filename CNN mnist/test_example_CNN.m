function test_example_CNN
load mnist_uint8;

train_x = double(reshape(train_x',28,28,60000))/255; %training images pixel values 
test_x = double(reshape(test_x',28,28,10000))/255;%testing images pixel values
train_y = double(train_y'); %analogous to targetvalue
test_y = double(test_y'); %analogous to labels 

%% ex1 Train a 6c-2s-12c-2s Convolutional neural network 
%will run 1 epoch in about 200 second and get around 7% error. 
%With 100 epochs you'll get around 1.2% error

rand('state',0)

cnn.layers = {
    struct('type', 'i') %input layer
    struct('type', 'c', 'outputmaps', 6, 'kernelsize', 5) %convolution layer  , kernel size or local receptive field length(5*5)
    struct('type', 's', 'scale', 2) %sub sampling layer
    struct('type', 'c', 'outputmaps', 12, 'kernelsize', 5) %convolution layer
    struct('type', 's', 'scale', 2) %subsampling layer
};


opts.alpha = 1; %learning rate
opts.batchsize = 25;
opts.numepochs = 10;

cnn = cnnsetup(cnn, train_x, train_y);
cnn = cnntrain(cnn, train_x, train_y, opts);
save cnn.mat cnn test_x test_y
%[er, bad] = cnntest(cnn, test_x, test_y);

%plot mean squared error
%figure; plot(cnn.rL);
%assert(er<0.12, 'Too big error');
