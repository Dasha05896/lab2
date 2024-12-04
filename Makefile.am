bin_PROGRAMS = my_program
my_program_SOURCES = main.cpp

# Оновлений розділ для тестів
check_PROGRAMS = test_main
test_main_SOURCES = test_main.cpp
test_main_LDADD = $(top_builddir)/lib/libgtest.a $(top_builddir)/lib/libgtest_main.a

# Додаткові файли для дистрибуції
dist_doc_DATA = README.md
EXTRA_DIST = debian/README.Debian debian/changelog debian/control debian/copyright

# Створення пакета і тестування
dist-hook:
    dh_make -s -e your-email@example.com -f ../my_program-$(VERSION).tar.gz
