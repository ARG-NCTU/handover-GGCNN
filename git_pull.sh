#! /bin/bash

# echo "password: $2"
BRANCH=main
if [ ! -z "$1" ]; then
    echo "pull branch: $1"
    BRANCH=$1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull handover-GGCNN-------------------------------"
echo "-----------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in handover-GGCNN. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull darknet_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/darknet_ros
git checkout master
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in darknet_ros. Aborting"
   return 1
fi

cd ~/handover-GGCNN
return 0