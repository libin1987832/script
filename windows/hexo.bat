rem sync hexo source and deploy
set hexo_dir=F:\code_bak\hexo
set hexo_source=F:\code_bak\git\hexo_genkins
F:
xcopy %hexo_source%\source %hexo_dir%\source /S/E/Y
cd %hexo_dir% 
rem hexo clean

hexo g

 