function [ features ] = expandFeatures( fileName )
    x = readPoint(strcat('Points\' , fileName , '.pts'));
    features = cell(1,136);
    for i=1:2:136
        j = floor((i/2) +1);
        features{i} = x{j}{1};
        features{i+1} = x{j}{2};
    end
end

