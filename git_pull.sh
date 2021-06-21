#! /bin/bash

# echo "password: $2"
BRANCH=master
if [ ! -z "$1" ]; then
    echo "pull branch: $1"
    BRANCH=$1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull mm-medical-------------------------------"
echo "-----------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in mm-medical. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull interbotix_ros_arms----------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/interbotix_ros_arms
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in mm-core. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull mm-core----------------------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/mm-core
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in mm-core. Aborting"
   return 1
fi

echo "-----------------------------------------------------------------------"
echo "-------------------------pull subt-core--------------------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/subt-core
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in subt-core. Aborting"
   return 1
fi

cd ~/mm-medical
return 0