# emegent-visual-number-sense
Emergence of a 'visual number sense' in hierarchical generative models, Stoianov &amp; Zorzi, *Nature Neuroscience*, 2012

* Numerosity estimation is phylogenetically ancient and foundational to human mathematical learning, but its computational bases remain controversial. Stoianov & Zorzi, 2012 show for the first time that visual numerosity emerges as a statistical property of images in *deep networks* that learn a hierarchical generative model of the sensory input. Emergent numerosity detectors had response profiles resembling those of monkey parietal neurons and supported numerosity estimation with the same behavioral signature shown by humans and animals.

* This repository includes the data used for the simulations of Stoianov&Zorzi (2012) and a visualization script: 

* DATA (Matlab/Octave) file StoianovZorzi2012_data.mat contains unlabeled binary images and corrisponding labels (in a separate matrix). The latter could be used for further analysis, such as performance measuring and numerosity decoder.

Variables: (1) *data_images*: 2D matrix, the rows of which contain vectorized images of size 30x30 pixels (900 pixels in total). To see an image with index "i", you could use: imagesc(reshape(data_image(i,:),30,30)). (2) *data_labels*: 2D matrix that contains corrisponding labels useful for analysis of the result. The first column contains the numerosity of each image (i.e., corresponding row in the data_images matrix). The second column contains the corresponding cumulative surface. (3) *data_info* : contains the range of numerosity and surface, as well as the image size

* Visualization (Matlab/Octave) script stoianovzorzi2012_converter.m loads and converts the unlabeled training data in StoianovZorzi2012_data.mat into 3D unlabeled training data for deep belief networks, and shows a random image and its parameters.

##  Author of the code and the data

*  Ivilin P. Stoianov, 
   Institute of Cognitive Sciences and Technologies (ISTC)
   National Research Council (CNR)
   Padova, Italy
   Contact: ivilinpeev.stoianov@cnr.it
   Web	  : https://github.com/stoianov

## Granted permissions:
* to use the image data contained in "StoianovZorzi2012_data.mat" and this script if citing the article Stoianov, I., and Zorzi, M. (2012). Emergence of a “visual number sense” in hierarchical generative models. *Nature neuroscience* 15, 194–6.

* First published on 12.04.2013 here: http://ccnl.psy.unipd.it/research/visual-number-sense-dataset
