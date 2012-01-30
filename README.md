

	git init
	git remote add origin git@github.com:kaihendry/Kai-s--HOME.git
	git pull origin master

If there a conflicts such as `.bashrc` already present, removing the file `rm
.bashrc` and running:

	git checkout master

Should get you setup.
