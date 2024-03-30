function [ Datas ] = readData( fileName )
  fid = fopen(strcat('Data_Files\', fileName));
  C = textscan(fid, '%s', 'delimiter', '\n');
  fclose(fid);
  allLines = C{1:1};
  temp = allLines(7:8);
  Points = expandFeatures(fileName(1:end-4));
  %dataSize = size(Points,2)+2;
  %dataSize = size(Points,2)+1;  
  dataSize = size(Points,2);  
  Datas = cell(1,dataSize+1);
  %Datas{1,dataSize-1} =  textscan(temp{1}, 'Age %d');
  %Datas{1,dataSize-1} = Datas{1,dataSize-1}{1,1};
  Datas{1,1} =  textscan(temp{2}, 'Gender %s');
  if (strcmp(Datas{1,1}{1,1},'Male'))
      Datas{1,1} = 1;
  else
      Datas{1,1} = 0;
  end
  Datas(1,2:end)=Points(1:end);
end