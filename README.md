
# Tempest - The OpenStack Integration Test Suite

This is a set of integration tests to be run against a live OpenStack cluster. Tempest has batteries of tests for OpenStack API validation, Scenarios, and other specific tests useful in validating an OpenStack deployment.

## Sample pillars

    tempest:
      test:
        enabled: true
        source:
          engine: git
          address: git://github.com/openstack/tempest.git
          revision: master


## Read more

* http://docs.openstack.org/developer/tempest/overview.html
* http://www.slideshare.net/masayukiigawa/tempest-scenariotests-20140512?related=1
* https://github.com/stackforge/puppet-tempest