父模块	parent	pom类型
子模块	common	jar类型
	core	jar类型
	entity	jar类型
	web	war类型 





配置
parent	pom.xml

1.添加所有框架依赖包，被子模块继承
2.添加自动部署到tomcat插件
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
3.指定maven编译方式
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

1.修改子模块打包方式为jar类型,去掉子模块的groupid和version标签，这两项在parent标签中已继承
  <artifactId>workPlatform-core</artifactId>
  <packaging>jar</packaging>
2.添加core模块依赖
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
3.由于core模块为serviec和dao层，所以需要添加编译自动更新xml配置，目的是自动更新，mybatis中的xml配置
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
1.修改子模块打包方式为jar类型，去掉子模块groupid,version标签
  <artifactId>workPlatform-common</artifactId>
  <packaging>jar</packaging>

entity	pom.xml	同common模块


web	pom.xml
1.修改子模块打包方式为war类型,去掉子模块groupid,version标签
  <artifactId>workPlatform-web</artifactId>
  <packaging>war</packaging>




框架配置文件(所有框架配置放在web模块resourecs文件夹下)
1.applicationContext-shiro.xml
修改自定义Realm包名
<bean id="myRealm" class="com.workPlatform.core.service.LoginRealm" />

2.applicationContext.xml
修改自动扫描注解包名
         <context:component-scan base-package="com.workPlatform.*.*">   
  		<context:exclude-filter type="annotation" expression="org.springframework.stereotype.Controller" />   
	  </context:component-scan>  
修改mybatis配置(注意mapperLocations的value为classpath*,全扫描包括jar)

<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">  
	    	<property name="dataSource" ref="dataSource" />
	        <property name="configLocation" value="classpath:mybatis-config.xml" />  
	        <property name="mapperLocations" value="classpath*:com/workPlatform/core/dao/*.xml" />    
    	</bean> 
 	    <!-- 自动扫描了所有mapper接口文件 -->  
    	<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer"> 
        	<property name="basePackage"  value="com.workPlatform.core.dao" /> 
        </bean>

3.dispatcher-servlet.xml
修改扫描配置包名
			<context:component-scan base-package="com.workPlatformWeb.controller" use-default-filters="false">
				<context:include-filter type="annotation" expression="org.springframework.stereotype.Controller" />  
			</context:component-scan>


web.xml配置
1.web模块下手动创建WEB-INF文件夹以及web.xml

2.注意dispatcher-servlet.xml中设置的jsp路径
<bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">  
   	<property name="prefix" value="/WEB-INF/jsp/" /><!-- 路径前缀 -->  
        <property name="suffix" value=".jsp" /><!-- 后缀 -->  
</bean>	


3.在web.xml中，dispatcher配置前加入，排除静态资源
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
web模块下
webapp/javaScript/
----------------------------------------------

自动部署
maven/conf/setting.xml
添加
<servers>
	<server>  
	    <id>tomcat7</id>  
	    <username>tomcat7</username>  
	    <password>tomcat7</password>  
	</server>
</servers>

tomcat/conf/tomcat-users.xml
添加
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="tomcat7" password="tomcat7" roles="manager-gui,manager-script,manager-jmx,manager-status"/>

注意对应的自定义用户名密码,对应的是parent模块pom.xml中的自动部署插件

部署命令:
1.在parent模块 pom.xml右键maven build
install
2.在parent模块 pom.xml右键maven build
tomcat7:deploy
重新部署用
tomcat7:redeploy
