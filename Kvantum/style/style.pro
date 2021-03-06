CONFIG += qt \
          plugin \
          x11 \
          warn_on

QT += svg
greaterThan(QT_MAJOR_VERSION, 4): QT += x11extras

TARGET = kvantum
TEMPLATE = lib

VERSION = 0.1

SOURCES += themeconfig/ThemeConfig.cpp \
           Kvantum.cpp \
           KvantumPlugin.cpp \
           shortcuthandler.cpp \
           drag/x11wmmove.cpp \
           drag/windowmanager.cpp \
           blur/blurhelper.cpp

HEADERS += themeconfig/specs.h \
           themeconfig/ThemeConfig.h \
           Kvantum.h \
           KvantumPlugin.h \
           shortcuthandler.h \
           drag/windowmanager.h \
           drag/x11wmmove.h \
           blur/blurhelper.h

greaterThan(QT_MAJOR_VERSION, 4) {
  SOURCES += animation/animation.cpp
  HEADERS += animation/animation.h
  OTHER_FILES += kvantum.json
}

RESOURCES += themeconfig/defaulttheme.qrc

unix:!macx: LIBS += -lX11

unix {
  #VARIABLES
  isEmpty(PREFIX) {
    PREFIX = /usr
  }
  COLORSDIR =$$PREFIX/share/kde4/apps/color-schemes
  KF5COLORSDIR =$$PREFIX/share/color-schemes
  DATADIR =$$PREFIX/share

  DEFINES += DATADIR=\\\"$$DATADIR\\\"

  #MAKE INSTALL
  target.path = $$[QT_INSTALL_PLUGINS]/styles
  colors.path = $$COLORSDIR
  colors.files += ../color/Kvantum.colors
  kf5colors.path = $$KF5COLORSDIR
  kf5colors.files += ../color/Kvantum.colors
  equals(QT_MAJOR_VERSION, 4): INSTALLS += target colors
  greaterThan(QT_MAJOR_VERSION, 4): INSTALLS += target kf5colors
}
