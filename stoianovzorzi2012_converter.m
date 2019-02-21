% Matlab/Octave code that re-organizes the data file StoianovZorzi2012_data.mat into minibatches (e.g., of size 100) for fast training of Deep Belief Neworks on GPU, and shows a random image and its parameters. 
%
% Requirement: the file StoianovZorzi2012_data.mat that contains unlabeled binary images and corrisponding labels (in a separate matrix). The latter could be used for further analysis. 
%
% Source variables:
% * data_images : 2D matrix, the rows of which contain vectorized images of size 30x30 pixels (900 pixels in total)
%                  To see an image with index "i", you could use: imagesc(reshape(data_image(i,:),30,30)); axis image;
% * data_labels : 2D matrix that contains corrisponding labels useful for analysis of the result. 
%                The first column contains the numerosity of each image 
%                (i.e., corresponding row in the data_images matrix)
%                     The second column contains the corresponding cumulative surface
% * data_info   : contains the range of numerosity and surface, as well as the image size
% 
% Outpuf of this script:
% * batchdata   : 3D matrix (batch-size, data-size, batch-number) of single-precision floats 
% * output file with this variable: StoianovZorzi2012_batchsize%d.mat
% 
% Author:  Ivilin P. Stoianov, CNR - ISTC - Padova (Italy)
%
% (A) Code that converts the unlabeled image data into 3D training data 
%
load([pwd filesep 'StoianovZorzi2012_data.mat']);
% Problem dimensions
batchsize=100;                                          % !!! HERE DEFINE the batch size !!!
numdims=size(data_images,2);                            % Size of vectorized images
totnum =size(data_images,1);                            % Total number of images
numbatches=ceil(totnum/batchsize);                      % Calcualte batch size
%
% Convert images into 3D batch data
batchdata  = zeros(batchsize, numdims, numbatches,'single');  % Empty 3D matrixes for batches.
randomorder=randperm(totnum);                           % (Index of all data reordered
for b=1:numbatches                                      % Distribute 2D vectorized image data to 3D batch data
  Iminibatch=randomorder(1+(b-1)*batchsize:b*batchsize);% Index of one batch
  batchdata(:,:,b) = data_images(Iminibatch, :);        % Copy this batch data in the 3D matrix 
end
%
% Save the 3D batchdata in a new file (e.g., StoianovZorzi2012_batchsize100.mat)
save('-v7', sprintf('StoianovZorzi2012_batchsize%d.mat',batchsize), 'batchdata');
%
% Now you are ready to perform deep learning using batches of data

%% (B) Code that shows a randomly selected image and its parameters
%
figure(1);
i=ceil(rand*size(data_images,1));                       % Select a random image to show 
imagesc(reshape(data_images(i,:),30,30));               % Reshape a vectorized image and show it
axis square;
title(sprintf('Image %d containing %d rectangles with total surface area of %d pixles',i,data_labels(i,1),data_labels(i,2)));
