# �⊮�@�\�L��
autoload -U compinit
compinit

# �����R�[�h�̐ݒ�
export LANG=ja_JP.UTF-8

# �p�X�̐ݒ�
PATH=~/bin:/usr/local/bin:$PATH
export MANPATH=/usr/local/share/man:/usr/local/man:/usr/share/man
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

#vim
if [ -d /Applications/MacVim.app ]; then
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# �֐�
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# vi���L�[�o�C���h
bindkey -v

# �G�C���A�X�̐ݒ�
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lal="ls -l -A"
alias vi='vim'
#alias cp="cp -i"
#alias mv="mv -i"
#alias rm="rm -i"
alias g='git'
alias s='git status'

# �v�����v�g�̐ݒ�
case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# �⊮�ݒ�
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# �V�F���̃v���Z�X���Ƃɗ��������L
setopt share_history

# �]���ȃX�y�[�X���폜���ăq�X�g���ɋL�^����
setopt hist_reduce_blanks

# �q�X�g����history�R�}���h���L�^���Ȃ�
setopt hist_no_store

# �q�X�g�����Ăяo���Ă�����s����ԂɈ�U�ҏW�ł����ԂɂȂ�
setopt hist_verify

# �s�����X�y�[�X�Ŏn�܂�R�}���h���C���̓q�X�g���ɋL�^���Ȃ�
#setopt hist_ignore_spece

# ���O�Ɠ����R�}���h���C���̓q�X�g���ɒǉ����Ȃ�
setopt hist_ignore_dups

# �d�������q�X�g���͒ǉ����Ȃ�
setopt hist_ignore_all_dups

# �⊮���邩�̎���͉�ʂ𒴂��鎞�ɂ݂̂ɍs���
LISTMAX=0

# sudo �ł��⊮�̑Ώ�
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# cd�̃^�C�~���O�Ŏ����I��pushd
setopt auto_pushd

# check correct command
#setopt correct

# ������ zsh �𓯎��Ɏg�����Ȃ� history �t�@�C���ɏ㏑�������ǉ�
setopt append_history

# �⊮��₪�������鎞�ɁA�ꗗ�\��
setopt auto_list

# auto_list �̕⊮���ꗗ�ŁAls -F �̂悤�Ƀt�@�C���̎�ʂ��}�[�N�\�����Ȃ�
setopt no_list_types

# �ۊǌ��ʂ��ł��邾���l�߂�
setopt list_packed

# �⊮�L�[�iTab, Ctrl+I) ��A�ł��邾���ŏ��ɕ⊮���������ŕ⊮
setopt auto_menu

# �J�b�R�̑Ή��Ȃǂ������I�ɕ⊮
setopt auto_param_keys

# �f�B���N�g�����̕⊮�Ŗ����� / �������I�ɕt�����A���̕⊮�ɔ�����
setopt auto_param_slash

# �r�[�v����炳�Ȃ��悤�ɂ���
setopt no_beep

# �R�}���h���C���̈����� --prefix=/usr �Ȃǂ� = �ȍ~�ł��⊮�ł���
setopt magic_equal_subst

# �t�@�C�����̓W�J�Ńf�B���N�g���Ƀ}�b�`�����ꍇ������ / ��t������
setopt mark_dirs

# 8 �r�b�g�ڂ�ʂ��悤�ɂȂ�A���{��̃t�@�C������\���\
setopt print_eight_bit

# Ctrl+w�Ť���O��/�܂ł��폜����
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# �f�B���N�g���𐅐F�ɂ���
export LS_COLORS='di=01;36'

# �t�@�C�����X�g�⊮�ł�ls�Ɠ��l�ɐF������
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# cd �������Ƃ���ls�����s����
function chpwd() { ls }

# �f�B���N�g���������Ť�f�B���N�g���̈ړ�������
setopt auto_cd

# C-s, C-q�𖳌��ɂ���B
setopt no_flow_control

# C-p C-n �ŃR�}���h��������
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
