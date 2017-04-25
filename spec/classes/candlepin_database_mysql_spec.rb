require 'spec_helper'

describe 'candlepin::database::mysql' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      describe 'default' do
        let :pre_condition do
          "class {'candlepin':
            db_type => 'mysql',
            db_password => 'testpassword',
          }"
        end

        it { should contain_class('candlepin::database::mysql') }
        it { should_not contain_class('candlepin::database::postgresql') }

        it do
          verify_concat_fragment_exact_contents(catalogue, 'Mysql Database Configuration', [
            'jpa.config.hibernate.dialect=org.hibernate.dialect.MySQLDialect',
            'jpa.config.hibernate.connection.driver_class=com.mysql.jdbc.Driver',
            'jpa.config.hibernate.connection.url=jdbc:mysql://localhost:3306/candlepin',
            'jpa.config.hibernate.hbm2ddl.auto=validate',
            'jpa.config.hibernate.connection.username=candlepin',
            'jpa.config.hibernate.connection.password=testpassword',
            'org.quartz.jobStore.misfireThreshold=60000',
            'org.quartz.jobStore.useProperties=false',
            'org.quartz.jobStore.dataSource=myDS',
            'org.quartz.jobStore.tablePrefix=QRTZ_',
            'org.quartz.jobStore.class=org.quartz.impl.jdbcjobstore.JobStoreTX',
            'org.quartz.jobStore.driverDelegateClass=org.quartz.impl.jdbcjobstore.StdJDBCDelegate',
            'org.quartz.dataSource.myDS.driver=com.mysql.jdbc.Driver',
            'org.quartz.dataSource.myDS.URL=jdbc:mysql://localhost:3306/candlepin',
            'org.quartz.dataSource.myDS.user=candlepin',
            'org.quartz.dataSource.myDS.password=testpassword',
            'org.quartz.dataSource.myDS.maxConnections=5',
          ])
        end
      end

      describe 'and enable_hbm2ddl_validate = false' do
        let :pre_condition do
          "class {'candlepin':
            db_type => 'mysql',
            enable_hbm2ddl_validate => false,
          }"
        end

        it do
          should contain_concat__fragment('Mysql Database Configuration').
            without_content(/jpa.config.hibernate.hbm2ddl.auto=validate/)
        end
      end
    end
  end
end
