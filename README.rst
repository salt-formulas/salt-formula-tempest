
===============
Tempest Formula
===============

This is a set of integration tests to be run against a live OpenStack cluster. Tempest has batteries of tests for OpenStack API validation, Scenarios, and other specific tests useful in validating an OpenStack deployment.

Sample Pillars
==============

.. code-block:: yaml

    tempest:
      test:
        enabled: true
        source:
          engine: git
          address: git://github.com/openstack/tempest.git
          revision: master
        suite:
          identity:
            disable_ssl_certificate_validation: true
            auth_version: v3
            uri_v3:
            region: RegionOne 
          identity-feature-enabled:
            trust: true
            api_v2: false
            api_v3: true


More Information
================

* http://docs.openstack.org/developer/tempest/overview.html
* http://www.slideshare.net/masayukiigawa/tempest-scenariotests-20140512?related=1
* https://github.com/stackforge/puppet-tempest
