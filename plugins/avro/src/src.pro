TOP_BUILDDIR = $$OUT_PWD/../../..
TOP_SRCDIR = $$PWD/../../..

include($${TOP_SRCDIR}/config.pri)

TEMPLATE        = lib
CONFIG         += plugin
QT             += widgets
INCLUDEPATH    += \
    $${TOP_SRCDIR}/src/ \
    $${TOP_SRCDIR}/src/lib/ \
    $${TOP_SRCDIR}/src/lib/logic/ \
    $${TOP_SRCDIR}/plugins/westernsupport/

HEADERS         = \
    avroplugin.h \
    avrolanguagefeatures.h \
    $${TOP_SRCDIR}/src/lib/logic/abstractlanguageplugin.h \
    $${TOP_SRCDIR}/plugins/westernsupport/spellchecker.h \
    $${TOP_SRCDIR}/plugins/westernsupport/spellpredictworker.h \
    $${TOP_SRCDIR}/plugins/westernsupport/candidatescallback.h \

SOURCES         = \
    avroplugin.cpp \
    avrolanguagefeatures.cpp \
    $${TOP_SRCDIR}/src/lib/logic/abstractlanguageplugin.cpp \
    $${TOP_SRCDIR}/plugins/westernsupport/spellchecker.cpp \
    $${TOP_SRCDIR}/plugins/westernsupport/spellpredictworker.cpp \
    $${TOP_SRCDIR}/plugins/westernsupport/candidatescallback.cpp \


TARGET          = $$qtLibraryTarget(avroplugin)

EXAMPLE_FILES = avroplugin.json

# generate database for presage:
PLUGIN_INSTALL_PATH = $${UBUNTU_KEYBOARD_LIB_DIR}/avro/

lang_db_avro.commands += \
  rm -f $$PWD/database_avro.db && \
  text2ngram -n 1 -l -f sqlite -o $$PWD/database_avro.db $$PWD/avro.txt && \
  text2ngram -n 2 -l -f sqlite -o $$PWD/database_avro.db $$PWD/avro.txt && \
  text2ngram -n 3 -l -f sqlite -o $$PWD/database_avro.db $$PWD/avro.txt
lang_db_avro.files += $$PWD/database_avro.db

lang_db_avro_install.files += $$PWD/database_avro.db
lang_db_avro_install.path = $$PLUGIN_INSTALL_PATH

QMAKE_EXTRA_TARGETS += lang_db_avro lang_db_avro_install

target.path = $$PLUGIN_INSTALL_PATH
INSTALLS += target lang_db_avro_install

OTHER_FILES += \
    avroplugin.json \
    avro.txt

# hunspell
CONFIG += link_pkgconfig
PKGCONFIG += hunspell
LIBS += -lhunspell
DEFINES += HAVE_HUNSPELL

# presage
LIBS += -lpresage
DEFINES += HUNSPELL_DICT_PATH=\\\"$$HUNSPELL_DICT_PATH\\\"

