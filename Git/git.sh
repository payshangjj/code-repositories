git remote add origin https://github.com/payshangjj/code-repositories.git
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"
git push -u origin master	#push code to GitHup

git fetch origin master
git log -p master..origin/master
git merge origin/master

git fetch origin master:tmp
git diff tmp 
git merge tmp

两种办法：
1、
先用 git log 查看上次上库的版本，把commit复制出来，
在用 git reset --hard <commit> 到上一个版本，然后再git pull
2、把冲突的目录移走（需要备份的话， 不需要备份的话直接删除）， 然后再git pull
确保你 fetch 的是需要下载的服务器。
