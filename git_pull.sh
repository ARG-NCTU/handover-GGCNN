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
cd ~/handover-GGCNN/catkin_ws/src/darknet_ros
git checkout master
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in darknet_ros. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull egohands_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/catkin_ws/src/egohands_ros
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in egohands_ros. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull bodyparts_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/catkin_ws/src/bodyparts_ros
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in bodyparts_ros. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull ggcnn_humanseg_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/catkin_ws/src/ggcnn_humanseg_ros
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in ggcnn_humanseg_ros. Aborting"
   return 1
fi

cd ~/handover-GGCNN
return 0