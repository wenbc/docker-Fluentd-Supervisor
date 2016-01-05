# docker-Fluentd-Supervisor
安装部署Fluentd，并使用Supervisor监控Fluentd进程。本实例实现Fluentd 监控http日志，并上传到Amazond的S3，修改fluent.conf文件中S3存储桶的aws_key_id、aws_sec_key。你们可以根据业务的需求修改Fluentd目录下面的fluent.conf、supervisord.conf两个配置文件内容。

首先，需要在你的系统中安装docker。安装请参考docker官方文档：

	https://docs.docker.com/engine/installation/

其次，保证docker处于运行状态，下载images  ubuntu14.04 

	docker pull ubuntu14.04 

最后，下载这个repository，进入下载的目录(否则就需要修改Dockerfile文件里面文件的路径)，根据Dockerfile生成docker image。

	docker build -t="fluentd:v1" .




