FROM mysql:5.7

# (1) 패키지 업데이트 및 wget 설치
RUN apt-get update
RUN apt-get install -y wget

# (2) entrykit 설치 -> 메인 프로세스 잠깐 중지하고 원하는 프로세스를 먼저 진행해줌
RUN wget https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_linux_x86_64.tgz
RUN tar -xvzf entrykit_0.4.0_linux_x86_64.tgz
RUN rm entrykit_0.4.0_linux_x86_64.tgz
RUN mv entrykit /usr/local/bin/
RUN entrykit --symlink

# (3) 스크립트 및 각종 설정 파일 복사
COPY add-server-id.sh /usr/local/bin/
COPY etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/
COPY etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/
COPY prepare.sh /docker-entrypoint-initdb.d
COPY init-data.sh /usr/local/bin/
COPY sql /sql

# (4) 스크립트, mysqld 실행, prehook(entrykit 실행해주는 명령어)
ENTRYPOINT [ \
  "prehook", \
    "add-server-id.sh", \
    "--", \
  "docker-entrypoint.sh" \
]

CMD ["mysqld"]
