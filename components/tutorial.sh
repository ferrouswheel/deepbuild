set -e
# Tutorial files
if [ ! -d "DL4H" ]; then
    git clone git@github.com:SnippyHolloW/DL4H.git
    (cd DL4H && git remote add http https://github.com/SnippyHolloW/DL4H.git)
else
    if  [ "$1" == "reset" ]; then
        (cd DL4H && git reset --hard && git checkout master && git pull --rebase $REMOTE master)
    fi
fi

