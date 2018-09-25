clc
clear 
close all

%% Slice setting
start = 1;   %開始張數
slice = 305; %結束張數
%%
cname = getenv('username');
pathname = ['C:\Users\',cname,'\Desktop'];
% leftTop = [512,512];
% rightBottom = [1,1];
for i=start:slice 

    %Fixed
    F = imread([pathname '\FixedOutput\' 'img' num2str(i-1) '.png' ]) ;
    M = imread([pathname '\output\' 'img' num2str(i-1) '.png' ]) ;
    
    [row,col] = find(F); %find nonzeor coordinate
    
    minRow=min(row);
    maxRow=max(row);
    
%     if all([col(1),minRow] < leftTop)
%         leftTop =  [col(1),minRow];
%         rightBottom = [col(end),maxRow];
%     end
%     if all([col(end),maxRow] > rightBottom)
%         leftTop =  [col(1),minRow];
%         rightBottom = [col(end),maxRow];
%     end
    
    leftTop =  [col(1),minRow];
    rightBottom = [col(end),maxRow];
    Rect = [leftTop,rightBottom-leftTop];
    
    cropF = imcrop(F,Rect);
    cropM = imcrop(M,Rect);
    
    [status, msg, msgID] = mkdir([pathname '\CropFixedOutput\']);
    [statusM, msgM, msgIDM] = mkdir([pathname '\CropOutput\']);
    
    imwrite(cropF,[pathname '\CropFixedOutput\' 'img' num2str(i-1) '.png' ]);
    imwrite(cropM,[pathname '\CropOutput\' 'img' num2str(i-1) '.png' ]);
end
disp("*****finish*****");
