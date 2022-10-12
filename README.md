# Successful reproduction of a large EEG study across software packages

by
Aya Kabbara,
Nina Forde,
Camille Maumet,
Mahmoud Hassan.
Contact: aya.kabbara7@gmail.com

> This is a guide for researchers to reproduce the results and figures published in the paper "Successful reproduction of a large EEG study across software packages".
>This paper has been submitted for publication in NeuroImage Reports.

This study sheds light on how the software tool used to preprocess EEG signals impacts the analysis results and conclusions. EEGLAB, Brainstorm and FieldTrip were used to reproduce the same preprocessing pipeline of a published EEG study performed on 500 participants.

![](figures/figure1_preprocess.001.jpeg)

*The full pipeline of the study. (a) EEGs were acquired from 500 participants performing a simple gambling task of six blocks composed of 20 trials. (b) The same dataset was then preprocessed using the different software tools: Reference (using the code published by the original paper (Williams et al. 2021)), EEGLAB, Brainstorm and FieldTrip. The preprocessing steps to be performed in each tool includes: the reduction to 32 electrodes, the re-referencing, the automatic detection of bad electrodes, the band-pass filtering, the interpolation of bad channels, the segmentation into time-locked epochs and the removal of artifactual trials. (c) The preprocessed signals derived from the four preprocessing codes are used to validate and reproduce the reference statistics and hypotheses. A quantitative comparison between the resulting signals is also conducted in terms of signal features*


## Abstract

As an active field of research and with the development of state-of-the-art algorithms to analyze EEG datasets, the parametrization of Electroencephalography (EEG) analysis workflows has become increasingly flexible and complex, with a great variety of methodological options and tools to be selected at each step. This high analytical flexibility can be problematic as it can yield to variability in research outcomes. Therefore, growing attention has been recently paid to understand the potential impact of different methodological decisions on the reproducibility of results. 
In this paper, we aim to examine how sensitive the results of EEG analyses are to variations in preprocessing with different software tools. We reanalyzed the shared EEG data (N=500) from  (Williams et al., 2021) using three of the most commonly used open-source Matlab-based EEG software tools: EEGLAB, Brainstorm and FieldTrip. After reproducing the same original preprocessing workflow in each software, the resulting evoked-related potentials (ERPs) were qualitatively and quantitatively compared in order to examine the degree of consistency/discrepancy between software packages. Our findings show a good degree of convergence in terms of the general profile of ERP waveforms, peak latencies and effect size estimates related to specific signal features. However, considerable variability was also observed in the magnitude of the absolute voltage observed with each software package as reflected by the similarity values and observed statistical differences at particular channels and time instants. In conclusion, we believe that this study provides valuable clues to better understand the impact of the software tool on the analysis of EEG results.


## Software implementation

> In each software, the preprocessing script includes the reduction to 32 electrodes, the re-referencing, the automatic detection of bad electrodes, the band-pass filtering, the interpolation of bad channels, the segmentation into time-locked epochs and the removal of artifactual trials.


All the preprocessing codes were written in Matlab (Matlab R2019a). The visualizations of ERP waveforms (Figure 2) and the quantitative features (Figure 3) were done in R (R Core Team 2020). Seaborn (Waskom 2021) was used to illustrate the comparison between the software distribution of the quantitative measures (Figure 4), and the similarity matrix between softwares (Figure 5). Other visualizations and statistical assessments were conducted using Matlab. 

