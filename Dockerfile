FROM ambakshi/amazon-linux:2016.03

RUN yum install -y python27-devel
RUN yum install -y python27-pip.noarch
RUN yum install -y zip
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN yum install -y perl
#RUN pip install awscli

