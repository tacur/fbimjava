package com.futurebim.core.config;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * This class is used to configure the database connection and the connection behavior.
 *
 * @author linsoli
 *
 */
@Component
@PropertySource("classpath:config/db.properties")
public class DbConfiguration {

  private final Logger log = LoggerFactory.getLogger(getClass());

  @Value("${poolName}")
  private String poolName;

  @Value("${jdbcUrl}")
  private String jdbcUrl;

  @Value("${dbUserName}")
  private String dbUserName;

  @Value("${password}")
  private String password;

  @Value("${minIdleConnections}")
  private Integer minIdleConnections;

  @Value("${maxPoolSize}")
  private Integer maxPoolSize;

  @Value("${cachePreparedStatements}")
  private Boolean cachePreparedStatements;

  @Value("${preparedStatementsCacheSize}")
  private Integer preparedStatementsCacheSize;

  @Value("${preparedStatementsCacheSqlLimit}")
  private Integer preparedStatementsCacheSqlLimit;

  @Value("${useServerSidePreparedStatements}")
  private Boolean useServerSidePreparedStatements;

  @Value("${className}")
  private String className;

  @Bean
  public DataSource getDatasource() {
    log.info("DB config: {}@{}", dbUserName, jdbcUrl);

    final HikariConfig configuration = new HikariConfig();
    configuration.setAutoCommit(false);
    configuration.setPoolName(poolName);
    configuration.setDriverClassName(className);
    configuration.setMinimumIdle(minIdleConnections);
    configuration.setJdbcUrl(jdbcUrl);
    configuration.setIdleTimeout(120000L);
    configuration.setMaximumPoolSize(maxPoolSize);
    configuration.setUsername(dbUserName);
    configuration.setPassword(password);
    configuration.setTransactionIsolation("TRANSACTION_READ_COMMITTED");
    
    

    configuration.addDataSourceProperty("cachePrepStmts", this.cachePreparedStatements);
    configuration.addDataSourceProperty("prepStmtCacheSize", this.preparedStatementsCacheSize);
    configuration.addDataSourceProperty("prepStmtCacheSqlLimit", this.preparedStatementsCacheSqlLimit);
    configuration.addDataSourceProperty("useServerPrepStmts", this.useServerSidePreparedStatements);

    final HikariDataSource ds = new HikariDataSource(configuration);
    ds.validate();
    return ds;
  }

  
  public String getPoolName() {
    return poolName;
  }

  
  public void setPoolName(String poolName) {
    this.poolName = poolName;
  }

  
  public String getJdbcUrl() {
    return jdbcUrl;
  }

  
  public void setJdbcUrl(String jdbcUrl) {
    this.jdbcUrl = jdbcUrl;
  }

  
  public String getDbUserName() {
    return dbUserName;
  }

  
  public void setDbUserName(String dbUserName) {
    this.dbUserName = dbUserName;
  }

  
  public String getPassword() {
    return password;
  }

  
  public void setPassword(String password) {
    this.password = password;
  }

  
  public Integer getMinIdleConnections() {
    return minIdleConnections;
  }

  
  public void setMinIdleConnections(Integer minIdleConnections) {
    this.minIdleConnections = minIdleConnections;
  }

  
  public Integer getMaxPoolSize() {
    return maxPoolSize;
  }

  
  public void setMaxPoolSize(Integer maxPoolSize) {
    this.maxPoolSize = maxPoolSize;
  }

  
  public Boolean getCachePreparedStatements() {
    return cachePreparedStatements;
  }

  
  public void setCachePreparedStatements(Boolean cachePreparedStatements) {
    this.cachePreparedStatements = cachePreparedStatements;
  }

  
  public Integer getPreparedStatementsCacheSize() {
    return preparedStatementsCacheSize;
  }

  
  public void setPreparedStatementsCacheSize(Integer preparedStatementsCacheSize) {
    this.preparedStatementsCacheSize = preparedStatementsCacheSize;
  }

  
  public Integer getPreparedStatementsCacheSqlLimit() {
    return preparedStatementsCacheSqlLimit;
  }

  
  public void setPreparedStatementsCacheSqlLimit(Integer preparedStatementsCacheSqlLimit) {
    this.preparedStatementsCacheSqlLimit = preparedStatementsCacheSqlLimit;
  }

  
  public Boolean getUseServerSidePreparedStatements() {
    return useServerSidePreparedStatements;
  }

  
  public void setUseServerSidePreparedStatements(Boolean useServerSidePreparedStatements) {
    this.useServerSidePreparedStatements = useServerSidePreparedStatements;
  }

  
  public String getClassName() {
    return className;
  }

  
  public void setClassName(String className) {
    this.className = className;
  }

}
