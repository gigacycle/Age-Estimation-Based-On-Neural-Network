function [mainNet,secondNet1,secondNet2,secondNet3,secondNet4] = mainCode(showDiagram, mainTarget,sT1,sT2,sT3,sT4, inputs)

targets = mainTarget;

% Create 5 Pattern Recognition Network
HSize = 8;
mainNet = patternnet(HSize, 'trainlm');
secondNet1 = patternnet(HSize, 'trainlm');
secondNet2 = patternnet(HSize, 'trainlm');
secondNet3 = patternnet(HSize, 'trainlm');
secondNet4 = patternnet(HSize, 'trainlm');


mainNet.numInputs = 1;
secondNet1.numInputs = 1;
secondNet2.numInputs = 1;
secondNet3.numInputs = 1;
secondNet4.numInputs = 1;

mainNet.inputs{1}.size = 137;
secondNet1.inputs{1}.size = 137;
secondNet2.inputs{1}.size = 137;
secondNet3.inputs{1}.size = 137;
secondNet4.inputs{1}.size = 137;

mainNet.layers{1}.size = 4;
secondNet1.layers{1}.size = 2;
secondNet2.layers{1}.size = 2;
secondNet3.layers{1}.size = 2;
secondNet4.layers{1}.size = 2;

mainNet.layers{1}.transferFcn = 'logsig';
secondNet1.layers{1}.transferFcn = 'logsig';
secondNet2.layers{1}.transferFcn = 'logsig';
secondNet3.layers{1}.transferFcn = 'logsig';
secondNet4.layers{1}.transferFcn = 'logsig';

% Setup Division of Data for Training, Validation, Testing
mainNet.divideParam.trainRatio = 70/100;
mainNet.divideParam.valRatio = 15/100;
mainNet.divideParam.testRatio = 15/100;

secondNet1.divideParam.trainRatio = 70/100;
secondNet1.divideParam.valRatio = 15/100;
secondNet1.divideParam.testRatio = 15/100;

secondNet2.divideParam.trainRatio = 70/100;
secondNet2.divideParam.valRatio = 15/100;
secondNet2.divideParam.testRatio = 15/100;

secondNet3.divideParam.trainRatio = 70/100;
secondNet3.divideParam.valRatio = 15/100;
secondNet3.divideParam.testRatio = 15/100;

secondNet4.divideParam.trainRatio = 70/100;
secondNet4.divideParam.valRatio = 15/100;
secondNet4.divideParam.testRatio = 15/100;

% Train the Network
[mainNet,mtr] = train(mainNet,inputs,targets);
[secondNet1,str1] = train(secondNet1,inputs,sT1);
[secondNet2,str2] = train(secondNet2,inputs,sT2);
[secondNet3,str3] = train(secondNet3,inputs,sT3);
[secondNet4,str4] = train(secondNet4,inputs,sT4);

% Test the Network
mainOutputs      = mainNet(inputs);
secondOutputs1 = secondNet1(inputs);
secondOutputs2 = secondNet2(inputs);
secondOutputs3 = secondNet3(inputs);
secondOutputs4 = secondNet4(inputs);

mainErrors = gsubtract(targets,mainOutputs);
s1Errors = gsubtract(sT1,secondOutputs1);
s2Errors = gsubtract(sT2,secondOutputs2);
s3Errors = gsubtract(sT3,secondOutputs3);
s4Errors = gsubtract(sT4,secondOutputs4);
performance = perform(mainNet,targets,mainOutputs);
performance1 = perform(secondNet1,sT1,secondOutputs1);
performance2 = perform(secondNet2,sT2,secondOutputs2);
performance3 = perform(secondNet3,sT3,secondOutputs3);
performance4 = perform(secondNet4,sT4,secondOutputs4);


% View the Network
%view(mainNet)

% Plots
    if (showDiagram == 1)
        figure, plotperform(mtr)
        figure, plottrainstate(mtr)
        figure, plotconfusion(mainTarget,mainOutputs)
        figure, ploterrhist(mainErrors)
    end
end
