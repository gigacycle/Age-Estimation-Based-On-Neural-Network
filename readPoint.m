function [ Points ] = readPoint( fileName )
  fid = fopen(fileName);
  C = textscan(fid, '%s', 'delimiter', '\n');
  fclose(fid);
  allLines = C{1:1};
  temp = allLines(4:end-1);
  Points{1:1} = [1 1];
   for n = 1:size(temp)
        Points{n} =  textscan(temp{n}, '%f %f');
   end
end

