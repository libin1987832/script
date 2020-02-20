#!/bin/bash
cd /root/hexo_jenkins/
cp /var/lib/jenkins/workspace/hexo_genkins/_config.yml .
cp -r /var/lib/jenkins/workspace/hexo_genkins/node_modules/* node_modules/
hexo g
hexo d
