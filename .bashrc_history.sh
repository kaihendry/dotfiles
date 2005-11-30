#!/bin/bash
#-------------------------- =+- Shell script -+= --------------------------
# @file      .bashrc_history.sh
# @date      Thu Mar 10 14:02:36 2005
# @brief
#
# CVS version control block - do not edit manually
#  $RCSfile: .bashrc_history,v $
#  $Source: /home/cvs/yoh/.bashrc_history,v $
#
# Created: Thu Mar 10 14:02:36 2005
#  Commited: $Date: 2005/10/18 14:30:30 $
#  Revision: $Revision: 1.12 $
#
#  Yaroslav Halchenko                                      CS@UNM, CS@NJIT
#  web:     http://www.onerussian.com                      & PSYCH@RUTGERS
#  e-mail:  yoh@onerussian.com                              ICQ#: 60653192
#
# DESCRIPTION (NOTES):
#   A script to be sourced from .bashrc to provide ways to archive all the
#   actions in infinitely long history file.
#   
#   To use, just place
#     'source .bashrc_history'   in ~/.bashrc
#
#     '$if Bash
#      # to exit through calling exit function which will archive the history
#      # next ones are optional: first is left for historical reasons
#      "\C-x\C-x": "exit\n"
#      "\C-x\C-w": "archive_history\n"
#      $endif'                   in ~/.inputrc
#
#   Then whenever you close bash (exit,logout or exit by pressing Ctrl-D
#   or Ctrl-X twice you will have a piece of current history added to
#   ~/.bash_history.archive
#
# SOURCE:
#   http://www.onerussian.com/Linux/.files/.bashrc_history
#
# LICENSE:  
#   Released under GNU Generic Public License. You should've received it with 
#   your GNU/Linux system. If not, write to the Free Software Foundation, Inc.,
#   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#-----------------\____________________________________/------------------


if [ "$PS1" ] ; then # interactive shell
    export STARTTIME=`date -u --iso-8601=minutes` \
           HISTORYDUMP=0
    shopt -s cmdhist histappend

    # Next function really stores the history logs. Besides that if you want to store whatever you have so far
    # you can call this function and it will save increment from the last call to it.
    archive_history()
    {
        TFILE=${HISTFILE}.$$.temp
	CURTIME=`date -u --iso-8601=minutes`
	CURTTY=`tty`
        #STAMP
        HISTORYDUMP=$(($HISTORYDUMP+1))
        # Title
        echo "#$USER@${HOSTNAME} [ ${STARTTIME} - ${CURTIME} ]:$HISTORYDUMP ($CURTTY) ----" >| $TFILE
        # Fresh tasty history
	history -a ${TFILE}
        # Append it to the archive
        cat ${TFILE} >> ${HISTFILE}.archive
        # Adjust history file itself
        # of cause we need to dump to some temp file and then rename... he heh
        cat ${HISTFILE} ${TFILE} | tail -${HISTSIZE} >| ${HISTFILE}.$$
        mv -f ${HISTFILE}.$$ ${HISTFILE}
        # clean up after yourself - to be absessive remove the other tmp file as well -
        # - might happen if there were no permission to move it at above point
        rm -rf ${TFILE} ${HISTFILE}.$$
    }

    trap 'archive_history' EXIT
    unset IGNOREEOF

fi
