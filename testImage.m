function [ age ] = testImage( imageName, netInput1, netInput2, netInput3, netInput4, netInput5)
    fileName = strcat(imageName,'.dat');
    result = readData(fileName);
    for i=1:size(result)
           result{1,i} = double(result{1,i});
    end
    tmpResult = flipud(rot90(cell2mat(result)));
    res1 = sim(netInput1,tmpResult);
    [V,I] = max(res1);
    switch I
        case 1
            res2 = sim(netInput2,tmpResult);
            [V,I1] = max(res2);
        switch I1
            case 1
                age = 'The age range is between: 1-8 ';
            case 2
                age = 'The age range is between: 9-12 ';
        end
        case 2
            res3 = sim(netInput3,tmpResult);
            [V,I2] = max(res3);
        switch I2
            case 1
                age = 'The age range is between: 13-19 ';
            case 2
                age = 'The age range is between: 20-25 ';
        end
        case 3
            res4 = sim(netInput4,tmpResult);
            [V,I3] = max(res4);
        switch I3
            case 1
                age = 'The age range is between: 26-35 ';
            case 2
                age = 'The age range is between: 36-45 ';
        end
        case 4
            res5 = sim(netInput5,tmpResult);
            [V,I4] = max(res5);
        switch I4
            case 1
                age = 'The age range is between: 46-53 ';
            case 2
                age = 'The age range is between: 54-63 ';
        end
    end
end