All source code used to generate the results and figures in the paper are in
the `src` folder.
The figure generation of figure 5 is run inside
[Jupyter notebooks](http://jupyter.org/).
The data used in this study is stored in `data` and downloaded from https://osf.io/qrs4h/.
Results generated by the code are saved in `results`.
See the `README.md` files in each directory for a full description.

## Getting the data

Download data from https://osf.io/qrs4h/ and store it `data` directory. 
The channel location file should be also downloaded from https://osf.io/ztw8u/ ChanlocsMaster.mat, and stored in `data` folder. 

## Getting the code

You can download a copy of all the files in this repository by cloning the
[git](https://git-scm.com/) repository:

    git clone https://github.com/AyaKabbara/EEG_preprocessing.git

or [download a zip archive](https://github.com/AyaKabbara/StageEEGpre/archive/master.zip).

## Dependencies
- Reference script: To re-run the script of the reference paper,  one should first download the Neuro-Tools package from https://github.com/Neuro-Tools/ including https://github.com/Neuro-Tools/MATLAB-EEG-preProcessing, 
https://github.com/Neuro-Tools/MATLAB-EEG-fileIO ,
https://github.com/Neuro-Tools/MATLAB-EEG-timeFrequencyAnalysis ,
https://github.com/Neuro-Tools/MATLAB-EEG-icaTools.

- EEGLAB script : This script uses EEGLAB functions available at  https://sccn.ucsd.edu/eeglab/download.php  eeglab current version

- Brainstorm script : This script uses Brainstorm functions available at https://neuroimage.usc.edu/bst/download.php

- FieldTrip script: This script uses FieldTrip functions available at https://www.fieldtriptoolbox.org/download/

All the tools directories are downloaded in `tools`. 

## Reproducing the results

### Reproducing Figure 2A, Figure 3A  using the reference script of (Williams et al, 2021)

> We used the same preprocessing code provided by the original paper, by eliminating the step of manual ICA employed to detect the arttifactual components related to eye blinks

1. Run the analysis with [RewardsPreprocessing_withoutICA.m](src/article/RewardsPreprocessing_withoutICA.m). This script will store the ERPs of all participants in a .mat file. It will also generate the csv files to be used for plotting the figures and the calculation of the descriptive statistics. 
2. Create figures 2A,3A and generate the related values in tables 1,2 using the following R script: [RewardProcessing_Plots_and_Statistics.R](src/graphiques/RewardProcessing_Plots_and_Statistics.R).
Note:  The name of csv files should be changed accordingly.

###  Reproducing Figure 2B, Figure 3B using EEGLAB

1. Run the analysis [eeglab_preprocessing.m](src/eeglab/eeglab_preprocessing.m).
2. Create figures 2B,3B and generate the related values in tables 1,2 using the R script [RewardProcessing_Plots_and_Statistics.R](src/graphiques/RewardProcessing_Plots_and_Statistics.R).Note: the name of csv files should be changed accordingly.


### Reproducing Figure 2C,Figure 3C using Brainstorm

1. Run the analysis with [bsPreprocessing.m](src/BST/bsPreprocessing.m). 
2. Create figures 2C,3C and generate the related values in tables 1,2 using the R script [RewardProcessing_Plots_and_Statistics.R](src/graphiques/RewardProcessing_Plots_and_Statistics.R).Note: the name of csv files should be changed accordingly.

### Reproducing Figure 2D,Figure 3D using FieldTrip

2. Run the analysis with [ftPreprocessing.m](src/fieldtrip/ftpreprocessing.m). 
3. Create  figures 2D,3D and generate the related values in tables 1,2 using the R script [RewardProcessing_Plots_and_Statistics.R](src/graphiques/RewardProcessing_Plots_and_Statistics.R).Note: the name of csv files should be changed accordingly.

### Reproducing Figure 4

1. Prepare the csv files containing the feature to be plotted using [fig4_preparation.m](src/graphiques/fig4_preparation.m). This script calls the function [extract_features.m](src/graphiques/extract_features.m). 
2. Create the figure using [Fig4.py](src/graphiques/Fig4.py)

### Reproducing Figure 5

1. Generate the similarity matrix (for both conditions) using the function [similarity_calc.m](src/graphiques/similarity_calc.m)
2. Create the figure using [Fig5.py](src/graphiques/Fig5.py)

### Reproducing Figure 6

Create Figure 6.A using [eeglab_stats.m](src/eeglab/eeglab_stats.m), Figure 6.B using [bs_stats.m](src/BST/bs_stats.m) and Figure 6.C using [ft_stats.m](src/fieldtrip/ft_stats.m)


