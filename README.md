```shell
源自lingmax大佬 https://www.right.com.cn/forum/thread-8137820-1-1.html
```
软件固定UDP  DNS端口8287  作者by:LingMax  开发不易 请善用

找到自己路由cpu支持的程序  (静态编译不依赖任何运行库)
# 我的是红米RMAC2100  cpu是mipsle指令结构  我选择LingMaxDns_linux_mipsle文件
# LingMaxDns_linux_amd64
拷贝到 /etc/LingMaxDns_linux_amd64

以openwrt举例
管理后台->网络->防火墙->自定义规则  (配置全部经过路由53端口的DNS数据包都转发到8287端口  或者配置上游dnsmaq也行)
iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 8287
保存设置

直接执行测试看看有没有报错 
/etc/LingMaxDns_linux_mipsle



开机启动方案1 (二选一)
管理后台->系统->启动项->本地启动脚本
```
/etc/LingMaxDns_linux_mipsle &
```
开机启动方案2 (二选一)
```
ssh执行
ln -s /etc/LingMaxDns_linux_mipsle /etc/rc.d/S999LingMaxDns
```
启动参数 (默认当前程序是守护程序  会自动创建一个-D主程序进行服务)
-D 直接启动主程序 一小时后自动结束 
-P53 改用53端口监听 
```
2022-2-17  发布第一个版本
2022-5-21  增加守护进程避免闪退,支持HTTPS代理,优化加速算法提升
下载地址https://wwi.lanzouj.com/b011aogdg
密码degz
```
```
补充内容 (2022-6-25 21:24):
不要用 -D
不要用 -D
不要用 -D
用了 一小时会自动结束进程
```
```
开源地址 go语言
https://gitee.com/xhxx/LingMaxDns
```
