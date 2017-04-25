require 'spec_helper'

describe 'candlepin::database::postgresql' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      describe 'default' do
        let :pre_condition do
          "class {'candlepin':
            db_password => 'testpassword',
           }"
        end

        it { should contain_class('candlepin::database::postgresql') }
        it { should_not contain_class('candlepin::database::mysql') }
        it { should contain_exec('cpdb').that_subscribes_to('Package[candlepin]') }
        it { should contain_exec('cpdb').that_comes_before('Service[tomcat]') }
        it { should contain_exec('cpdb').that_comes_before('Exec[cpinit]') }
        it { should contain_postgresql__server__db('candlepin') }
        it { should contain_postgresql__server__role('candlepin').that_comes_before('Postgresql::Server::Database[candlepin]') }

        it do
          verify_concat_fragment_exact_contents(catalogue, 'PostgreSQL Database Configuration', [
            'jpa.config.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect',
            'jpa.config.hibernate.connection.driver_class=org.postgresql.Driver',
            'jpa.config.hibernate.connection.url=jdbc:postgresql://localhost:5432/candlepin',
            'jpa.config.hibernate.hbm2ddl.auto=validate',
            'jpa.config.hibernate.connection.username=candlepin',
            'jpa.config.hibernate.connection.password=testpassword',
            'org.quartz.jobStore.misfireThreshold=60000',
            'org.quartz.jobStore.useProperties=false',
            'org.quartz.jobStore.dataSource=myDS',
            'org.quartz.jobStore.tablePrefix=QRTZ_',
            'org.quartz.jobStore.class=org.quartz.impl.jdbcjobstore.JobStoreTX',
            'org.quartz.jobStore.driverDelegateClass=org.quartz.impl.jdbcjobstore.PostgreSQLDelegate',
            'org.quartz.dataSource.myDS.driver=org.postgresql.Driver',
            'org.quartz.dataSource.myDS.URL=jdbc:postgresql://localhost:5432/candlepin',
            'org.quartz.dataSource.myDS.user=candlepin',
            'org.quartz.dataSource.myDS.password=testpassword',
            'org.quartz.dataSource.myDS.maxConnections=5',
          ])
        end

        describe 'and enable_hbm2ddl_validate = false' do
          let :pre_condition do
            "class {'candlepin':
               enable_hbm2ddl_validate => false,
             }"
          end

          it do
            should contain_concat__fragment('PostgreSQL Database Configuration').
              without_content(/jpa.config.hibernate.hbm2ddl.auto=validate/)
          end
        end
      end
    end
  end
end
