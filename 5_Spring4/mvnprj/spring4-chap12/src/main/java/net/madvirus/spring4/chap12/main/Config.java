package net.madvirus.spring4.chap12.main;

import java.beans.PropertyVetoException;

import javax.sql.DataSource;

import net.madvirus.spring4.chap12.store.dao.ItemDao;
import net.madvirus.spring4.chap12.store.dao.PaymentInfoDao;
import net.madvirus.spring4.chap12.store.dao.PurchaseOrderDao;
import net.madvirus.spring4.chap12.store.dao.jdbc.JdbcItemDao;
import net.madvirus.spring4.chap12.store.dao.jdbc.JdbcPaymentInfoDao;
import net.madvirus.spring4.chap12.store.dao.jdbc.JdbcPurchaseOrderDao;
import net.madvirus.spring4.chap12.store.service.PlaceOrderService;
import net.madvirus.spring4.chap12.store.service.PlaceOrderServiceAnnotImpl;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
// @Configuration에서 @Transactional 어노테이션을 적용하기 위해서는 @EnableTrnasactionManager 를 설정해주어야한다.
public class Config implements TransactionManagementConfigurer {

	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		try {
			ds.setDriverClass("com.mysql.jdbc.Driver");
		} catch (PropertyVetoException e) {
			throw new RuntimeException(e);
		}
		ds.setJdbcUrl("jdbc:mysql://localhost/shop?characterEncoding=utf8");
		ds.setUser("spring4");
		ds.setPassword("spring4");
		return ds;
	}

	@Override
	public PlatformTransactionManager annotationDrivenTransactionManager() {
		DataSourceTransactionManager txMgr = new DataSourceTransactionManager();
		txMgr.setDataSource(dataSource());
		return txMgr;
	} // 사용할 PlatformTransactionManager를 직접 지정하고싶으면, 인터페이스를 통해서 구현해야한다.

	@Bean
	public PlaceOrderService placeOrderService() {
		PlaceOrderServiceAnnotImpl svc = new PlaceOrderServiceAnnotImpl();
		svc.setItemDao(itemDao());
		svc.setPaymentInfoDao(paymentInformationDao());
		svc.setPurchaseOrderDao(purchaseOrderDao());
		return svc;
	}

	@Bean
	public ItemDao itemDao() {
		return new JdbcItemDao(dataSource());
	}

	@Bean
	public PaymentInfoDao paymentInformationDao() {
		return new JdbcPaymentInfoDao(dataSource());
	}

	@Bean
	public PurchaseOrderDao purchaseOrderDao() {
		return new JdbcPurchaseOrderDao(dataSource());
	}

}
