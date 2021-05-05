# GibbsEffectMultimodal

This repo is a companion to the article:

Oversampling errors in multimodal medical imaging are due to the Gibbs effect [preprint](https://www.researchgate.net/publication/349569397_Oversampling_errors_in_multimodal_medical_imaging_are_due_to_the_Gibbs_effect)

In order to repeat the experiments presented in such work you must have installed:

 * ANTs
 * FSL
 * fresurfer

installed along w/ Python 3.x and the scikit-image, scipy and pandas libraries.

Then you can launch the resamplings by running `bash all.sh` in a Unix terminal.

To compute the errors you can run the `get_errors_`x`.pynb` notebooks, which (provided the enviromnent is identical to ours) will return the excel files 

 1. VOI_oversampling.xlsx
 1. VOI_undersampling.xlsx
 1. pointwise_oversampling_DSSIM.xlsx
 
 identical to the ones already in this repo.

The notebook "get_errors_pointwise_oversampling_error_bound_verify.ipynb" verifies the error bound given in the paper.

The notebook "Computing_Constants.ipynb" contains the (analytical) computation of the constants for the chosen basis functions.
