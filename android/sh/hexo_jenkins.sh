node -v
hexo init hexo_test
cd hexo_test
npm uninstall hexo-generator-index --save
npm install hexo-generator-index-pin-top --save
npm install hexo-blog-encrypt@2.2.4 --save
# 需要编辑crpyo-js
npm install hexo-admin --save
npm install hexo-tag-plantuml --save
#npm install imageMagick --save
#npm install gm --save
npm install hexo-deployer-git --save
npm install https://github.com/threeq/hexo-tag-mermaid.git --save
#需要编辑index。js
cp ~/git/hexo/_config.yml .
cp -r ~/git/hexo/themes/lb themes/
cp ~/git/hexo/node_modules/crypto-js/crypto-js.js node_modules/crypto-js/
cp ~/git/hexo/node_modules/hexo-tag-gantt/index.js node_modules/hexo-tag-gantt/
rm -r source
ln -s /var/lib/jenkins/workspace/hexo/source source
