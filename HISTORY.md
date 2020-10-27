## [11.0.0](https://github.com/theforeman/puppet-candlepin/tree/11.0.0) (2020-10-27)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/10.0.0...11.0.0)

**Breaking changes:**

- Fixes [\#30523](https://projects.theforeman.org/issues/30523): Create providers to make database migration idempotent [\#161](https://github.com/theforeman/puppet-candlepin/pull/161) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Fixes [\#30767](https://projects.theforeman.org/issues/30767) - Allow the owner\_content\_access\_mode.modified event type [\#164](https://github.com/theforeman/puppet-candlepin/pull/164) ([jturel](https://github.com/jturel))

**Fixed bugs:**

- Refs [\#29220](https://projects.theforeman.org/issues/29220) - Add missing parameter [\#166](https://github.com/theforeman/puppet-candlepin/pull/166) ([ekohl](https://github.com/ekohl))

## [10.0.0](https://github.com/theforeman/puppet-candlepin/tree/10.0.0) (2020-08-05)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/9.0.1...10.0.0)

**Breaking changes:**

- Refs [\#30346](https://projects.theforeman.org/issues/30346): Expect an actual truststore instead of re-using keystore [\#160](https://github.com/theforeman/puppet-candlepin/pull/160) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Use the namespaced pg password function [\#158](https://github.com/theforeman/puppet-candlepin/pull/158) ([ekohl](https://github.com/ekohl))

## [9.0.1](https://github.com/theforeman/puppet-candlepin/tree/9.0.1) (2020-08-03)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/9.0.0...9.0.1)

**Fixed bugs:**

- Fixes [\#30135](https://projects.theforeman.org/issues/30135) - Automatically clean up Candlepin event queues [\#157](https://github.com/theforeman/puppet-candlepin/pull/157) ([jturel](https://github.com/jturel))

## [9.0.0](https://github.com/theforeman/puppet-candlepin/tree/9.0.0) (2020-05-15)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/8.0.0...9.0.0)

**Breaking changes:**

- Make candlepin::repo a standalone class [\#155](https://github.com/theforeman/puppet-candlepin/pull/155) ([ekohl](https://github.com/ekohl))
- Fixes [\#29625](https://projects.theforeman.org/issues/29625) - Stop accepting TLS 1.1 connections [\#152](https://github.com/theforeman/puppet-candlepin/pull/152) ([ekohl](https://github.com/ekohl))
- Fixes [\#29220](https://projects.theforeman.org/issues/29220): Disable CRL generation by default [\#145](https://github.com/theforeman/puppet-candlepin/pull/145) ([ehelms](https://github.com/ehelms))
- Fixes [\#28924](https://projects.theforeman.org/issues/28924): Drop qpid queue and add exposing of Artemis [\#143](https://github.com/theforeman/puppet-candlepin/pull/143) ([ehelms](https://github.com/ehelms))
- Fixes [\#28922](https://projects.theforeman.org/issues/28922): Deploy Candlepin on localhost by default [\#142](https://github.com/theforeman/puppet-candlepin/pull/142) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Allow extlib 5.x [\#149](https://github.com/theforeman/puppet-candlepin/pull/149) ([mmoll](https://github.com/mmoll))
- Fixes [\#29194](https://projects.theforeman.org/issues/29194) - Support EL8 [\#148](https://github.com/theforeman/puppet-candlepin/pull/148) ([wbclark](https://github.com/wbclark))

## [8.0.0](https://github.com/theforeman/puppet-candlepin/tree/8.0.0) (2020-02-12)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/7.0.1...8.0.0)

**Breaking changes:**

- Run cpdb --update [\#139](https://github.com/theforeman/puppet-candlepin/pull/139) ([ekohl](https://github.com/ekohl))

**Implemented enhancements:**

- Fixes [\#28840](https://projects.theforeman.org/issues/28840) - move to every 24 hours instead of every hour [\#141](https://github.com/theforeman/puppet-candlepin/pull/141) ([mccun934](https://github.com/mccun934))

**Merged pull requests:**

- Use the nightly repository by default [\#140](https://github.com/theforeman/puppet-candlepin/pull/140) ([ekohl](https://github.com/ekohl))

## [7.0.1](https://github.com/theforeman/puppet-candlepin/tree/7.0.1) (2019-06-13)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/7.0.0...7.0.1)

**Merged pull requests:**

- Allow latest stdlib, extlib, concat and qpid versions [\#137](https://github.com/theforeman/puppet-candlepin/pull/137) ([ekohl](https://github.com/ekohl))
- Allow puppetlabs-postgresql 7.x [\#135](https://github.com/theforeman/puppet-candlepin/pull/135) ([ekohl](https://github.com/ekohl))

## [7.0.0](https://github.com/theforeman/puppet-candlepin/tree/7.0.0) (2019-04-17)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/6.0.0...7.0.0)

**Breaking changes:**

- Drop Puppet 4 [\#132](https://github.com/theforeman/puppet-candlepin/pull/132) ([ekohl](https://github.com/ekohl))
- Configure tomcat to use keystore from /etc/candlepin [\#131](https://github.com/theforeman/puppet-candlepin/pull/131) ([ehelms](https://github.com/ehelms))
- Drop unused JasperListener [\#130](https://github.com/theforeman/puppet-candlepin/pull/130) ([ehelms](https://github.com/ehelms))

**Merged pull requests:**

- Allow katello/qpid 5.x [\#133](https://github.com/theforeman/puppet-candlepin/pull/133) ([ekohl](https://github.com/ekohl))

## [6.0.0](https://github.com/theforeman/puppet-candlepin/tree/6.0.0) (2019-01-14)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/5.2.1...6.0.0)

**Breaking changes:**

- Remove unused parameters [\#118](https://github.com/theforeman/puppet-candlepin/pull/118) ([ekohl](https://github.com/ekohl))
- Drop unused ports and switch run\_init to false [\#113](https://github.com/theforeman/puppet-candlepin/pull/113) ([ehelms](https://github.com/ehelms))

**Implemented enhancements:**

- Use extlib namespaced functions [\#127](https://github.com/theforeman/puppet-candlepin/pull/127) ([ekohl](https://github.com/ekohl))
- Add candlepin-selinux during install [\#124](https://github.com/theforeman/puppet-candlepin/pull/124) ([akofink](https://github.com/akofink))
- Allow extlib 3.x [\#123](https://github.com/theforeman/puppet-candlepin/pull/123) ([ekohl](https://github.com/ekohl))
- Add puppet 6 support [\#122](https://github.com/theforeman/puppet-candlepin/pull/122) ([ekohl](https://github.com/ekohl))
- Convert docs to yardoc [\#117](https://github.com/theforeman/puppet-candlepin/pull/117) ([ekohl](https://github.com/ekohl))

**Merged pull requests:**

- Remove puppet-lint-absolute\_classname-check [\#119](https://github.com/theforeman/puppet-candlepin/pull/119) ([ekohl](https://github.com/ekohl))
- Update README [\#115](https://github.com/theforeman/puppet-candlepin/pull/115) ([ekohl](https://github.com/ekohl))

## [5.2.1](https://github.com/theforeman/puppet-candlepin/tree/5.2.1) (2018-10-15)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/5.2.0...5.2.1)

**Fixed bugs:**

- Fixes [\#25062](https://projects.theforeman.org/issues/25062): set hibernate logging to ERROR [\#112](https://github.com/theforeman/puppet-candlepin/pull/112) ([akofink](https://github.com/akofink))

## [5.2.0](https://github.com/theforeman/puppet-candlepin/tree/5.2.0) (2018-10-08)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/5.1.1...5.2.0)

**Implemented enhancements:**

- Allow stdlib/concat 5.x [\#109](https://github.com/theforeman/puppet-candlepin/pull/109) ([ekohl](https://github.com/ekohl))
- Add debug logging placeholder to candlepin.conf [\#107](https://github.com/theforeman/puppet-candlepin/pull/107) ([kahowell](https://github.com/kahowell))

## [5.1.1](https://github.com/theforeman/puppet-candlepin/tree/5.1.1) (2018-07-11)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/5.1.0...5.1.1)

**Fixed bugs:**

- Refs [\#23025](https://projects.theforeman.org/issues/23025) escape db connection string [\#101](https://github.com/theforeman/puppet-candlepin/pull/101) ([alda519](https://github.com/alda519))

## [5.1.0](https://github.com/theforeman/puppet-candlepin/tree/5.1.0) (2018-02-28)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/4.0.2...5.1.0)

**Implemented enhancements:**

- Acceptance test [\#99](https://github.com/theforeman/puppet-candlepin/pull/99) ([sean797](https://github.com/sean797))
- Fixes [\#22567](https://projects.theforeman.org/issues/22567) - add sslEnabledProtocols parameter to server.xml.erb [\#97](https://github.com/theforeman/puppet-candlepin/pull/97) ([sideangleside](https://github.com/sideangleside))
- refs [\#21350](https://projects.theforeman.org/issues/21350) - allow only enabling specific tls versions [\#96](https://github.com/theforeman/puppet-candlepin/pull/96) ([stbenjam](https://github.com/stbenjam))

## [5.0.0](https://github.com/theforeman/puppet-candlepin/tree/5.0.0) (2018-01-25)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/4.0.2...5.0.0)

**Breaking changes:**

- Remove unused variables [\#82](https://github.com/theforeman/puppet-candlepin/pull/82) ([ekohl](https://github.com/ekohl))

**Implemented enhancements:**

- Update Github URLs [\#89](https://github.com/theforeman/puppet-candlepin/pull/89) ([ekohl](https://github.com/ekohl))
- Fixes [\#18146](https://projects.theforeman.org/issues/18146) - add mem/params to tomcat.conf [\#86](https://github.com/theforeman/puppet-candlepin/pull/86) ([chris1984](https://github.com/chris1984))
- Update changelogs and major version bump [\#85](https://github.com/theforeman/puppet-candlepin/pull/85) ([ekohl](https://github.com/ekohl))

## [4.0.2](https://github.com/theforeman/puppet-candlepin/tree/4.0.2) (2018-02-13)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/4.0.1...4.0.2)

**Merged pull requests:**

- Allow qpid 4.x [\#98](https://github.com/theforeman/puppet-candlepin/pull/98) ([ekohl](https://github.com/ekohl))

## [4.0.1](https://github.com/theforeman/puppet-candlepin/tree/4.0.1) (2017-10-18)

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/4.0.0...4.0.1)

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

[Full Changelog](https://github.com/theforeman/puppet-candlepin/compare/832bafa66c9fdc8d632908613695691e90f78583...0.1.0)

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
