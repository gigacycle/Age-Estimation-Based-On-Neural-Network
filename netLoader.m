function [Mnet,Snet1,Snet2,Snet3,Snet4] = netLoader
    if (exist('mainNet.mat')>0)
        load('mainNet');
        mnet = mainNet;
    else
        return;
    end
    if (exist('SNet1.mat')>0)
        load('SNet1');
        snet1 = sNet1;
    else
        return;
    end
    if (exist('SNet2.mat')>0)
        load('SNet2');
        snet2 = sNet2;
    else
        return;
    end
    if (exist('SNet3.mat')>0)
        load('SNet3');
        snet3 = sNet3;
    else
        return;
    end
    if (exist('SNet4.mat')>0)
        load('SNet4');
        snet4 = sNet4;
    else
        return;
    end
    Mnet = mnet;
    Snet1 = snet1;
    Snet2 = snet2;
    Snet3 = snet3;
    Snet4 = snet4;
end