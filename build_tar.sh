fname=~/send/example-projects-`date +"%Y_%m_%d"`.tar
rm -f $fname
tar cf $fname `cat all_projects.txt`
fname_yarn=~/send/yarn-offline-`date +"%Y_%m_%d"`.tar
cd ~/npm-packages-offline-cache
tar cf $fname_yarn .
