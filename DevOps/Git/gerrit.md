
Gerrit
======

## Git clone from gerrit

	git clone ssh://brandon@<gerrit-ip>:29418/<project>
	cd <project>
	git config --global user.name "Brandon-Tsai"
	git config --global user.email "brandon@xxx-mail.com"
	scp -p -P 29418 brandon@<gerrit ip>:hooks/commit-msg .git/hooks
	git checkout -b fix_bug_12345

## first Modify and commit
	(hack the codes...)
	git add/rm <files>
	git commit -a
	git push origin HEAD:refs/for/<remote-branch>

## Re-commit
	(hack the codes again)
	git add/rm <files>
	git commit --amend
	git push gerrit HEAD:refs/for/<remote-branch>

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


## Do not Re-Commit!!

If you have push your commit to gitlab,

**Do not use *git commit --amend* to fix some error in pushed commit.**

instead, you should create a new commit again.

or you should remove the pushed commit

## Remove pushed commit:

```
git push -f origin <last-release>:master
```

where *last-release* is the commit id, or branch you want to reset master to.
