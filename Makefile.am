bin_PROGRAMS = my_program
my_program_SOURCES = main.cpp
dist_doc_DATA = README.md

# Додаткові файли для включення в Debian пакет
EXTRA_DIST = debian/README.Debian debian/changelog debian/control debian/copyright

# Додаткове правило для дистрибуції
dist-hook:
    dh_make -s -e your-email@example.com -f ../my_program-$(VERSION).tar.gz
