%Main
close all
clear all
clc
while (1==1)
    choice=menu('Face Recognition System',...
                'Train System',...
                'Face Recognition',...
                'Exit');
  
    if (choice ==1)
        [m, A, Eigenfaces]=TrainSystem; % Trains the system with the user database
    end
    if (choice == 2)
        if exist('train.mat');
            load train;
        end
        FaceRec(m, A, Eigenfaces); % Uses the eigenfaces and recognises the person
    end
   
    if (choice == 3)
        clear all;
        clc;
        close all;
        return;
    end    
    
end
