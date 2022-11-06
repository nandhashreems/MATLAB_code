
myFolder= 'C:\Users\nandh\Desktop\dumma';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
%   imshow(imageArray);  % Display image.
end

