## Makefile.am
##
## Process this file with automake to produce Makefile.in

SUBDIRS = ebin include doc

check_DATA = .dialyzer_ok .common_test_ok

.dialyzer_ok:
	dialyzer --src src

.common_test_ok:
	ct_run -pa ebin -dir test -logdir test/log

clean-local:
	-rm -r test/*.beam test/log/*

install-exec-hook:
	chown -R otpuser:otp $(appdir)

