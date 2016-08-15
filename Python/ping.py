#!/usr/bin/env python
#coding:utf-8
import os
import  threading
numlock =threading.RLock() #线程锁 操作在线数时必须要请求此锁
prlock=threading.RLock()   #输出锁 子线程在显示器上输出时必须请求此锁（防止输出错位）
zxs=0                      #在线数
class pings(threading.Thread):
  def __init__(self,num,interval):
    threading.Thread.__init__(self)
    self.nums=num
    self.inter=interval
    self.thread_stop=False
    self.ns=0
  def run(self):
    global zxs
    start=self.nums
    while start<255:
      ret=os.system('ping -c 1 -W 1 192.168.1.%d >/dev/null' % start)
      if not ret:
        prlock.acquire()#请求输出锁
        print 'ping 192.168.1.%d ok' % start
        prlock.release()#释放输出锁
        self.ns +=1
      start+=self.inter
    numlock.acquire()   #请求数操作锁
    zxs+=self.ns
    numlock.release()   #释放数操作锁
 
def pingt():
  s=255
  r=s-1
  threads=[]
  for i in range(1,s):
    t=pings(i,r)
    threads.append(t)
  for i in threads:
    i.start()
  for i in threads:
    i.join()
  global zxs
  print zxs,'个ip在线'   #输出在线数
if __name__=='__main__':
  pingt()
