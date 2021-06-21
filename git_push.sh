#!/bin/bash



if [ ! "$1" ]; then
    echo "commit detail please"
    return
fi
echo "commit: $1"

COMMIT=$1
BRANCH=master

if [ ! -z "$2" ]; then
    echo "operator on branch: $2"
    BRANCH=$2
fi

source git_pull.sh $BRANCH
PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ] ; then
   echo "There is conflict. Aborting"
   cd ~/handover-GGCNN/
   return
fi
echo "-------------------------pull success----------------------------------"

# push 
echo "-----------------------------------------------------------------------"
echo "-------------------------push bodyparts_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/catkin_ws/src/bodyparts_ros
git add -A
git commit -m "$1 bodyparts_ros"
git push

# push arm
echo "-----------------------------------------------------------------------"
echo "-------------------------push egohands_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/catkin_ws/src/egohands_ros
git add -A
git commit -m "$1 egohands_ros"
git push

# push arm
echo "-----------------------------------------------------------------------"
echo "-------------------------push darknet_ros----------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/catkin_ws/src/darknet_ros
git add -A
git commit -m "$1 darknet_ros"
git push

# push main
echo "-----------------------------------------------------------------------"
echo "-------------------------push handover-GGCNN-------------------------------"
echo "-----------------------------------------------------------------------"
cd ~/handover-GGCNN/
git add -A
git commit -m "$1"
git push 
