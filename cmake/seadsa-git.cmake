set(SEADSA_SOURCE_DIR "${CMAKE_SOURCE_DIR}/sea-dsa" CACHE STRING "seadsa source directory")
if (TopLevel)
  add_custom_target(sea-dsa-git)
endif()
