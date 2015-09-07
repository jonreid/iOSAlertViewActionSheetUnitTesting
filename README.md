*This repository is deprecated. Use [MockUIAlertViewActionSheet](https://github.com/jonreid/MockUIAlertViewActionSheet) instead. Thanks!*

Unit testing alerts and action sheets
=====================================

Ever wonder if it's possible to write unit tests for alerts and action sheets?
This is the system I use to TDD my UIAlertView and UIActionSheet code.

The example project includes two versions of the tests: one in plain OCUnit, and
one using [OCHamcrest](https://github.com/hamcrest/OCHamcrest). OCHamcrest is
not required — but compare the test code (especially checking the
`otherButtonTitles` NSArray) and you'll see why I prefer it.

For more discussion, see my blog post
[Unit Testing Your Alerts and Action Sheets](http://qualitycoding.org/testing-alerts/).
