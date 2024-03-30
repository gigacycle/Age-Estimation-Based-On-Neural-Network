function [ nnInputs, mainTargets, secondTarget1, secondTarget2, secondTarget3, secondTarget4] = makeDataFeatures()
    dataFiles = dir('Data_Files\*.dat'); 
    numfiles = length(dataFiles);
    FaceFeatures = cell(numfiles,138);
    mTClassify = cell(numfiles,4); %main target classification
    sT1Classify = cell(numfiles,2); %second target 1 classification 
    sT2Classify = cell(numfiles,2); %second target 2 classification 
    sT3Classify = cell(numfiles,2); %second target 3 classification 
    sT4Classify = cell(numfiles,2); %second target 4 classification
    for k = 1:numfiles
        fName = dataFiles(k).name;
       x = readData(fName);
       [mt,st1,st2,st3,st4] = Classify(fName);
       for i=1:size(x,2)
           FaceFeatures{k,i} = double(x{1,i});
       end
       for i=1:4
           mTClassify{k,i} = double(mt{1,i});
           if (i<3)
               sT1Classify{k,i} = double(st1{1,i});
               sT2Classify{k,i} = double(st2{1,i});
               sT3Classify{k,i} = double(st3{1,i});
               sT4Classify{k,i} = double(st4{1,i});
           end
       end
    end
    %nnInputs =  cell2mat(FaceFeatures);
    nnInputs =  flipud(rot90(cell2mat(FaceFeatures)));
    mainTargets =  flipud(rot90(cell2mat(mTClassify)));
    secondTarget1 =  flipud(rot90(cell2mat(sT1Classify)));
    secondTarget2 =  flipud(rot90(cell2mat(sT2Classify)));
    secondTarget3 =  flipud(rot90(cell2mat(sT3Classify)));
    secondTarget4 =  flipud(rot90(cell2mat(sT4Classify)));
end

function [ mainTarget, secondTarget1, secondTarget2, secondTarget3, secondTarget4 ] = Classify( fileName )
  fid = fopen(strcat('Data_Files\', fileName));
  C = textscan(fid, '%s', 'delimiter', '\n');
  fclose(fid);
  allLines = C{1:1};
  temp = allLines(7:7);
  mainTarget = cell(4);
  secondTarget1 = cell(2); %second target 1 classification 
  secondTarget2 = cell(2); %second target 2 classification 
  secondTarget3 = cell(2); %second target 3 classification 
  secondTarget4 = cell(2); %second target 4 classification

  age = textscan(temp{1}, 'Age %d');
  for cnt=1:4
      mainTarget{1,cnt} = 0;
      if (cnt<3) 
          secondTarget1{1,cnt} = 0;
          secondTarget2{1,cnt} = 0;
          secondTarget3{1,cnt} = 0;
          secondTarget4{1,cnt} = 0;
      end
  end
  %----------------------Classify Ages----------------------------
  %-----------------------Range : 1-12  ---------------------------
  if       ((age{1}>=1)  &&  (age{1}<=12))
     mainTarget{1,1} = 1;
     %-------------------(1-8)----------------------------
     if ((age{1}>=1)  &&  (age{1}<=8))
         secondTarget1{1,1} = 1;
     %-------------------(9-12)----------------------------
     elseif ((age{1}>=9)  &&  (age{1}<=12))
         secondTarget1{1,2} = 1;
     end
  %---------------------Range : 13-25  ---------------------------
  elseif ((age{1}>=13) && (age{1}<=25))
     mainTarget{1,2} = 1;
     %-------------------(13-19)----------------------------
     if ((age{1}>=13)  &&  (age{1}<=19))
         secondTarget2{1,1} = 1;
     %-------------------(20-25)----------------------------
     elseif ((age{1}>=20)  &&  (age{1}<=25))
         secondTarget2{1,2} = 1;
     end
  %---------------------Range : 26-45  ---------------------------
  elseif ((age{1}>=26) && (age{1}<=45))
     mainTarget{1,3} = 1;
     %-------------------(26-35)----------------------------
     if ((age{1}>=26)  &&  (age{1}<=35))
         secondTarget3{1,1} = 1;
     %-------------------(36-45)----------------------------
     elseif ((age{1}>=36)  &&  (age{1}<=45))
         secondTarget3{1,2} = 1;
     end
  %---------------------Range : 46-63  ---------------------------
  elseif ((age{1}>=46) && (age{1}<=63))
     mainTarget{1,4} = 1;
     %-------------------(46-53)----------------------------
     if ((age{1}>=46)  &&  (age{1}<=53))
         secondTarget4{1,1} = 1;
     %-------------------(54-63)----------------------------
     elseif ((age{1}>=54)  &&  (age{1}<=63))
         secondTarget4{1,2} = 1;
     end
  end
  
end