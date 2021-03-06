glew {
  # Optionally specify location of GLEW using the 
  # GLEWDIR env. variable
  GLEW_DIR = $$(GLEWDIR)
  !isEmpty(GLEW_DIR) {
    QMAKE_INCDIR += $$GLEW_DIR/include
    QMAKE_LIBDIR += $$GLEW_DIR/lib
    QMAKE_LIBDIR += $$GLEW_DIR/lib64
  }

  unix:LIBS += -lGLEW -lglut
  CONFIG(mingw-cross-env): {
    !CONFIG(mingw-cross-env-shared) {
      DEFINES += GLEW_STATIC
    }
  } else {
    win32:LIBS += -lglew32
  }
}
