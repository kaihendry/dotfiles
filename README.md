# [Kai Hendry's](http://hendry.iki.fi) Git $HOME

	git init
	git remote add origin git@github.com:kaihendry/Kai-s--HOME.git
	git pull origin master

If there a conflicts such as `.bashrc` already present, removing the file `rm
.bashrc` and running:

	git checkout master

Should get you setup.


# Dependencies

[Pathogen](https://github.com/tpope/vim-pathogen)

	curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim


# TODO

Figure out git submodules
