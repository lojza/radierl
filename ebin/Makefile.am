## Makefile.am
##
## Process this file with automake to produce Makefile.in

appdir = $(beamdir)
app_DATA = radius.app
EXTRA_DIST = radius.app

beam_DATA = radius.beam \
		radius_app.beam \
		radius_attributes.beam \
		radius_fsm.beam \
		radius_fsm_sup.beam \
		radius_server.beam \
		radius_server_sup.beam \
		radius_sup.beam

%.beam:$(top_srcdir)/src/%.erl
	$(ERLC) $(ERLCFLAGS) -I $(top_builddir)/include -I $(top_builddir)/src $<

%.app:   %.app-in
	sed -e 's/%APP_NAME%/$(PACKAGE_NAME)/' \
			-e 's/%APP_VERSION%/$(PACKAGE_VERSION)/' < $< > $@

CLEANFILES = $(beam_DATA) $(app_DATA)

