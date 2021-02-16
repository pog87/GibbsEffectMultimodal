
function reg {
  $ANTSPATH/antsApplyTransforms -d 3 -i ${1}.nii.gz -r ${2}.nii.gz -o ${3}.nii.gz -t identity
  $ANTSPATH/antsApplyTransforms -d 3 -i ${1}.nii.gz -r ${2}.nii.gz -o ${3}_splines.nii.gz -t identity -n BSpline
  $ANTSPATH/antsApplyTransforms -d 3 -i ${1}.nii.gz -r ${2}.nii.gz -o ${3}_gauss.nii.gz -t identity -n Gaussian
  $ANTSPATH/antsApplyTransforms -d 3 -i ${1}.nii.gz -r ${2}.nii.gz -o ${3}_lancz.nii.gz -t identity -n LanczosWindowedSinc
}

function under {
  $ANTSPATH/antsApplyTransforms -d 3 -i ${1}.nii.gz -r ${2}.nii.gz -o ${3}.nii.gz -t identity -n NearestNeighbor
  $ANTSPATH/antsApplyTransforms -d 3 -i ${1}.nii.gz -r ${2}.nii.gz -o ${3}_multilab.nii.gz -t identity -n MultiLabel
}

function job {
  echo ${1}
  reg ../data/${1}_lq ../data/${1}_hq ${1}_hq_reg

  under ../data/${1}_hq_seg ../data/${1}_lq ${1}_lq_seg
}


job SL
job t1w
job walnut
