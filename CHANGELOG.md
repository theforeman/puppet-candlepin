# Changelog

## [5.1.1](https://github.com/theforeman/puppet-candlepin/tree/5.1.1) (2018-06-07)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/5.1.0...5.1.1)

**Fixed bugs:**

- Refs [\#23025](https://projects.theforeman.org/issues/23025) escape db connection string [\#101](https://github.com/theforeman/puppet-candlepin/pull/101) ([alda519](https://github.com/alda519))

## [5.1.0](https://github.com/theforeman/puppet-candlepin/tree/5.1.0) (2018-02-28)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/5.0.0...5.1.0)

**Implemented enhancements:**

- Acceptance test [\#99](https://github.com/theforeman/puppet-candlepin/pull/99) ([sean797](https://github.com/sean797))
- Fixes [\#22567](https://projects.theforeman.org/issues/22567) - add sslEnabledProtocols parameter to server.xml.erb [\#97](https://github.com/theforeman/puppet-candlepin/pull/97) ([sideangleside](https://github.com/sideangleside))
- refs [\#21350](https://projects.theforeman.org/issues/21350) - allow only enabling specific tls versions [\#96](https://github.com/theforeman/puppet-candlepin/pull/96) ([stbenjam](https://github.com/stbenjam))

# Change Log

## [5.0.0](https://github.com/theforeman/puppet-candlepin/tree/5.0.0) (2018-01-25)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/4.0.1...5.0.0)

**Breaking changes:**

- Remove unused variables [\#82](https://github.com/theforeman/puppet-candlepin/pull/82) ([ekohl](https://github.com/ekohl))

**Implemented enhancements:**

- Update Github URLs [\#89](https://github.com/theforeman/puppet-candlepin/pull/89) ([ekohl](https://github.com/ekohl))
- Fixes [\#18146](https://projects.theforeman.org/issues/18146) - add mem/params to tomcat.conf [\#86](https://github.com/theforeman/puppet-candlepin/pull/86) ([chris1984](https://github.com/chris1984))
- Update changelogs and major version bump [\#85](https://github.com/theforeman/puppet-candlepin/pull/85) ([ekohl](https://github.com/ekohl))

## [4.0.1](https://github.com/theforeman/puppet-candlepin/tree/4.0.1)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/4.0.0...4.0.1)

**Merged pull requests:**

- Allow extlib 2.0 [\#83](https://github.com/theforeman/puppet-candlepin/pull/83) ([ekohl](https://github.com/ekohl))

## [4.0.0](https://github.com/theforeman/puppet-candlepin/tree/4.0.0) (2017-08-15)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/3.0.0...4.0.0)

**Merged pull requests:**

- Contain candlepin::service [\#81](https://github.com/theforeman/puppet-candlepin/pull/81) ([ekohl](https://github.com/ekohl))
- Allow newer versions of concat and postgresql [\#80](https://github.com/theforeman/puppet-candlepin/pull/80) ([ekohl](https://github.com/ekohl))
- modulesync: Puppet 5, parallel tests, cleanup [\#79](https://github.com/theforeman/puppet-candlepin/pull/79) ([ekohl](https://github.com/ekohl))
- Refs [\#19667](https://projects.theforeman.org/issues/19667) - add support for SSL secured DB connections [\#78](https://github.com/theforeman/puppet-candlepin/pull/78) ([mbacovsky](https://github.com/mbacovsky))
- Bump qpid dependency [\#77](https://github.com/theforeman/puppet-candlepin/pull/77) ([ehelms](https://github.com/ehelms))
- Allow $user\_groups to be a String [\#76](https://github.com/theforeman/puppet-candlepin/pull/76) ([ekohl](https://github.com/ekohl))
- Drop puppet 3 [\#75](https://github.com/theforeman/puppet-candlepin/pull/75) ([ekohl](https://github.com/ekohl))
- Repo GPG keys are optional [\#74](https://github.com/theforeman/puppet-candlepin/pull/74) ([ekohl](https://github.com/ekohl))

## [3.0.0](https://github.com/theforeman/puppet-candlepin/tree/3.0.0) (2017-04-07)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/2.0.1...3.0.0)

**Merged pull requests:**

- Expand ignore with generated files/directories [\#73](https://github.com/theforeman/puppet-candlepin/pull/73) ([ekohl](https://github.com/ekohl))
- Rename $repo to $repo\_version [\#72](https://github.com/theforeman/puppet-candlepin/pull/72) ([ekohl](https://github.com/ekohl))
- Modulesync update [\#71](https://github.com/theforeman/puppet-candlepin/pull/71) ([ekohl](https://github.com/ekohl))
- Add optional repository management [\#70](https://github.com/theforeman/puppet-candlepin/pull/70) ([ekohl](https://github.com/ekohl))
- add possibility to add more chipers [\#69](https://github.com/theforeman/puppet-candlepin/pull/69) ([cristifalcas](https://github.com/cristifalcas))
- Create qpid exchange [\#67](https://github.com/theforeman/puppet-candlepin/pull/67) ([ehelms](https://github.com/ehelms))
- Modulesync update [\#66](https://github.com/theforeman/puppet-candlepin/pull/66) ([ekohl](https://github.com/ekohl))
- Use // to specify postgresl database [\#65](https://github.com/theforeman/puppet-candlepin/pull/65) ([ehelms](https://github.com/ehelms))
- Fix the formatting of README.md [\#64](https://github.com/theforeman/puppet-candlepin/pull/64) ([ekohl](https://github.com/ekohl))
- External Postgresql Support and a little refactoring [\#62](https://github.com/theforeman/puppet-candlepin/pull/62) ([Klaas-](https://github.com/Klaas-))
- Update modulesync config [\#60](https://github.com/theforeman/puppet-candlepin/pull/60) ([ekohl](https://github.com/ekohl))
- Change existing Kafo type definitions to Puppet 4 types [\#58](https://github.com/theforeman/puppet-candlepin/pull/58) ([stbenjam](https://github.com/stbenjam))
- Add support for non-validated SSL on database connections. [\#54](https://github.com/theforeman/puppet-candlepin/pull/54) ([gregswift](https://github.com/gregswift))

## [2.0.1](https://github.com/theforeman/puppet-candlepin/tree/2.0.1) (2017-01-24)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/2.0.0...2.0.1)

**Closed issues:**

- Error during catalog apply from postgresql.pp [\#35](https://github.com/theforeman/puppet-candlepin/issues/35)

**Merged pull requests:**

- Update module [\#59](https://github.com/theforeman/puppet-candlepin/pull/59) ([ekohl](https://github.com/ekohl))

## [2.0.0](https://github.com/theforeman/puppet-candlepin/tree/2.0.0) (2016-11-22)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/1.1.0...2.0.0)

**Merged pull requests:**

- module sync update [\#57](https://github.com/theforeman/puppet-candlepin/pull/57) ([jlsherrill](https://github.com/jlsherrill))
- Modulesync, bump major for 1.8.7/el6 drop [\#55](https://github.com/theforeman/puppet-candlepin/pull/55) ([stbenjam](https://github.com/stbenjam))
- Modulesync [\#53](https://github.com/theforeman/puppet-candlepin/pull/53) ([stbenjam](https://github.com/stbenjam))
- Modulesync [\#52](https://github.com/theforeman/puppet-candlepin/pull/52) ([stbenjam](https://github.com/stbenjam))
- Modulesync: rspec-puppet-facts updates [\#51](https://github.com/theforeman/puppet-candlepin/pull/51) ([stbenjam](https://github.com/stbenjam))
- fixes [\#11737](https://projects.theforeman.org/issues/11737) - qpid hostname configurable and 'localhost' by default [\#44](https://github.com/theforeman/puppet-candlepin/pull/44) ([stbenjam](https://github.com/stbenjam))

## [1.1.0](https://github.com/theforeman/puppet-candlepin/tree/1.1.0) (2016-09-12)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/1.0.1...1.1.0)

**Merged pull requests:**

- Modulesync update [\#50](https://github.com/theforeman/puppet-candlepin/pull/50) ([ehelms](https://github.com/ehelms))
- puppet4 tweak to populate var in candlepin.conf [\#49](https://github.com/theforeman/puppet-candlepin/pull/49) ([beav](https://github.com/beav))
- Modulesync: pin json\_pure [\#48](https://github.com/theforeman/puppet-candlepin/pull/48) ([stbenjam](https://github.com/stbenjam))
- Pin extlib since they dropped 1.8.7 support [\#47](https://github.com/theforeman/puppet-candlepin/pull/47) ([stbenjam](https://github.com/stbenjam))
- refs [\#15217](https://projects.theforeman.org/issues/15217) - puppet 4 support [\#46](https://github.com/theforeman/puppet-candlepin/pull/46) ([stbenjam](https://github.com/stbenjam))
- Modulesync [\#43](https://github.com/theforeman/puppet-candlepin/pull/43) ([stbenjam](https://github.com/stbenjam))

## [1.0.1](https://github.com/theforeman/puppet-candlepin/tree/1.0.1) (2016-02-24)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/1.0.0...1.0.1)

**Merged pull requests:**

- Require the concat and not file resource properly [\#42](https://github.com/theforeman/puppet-candlepin/pull/42) ([ehelms](https://github.com/ehelms))

## [1.0.0](https://github.com/theforeman/puppet-candlepin/tree/1.0.0) (2016-02-05)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/0.2.1...1.0.0)

**Merged pull requests:**

- stop installing candlepin-tomcat\* [\#41](https://github.com/theforeman/puppet-candlepin/pull/41) ([jlsherrill](https://github.com/jlsherrill))
- Fixes [\#13530](https://projects.theforeman.org/issues/13530) - change ensure defaults from installed to present [\#39](https://github.com/theforeman/puppet-candlepin/pull/39) ([mbacovsky](https://github.com/mbacovsky))
- Manage Tomcat trustore [\#38](https://github.com/theforeman/puppet-candlepin/pull/38) ([cristifalcas](https://github.com/cristifalcas))
- Librarian-puppet errors resolving dependencies for puppet concat [\#37](https://github.com/theforeman/puppet-candlepin/pull/37) ([ehelms](https://github.com/ehelms))
- Fixes [\#13361](https://projects.theforeman.org/issues/13361): tell puppet to wait for wget to finish [\#36](https://github.com/theforeman/puppet-candlepin/pull/36) ([beav](https://github.com/beav))
- add flag to manage wget [\#34](https://github.com/theforeman/puppet-candlepin/pull/34) ([cristifalcas](https://github.com/cristifalcas))
- fix db name [\#33](https://github.com/theforeman/puppet-candlepin/pull/33) ([cristifalcas](https://github.com/cristifalcas))

## [0.2.1](https://github.com/theforeman/puppet-candlepin/tree/0.2.1) (2015-11-20)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/0.2.0...0.2.1)

**Merged pull requests:**

- Fixes [\#11824](https://projects.theforeman.org/issues/11824): Ignore proxies when initializing Candlepin [\#30](https://github.com/theforeman/puppet-candlepin/pull/30) ([ehelms](https://github.com/ehelms))
- Allow changing deployment port [\#29](https://github.com/theforeman/puppet-candlepin/pull/29) ([ehelms](https://github.com/ehelms))

## [0.2.0](https://github.com/theforeman/puppet-candlepin/tree/0.2.0) (2015-10-12)
[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/0.1.0...0.2.0)

**Merged pull requests:**

- Remove puppet-foreman in favor of cache\_data from extlib [\#28](https://github.com/theforeman/puppet-candlepin/pull/28) ([ehelms](https://github.com/ehelms))
- Re-factor to Candlepin default configuration [\#27](https://github.com/theforeman/puppet-candlepin/pull/27) ([ehelms](https://github.com/ehelms))
- Refs [\#11681](https://projects.theforeman.org/issues/11681) - Explicitly use UTF-8 as postgres database encoding [\#26](https://github.com/theforeman/puppet-candlepin/pull/26) ([iNecas](https://github.com/iNecas))
- Update Candlepin config file including addition of quartz. [\#25](https://github.com/theforeman/puppet-candlepin/pull/25) ([ehelms](https://github.com/ehelms))
- Add forge and travis badges to README [\#24](https://github.com/theforeman/puppet-candlepin/pull/24) ([stbenjam](https://github.com/stbenjam))

## [0.1.0](https://github.com/theforeman/puppet-candlepin/tree/0.1.0) (2015-07-20)
**Merged pull requests:**

- Fixes [\#11160](https://projects.theforeman.org/issues/11160) : Increase the number of times the scripts attempts to c… [\#23](https://github.com/theforeman/puppet-candlepin/pull/23) ([bkearney](https://github.com/bkearney))
- Prepare puppet-candlepin for release [\#22](https://github.com/theforeman/puppet-candlepin/pull/22) ([stbenjam](https://github.com/stbenjam))
- Fixes [\#10654](https://projects.theforeman.org/issues/10654) : Increase the number of times which wget will retry, an… [\#21](https://github.com/theforeman/puppet-candlepin/pull/21) ([bkearney](https://github.com/bkearney))
- Updates from modulesync. [\#20](https://github.com/theforeman/puppet-candlepin/pull/20) ([ehelms](https://github.com/ehelms))
- Refs [\#8777](https://projects.theforeman.org/issues/8777): Remove configuration directories to allow package control. [\#18](https://github.com/theforeman/puppet-candlepin/pull/18) ([ehelms](https://github.com/ehelms))
- Pin rspec on ruby 1.8.7 [\#17](https://github.com/theforeman/puppet-candlepin/pull/17) ([stbenjam](https://github.com/stbenjam))
- fixes [\#8352](https://projects.theforeman.org/issues/8352) - fix possible duplicate definition of wget packages [\#16](https://github.com/theforeman/puppet-candlepin/pull/16) ([stbenjam](https://github.com/stbenjam))
- fixes [\#8328](https://projects.theforeman.org/issues/8328) - fixing order of db, cpdb, tomcat, cpinit [\#15](https://github.com/theforeman/puppet-candlepin/pull/15) ([jlsherrill](https://github.com/jlsherrill))
- Fixes [\#8173](https://projects.theforeman.org/issues/8173):  Disable SSLv3 in tomcat [\#14](https://github.com/theforeman/puppet-candlepin/pull/14) ([ehelms](https://github.com/ehelms))
- Refs [\#7224](https://projects.theforeman.org/issues/7224) - initial pass at making puppet-candlepin work for hosted environment [\#13](https://github.com/theforeman/puppet-candlepin/pull/13) ([dcrissman](https://github.com/dcrissman))
- Refs [\#6736](https://projects.theforeman.org/issues/6736): Change Modulefile into a metadata.json file. [\#12](https://github.com/theforeman/puppet-candlepin/pull/12) ([ehelms](https://github.com/ehelms))
- Refs [\#6736](https://projects.theforeman.org/issues/6736): Update to standard layout and basic tests. [\#11](https://github.com/theforeman/puppet-candlepin/pull/11) ([ehelms](https://github.com/ehelms))
- Update Candlepin configuration [\#9](https://github.com/theforeman/puppet-candlepin/pull/9) ([awood](https://github.com/awood))
- Fixes [\#6139](https://projects.theforeman.org/issues/6139) - support RHEL 7 [\#8](https://github.com/theforeman/puppet-candlepin/pull/8) ([jmontleon](https://github.com/jmontleon))
- Adding specification of CA cert, key and password to the Candlepin [\#7](https://github.com/theforeman/puppet-candlepin/pull/7) ([ehelms](https://github.com/ehelms))
- Cleaning up file definitions, flatterning templates directory structure [\#6](https://github.com/theforeman/puppet-candlepin/pull/6) ([ehelms](https://github.com/ehelms))
- Changes to pass keystore password to the Candlepin module. [\#5](https://github.com/theforeman/puppet-candlepin/pull/5) ([ehelms](https://github.com/ehelms))
- Updates to parameterize and support new certs structure. [\#4](https://github.com/theforeman/puppet-candlepin/pull/4) ([ehelms](https://github.com/ehelms))
- Candlepin certs rework [\#3](https://github.com/theforeman/puppet-candlepin/pull/3) ([iNecas](https://github.com/iNecas))
- Reflect the changes in latest puppet-postgresql [\#2](https://github.com/theforeman/puppet-candlepin/pull/2) ([iNecas](https://github.com/iNecas))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
