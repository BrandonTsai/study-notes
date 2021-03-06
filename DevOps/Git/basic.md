
Git
===

## Git global setup:

```
git config --local user.name "BrandonTsai"
git config --local user.email "emilwings@gmail.com"
```

## Create new project

```bash
git init
touch README.md
git add --all
git commit -a -m 'first commit'
```


## Git clone from Remote

```bash
git clone https://github.com/BrandonTsai/study-notes.git
```

## Create new branch to Modify

(1) always create a branch

(2) you can also add a branch that can trace **remote branch** by:

```bash
$ git branch --all
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
  remotes/origin/new-features

$ git checkout -b add-new-features remotes/origin/new-features
```

(3) or you can checkout to a **special tag** via create a new branch

```bash
$ git tag
1.0.0
2.0.0
3.0.0

$ git checkout -b from-tag 3.0.0    
```

## Commit

hack the codes..., and then commit the changes

```bash
git add --all
git rm <files>
git commit -a
```

**Commit Message Format:**

	簡述 (不超過50)
	<空一行>
	詳述 (每行不超過72)


**Hint:** if you are tracing remote branch,
it is great to pull latest code before commit

## Re-commit

```
(hack the codes again)
git add/rm <files>
git commit --amend
```

## cancel the latest commit

if you want to cancel the latest commit:

	git reset HEAD^

## Pull

Pull the master branch

	git checkout master
	git pull

Check out the target change

	git checkout <working_branch>

Rebase on the master

	git rebase master

Fix conflict

	( resolve the conflict )
	git add/rm <files>
	git rebase –continue


## Push to remote

```
$ git remote -v
origin	https://github.com/BrandonTsai/study-notes.git (fetch)
origin	https://github.com/BrandonTsai/study-notes.git (push)
$ git push origin HEAD:<remote-branch>
```

or add another remote site to push, for example:

```
git remote add gitlab ssh://brandontsai@gitlab.com:29418/<project>.git
```



## Handle Remote Branch

refer: http://www.hostingadvice.com/how-to/git-branch-rename/

(1) Push and linked local *local-feature2* branch to trace the new remote *feature3* branch.

```
$ git push -u origin local-feature2:feature3
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/myusername/myproject.git
* [new branch]      local-feature2 -&gt; feature3
* Branch local-feature2 set up to track remote branch feature 3 from origin.
```

(2) Rename local branch

```
$ git branch -m local-feature2 local-feature3
```

(3) Delete the old remote branch

```
$ git push origin :feature2
To https://github.com/myusername/myproject.git
- [deleted]         feature2
```


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
