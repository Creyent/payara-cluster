FROM payara/server-full:181
ENV PAYARA_PATH /opt/payara41
ENV ADMIN_USER admin
ENV ADMIN_PASSWORD 1234

LABEL maintainer="Victor Cifuentes <creyent@gmail.com>"
LABEL version="1.0"

# set new credentials to admin/1234 
RUN echo 'AS_ADMIN_PASSWORD=\n\
AS_ADMIN_NEWPASSWORD='$ADMIN_PASSWORD'\n\
EOF\n'\
>> /opt/tmpfile

RUN echo 'AS_ADMIN_PASSWORD='$ADMIN_PASSWORD'\n\
EOF\n'\
>> /opt/pwdfile

RUN \
 $PAYARA_PATH/bin/asadmin start-domain && \
 $PAYARA_PATH/bin/asadmin --user $ADMIN_USER --passwordfile=/opt/tmpfile change-admin-password && \
 $PAYARA_PATH/bin/asadmin --user $ADMIN_USER --passwordfile=/opt/pwdfile enable-secure-admin && \
 $PAYARA_PATH/bin/asadmin --user $ADMIN_USER --passwordfile=/opt/pwdfile set-hazelcast-configuration --enabled=true --dynamic=true && \
 $PAYARA_PATH/bin/asadmin restart-domain

# cleanup
RUN rm /opt/tmpfile