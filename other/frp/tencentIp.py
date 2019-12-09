#!/usr/bin/python
# -*- coding: utf-8 -*-

# 引入云API入口模块
from QcloudApi.qcloudapi import QcloudApi
import json
from json import load
import urllib.request as urllib2


'''
module: 设置需要加载的模块
已有的模块列表：
cvm      对应   cvm.api.qcloud.com
cdb      对应   cdb.api.qcloud.com
lb       对应   lb.api.qcloud.com
trade    对应   trade.api.qcloud.com
sec      对应   csec.api.qcloud.com
image    对应   image.api.qcloud.com
monitor  对应   monitor.api.qcloud.com
cdn      对应   cdn.api.qcloud.com
'''
module = 'cns'
# &Action=RecordList
# &offset=0
# &length=20
# &domain=qq.com
'''
action: 对应接口的接口名，请参考wiki文档上对应接口的接口名
'''
action = 'RecordModify'

'''
config: 云API的公共参数
'''
secret_id = "AKID1pY5NQ3k1DF1X8scU9bolTyVmqfFvhX7"
secret_key = "zjDRGExSjlZ9UZgcIixHMAi15tRjXAXf"
config = {
    'Region': 'ap-guangzhou',
    'secretId': secret_id,
    'secretKey': secret_key,
}

# 接口参数
# action_params = {
#     'Action': 'RecordList',
#     'offset': 0,
#     'length': 20,
#     'domain': "muzi198783.club",
#     'subDomain': "frpsdty"
# }
my_ip = load(urllib2.urlopen('https://api.ipify.org/?format=json'))['ip']
action_params_m = {
    'Action': 'RecordModify',
    'recordId': 505547972,
    'recordType': 'A',
    'domain': "muzi198783.club",
    'subDomain': "frpsdty",
    'recordLine': '默认',
    'value': my_ip
}

try:
    service = QcloudApi(module, config)
    print(service.generateUrl(action, action_params_m))
    str_p= service.call(action, action_params_m).decode("utf-8")
    print(str_p)
    rep = json.loads(str_p)
    print(rep)
except Exception as e:
    import traceback
    print('traceback.format_exc():\n%s' % traceback.format_exc())
