cd ..
rm -rf .qt
rm -rf .vnc/
rm -rf .ymessenger/
rm -rf .themes/
cd .phoenix/
ll
cd default/
ls
cd 
rm -rf .phoenix/
cd python/
ls
cd ..
mv python/ debian/python-scratch
cd debian/
svn add python-scratch/
ls
svn update
mv python-scratch/ ..
cd 
svn commit
svn status
cd personal/
svn add hut-transcript.pdf casino/
cd 
svn commit
cd .mozilla
cd default/
ll
cd ack41g03.slt/
ll
svn propedit svn:ignore Cache
ls
ls -al
svn propedit svn:ignore .
ls
svn propedit svn:ignore .
svn proplist
svn propget svn:ignore .
svn propedit svn:ignore .
cd
svn commit
cd /home/hendry/.mozilla/default/ack41g03.slt/
ll
cd 
svn cleanup
cd .mozilla/default/ack41g03.slt/
svn propget svn:ignore .
svn propedit svn:ignore .
svn cleanip
svn cleanup
svn propedit svn:ignore .
svn cleanup
svn propget svn:ignore .
svn cleanup
cd 
svn commit
svn cleanup
rm -rf .mozilla/default/ack41g03.slt/Cache.Trash
svn cleanup
rm -rf .mozilla/default/ack41g03.slt/Cache
svn cleanup
svn commit
cd /home/hendry/.mozilla/default/ack41g03.slt/
ll
cd
svn cleanup /home/hendry/.mozilla/default/ack41g03.slt/Cache.Trash
svn update
cd .mozilla/default/ack41g03.slt/
svn rm Cache
ls
svn rm Cache.Trash/
rm -rf Cache
rm -rf Cache.Trash/
cd
svn commit
svn update
cd debian/
ls
cd ..
rm debian/
rm -rf debian/
history | grep debian
history | ssh
history | grep ssh
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/debian
mv python-scratch/ debian/
cd debian/
svn add python-scratch/
svn commit
cd
ll
svn status
svn commit
svn update
ls
cd school/
cd datastructures/
ls
cd 
tree datastructures
tree school/datastructures/
ls
cd datastructures
ls
cd 
cd datastructuresproject/
ls
ll
ls
cd 
cd school/
ls
cd 
mv datastructuresproject school/
cd school/
svn add datastructuresproject/
cd 
vim .bash_profile 
ll
cd .vim/
ls
cd 
svn add .vim
ls
cd ictec/
ls
cd pip/
ls
cd ..
lsl
ll
cd 
cd school/
cd 
mv ictec/ school/
cd school/
svn add ictec/
cd 
lsl
ll
cd swriting/
ls
cd 
ls school/swriting/
rm -rf swriting/
ls
mc
cd debian/
ls
dpkg --get-selections
dpkg --get-selections > package-selections
vim package-selections 
ll
dpkg --get-selections > package-selections.bilbo
rm package-selections
svn add package-selections.bilbo 
svn commit
cd 
ls
cd configs/
ls
ll
cd 
rm -rf configs/
ll
cd netinst/
ls
cd 
rm -rf netinst/
ls
vim andreas.txt 
rm andreas.txt 
ll
vim .reportbugrc 
ls
ll
svn add .reportbugrc 
vim lh6_comm.txt 
rm lh6_comm.txt 
ls
rm -rf crossover/
mv accomodation/ personal/
cd personal/
ls
cd accomodation/
ls
ll
vim shared.tex 
ll
mc
cd ..
svn add accomodation/
cd 
ls
cd misc/
ls
ll
mv MADONNA.BRITNEY.AND.CHRISTINA.3-WAY.KISS.\(FLAVA\).MPG /home/hendry/movie/
cd 
rm -rf misc/
cd mail-attachments/
ls
ll
cd 
ls
svn commit
svn update
ls
svn add mail-attachments/
cd mail
ls
cd ..
svn rm mail-attachments/
mv mail-attachments/ mail
vim .muttrc 
cd mail/
ls
svn add mail-attachments/
cd mail-attachments/
ls
cd 
svn update
svn commit
svn rm mail-attachments
mv mail/mail-attachments/ .
svn commit
svn update
svn rm mail-attachments/
rm -rf mail-attachments/
cd mail/
ls
mkdir mail-attachments
svn add mail-attachments/
cd 
svn commit
cd mail/
svn commit
cd porn/
ls
rm -rf alt.binaries.erotica.divx/
ll
cd 
ls
cd mozilla-bilbo/
ls
cd default/to37efex.slt/
ls
w3m bookmarks.html 
mv bookmarks.html /home/hendry/public_html/
cd 
rm -rf mozilla-bilbo/
ls
rm -rf gnupg-old/
ls
pwd
top
ls
mc
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
vim .bashrc 
rm .bashrc 
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
less .xsession-errors 
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
less .mailcap 
rm .mailcap 
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
vim .viminfo 
rm .viminfo 
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
mv .mozilla mozilla-bilbo
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .


