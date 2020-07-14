# JBoss Tomcat scripts 
 
jboss-ews-tomcat : JBoss Enterprise Web Server 2(Tomcat6,Tomcat7) and Tomcat6,Tomcat7 on Linux(Unix) Platform 
jboss-eap-6-windows : JBoss Enterprise Platform 6 on Windows Platform 


```
## PMES SERVER-GROUP
/server-group=PMES:add(profile=ha,socket-binding-group=ha-sockets)
/server-group=PMES/jvm=default:add()
/server-group=PMES/jvm=default:write-attribute(name=heap-size,value=2G)
/server-group=PMES/jvm=default:write-attribute(name=max-heap-size,value=2G)

/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-server")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:MetaspaceSize=512m")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:MaxMetaspaceSize=512m")  
 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+PrintGCDetails")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+PrintGCTimeStamps")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+PrintGCDateStamps")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+UseGCLogFileRotation")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:NumberOfGCLogFiles=10")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:GCLogFileSize=100M")
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+UseParallelGC") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+UseParallelOldGC") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+ExplicitGCInvokesConcurrent") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-XX:+HeapDumpOnOutOfMemoryError")

/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-Djava.net.preferIPv4Stack=true") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-Dorg.jboss.resolver.warning=true") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-Djboss.modules.system.pkgs=org.jboss.byteman") 
/server-group=PMES/jvm=default:add-jvm-option(jvm-option="-Djava.awt.headless=true") 

/server-group=PMES/system-property=jboss.default.multicast.address:add(value=230.2.0.1)
/server-group=PMES/system-property=jboss.messaging.group.address:add(value=231.2.0.1)
/server-group=PMES/system-property=jboss.modcluster.multicast.address:add(value=232.2.0.1)
/server-group=PMES/system-property=jboss.default.jgroups.stack:add(value=udp)


        <server-group name="PMES" profile="ha">
            <jvm name="default">
                <heap size="2G" max-size="2G"/>
                <jvm-options>
                    <option value="-server"/>
                    <option value="-XX:MetaspaceSize=512m"/>
                    <option value="-XX:MaxMetaspaceSize=512m"/>
                    <option value="-XX:+PrintGCDetails"/>
                    <option value="-XX:+PrintGCTimeStamps"/>
                    <option value="-XX:+PrintGCDateStamps"/>
                    <option value="-XX:+UseGCLogFileRotation"/>
                    <option value="-XX:NumberOfGCLogFiles=10"/>
                    <option value="-XX:GCLogFileSize=100M"/>
                    <option value="-XX:+UseParallelGC"/>
                    <option value="-XX:+UseParallelOldGC"/>
                    <option value="-XX:+ExplicitGCInvokesConcurrent"/>
                    <option value="-XX:+HeapDumpOnOutOfMemoryError"/>

                    <option value="-Djava.net.preferIPv4Stack=true"/>
                    <option value="-Dorg.jboss.resolver.warning=true"/>
                    <option value="-Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE"/>
                    <option value="-Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE"/>
                    <option value="-Djboss.modules.system.pkgs=org.jboss.byteman"/>
                    <option value="-Djava.awt.headless=true"/>
                </jvm-options>
            </jvm>
            <socket-binding-group ref="ha-sockets"/>
            <system-properties>
                <property name="jboss.default.multicast.address" value="230.10.1.1"/>
                <property name="jboss.messaging.group.address" value="230.20.1.1"/>
                <property name="jboss.modcluster.multicast.address" value="230.30.1.1"/>
                <property name="jboss.default.jgroups.stack" value="udp"/>
            </system-properties>
        </server-group> 

## TMES SERVER-GROUP
/server-group=TMES:add(profile=ha,socket-binding-group=ha-sockets)
/server-group=TMES/jvm=default:add()
/server-group=TMES/jvm=default:write-attribute(name=heap-size,value=2G)
/server-group=TMES/jvm=default:write-attribute(name=max-heap-size,value=2G)

/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-server")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:MetaspaceSize=512m")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:MaxMetaspaceSize=512m")  
 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+PrintGCDetails")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+PrintGCTimeStamps")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+PrintGCDateStamps")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+UseGCLogFileRotation")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:NumberOfGCLogFiles=10")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:GCLogFileSize=100M")
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+UseParallelGC") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+UseParallelOldGC") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+ExplicitGCInvokesConcurrent") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-XX:+HeapDumpOnOutOfMemoryError")

/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-Djava.net.preferIPv4Stack=true") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-Dorg.jboss.resolver.warning=true") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-Djboss.modules.system.pkgs=org.jboss.byteman") 
/server-group=TMES/jvm=default:add-jvm-option(jvm-option="-Djava.awt.headless=true") 

/server-group=TMES/system-property=jboss.default.multicast.address:add(value=230.2.0.2) 
/server-group=TMES/system-property=jboss.messaging.group.address:add(value=231.2.0.2) 
/server-group=TMES/system-property=jboss.modcluster.multicast.address:add(value=232.2.0.2)
/server-group=TMES/system-property=jboss.default.jgroups.stack:add(value=udp)


        <server-group name="TMES" profile="ha">
            <jvm name="default">
                <heap size="2G" max-size="2G"/>
                <jvm-options>
                    <option value="-server"/>
                    <option value="-XX:MetaspaceSize=512m"/>
                    <option value="-XX:MaxMetaspaceSize=512m"/>
                    <option value="-XX:+PrintGCDetails"/>
                    <option value="-XX:+PrintGCTimeStamps"/>
                    <option value="-XX:+PrintGCDateStamps"/>
                    <option value="-XX:+UseGCLogFileRotation"/>
                    <option value="-XX:NumberOfGCLogFiles=10"/>
                    <option value="-XX:GCLogFileSize=100M"/>
                    <option value="-XX:+UseParallelGC"/>
                    <option value="-XX:+UseParallelOldGC"/>
                    <option value="-XX:+ExplicitGCInvokesConcurrent"/>
                    <option value="-XX:+HeapDumpOnOutOfMemoryError"/>

                    <option value="-Djava.net.preferIPv4Stack=true"/>
                    <option value="-Dorg.jboss.resolver.warning=true"/>
                    <option value="-Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE"/>
                    <option value="-Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE"/>
                    <option value="-Djboss.modules.system.pkgs=org.jboss.byteman"/>
                    <option value="-Djava.awt.headless=true"/>
                </jvm-options>
            </jvm>
            <socket-binding-group ref="ha-sockets"/>
            <system-properties>
                <property name="jboss.default.multicast.address" value="230.10.1.1"/>
                <property name="jboss.messaging.group.address" value="230.20.1.1"/>
                <property name="jboss.modcluster.multicast.address" value="230.30.1.1"/>
                <property name="jboss.default.jgroups.stack" value="udp"/>
            </system-properties>
        </server-group> 


### PMES server
### PMES01
/host=master/server-config=PMES01:add(group=PMES,auto-start=true,socket-binding-port-offset=100)
/host=master/server-config=PMES01/system-property=jboss.node.name:add(value="PMES01") 
/host=master/server-config=PMES01/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=PMES01/jvm=default:add()
/host=master/server-config=PMES01/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/PMES01/log/gc.log") 
/host=master/server-config=PMES01/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/PMES01/log/") 

### PMES02 
/host=master/server-config=PMES02:add(group=PMES,auto-start=true,socket-binding-port-offset=200)
/host=master/server-config=PMES02/system-property=jboss.node.name:add(value="PMES02") 
/host=master/server-config=PMES02/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=PMES02/jvm=default:add()
/host=master/server-config=PMES02/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/PMES02/log/gc.log") 
/host=master/server-config=PMES02/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/PMES02/log/") 

### PMES03
/host=master/server-config=PMES03:add(group=PMES,auto-start=true,socket-binding-port-offset=300)
/host=master/server-config=PMES03/system-property=jboss.node.name:add(value="PMES03") 
/host=master/server-config=PMES03/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=PMES03/jvm=default:add()
/host=master/server-config=PMES03/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/PMES03/log/gc.log") 
/host=master/server-config=PMES03/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/PMES03/log/") 

### PMES04
/host=master/server-config=PMES04:add(group=PMES,auto-start=true,socket-binding-port-offset=400)
/host=master/server-config=PMES04/system-property=jboss.node.name:add(value="PMES04") 
/host=master/server-config=PMES04/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=PMES04/jvm=default:add()
/host=master/server-config=PMES04/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/PMES04/log/gc.log") 
/host=master/server-config=PMES04/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/PMES04/log/") 


        <server name="PMES01" group="PMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="PMES01"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/PMES01/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/PMES01/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="100"/>
        </server>
        <server name="PMES02" group="PMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="PMES02"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/PMES02/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/PMES02/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="200"/>
        </server>
        <server name="PMES03" group="PMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="PMES03"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/PMES03/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/PMES03/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="300"/>
        </server>
        <server name="PMES04" group="PMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="PMES04"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/PMES04/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/PMES04/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="400"/>
        </server>

### TMES server
### TMES01
/host=master/server-config=TMES01:add(group=TMES,auto-start=true,socket-binding-port-offset=100)
/host=master/server-config=TMES01/system-property=jboss.node.name:add(value="TMES01") 
/host=master/server-config=TMES01/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=TMES01/jvm=default:add()
/host=master/server-config=TMES01/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/TMES01/log/gc.log") 
/host=master/server-config=TMES01/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/TMES01/log/") 

### TMES02 
/host=master/server-config=TMES02:add(group=TMES,auto-start=true,socket-binding-port-offset=200)
/host=master/server-config=TMES02/system-property=jboss.node.name:add(value="TMES02") 
/host=master/server-config=TMES02/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=TMES02/jvm=default:add()
/host=master/server-config=TMES02/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/TMES02/log/gc.log") 
/host=master/server-config=TMES02/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/TMES02/log/") 

### TMES03
/host=master/server-config=TMES03:add(group=TMES,auto-start=true,socket-binding-port-offset=300)
/host=master/server-config=TMES03/system-property=jboss.node.name:add(value="TMES03") 
/host=master/server-config=TMES03/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=TMES03/jvm=default:add()
/host=master/server-config=TMES03/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/TMES03/log/gc.log") 
/host=master/server-config=TMES03/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/TMES03/log/") 

### TMES04
/host=master/server-config=TMES04:add(group=TMES,auto-start=true,socket-binding-port-offset=400)
/host=master/server-config=TMES04/system-property=jboss.node.name:add(value="TMES04") 
/host=master/server-config=TMES04/system-property=jboss.bind.address:add(value="\${jboss.bind.address:127.0.0.1}")  
/host=master/server-config=TMES04/jvm=default:add()
/host=master/server-config=TMES04/jvm=default:add-jvm-option(jvm-option="-Xloggc:\${jboss.domain.base.dir}/servers/TMES04/log/gc.log") 
/host=master/server-config=TMES04/jvm=default:add-jvm-option(jvm-option="-XX:HeapDumpPath=\${jboss.domain.base.dir}/servers/TMES04/log/") 




        <server name="TMES01" group="TMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="TMES01"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/TMES01/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/TMES01/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="100"/>
        </server>
        <server name="TMES02" group="TMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="TMES02"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/TMES02/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/TMES02/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="200"/>
        </server>
        <server name="TMES03" group="TMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="TMES03"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/TMES03/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/TMES03/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="300"/>
        </server>
        <server name="TMES04" group="TMES" auto-start="true"> 
            <system-properties>
                <property name="jboss.node.name" value="TMES04"/>   
                <property name="jboss.bind.address" value="${jboss.bind.address:127.0.0.1}"/>   
            </system-properties>
            <jvm name="default">
               <jvm-options>
                    <option value="-Xloggc:${jboss.domain.base.dir}/servers/TMES04/log/gc.log"/>
                    <option value="-XX:HeapDumpPath=${jboss.domain.base.dir}/servers/TMES04/log/"/>
                </jvm-options>
            </jvm>
            <socket-bindings port-offset="400"/>
        </server>
 ```
