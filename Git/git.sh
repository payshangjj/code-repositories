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

���ְ취��
1��
���� git log �鿴�ϴ��Ͽ�İ汾����commit���Ƴ�����
���� git reset --hard <commit> ����һ���汾��Ȼ����git pull
2���ѳ�ͻ��Ŀ¼���ߣ���Ҫ���ݵĻ��� ����Ҫ���ݵĻ�ֱ��ɾ������ Ȼ����git pull
ȷ���� fetch ������Ҫ���صķ�������
