clear;
% RandStream.setDefaultStream(RandStream('mt19937ar','seed', 1));
[Inputs,Targets] = makeDataFeatures;

%% create custom network
net =patternnet([68 36], 'traingdm');
% net = newff(Inputs, Targets, [68 36], {'logsig', 'logsig'}, 'traingdm');
% net = newff(Inputs, Targets, [68 36], {'logsig', 'logsig'}, 'trainbr');
net.numInputs = 1;
net.inputs{1}.size = 137;
%net.inputs{2}.size = 136;
% inputConnectMat(1,1) = 0;
% inputConnectMat(2,1) = 0;
% for i=2:69
%     net.inputs{i}.size = 2;
%     inputConnectMat(1, i) = 1;
%     inputConnectMat(2, i) = 0;
% end
% inputConnectMat(3,:)=inputConnectMat(2,:);
% inputConnectMat(3,1) = 1;
% net.layers{1}.size = 68;
% net.layers{2}.size = 36;
%net.layers{1}.size = 8;
%net.inputConnect = [0 1; 1 0; 0 0];
% net.inputConnect = [inputConnectMat(1,:); inputConnectMat(3,:) ; inputConnectMat(2,:)];
% net.layerConnect(1,3) = 1;
% net.layerweights{1,3}.delays = [1,3];
%net.inputweights{1,1}.delays = [1,2];
net.trainparam.epochs = 775;
net.trainparam.lr = 0.3;
net.trainparam.mc = 0.3;
net.trainparam.showCommandLine = 1;
% net.trainparam.max_fail = 775;
% net.trainparam.min_grad = 1e-1000;
% net.derivFcn = 'bttderiv';
% net.trainparam.show = 1;
net.layers{1}.transferFcn = 'logsig';
net.layers{2}.transferFcn = 'logsig';
net.layers{3}.transferFcn = 'logsig';
%net.layers{2}.transferFcn = 'logsig';
% net.efficiency.memoryReduction=4;
% net.biasConnect(1) = 1;
% net.biasConnect(2) = 1;
net.performFcn = 'mse';

%% train network
% biasVector = Inputs(1,1:end);00
% Inputs(1,:) = [];
net.divideMode = 'sample'; 
net.divideParam.trainRatio = 42.01/100;
net.divideParam.valRatio = 20.95/100;
net.divideParam.testRatio = 37.04/100;
[net, tr] = train(net,Inputs,Targets);