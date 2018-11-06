### 这几天学习关于nginx的一个分享

### ./rpm  
#### 制作了一个nginx-1.12.2的rpm：
  ##### a.rpm 中在基础的模块上加载了http_ssl_module | stream | http_stub_status_module 模块
  ##### b.出于安全的考虑，使用nginx用户的身份启动nginx,（nginx用户为/sbin/nologin)
  ##### c.自动加载nginx脚本，方便nginx的开启,重启,等等....可以直接运行nginx 测试
  ##### d.在文件中给到了.src.rpm包，可以自行编译
### ./conf
#### 关于nginx学习的一个配置,详细可以查看配置文件
### ./sbin
#### nginx启动脚本及一个Yum检测的脚本

还是个新手，大家多多指教
