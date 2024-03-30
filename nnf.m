clear;
[Inputs,Targets] = makeDataFeatures;
net =network;
net.numInputs=68;
for i=1:136
    net.inputs{i}.size = 2;
end
net.numLayers = 3;
net.layers{1}.size = 69;
net.layers{2}.size = 69;
net.layers{3}.size = 4;
net.inputConnect(1) = 1;
net.layerConnect(2, 1) = 1;
net.layerConnect(3, 2) = 1;
net.outputConnect(3) = 1;
net.targetConnect(3) = 1;
net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'purelin';
net.layers{3}.transferFcn = 'purelin';
net.biasConnect(1) = 1;
net.biasConnect(2) = 1;
net.biasConnect(3) = 1;
net.initFcn = 'initlay';
net = init(net);
net.performFcn = 'mse';
net.trainFcn = 'trainlm';