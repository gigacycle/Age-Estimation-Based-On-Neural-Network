function[points] = showImageFeatures( fileName, picAxes, showfeatures )
    img = imread(strcat('Images\' , fileName , '.jpg'));
    axes(picAxes);
    imshow(img);
    if (showfeatures == 1) 
        hold on;
        x = readPoint(strcat('Points\' , fileName , '.pts'));
        for i=1:68
            points{i} = x{i}{1};
            plot(x{i}{1},x{i}{2},'.');
        end
        hold off;
        for i=1:68
            points{67+i} = x{i}{2};
        end    
    end
end