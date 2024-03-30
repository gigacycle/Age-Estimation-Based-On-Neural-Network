function [ mNet,sNet1,sNet2,sNet3,sNet4 ] = reTrain( inputs, mainNet,secondNet1,secondNet2,secondNet3,secondNet4,mainTarget,sT1,sT2,sT3,sT4 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [mNet,mtr] = train(mainNet,inputs,mainTarget);
    [sNet1,str1] = train(secondNet1,inputs,sT1);
    [sNet2,str2] = train(secondNet2,inputs,sT2);
    [sNet3,str3] = train(secondNet3,inputs,sT3);
    [sNet4,str4] = train(secondNet4,inputs,sT4);

end

