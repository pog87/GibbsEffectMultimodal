
function reg {
  mat=${3}.mat
  flirt -in ${1}.nii.gz -ref ${2}.nii.gz -out ${3}.nii.gz -omat ${mat} -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6 -interp trilinear
  flirt -in ${1}.nii.gz -ref ${2}.nii.gz -out ${3}_splines.nii.gz -omat ${mat} -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6 -interp spline
}

function under {
  mat=${3}.mat
  flirt -in ${1}.nii.gz -ref ${2}.nii.gz -out ${3}.nii.gz -omat ${mat} -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6 -interp nearestneighbour
}

function job {
  echo ${1}
  reg ../data/${1}_lq ../data/${1}_hq ${1}_hq_reg
  under ../data/${1}_hq_seg ../data/${1}_lq ${1}_lq_seg
}


job SL
job t1w
job walnut
