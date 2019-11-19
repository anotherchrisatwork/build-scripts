fname=~/send/example-projects-`date +"%Y_%m_%d"`.tar
rm -f $fname
tar cf $fname --exclude node_modules `cat all_projects.txt` verdaccio
verdaccio=~/send/verdaccio-storage-`date +"%Y_%m_%d"`.tar
cd ~/.local/share/verdaccio/storage
tar cf $verdaccio .
