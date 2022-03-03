软件固定UDP  DNS端口8287  作者by:LingMax  开发不易 请善用

找到自己路由cpu支持的程序  (静态编译不依赖任何运行库)
# 我的是红米RMAC2100  cpu是mipsle指令结构  我选择LingMaxDns_linux_mipsle文件
# LingMaxDns_linux_amd64
拷贝到 /etc/LingMaxDns_linux_amd64

以openwrt举例
管理后台->网络->防火墙->自定义规则  (配置全部经过路由53端口的DNS数据包都转发到8287端口  或者配置上游dnsmaq也行)
```shell
iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 8287
```
保存设置

直接执行测试看看有没有报错 
```shell
/etc/LingMaxDns_linux_amd64
```



开机启动方案1 (二选一)
管理后台->系统->启动项->本地启动脚本
```shell
/etc/LingMaxDns_linux_amd64 &
```

开机启动方案2 (二选一)
ssh执行
```shell
ln -s /etc/LingMaxDns_linux_amd64 /etc/rc.d/S999LingMaxDns
```