rm .gconf
rm -rf .gconf
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
vim .bash_profile 
rm .bashrc 
rm .bash_profile 
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
rm .muttrc
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
rm .bash_history 
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
rm -rf .gconfd/
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
rm .vimrc
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/home .
ls
cd germanstuff/
ls
cd cdrom/
ls
cd wb_de_en/
ls
cd baustelle/
ll
cd 
rm -rf germanstuff/
sudo rm -rf germanstuff/
ll
svn status
ll
cd wine/
ls
cd ..
rm -rf wine
ls
cd c
ls
l
ll
cd 
cd wo
cd work/
ll
cd 
rm -rf work
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/work
cd school
svn co svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/school
ll school/
mv c school/
cd school/
svn status
svn add c
ls -al
svn status
svn commit
cd 
rm .vimrc
svn update
rm .vimrc
rm .viminfo
touch .viminfo
svn update
ll
ls
cd gimp/
ls
cd ..
rm -rf gimp/
cd mutella/
ls
ll
cd 
rm -rf mutella/
svn add .irssi/
vim mutt_bgrun 
grep run .muttrc
ll
cd wolf/
ls
cd 
rm -rf wolf/
cd win
vim win
rm win
ls -al
mc
mc
mc
ls
rm muttrc.show 
ls *.spx
rm *.spx
vim directions.txt 
rm directions.txt 
ll
rm xgammon.sig_save 
vim transcript.txt 
rm transcript.txt 
ll
rm unicafe.txt 
ll
vim ssl.txt
rm ssl.txt*
ll
vim sonera.pgp 
rm sonera.pgp 
ll
vim Session.vim 
rm Session.vim 
ll
ls
ls *.gif
feh *.gif
rm *.gif
cd seminar/
ls
ll
vim paper.tex
ll
cd 
cd school/
ls
ll
cd seminar/
ls
ll
cd 
rm -rf seminar/
ll
rm silke.tar 
rm sip-simple.ps 
rm -rf .vicq/
rm -rf .w3mmee/
rm -rf .ut2003/
cd mail
ls
cd sent-mail/
ls
cd 
rm sent-mail-07-2003.tar 
ls
rm blog*
rm dataproj.tar 
cd data
ls
cd 
vim .ubhrc 
mv data porn
ll
xpdf output.pdf 
ls
ls *.pdf
xpdf output.pdf 
rm output.pdf 
cd irclogs/
ls
ll
cd 
svn add irclogs/
ll
svn commit
rm -rf .transgaming/
rm -rf .thumbnails/
rm -rf .sweep/
cd scripts/
ls
vim bu.py 
cd 
mv scripts/ personal/
cd personal/
ls
svn add scripts/
cd 
ls
rm -rf leechftp/
cd letters/
ls
ll
cd
mv letters/ personal/
cd personal/
ll
svn add letters/
cd 
ll
ls
cd java/
ls
cd 
cd school/
cd 
rm -rf java
svn import debian svn+ssh://hendry@melkinpaasi.cs.helsinki.fi/home/fs/hendry/repo/debian
sudo aptitude
ubh
cd porn/
ls
cd
vim .newsrc
ubh
cd porn/alt.binaries.pictures.erotica.hardcore/
ll
feh *
rm *
cd
ll
rm -rf .kde
ssh melkinpaasi
vim /etc/screenrc 
screen 
ls
ll
ls
cd /tmp/
top
galeon
 PROMPT_COMMAND='pwd>&7;kill -STOP $$'
 cd "`echo -e '\057home\057hendry\057\056galeon'`"
 PROMPT_COMMAND='pwd>&7;kill -STOP $$'
 cd "`echo -e '\057home\057hendry\057\056irssi'`"
 cd "`echo -e '\057home\057hendry\057\056irssi\057logs'`"
