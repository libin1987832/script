@echo off & setlocal
rem 注意这里的s定义，其值不是使用双引号引起来的
rem  also works for comma-separated lists, e.g. ABC,DEF,GHI,JKL
set s=AAA BBB CCC DDD; EEE FFF
for %%a in (%s%) do (
	echo %%a
	if %%a==CCC echo YYY
)