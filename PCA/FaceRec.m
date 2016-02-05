function [ OutputName ] = FaceRec(m, A, Eigenfaces)
cd ('C:\Users\Tiruchi\Desktop\Projects\Projects12-14-master\facerec_PCA\TestImage'); % Changes the directory to the test database
while (1==1)
    choice=menu('Face Recognition',...
                'Input Image From File',...
                'Recognition',...
                'Exit');
    if (choice ==1)
       try cd ('C:\Users\Tiruchi\Desktop\PCA\TestImage');close all; end; 
         ChooseFile = imgetfile; % specifies the path from where the file is chosen
         capcha = imread(ChooseFile); % Reads the input image
         capcha = imcrop(capcha,[180,20,280,380]); %Crops the image to the region of interest
         % Resizes it into size 281x381
         imshow(capcha); 
         saveimage(capcha);
    end
   
    
     if (choice == 2)
       OutputName=Recognition(m, A, Eigenfaces); %Returns an index of the face vector space, i.e,, the person matched with the face input
       disp(OutputName);
       n=((OutputName+2)/4);%change the denominator to the number of photos you upload to a single folder and the numerator accordingly
       
       im=imread('InputImage.jpg'); %Displays input image
       cd ..;
       img=strcat('TrainDatabase\s',int2str(n),'\1.jpg');
       SelectedImage=imread(img); 
       subplot(121);
       imshow(im)  % Displays image under the title Test Image
    title('Test Image');
    subplot(122),imshow(SelectedImage);  % Displays the equivalent image under the title Equivalent Image
    title('Equivalent Image');
       disp('Student No');
       disp(int2str(n));
       
    end
     
   if (choice == 3) 
       clc; 
        close all;
        return;
    end    
end

