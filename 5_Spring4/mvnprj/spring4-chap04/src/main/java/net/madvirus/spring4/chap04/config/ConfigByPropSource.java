package net.madvirus.spring4.chap04.config;

import net.madvirus.spring4.chap04.ConnectionProvider;
import net.madvirus.spring4.chap04.JdbcConnectionProvider;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@Configuration
@PropertySources(@PropertySource("classpath:/db.properties"))
// 프로퍼티 파일을 이용해서 Environment에 프로퍼티를 추가할 때 사용, 프로퍼티가 없으면 Environment의 프로퍼티를 사용하게 함.
public class ConfigByPropSource {

	@Bean
	public static PropertySourcesPlaceholderConfigurer properties() {
		PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
		return configurer;
		// @PropertySource설정을 이용해서 좀 더 간단하게 프로퍼티를 적용할 수 있다.
	}

	@Value("${db.driver}")
	private String driver;
	@Value("${db.jdbcUrl}")
	private String jdbcUrl;
	@Value("${db.user}")
	private String user;
	@Value("${db.password}")
	private String password;

	@Bean(initMethod = "init")
	public ConnectionProvider connectionProvider() {
		JdbcConnectionProvider connectionProvider = new JdbcConnectionProvider();
		connectionProvider.setDriver(driver);
		connectionProvider.setUrl(jdbcUrl);
		connectionProvider.setUser(user);
		connectionProvider.setPassword(password);
		return connectionProvider;
	}
}
