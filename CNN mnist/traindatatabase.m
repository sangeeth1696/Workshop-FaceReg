function T = TrainDatabase(TrainDatabasePath)
 

T = [];
disp('Loading Faces');

for j = 3 :  7
    % I have chosen the name of each image in databases as a corresponding
    % number. However, it is not mandatory!
    str = int2str(j);
       
    str = strcat(TrainDatabasePath,'\1-0',str,'.jpg');
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    T = [T temp]; % 'T' grows after each turn 
    T=double(T)/255;
end

end

