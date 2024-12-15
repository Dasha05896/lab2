bin_PROGRAMS = myprogram
myprogram_SOURCES = main.cpp

dist_dir = $(top_builddir)/dist
EXTRA_DIST = $(srcdir)/Makefile.am $(srcdir)/configure.ac

dist:
    tar czf $(PACKAGE)-$(VERSION).tar.gz $(srcdir)
