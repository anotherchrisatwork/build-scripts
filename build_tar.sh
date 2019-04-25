fname=~/send/example-projects-`date +"%Y_%m_%d"`.tar
rm -f $fname
tar cf $fname `cat all_projects.txt`
verdaccio=~/send/verdaccio-storage-`date +"%Y_%m_%d"`.tar
cd ~/.local/share/verdaccio/storage
tar cf $verdaccio .
