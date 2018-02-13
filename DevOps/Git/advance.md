
Diff
====

```
git diff Old_commit_id New_commit_id > my.patch
git apply my.patch
```

Format-patch
============

refer: http://yodalee.blogspot.tw/2017/03/git-patch.html

patch the latest n commits.
```
git format-patch -n
```

switch to another branch, apply these patches.
```
git am 000x-xxx.patch
```


when conflict:

```
git apply --reject 000x-xxx.patch
```

This command will create *xxx.py.rej* files which contains the hunk that failed.

after fix these conflict files...

```
git add <files>

git am --resolved
```

Combine Multiple Commits
========================

http://zerodie.github.io/blog/2012/01/19/git-rebase-i/

```
git rebase -i <commit SHA-1>
```

* **squash (s for short)**: which melds the commit into the previous one (the one in the line before)
* **fixup (f for short)**: which acts like “squash”, but discards this commit’s message


Stash
======

https://git-scm.com/book/zh-tw/v1/Git-%E5%B7%A5%E5%85%B7-%E5%84%B2%E8%97%8F-Stashing

```
git stash

git stash pop
```
