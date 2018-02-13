
Gitlab
======

## Git global setup:

    git config --global user.name "cap-tsungyitsai"
    git config --global user.email "tsung-yi.tsai@quantatw.com"

## Create Repository
    mkdir test
    cd test
    git init
    touch README.md
    git add --all
    git commit -m 'first commit'
    git remote add gitlab git@gitlab.com:brandon.tsai/<my-project>.git
    git push gitlab HEAD:<my-branch>

## Clone form gitlab

    git clone git@gitlab.com:brandon.tsai/<my-project>.git
    touch README.md
    git add --all
    git commit -m 'first commit'
    git push origin HEAD:<my-branch>
