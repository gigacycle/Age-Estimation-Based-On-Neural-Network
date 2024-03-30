function [ age ] = getAge( fileName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  fid = fopen(strcat('Data_Files\', fileName, '.dat'));
  C = textscan(fid, '%s', 'delimiter', '\n');
  fclose(fid);
  allLines = C{1:1};
  temp = allLines(7:7);
  age = textscan(temp{1}, 'Age %d');
  age = age{1};
end