#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 引入云API入口模块

from django.conf import settings
import base64
import hashlib
import hmac
import random
import time
import operator
import json
import urllib.parse
import urllib.request as urllib2
import urllib3

from json import load
#from .utils import get_logger

#logger = get_logger(__file__)
urllib3.disable_warnings()

class QcloudApi():
    def __init__(self):
        self.SecretId = 'AKIDFF28ZlJX8VrYzNmka9TdYG8l8EwPedM4'
        self.secretKey = 'bw1ziV3mT9amyuI4Yz92f5GBsPzJOfxz'

    # secret_id = "AKIDFF28ZlJX8VrYzNmka9TdYG8l8EwPedM4"
    # secret_key = "bw1ziV3mT9amyuI4Yz92f5GBsPzJOfxz"
    def get(self, module, action, **params):
        config = {
            'Action': action,
            'Nonce': random.randint(10000, 99999),
            'SecretId': self.SecretId,
            'SignatureMethod': 'HmacSHA256',
            'Timestamp': int(time.time()),
        }
        url_base = '{0}.api.qcloud.com/v2/index.php?'.format(module)

        params_all = dict(config, **params)

        params_sorted = sorted(params_all.items(), key=operator.itemgetter(0))

        srcStr = 'GET{0}'.format(url_base) + ''.join("%s=%s&" % (k, v) for k, v in dict(params_sorted).items())[:-1]
        signStr = base64.b64encode(hmac.new(bytes(self.secretKey, encoding='utf-8'), bytes(srcStr, encoding='utf-8'), digestmod=hashlib.sha256).digest()).decode('utf-8')

        config['Signature'] = signStr

        params_last = dict(config, **params)

        params_url = urllib.parse.urlencode(params_last)

        url = 'https://{0}&'.format(url_base) + params_url
        http = urllib3.PoolManager()
        r = http.request('GET', url=url, retries=False)
        ret = json.loads(r.data.decode('utf-8'))
        if ret.get('code', {}) == 0:
            return ret
        else:
            raise Exception(ret)

#调用例子：
qcloud = QcloudApi()
my_ip = load(urllib2.urlopen('https://api.ipify.org/?format=json'))['ip']
print(my_ip)
#ret = qcloud.get(module='cns', action='DomainCreate', domain='muzi9.club')
# ret = qcloud.get(module='cns', action='SetDomainStatus', domain='abc.com', status='enable')  # 'enable' or 'disable'
#ret = qcloud.get(module='cns', action='DomainList')
# ret = qcloud.get(module='cns', action='DomainDelete', domain='abc.com')

# ret = qcloud.get(module='cns', action='RecordList', domain='abc.com', length=100)
ret = qcloud.get(module='cns', action='RecordCreate', domain='muzi8.club', subDomain='qb', value='121.36.58.219', recordType='A',recordLine='默认')
# ret = qcloud.get(module='cns', action='RecordModify', domain='abc.com', recordId=388853153, subDomain='www', value='192.168.101.11', recordType='A', recordLine='电信', remark='主站搜索引擎线路')
# ret = qcloud.get(module='cns', action='RecordStatus', domain='abc.com', recordId=388745814, status='enable')
# ret = qcloud.get(module='cns', action='RecordDelete', domain='abc.com', recordId=388745814)
#print(ret)
#print(ret['data']['domains'][0].get('name'))
if 'muzi8.club' in [item['name'] for item in ret['data']['domains']]:
    print('yes')