#!/bin/sh
# Startup script for bamboo
#
# chkconfig: 2345 99 01
# description: Atlassian Bamboo
# pidfile: /var/run/bamboo.pid
. /etc/rc.d/init.d/functions
 
BAMBOO_HOME=/var/atlassian/application-data/bamboo
BAMBOO_INSTALL=/opt/atlassian/bamboo
BAMBOO_USER=bamboo
 
export BAMBOO_HOME
NAME=bamboo
BPID=${BAMBOO_INSTALL}/bamboo.pid
PID=/var/run/${NAME}.pid
cd ${BAMBOO_INSTALL}
if [ _$1 = _condrestart ]; then
	su ${BAMBOO_USER} -c "
		cd ${BAMBOO_INSTALL} &&
		${BAMBOO_INSTALL}/wrapper/start-bamboo stop &&
		${BAMBOO_INSTALL}/wrapper/start-bamboo start
	"
else
	su ${BAMBOO_USER} -c "
		cd ${BAMBOO_INSTALL} &&
		${BAMBOO_INSTALL}/wrapper/start-bamboo $@
		"
fi
RC=$?
 
if [ -f $BPID ]; then
	cp -- $BPID $PID
        touch /var/lock/subsys/${NAME}
else
	rm -- $PID /var/lock/subsys/${NAME} 2>/dev/null
fi
 
exit $RC
