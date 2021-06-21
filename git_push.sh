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
   cd ~/mm-medical/
   return
fi
echo "-------------------------pull success----------------------------------"

# push core
echo "-----------------------------------------------------------------------"
echo "-------------------------push mm-core----------------------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/mm-core
git add -A
git commit -m "$1 on core"
git push

# push core
echo "-----------------------------------------------------------------------"
echo "-------------------------push subt-core--------------------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/subt-core
git add -A
git commit -m "$1 on core"
git push

# push arm
echo "-----------------------------------------------------------------------"
echo "-------------------------push interbotix_ros_arms----------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/catkin_ws/src/interbotix_ros_arms
git add -A
git commit -m "$1 on core"
git push

# push main
echo "-----------------------------------------------------------------------"
echo "-------------------------push mm-medical-------------------------------"
echo "-----------------------------------------------------------------------"
cd ~/mm-medical/
git add -A
git commit -m "$1"
git push 
