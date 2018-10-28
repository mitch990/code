��ģ��	parent	pom����
��ģ��	common	jar����
	core	jar����
	entity	jar����
	web	war���� 





����
parent	pom.xml

1.������п��������������ģ��̳�
2.����Զ�����tomcat���
 <build>
  	<plugins>
        <plugin>
            <groupId>org.apache.tomcat.maven</groupId>
            <artifactId>tomcat7-maven-plugin</artifactId>
            <version>2.2</version>
            <configuration>
            <url>http://127.0.0.1:8080/manager/text</url>
            <username>tomcat7</username>
            <password>tomcat7</password>
            <path>/workPlatform</path>
            </configuration>
        </plugin>
    </plugins>
  </build>
3.ָ��maven���뷽ʽ
  <profiles>
		<profile>
			<id>jdk-1.8</id>
			<activation>
				<activeByDefault>true</activeByDefault>
				<jdk>1.8</jdk>
			</activation>
			<properties>
				<maven.compiler.source>1.8</maven.compiler.source>
				<maven.compiler.target>1.8</maven.compiler.target>
				<maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>
			</properties>
		</profile>
	</profiles>




core	pom.xml

1.�޸���ģ������ʽΪjar����,ȥ����ģ���groupid��version��ǩ����������parent��ǩ���Ѽ̳�
  <artifactId>workPlatform-core</artifactId>
  <packaging>jar</packaging>
2.���coreģ������
     <dependency>
  		<groupId>com.workPlatform</groupId>
  		<artifactId>workPlatform-common</artifactId>
  		<version>0.0.1-SNAPSHOT</version>
  	</dependency>
  	  	<dependency>
  			<groupId>com.workPlatform</groupId>
  			<artifactId>workPlatform-entity</artifactId>
  			<version>0.0.1-SNAPSHOT</version>
  	</dependency>
3.����coreģ��Ϊserviec��dao�㣬������Ҫ��ӱ����Զ�����xml���ã�Ŀ�����Զ����£�mybatis�е�xml����
  <build>
   	 <resources>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.xml </include>
                </includes>
            </resource>
     </resources>
   </build>


common	pom.xml
1.�޸���ģ������ʽΪjar���ͣ�ȥ����ģ��groupid,version��ǩ
  <artifactId>workPlatform-common</artifactId>
  <packaging>jar</packaging>

entity	pom.xml	ͬcommonģ��


web	pom.xml
1.�޸���ģ������ʽΪwar����,ȥ����ģ��groupid,version��ǩ
  <artifactId>workPlatform-web</artifactId>
  <packaging>war</packaging>




��������ļ�(���п�����÷���webģ��resourecs�ļ�����)
1.applicationContext-shiro.xml
�޸��Զ���Realm����
<bean id="myRealm" class="com.workPlatform.core.service.LoginRealm" />

2.applicationContext.xml
�޸��Զ�ɨ��ע�����
         <context:component-scan base-package="com.workPlatform.*.*">   
  		<context:exclude-filter type="annotation" expression="org.springframework.stereotype.Controller" />   
	  </context:component-scan>  
�޸�mybatis����(ע��mapperLocations��valueΪclasspath*,ȫɨ�����jar)

<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">  
	    	<property name="dataSource" ref="dataSource" />
	        <property name="configLocation" value="classpath:mybatis-config.xml" />  
	        <property name="mapperLocations" value="classpath*:com/workPlatform/core/dao/*.xml" />    
    	</bean> 
 	    <!-- �Զ�ɨ��������mapper�ӿ��ļ� -->  
    	<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer"> 
        	<property name="basePackage"  value="com.workPlatform.core.dao" /> 
        </bean>

3.dispatcher-servlet.xml
�޸�ɨ�����ð���
			<context:component-scan base-package="com.workPlatformWeb.controller" use-default-filters="false">
				<context:include-filter type="annotation" expression="org.springframework.stereotype.Controller" />  
			</context:component-scan>


web.xml����
1.webģ�����ֶ�����WEB-INF�ļ����Լ�web.xml

2.ע��dispatcher-servlet.xml�����õ�jsp·��
<bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">  
   	<property name="prefix" value="/WEB-INF/jsp/" /><!-- ·��ǰ׺ -->  
        <property name="suffix" value=".jsp" /><!-- ��׺ -->  
</bean>	


3.��web.xml�У�dispatcher����ǰ���룬�ų���̬��Դ
<servlet-mapping>  
    	<servlet-name>default</servlet-name> 
   		<url-pattern>*.htm</url-pattern>    
	</servlet-mapping>   
	<servlet-mapping>  
    	<servlet-name>default</servlet-name> 
   		<url-pattern>*.js</url-pattern>    
	</servlet-mapping>
	<servlet-mapping>  
    	<servlet-name>default</servlet-name> 
   	<url-pattern>*.css</url-pattern>    
</servlet-mapping>


layui
webģ����
webapp/javaScript/
----------------------------------------------

�Զ�����
maven/conf/setting.xml
���
<servers>
	<server>  
	    <id>tomcat7</id>  
	    <username>tomcat7</username>  
	    <password>tomcat7</password>  
	</server>
</servers>

tomcat/conf/tomcat-users.xml
���
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="tomcat7" password="tomcat7" roles="manager-gui,manager-script,manager-jmx,manager-status"/>

ע���Ӧ���Զ����û�������,��Ӧ����parentģ��pom.xml�е��Զ�������

��������:
1.��parentģ�� pom.xml�Ҽ�maven build
install
2.��parentģ�� pom.xml�Ҽ�maven build
tomcat7:deploy
���²�����
tomcat7:redeploy
