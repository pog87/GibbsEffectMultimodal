function reg {
  #lta=${3}.lta
  #./mri_robust_register --mov ${1}.nii.gz --dst ${2}.nii.gz --lta ${lta} --satit
  ./mri_convert -rl ${2}.nii.gz ${1}.nii.gz ${3}_splines.nii.gz -rt cubic
  ./mri_convert -rl ${2}.nii.gz ${1}.nii.gz ${3}.nii.gz
}

function under {
  #lta=${3}.lta
  #./mri_robust_register --mov ${1}.nii.gz --dst ${2}.nii.gz --lta ${lta} --satit
  ./mri_convert -rl ${2}.nii.gz ${1}.nii.gz ${3}.nii.gz -rt nearest
}

function job {
  echo ${1}
  reg ../data/${1}_lq ../data/${1}_hq ${1}_hq_reg
  under ../data/${1}_hq_seg ../data/${1}_lq ${1}_lq_seg
}


job SL
job t1w
job walnut
